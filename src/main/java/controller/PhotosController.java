package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.sf.json.JSONArray;
import service.PhotosService;
import service.ProfileService;
import service.ShopsService;
import service.UsersService;
import utils.CheckUtil;
import vo.CommentsPhotoIdjoinVo;
import vo.CommentsVo;
import vo.CommentsjoinVo;
import vo.FeedLikesVo;
import vo.FollowingVo;
import vo.LikesVo;
import vo.PhotoRegisterVo;
import vo.PhotosVo;
import vo.ProductsVo;
import vo.ProfileVo;
import vo.RepostsVo;
import vo.UsersVo;

@Controller
public class PhotosController {
	
	
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
	private RedisTemplate<String, String> redisTemplate;
	
	@Autowired
	private ShopsService shopsService;
	/*
     * @method name : feed
     *
     * @date : 2019.06.26
     *
     * @author : 김동민
     *
     * @description : feed 페이지
     *
     * @parameters : userid
     *
     * @return : String
     *
     * @example 
     */
	
	/* feed 페이지 */
	@RequestMapping(value = "/{userid}/feeds", method = RequestMethod.GET)
	public String feed(@PathVariable("userid") String userid,  Model model) {

		List<CommentsPhotoIdjoinVo> photos = photoservice.getAllFeedPhotos(userid);
		List<PhotosVo> timelinephoto = photoservice.getAllPhotos(userid);
		List<Integer> feedlikecount = new ArrayList<Integer>();
		
		ProfileVo profile = new ProfileVo();
		ProfileVo Myprofile = profileservice.getProfile(userid);
		int follower = photoservice.getFollowerCount(userid);
		int following = photoservice.getFollowingCount(userid);
		
		List<LikesVo> likecheck = new ArrayList<LikesVo>();
		
		List<String> photoList = new ArrayList<String>();
		List<List<CommentsjoinVo>> commentList = new ArrayList<List<CommentsjoinVo>>();
		List<RepostsVo> reposts = photoservice.getReposts(userid);
		String temp = "";
		List<String> repostsclass = new ArrayList<String>();
		
		for(int i =0; i < photos.size(); i ++) {
			profile.setPhotoName(profileservice.getProfile(photos.get(i).getUserId()).getPhotoName());
			photoList.add(profile.getPhotoName());
			commentList.add(photoservice.getAllCommentsJoin(photos.get(i).getPhotoId().intValue()));
			likecheck.add(photoservice.getLikeCheck(userid, photos.get(i).getPhotoId().intValue()));
			feedlikecount.add(photoservice.getLikeCount(photos.get(i).getPhotoId().intValue()));
			System.out.println(reposts.size());
			for(int j=0; j < reposts.size(); j ++) {
				if(String.valueOf(photos.get(i).getPhotoId()).equals(String.valueOf(reposts.get(j).getPhotoId()))) {
					temp = "Repost-black";
					break;
				} else {
					temp = "Repost";
			}
				
			}
			repostsclass.add(temp);
		}
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("photos", photos);
		model.addAttribute("anotherphotos", photoList);
		model.addAttribute("feedlikecount", feedlikecount);
		model.addAttribute("profile", Myprofile);
		model.addAttribute("follower", follower);
		model.addAttribute("following", following);
		model.addAttribute("likecheck", likecheck);
		model.addAttribute("repostsclass", repostsclass);
		model.addAttribute("timelinephoto", timelinephoto);
		
		
		return "photos/photoFeed";
	}
	
	/* 사진올리기 페이지 */
	@RequestMapping(value = "/{userid}/photos", method = RequestMethod.GET)
	public String getPhotoUpload() {
		
		return "ajaxview/photoUpload";
	}
	
	/* 사진올리기 */
	@RequestMapping(value = "/{userid}/photos", method = RequestMethod.POST)
	public String photoUpload(@PathVariable("userid") String userid, PhotosVo photosvo, PhotoRegisterVo photoRegisterVo,MultipartHttpServletRequest request) throws UnsupportedEncodingException {
		
		MultipartFile mf = request.getFile("file");
		System.out.println("photosvo " + photosvo);
		System.out.println("photoRegisterVo " + photoRegisterVo);
		if(mf != null) {
			String fileName = new String(mf.getOriginalFilename()); //파일명 얻기
			System.out.println("fileName : " + fileName);
			
			//업로드 파일명을 변경후 저장			
			String uploadedFileName = System.currentTimeMillis() 
					+ UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
		
			System.out.println("변경된 파일 명 : " + uploadedFileName);
			
		    String uploadPath = request.getSession().getServletContext().getRealPath("uploads");
		    System.out.println("uploads : "+ uploadPath);
		    if(mf.getSize() != 0) {	    	
		    	try {
					mf.transferTo(new File(uploadPath+"/"+fileName));
				} catch (IllegalStateException | IOException e) {
					System.out.println(e.getMessage());
				}	 
		    	photosvo.setFileName(fileName);
		    	photosvo.setUserId(userid);
		    }   
		}
		if(!("Ax1").equals(photoRegisterVo.getAx1())) { // 20190714 수정  https://m.blog.naver.com/tmondev/220791552394
			System.out.println(photoRegisterVo.getAx1());
			String[] arrayA = photoRegisterVo.getARefLink().split("/");
			String[] arrayB = photoRegisterVo.getBRefLink().split("/");
			System.out.println(photoRegisterVo.getAx1());
			photoRegisterVo.setARefProductId(BigInteger.valueOf(Integer.parseInt(arrayA[7])));
			photoRegisterVo.setBRefProductId(BigInteger.valueOf(Integer.parseInt(arrayB[7])));
			
			photoRegisterVo.setARefShopid(arrayA[5]);
			photoRegisterVo.setBRefShopid(arrayB[5]);
			
			int result = photoservice.insertPhotos(photosvo);
			photoservice.insertCoordinates(photoRegisterVo);
			
		} else {
			int result = photoservice.insertPhotos(photosvo);
		} 
		return "redirect:/{userid}/";
	}
	
	/* 사진보기(디테일) */
	@RequestMapping(value = "/{userid}/photos/{photouserid}/{photoid}", method = RequestMethod.POST)
	public String getPhoto(@PathVariable("photouserid") String photouserid, @PathVariable("userid") String userid, @PathVariable("photoid") int photoid, Model model) {
		JSONArray jsonArray = new JSONArray();

		photosvo = photoservice.getPhoto(photoid);
		List<PhotosVo> allphotos = photoservice.getAllPhotos(userid);
		List<CommentsjoinVo> comments = photoservice.getAllCommentsJoin(photoid);
		LikesVo likecheck = photoservice.getLikeCheck(userid, photoid);
		ProfileVo profile = profileservice.getProfile(photouserid);
		Map<String,Object> photodetail = new HashMap<String,Object>();
		List<RepostsVo> reposts = photoservice.getReposts(userid);
		
		
		HashMap<String,BigInteger> productMap = new HashMap<String, BigInteger>();
		
		PhotoRegisterVo coordinates = photoservice.getCoordinates(photoid);
		if(!CheckUtil.isEmpty(coordinates)) {  // 20190714 추가 
			productMap.put("productid1", coordinates.getARefProductId());
			productMap.put("productid2", coordinates.getBRefProductId());
			
			coordinates.setYAvg(Integer.parseInt(coordinates.getAy1())+(Integer.parseInt(coordinates.getAy2())-Integer.parseInt(coordinates.getAy1()))/2);
			coordinates.setXAvg(Integer.parseInt(coordinates.getAx1())+(Integer.parseInt(coordinates.getAx2())-Integer.parseInt(coordinates.getAx1()))/2);
			coordinates.setYBvg(Integer.parseInt(coordinates.getBy1())+(Integer.parseInt(coordinates.getBy2())-Integer.parseInt(coordinates.getBy1()))/2);
			coordinates.setXBvg(Integer.parseInt(coordinates.getBx1())+(Integer.parseInt(coordinates.getBx2())-Integer.parseInt(coordinates.getBx1()))/2);
			List<ProductsVo> productList = shopsService.getPhotoProduct(productMap);
			String repostsclass = null;
			
			if(userid.equals(photouserid)){
				for(int i= 0; i < reposts.size(); i++){
					if(String.valueOf(photosvo.getRefPhotoid()).equals(String.valueOf(reposts.get(i).getPhotoId()))){
						repostsclass = "Repost-black";
						break;
					} else {
						repostsclass = "Repost";
					}
				}
			} else {
				for(int i = 0; i < reposts.size(); i++) {
					if(String.valueOf(photoid).equals(String.valueOf(reposts.get(i).getPhotoId()))) {
						repostsclass = "Repost-black";
						break;
					} else {
						repostsclass = "Repost";
					}
				}
			}

			System.out.println(repostsclass);
			photodetail.put("repostsclass", repostsclass);

			model.addAttribute("productList", jsonArray.fromObject(productList));
			model.addAttribute("coordinates", coordinates);

		} //if(CheckUtil.isEmpty(coordinates)) { 
		
		
		
		
		photodetail.put("photos", photosvo);
		photodetail.put("comments", comments);
		photodetail.put("likecheck", likecheck);
		photodetail.put("profile", profile);
		photodetail.put("reposts", reposts);
		
		
		model.addAttribute("photodetail", photodetail);

		
		return "ajaxview/photoDetail";
	}
	
	/* 좋아요 및 comment 카운트 ajax */
	@RequestMapping(value = "/{userid}/photos/{photoid}/likes", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getLikeCount(@PathVariable("userid") String userid, @PathVariable("photoid") int photoid) {
		
		Map<String,Object> allcheck = new HashMap<String, Object>();
		
		Integer likecount = photoservice.getLikeCount(photoid);
		Integer commentcount = photoservice.getCommentCount(photoid);
		
		allcheck.put("likecount", likecount);
		allcheck.put("commentcount", commentcount);
		
		return allcheck;
	}
	
	/* 좋아요 클릭전에 DB에 null 값이면 좋아요 테이블 insert ajax */
	@ResponseBody
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
	@ResponseBody
	@RequestMapping(value = "/{userid}/likecheckok", method = RequestMethod.POST)
	public int getLikeCheckTrue(String userid, int photoid, boolean likeyn) {
		
		System.out.println(userid + photoid + likeyn);
		
		int result = photoservice.getLikeCheckOk(userid, photoid, likeyn);
		
		if(result != 0) {
			return 1;
		}else {
			return 0;
		}
		
	}
	
	/* 타임라인 페이지 */
	@RequestMapping(value = "/{userid}/", method = {RequestMethod.POST, RequestMethod.GET})
	public String getTimelinePhotos(@PathVariable("userid") String userid,Model model) {
		
/*		String value = redisTemplate.opsForValue().get(userid);
		Set<String> keys = redisTemplate.keys("*");
		
		for (String key : keys) {
			System.out.println(key);
			//redisTemplate.delete(key);
		}
		
		String connectcheck = "";
		if(value != null) {
			System.out.println("널 아님" + value);
			connectcheck = "connecting";
		}else {
			System.out.println("널 임" + value);
			connectcheck = "nonconnect";
		}*/
		
		List<PhotosVo> timelinephoto = photoservice.getAllPhotos(userid);
		ProfileVo profile = profileservice.getProfile(userid);
		int follower = photoservice.getFollowerCount(userid);
		int following = photoservice.getFollowingCount(userid);
		
		model.addAttribute("timelinephoto", timelinephoto);
		model.addAttribute("profile", profile);
		model.addAttribute("follower", follower);
		model.addAttribute("following", following);
		//model.addAttribute("connectcheck", connectcheck);
		

		return "photos/photoTimeline";
	}
	
	
	/* 좋아요 페이지 */
	@RequestMapping(value = "/{userid}/likes", method = {RequestMethod.POST, RequestMethod.GET})
	public String like(@PathVariable("userid") String userid, Model model) {
		
		List<PhotosVo> photoslike = photoservice.getPhotoLikes(userid);
		List<PhotosVo> timelinephoto = photoservice.getAllPhotos(userid);
		ProfileVo profile = profileservice.getProfile(userid);
		int follower = photoservice.getFollowerCount(userid);
		int following = photoservice.getFollowingCount(userid);
		
		model.addAttribute("photos", photoslike);
		model.addAttribute("profile", profile);
		model.addAttribute("follower", follower);
		model.addAttribute("following", following);
		model.addAttribute("timelinephoto", timelinephoto);

		return "photos/photoLike";
	}
	
	/* comment 쓰기 ajax */
	@ResponseBody
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
	
	/* 프로필 수정 페이지 */
	@RequestMapping(value = "/{userid}/photos/edit", method = RequestMethod.GET)
	public String getProfile(@PathVariable("userid") String userid, Model model) {
		
		usersvo = usersservice.getUsers(userid);
		profilevo = profileservice.getProfile(userid);
		
		Map<String, Object> edit = new HashMap<String, Object>();
		
		edit.put("users", usersvo);
		edit.put("profile", profilevo);
		
		System.out.println(edit);
		
		model.addAttribute("edit", edit);
		
		return "photos/photosProfile";
	}
	
	// 20190714 @Transaction 추가 
	@Transactional
	@RequestMapping(value = "/{userid}/photos/edit", method = RequestMethod.POST)
	public String updateProfile(@PathVariable("userid") String userid, ProfileVo profilevo, UsersVo usersvo) {
		
		System.out.println(profilevo);
		System.out.println(usersvo);
		
		//20190714 deleted usersvo.setEnabled(true);
		System.out.println(">"+profilevo.getUserid()+"<");
		System.out.println(profilevo.getIntroduction());
		System.out.println(profilevo.getWebsite());
		profileservice.updateSnsProfile(profilevo);
		usersservice.updateUsers(usersvo);
		
		return "redirect:/{userid}/photos/edit";
	}
	
	@ResponseBody
	@RequestMapping(value = "/{userid}/profile/photo", method = RequestMethod.POST)
	public String getPhotoEdit(@PathVariable("userid") String userid, MultipartHttpServletRequest request) throws UnsupportedEncodingException {
		
		int result = 0;
		
		MultipartFile mf = request.getFile("photofile");
		if(mf != null) {
			String fileName = new String(mf.getOriginalFilename()); //파일명 얻기
			System.out.println("fileName : " + fileName);
			
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
	
	@ResponseBody
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
	
	@ResponseBody
	@RequestMapping(value = "/{userid}/photos/followcheck", method = RequestMethod.POST)
	public FollowingVo getFollowcheck(String followingid, String usersuserid) {
		
		FollowingVo getfollowing = null;
		
		getfollowing = photoservice.getFollowing(followingid, usersuserid);
		
		return getfollowing;
	}
	
	@RequestMapping(value = "/{userid}/reposts/{photouserid}/{photoid}", method = RequestMethod.GET)
	public String getReposts(@PathVariable("photouserid") String photouserid, @PathVariable("userid") String userid, @PathVariable("photoid") int photoid, Model model) {
		
		photosvo = photoservice.getPhoto(photoid);
		List<CommentsjoinVo> comments = photoservice.getAllCommentsJoin(photoid);
		LikesVo likecheck = photoservice.getLikeCheck(userid, photoid);
		ProfileVo profile = profileservice.getProfile(photosvo.getUserId());
		Map<String,Object> photodetail = new HashMap<String,Object>();
		
		photodetail.put("photos", photosvo);
		photodetail.put("comments", comments);
		photodetail.put("likecheck", likecheck);
		photodetail.put("profile", profile);
		
		model.addAttribute("photodetail", photodetail);
		
		
		System.out.println(comments);
		return "ajaxview/photoRepost";
	}
	
	@ResponseBody
	@RequestMapping(value = "/{userid}/reposts/{photouserid}/{photoid}", method = RequestMethod.POST)
	public String insertReposts(@PathVariable("photouserid") String photouserid, @PathVariable("userid") String userid, @PathVariable("photoid") int photoid, String repost) {
		
		photoservice.insertTransaction(userid, photoid, repost);
		
		return "success";
	}
	
	@RequestMapping(value = "/{userid}/repostsOk/{photouserid}/{photoid}", method = RequestMethod.POST)
	public String deleteReposts(@PathVariable("photouserid") String photouserid, @PathVariable("userid") String userid, @PathVariable("photoid") int photoid, String timeline) {
		
		System.out.println("컨트롤러 탐");
		
		System.out.println(timeline);
		System.out.println(photoid);
		PhotosVo photosvo = new PhotosVo();
		
		if(timeline.equals("timeline")){
			photosvo = photoservice.getPhoto(photoid);
			photoservice.deleteRepost(userid, photosvo.getRefPhotoid().intValue());
		} else {
			photoservice.deleteRepost(userid, photoid);
		}
		
		return "redirect:/{userid}/";
	}
	
	@RequestMapping(value = "/{userid}/chats", method = RequestMethod.GET)
	public String getChat(@RequestParam("photouserid")String photouserid, Model model) {
		
		System.out.println(photouserid);
		
		ProfileVo profilevo = profileservice.getProfile(photouserid);
		
		System.out.println(profilevo);
		
		model.addAttribute("profilevo", profilevo);
		
		return "ajaxview/PhotoChat";
	}
	
	@RequestMapping(value = "/{userid}/photos/editpassword", method = RequestMethod.GET)
	public String getEditPassword(@PathVariable("userid")String userid, Model model) {
		
		
		return "ajaxview/PhotoEditPassword";
	}
	
	

}
