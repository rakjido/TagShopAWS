package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import service.PhotosService;
import service.ProfileService;
import service.UsersService;
import vo.CommentsPhotoIdjoinVo;
import vo.CommentsVo;
import vo.CommentsjoinVo;
import vo.FeedLikesVo;
import vo.FollowingVo;
import vo.LikesVo;
import vo.PhotosVo;
import vo.ProfileVo;
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
	
}
