package controller;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import service.PhotosService;
import service.ProfileService;
import service.UsersService;
import vo.CommentsPhotoIdjoinVo;
import vo.CommentsVo;
import vo.CommentsjoinVo;
import vo.FeedLikesVo;
import vo.FollowingVo;
import vo.LikesVo;
import vo.PhotoRegisterVo;
import vo.PhotosVo;
import vo.ProfileVo;
import vo.RankingVo;
import vo.UsersVo;
@RestController
public class PhotosRestController {
    @Autowired
    private PhotosService photoservice;
    
    @Autowired
    private ProfileService profileservice;
    
    @Autowired
    private UsersService usersservice;
    
    @Autowired
    private PhotosVo photosvo;
    
    @Autowired
    private ProfileVo profilevo;
    
    @Autowired
    private CommentsVo commentsvo;
    
    @Autowired
    private CommentsjoinVo commentsjoinvo;
    
    @Autowired
    private LikesVo likesvo;
    
    @Autowired
    private UsersVo usersvo;
    
    @Autowired
    private FollowingVo following;
    
    @Autowired
    private CommentsPhotoIdjoinVo commentsphotoidjoinvo;
    
    @Autowired
    private FeedLikesVo feelikesvo;
    
    @Autowired
    private List<RankingVo> rankingVoList;
    
    @Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    /* 좋아요 및 comment 카운트 ajax */
	@RequestMapping(value = "/{userid}/photos/{photoid}/likes", method = RequestMethod.POST)
	public Map<String,Object> getLikeCount(@PathVariable("userid") String userid, @PathVariable("photoid") int photoid) {
		
		Map<String,Object> allcheck = new HashMap<String, Object>();
		
		Integer likecount = photoservice.getLikeCount(photoid);
		Integer commentcount = photoservice.getCommentCount(photoid);
		
		allcheck.put("likecount", likecount);
		allcheck.put("commentcount", commentcount);
		
		return allcheck;
	}
	
	/* 좋아요 클릭전에 DB에 null 값이면 좋아요 테이블 insert ajax */
	@RequestMapping(value = "/{userid}/likecheck", method = RequestMethod.POST)
	public String getLikeCheck(@RequestBody LikesVo likes) {
		
		int result = photoservice.insertLikes(likes);
		
		if(result != 0) {
			return "success";
		}else {
			return "false";
		}
		
	}
	
	/* 좋아요 선택, 해제 update ajax */
	@RequestMapping(value = "/{userid}/likecheckok", method = RequestMethod.POST)
	public int getLikeCheckTrue(String userid, int photoid, boolean likeyn) {
		
		int result = photoservice.getLikeCheckOk(userid, photoid, likeyn);
		
		if(result != 0) {
			return 1;
		}else {
			return 0;
		}
		
	}
	
	/* comment 쓰기 ajax */
	@RequestMapping(value = "/{userid}/comments/{photouserid}/{photoid}", method = RequestMethod.POST)
	public ProfileVo insertComment(@PathVariable("userid") String userid, @PathVariable("photoid") BigInteger photoid, @RequestParam("comment") String comment) {
		

		
		commentsvo.setUsersUserid(userid);
		commentsvo.setPhotoId(photoid);
		commentsvo.setBuyYn(false);
		commentsvo.setComments(comment);
		
		int result = photoservice.insertComments(commentsvo);
		
		profilevo = profileservice.getProfile(userid);
		
		return profilevo;
	}
	
	/* 프로필 사진 변경 */
	@RequestMapping(value = "/{userid}/profile/photo", method = RequestMethod.POST)
	public String getPhotoEdit(@PathVariable("userid") String userid, MultipartHttpServletRequest request) throws UnsupportedEncodingException {
		
		int result = 0;
		
		MultipartFile mf = request.getFile("photofile");
		if(mf != null) {
			String fileName = new String(mf.getOriginalFilename()); //파일명 얻기
			
		    String uploadPath = request.getSession().getServletContext().getRealPath("uploads");
		    
		    if(mf.getSize() != 0) {	    	
		    	try {
					mf.transferTo(new File(uploadPath+"/"+fileName));
				} catch (IllegalStateException | IOException e) {
					System.out.println(e.getMessage());
				}	 
		    	
		    	result = photoservice.udatePhotoProfile(userid, fileName);
		    }   
		}

		if(result != 0){
			return "success";
		}else{
			return "false";
		}
		
		
	}
	
	/* 팔로우, 팔로잉 insert, delete*/
	@RequestMapping(value = "/{userid}/photos/{photouserid}/follow", method = RequestMethod.POST)
	public int insertfollowcheck(@RequestBody Map<String, Object> params) {
		
		following.setFollowingId((String)params.get("followingId"));
		following.setUsersUserid((String)params.get("usersuserId"));
		int result = 0;
		
		if(params.get("follow").equals("팔로우")) {
			photoservice.insertFollow(following);
			result = 1;
		}else if(params.get("follow").equals("팔로잉")) {
			photoservice.deleteFollow(following);
			result = 0;
		}
		return result;
	}
	
	/* 팔로우, 팔로잉 체크 */
	@RequestMapping(value = "/{userid}/photos/followcheck", method = RequestMethod.POST)
	public FollowingVo getFollowcheck(String followingid, String usersuserid) {
		
		FollowingVo getfollowing = null;
		
		getfollowing = photoservice.getFollowing(followingid, usersuserid);
		
		return getfollowing;
	}
	
	/* repost insert */
	@RequestMapping(value = "/{userid}/reposts/{photouserid}/{photoid}", method = RequestMethod.POST)
	public String insertReposts(@PathVariable("photouserid") String photouserid, @PathVariable("userid") String userid, @PathVariable("photoid") int photoid, String repost) {
		
		PhotoRegisterVo coordinates = photoservice.getCoordinates(photoid);
		
		int result = photoservice.insertTransaction(userid, photoid, repost);
		
		if(result == 1 && coordinates != null){
			PhotosVo photo = photoservice.getRefphotos(photoid);
			coordinates.setPhotoId(photo.getPhotoId());
			photoservice.insertCoordinates(coordinates);
		}
		
		return "success";
	}
	
	/* 비밀번호 체크 */
	@RequestMapping(value = "/{userid}/photos/passwordcheck", method = RequestMethod.GET)
	public int getPasswordCheck(@PathVariable("userid")String userid, @RequestParam("password")String password, Model model) {
		
		usersvo = usersservice.getUsers(userid);
		
		if(bCryptPasswordEncoder.matches(password, usersvo.getPassword())){
			return 1;
		}else {
			return 0;
		}
		
	}
	
	/* 댓글 카운트 */
	@RequestMapping(value = "/commentcount/{photoid}", method = RequestMethod.POST)
	public int commentcount(@PathVariable("photoid")int photoid) {
		return photoservice.commentCount(photoid);
	}
	
	/* 무한스크롤 타임라인 */
	@RequestMapping(value = "{userid}/photos/loads", method = RequestMethod.POST)
	public List<PhotosVo> getLimitPhotoLoads(@PathVariable("userid")String userid, @RequestParam(value= "limit", defaultValue = "0") int limit) {
		
		List<PhotosVo> photosvo = photoservice.getAllLimitPhotos(userid, limit);
		
		return photosvo;
	}
	
	/* 무한스크롤 좋아요 */
	@RequestMapping(value = "{userid}/photos/likesloads", method = RequestMethod.POST)
	public List<PhotosVo> getLimitLikesPhotoLoads(@PathVariable("userid")String userid, @RequestParam(value= "limit", defaultValue = "0") int limit) {
		
		List<PhotosVo> photosvo = photoservice.getLimitPhotoLikes(userid, limit);
		
		return photosvo;
	}
    
	/* 검색 소셜 아이디 */
    @RequestMapping(value="/searchUserid/{keyword}", method=RequestMethod.GET)
    public List<String> searchUserid(@PathVariable("keyword") String keyword){
    	System.out.println(keyword);
    	System.out.println("리턴 값 : " + photoservice.searchUserid(keyword));
        return photoservice.searchUserid(keyword);
    }
    
    /* 검색 #태그로 검색 */
    @RequestMapping(value="/searchTagName/{keyword}", method=RequestMethod.GET)
    public List<String> searchTagName(@PathVariable("keyword") String keyword){
    	System.out.println(keyword);
        System.out.println("리턴 값 : " + photoservice.searchTagName(keyword));
        return photoservice.searchTagName(keyword);
    }
    
    /* 검색 조건에 맞는 태그의 사진 가져오기 */
    @RequestMapping(value="/searchPhotoTags/{keyword}", method=RequestMethod.GET)
    public List<BigInteger> searchPhotoTags(@PathVariable("keyword") String keyword){
        return photoservice.searchPhotoTags(keyword);
    }
    
    /* 검색 많이 검색한 태그의 사진 랭크 */
    @RequestMapping(value="/searchPhotoTagsbyRanking/{keyword}", method=RequestMethod.GET)
    public List<BigInteger> searchPhotoTagsbyRanking(@PathVariable("keyword") String keyword){
        rankingVoList = photoservice.searchPhotoTagsbyRanking(keyword);
        List<BigInteger> photoidList = new ArrayList<>();
        for (RankingVo rankingVo : rankingVoList) {
            photoidList.add(rankingVo.getPhotoid());
        }
        return photoidList;
    }
}
