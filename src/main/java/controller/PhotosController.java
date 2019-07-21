package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import service.TagsLocaleService;
import service.UsersService;
import utils.CheckUtil;
import vo.CommentsPhotoIdjoinVo;
import vo.CommentsVo;
import vo.CommentsjoinVo;
import vo.FeedLikesVo;
import vo.FollowingVo;
import vo.LikesVo;
import vo.PhotoRegisterVo;
import vo.PhotoTagsJoinVo;
import vo.PhotosVo;
import vo.ProductsVo;
import vo.ProfileVo;
import vo.RecommendVo;
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
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private TagsLocaleService tagsLocaleService;
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

		Date today = new Date();
		int hours=0;
		int minute=0;
		String datetext = "";
		List<CommentsPhotoIdjoinVo> photos = photoservice.getAllFeedPhotos(userid);
		List<PhotosVo> timelinephoto = photoservice.getAllPhotos(userid);
		List<Integer> feedlikecount = new ArrayList<Integer>();
		List<RecommendVo> recommend = usersservice.recommend(userid);
		List<String> photodate = new ArrayList<String>();
		
		ProfileVo profile = new ProfileVo();
		ProfileVo Myprofile = profileservice.getProfile(userid);
		int follower = photoservice.getFollowerCount(userid);
		int following = photoservice.getFollowingCount(userid);
		
		List<LikesVo> likecheck = new ArrayList<LikesVo>();
		
		List<String> photoList = new ArrayList<String>();
		List<List<CommentsjoinVo>> commentList = new ArrayList<List<CommentsjoinVo>>();
		List<RepostsVo> reposts = photoservice.getReposts(userid);
		List<String> repostsclass = new ArrayList<String>();
		List<List<PhotoTagsJoinVo>> tags =  new ArrayList<List<PhotoTagsJoinVo>>();
		
		
		
		for(int i =0; i < photos.size(); i ++) {
			profile.setPhotoName(profileservice.getProfile(photos.get(i).getUserId()).getPhotoName());
			photoList.add(profile.getPhotoName());
			commentList.add(photoservice.getAllCommentsJoin(photos.get(i).getPhotoId().intValue()));
			likecheck.add(photoservice.getLikeCheck(userid, photos.get(i).getPhotoId().intValue()));
			feedlikecount.add(photoservice.getLikeCount(photos.get(i).getPhotoId().intValue()));
			tags.add(photoservice.getPhotoTags(photos.get(i).getPhotoId().intValue()));
			
			hours = today.getHours() - photos.get(i).getCreateDate().getHours();
			minute = today.getMinutes() - photos.get(i).getCreateDate().getMinutes();
			
			
			if (photos.get(i).getDateDiff() != 0) {
				datetext = photos.get(i).getDateDiff() + "일 전";
				photodate.add(datetext);
			}else if(hours > 0 && photos.get(i).getDateDiff() == 0){
				datetext = hours + "시간 전";
				photodate.add(datetext);
			}else{
				datetext = minute + "분 전";
				photodate.add(datetext);
			}
			
			if(reposts.size() == 0) {
				repostsclass.add("Repost");
			}else {
				
				for(int j=0; j < reposts.size(); j ++) {
					System.out.println(String.valueOf(photos.get(i).getPhotoId()).equals(String.valueOf(reposts.get(j).getPhotoId())));
					if(String.valueOf(photos.get(i).getPhotoId()).equals(String.valueOf(reposts.get(j).getPhotoId()))) {
						repostsclass.add("Repost-black");
						break;
					} else {
						repostsclass.add("Repost");
					}
					
				}
			}
			
		}
		
		
		model.addAttribute("photodate", photodate);
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
		model.addAttribute("recommend", recommend);
		model.addAttribute("phototags", tags);
		
		return "photos/photoFeed";
	}
	
	/* 사진올리기 페이지 */
	@RequestMapping(value = "/{userid}/photos", method = RequestMethod.GET)
	public String getPhotoUpload() {
		
		return "ajaxview/photoUpload";
	}
	
	/* 사진올리기 */
	@RequestMapping(value = "/{userid}/photos", method = RequestMethod.POST)
	public String photoUpload(@PathVariable("userid") String userid, PhotosVo photosvo, PhotoRegisterVo photoRegisterVo,MultipartHttpServletRequest request,
			@RequestParam(value="tagText1", defaultValue="") String tagText1,
			@RequestParam(value="tagText2", defaultValue="") String tagText2,
			@RequestParam(value="tagText3", defaultValue="") String tagText3) throws UnsupportedEncodingException {
		
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
		
		if(photoRegisterVo.getARefLink().equals("")) {
			photoRegisterVo.setARefLink("http://192.168.1.22:8090/tagshop/shops/test/products/45");
		}
		System.out.println(photoRegisterVo.getBRefLink());
		if(photoRegisterVo.getBRefLink().equals("noLink")) {
			photoRegisterVo.setBRefLink("http://192.168.1.22:8090/tagshop/shops/test/products/45");
		}
		
		if(!("Ax1").equals(photoRegisterVo.getAx1())) { // 20190714 수정  https://m.blog.naver.com/tmondev/220791552394
			String[] arrayA = photoRegisterVo.getARefLink().split("/");
			photoRegisterVo.setARefProductId(BigInteger.valueOf(Integer.parseInt(arrayA[7])));
			photoRegisterVo.setARefShopid(arrayA[5]);
			
			String[] arrayB = photoRegisterVo.getBRefLink().split("/");
			photoRegisterVo.setBRefProductId(BigInteger.valueOf(Integer.parseInt(arrayB[7])));
			photoRegisterVo.setBRefShopid(arrayB[5]);
			
			int result = photoservice.insertPhotos(photosvo);
			photoservice.insertCoordinates(photoRegisterVo);
		} else {
			int result = photoservice.insertPhotos(photosvo);
		}
		
		
		
		if(tagText1 != null && !(tagText1.equals(""))) {
			System.out.println("text1 : " + tagText1);
			HashMap<String, String> map = tagsLocaleService.addMultiTags(tagText1);
			tagsLocaleService.addPhotoTags(tagsLocaleService.getTagsId(map));
		}
		
		if(tagText2  != null && !(tagText2.equals(""))) {
			HashMap<String, String> map = tagsLocaleService.addMultiTags(tagText2);
			tagsLocaleService.addPhotoTags(tagsLocaleService.getTagsId(map));
		}
		
		if(tagText3  != null && !(tagText3.equals(""))) {
			HashMap<String, String> map = tagsLocaleService.addMultiTags(tagText3);
			tagsLocaleService.addPhotoTags(tagsLocaleService.getTagsId(map));
		}
		
		
		return "redirect:/{userid}/";
	}
	
	/* 사진보기(디테일) */
	@RequestMapping(value = "/{userid}/photos/{photouserid}/{photoid}", method = RequestMethod.POST)
	public String getPhoto(@PathVariable("photouserid") String photouserid, @PathVariable("userid") String userid, @PathVariable("photoid") int photoid, Model model) {
		
		JSONArray jsonArray = new JSONArray();
		
		Date today = new Date();
		int time=0;
		int minute=0;
		
		FollowingVo getfollowing = null;
		
		getfollowing = photoservice.getFollowing(photouserid, userid);
		photosvo = photoservice.getPhoto(photoid);
		List<PhotosVo> allphotos = photoservice.getAllPhotos(userid);
		List<CommentsjoinVo> comments = photoservice.getAllCommentsJoin(photoid);
		LikesVo likecheck = photoservice.getLikeCheck(userid, photoid);
		ProfileVo profile = profileservice.getProfile(photouserid);
		Map<String,Object> photodetail = new HashMap<String,Object>();
		List<RepostsVo> reposts = photoservice.getReposts(userid);
		List<PhotoTagsJoinVo> phototag = photoservice.getPhotoTags(photoid);
		

		if (photosvo.getDateDiff().equals("0")) {
			time = today.getHours() - photosvo.getCreateDate().getHours();
			if (time == 0) {
				minute = today.getMinutes() - photosvo.getCreateDate().getMinutes();
			}
		}
		
		
		HashMap<String,BigInteger> productMap = new HashMap<String, BigInteger>();
		
		PhotoRegisterVo coordinates = photoservice.getCoordinates(photoid);
		String repostsclass = null;
		System.out.println(reposts.size());
		
		if(reposts.size() == 0) {
			repostsclass = "Repost";
		}else
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

		
		if(!CheckUtil.isEmpty(coordinates)) {  // 20190714 추가 
			productMap.put("productid1", coordinates.getARefProductId());
			productMap.put("productid2", coordinates.getBRefProductId());
			
			coordinates.setYAvg(Integer.parseInt(coordinates.getAy1())+(Integer.parseInt(coordinates.getAy2())-Integer.parseInt(coordinates.getAy1()))/2);
			coordinates.setXAvg(Integer.parseInt(coordinates.getAx1())+(Integer.parseInt(coordinates.getAx2())-Integer.parseInt(coordinates.getAx1()))/2);
			coordinates.setYBvg(Integer.parseInt(coordinates.getBy1())+(Integer.parseInt(coordinates.getBy2())-Integer.parseInt(coordinates.getBy1()))/2);
			coordinates.setXBvg(Integer.parseInt(coordinates.getBx1())+(Integer.parseInt(coordinates.getBx2())-Integer.parseInt(coordinates.getBx1()))/2);
			List<ProductsVo> productList = shopsService.getPhotoProduct(productMap);

			model.addAttribute("productList", jsonArray.fromObject(productList));
			model.addAttribute("coordinates", coordinates);
			
			
			
		} //if(CheckUtil.isEmpty(coordinates)) { 
		
		
		
		System.out.println(getfollowing);
		
		photodetail.put("time", time);
		photodetail.put("minute", minute);
		photodetail.put("repostsclass", repostsclass);
		photodetail.put("photos", photosvo);
		photodetail.put("comments", comments);
		photodetail.put("likecheck", likecheck);
		photodetail.put("profile", profile);
		photodetail.put("reposts", reposts);
		photodetail.put("phototag", phototag);
		photodetail.put("followcheck", getfollowing);
		
		
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
	public String getTimelinePhotos(@PathVariable("userid") String userid, @RequestParam(value= "limit", defaultValue = "0") int limit, Model model) {
		
		System.out.println(limit);
		
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
		
		List<PhotosVo> timelinephoto = photoservice.getAllLimitPhotos(userid, limit);
		
		System.out.println(timelinephoto);
		
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
	public String like(@PathVariable("userid") String userid,  @RequestParam(value= "limit", defaultValue = "0") int limit, Model model) {
		
		limit = 0;
		
		List<PhotosVo> photoslike = photoservice.getLimitPhotoLikes(userid, limit);
		
		System.out.println("좋아요 photos : " + photoslike);
		
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
	
	@RequestMapping(value = "/{userid}/tag/{tagname}", method = {RequestMethod.POST, RequestMethod.GET})
	public String getTagPhoto(@PathVariable("userid") String userid, @PathVariable("tagname") String tagname, @RequestParam(value= "limit", defaultValue = "0") int limit, Model model) {
		
		List<PhotosVo> timelinephoto = photoservice.getAllLimitPhotos(userid, limit);
		
		System.out.println(timelinephoto);
		
		ProfileVo profile = profileservice.getProfile(userid);
		int follower = photoservice.getFollowerCount(userid);
		int following = photoservice.getFollowingCount(userid);
		
		model.addAttribute("timelinephoto", timelinephoto);
		model.addAttribute("profile", profile);
		model.addAttribute("follower", follower);
		model.addAttribute("following", following);

		return "photos/photoTag";
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
	
	@RequestMapping(value = "/{userid}/photos/editpassword", method = RequestMethod.POST)
	public String updateEditPassword(@PathVariable("userid")String userid, @RequestParam("repassword")String password ,Model model) {
		
		usersservice.updateUsersPassword(userid, bCryptPasswordEncoder.encode(password));
		
		return "redirect:/{userid}/photos/edit";
	}
	
	@RequestMapping(value = "/{userid}/photos/editprofile", method = RequestMethod.GET)
	public String getEditProfile(@PathVariable("userid")String userid, Model model) {
		
		usersvo = usersservice.getUsers(userid);
		profilevo = profileservice.getProfile(userid);
		
		Map<String, Object> edit = new HashMap<String, Object>();
		
		edit.put("users", usersvo);
		edit.put("profile", profilevo);
		
		System.out.println(edit);
		
		model.addAttribute("edit", edit);
		
		return "ajaxview/PhotoEditProfile";
	}
	
	@ResponseBody
	@RequestMapping(value = "/{userid}/photos/passwordcheck", method = RequestMethod.GET)
	public int getPasswordCheck(@PathVariable("userid")String userid, @RequestParam("password")String password, Model model) {
		
		usersvo = usersservice.getUsers(userid);
		
		if(bCryptPasswordEncoder.matches(password, usersvo.getPassword())){
			return 1;
		}else {
			return 0;
		}
		
	}
	
	@RequestMapping(value = "/{userid}/photos/{photoid}/delete", method = RequestMethod.GET)
	public String deletePhoto(
			@PathVariable("userid")String userid,
			@PathVariable("photoid")int photoid) {
		
		System.out.println("userid체크 : " + userid);
		System.out.println("photoid 체크 : " + photoid);
		
		photoservice.deletePhoto(userid, photoid);
		
		return "redirect:/{userid}/";
	}
	
	@ResponseBody
	@RequestMapping(value = "/commentcount/{photoid}", method = RequestMethod.POST)
	public int commentcount(@PathVariable("photoid")int photoid) {
		return photoservice.commentCount(photoid);
	}
	
	@ResponseBody
	@RequestMapping(value = "{userid}/photos/loads", method = RequestMethod.POST)
	public List<PhotosVo> getLimitPhotoLoads(@PathVariable("userid")String userid, @RequestParam(value= "limit", defaultValue = "0") int limit) {
		
		List<PhotosVo> photosvo = photoservice.getAllLimitPhotos(userid, limit);
		
		System.out.println(photosvo);
		
		return photosvo;
	}
	
	@ResponseBody
	@RequestMapping(value = "{userid}/photos/likesloads", method = RequestMethod.POST)
	public List<PhotosVo> getLimitLikesPhotoLoads(@PathVariable("userid")String userid, @RequestParam(value= "limit", defaultValue = "0") int limit) {
		
		List<PhotosVo> photosvo = photoservice.getLimitPhotoLikes(userid, limit);
		
		System.out.println(photosvo);
		
		return photosvo;
	}
	
	

}
