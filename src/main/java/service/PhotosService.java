package service;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.PhotosDao;
import vo.CommentsPhotoIdjoinVo;
import vo.CommentsVo;
import vo.CommentsjoinVo;
import vo.FeedLikesVo;
import vo.FollowingVo;
import vo.LikesVo;
import vo.PhotosVo;
import vo.RepostsVo;

@Service
public class PhotosService {
	
	@Autowired
	private SqlSession sqlsession;
	
/*	public void insertPhotos(PhotosVo dto) {
		
	}*/
	
	public List<PhotosVo> getAllPhotos(String userid) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.getAllPhotos(userid);
	}
	
	/*public void updatePhotos(PhotosVo dto) {
		
	}*/
	
	public Integer getLikeCount(int photoid) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.getLikeCount(photoid);
		
	}
	
	public Integer getCommentCount(int photoid) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.getCommentCount(photoid);
	}
	
	public int getFollowerCount(String userid) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.getFollowerCount(userid);
		
	}
	
	public int getFollowingCount(String userid) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.getFollowingCount(userid);
		
	}
	
	public PhotosVo getPhoto(int photoid) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.getPhoto(photoid);
		
	}
	
	public List<CommentsVo> getAllComments(int photoid) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.getAllComments(photoid);
	}
	
	public List<CommentsjoinVo> getAllCommentsJoin(int photoid) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.getAllCommentsJoin(photoid);
		
	}
	
	public int insertLikes(LikesVo likes) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.insertLikes(likes);
		
	}
	
	public LikesVo getLikeCheck(String userid, int photoid) {
		
		HashMap<String, Object> check = new HashMap<String, Object>();
		
		check.put("userid", userid);
		check.put("photoid", photoid);
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.getLikeCheck(check);
	}
	
	public int getLikeCheckOk(String userid, int photoid, boolean likeyn) {
		
		HashMap<String, Object> check = new HashMap<String, Object>();
		
		check.put("userid", userid);
		check.put("photoid", photoid);
		check.put("likeyn", likeyn);
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.getLikeCheckOk(check);
		
	}
	
	public int insertComments(CommentsVo comments) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.insertComments(comments);
	}
	
	public CommentsjoinVo getCommentsJoin(String userid, BigInteger photoid) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		HashMap<String, Object> comment = new HashMap<String, Object>();
		comment.put("userid", userid);
		comment.put("photoid", photoid);
		
		return dao.getCommentsJoin(comment);
		
	}
	
	public int insertPhotos(PhotosVo photos) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.insertPhotos(photos);
		
	}
	
	public List<PhotosVo> getPhotoLikes(String userid) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.getPhotoLikes(userid);
		
	}
	
	public int insertFollow(FollowingVo follow) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.insertFollow(follow);
		
	}
	
	public int deleteFollow(FollowingVo follow) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.deleteFollow(follow);
	}
	
	public FollowingVo getFollowing(String followingid, String usersuserid) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		HashMap<String, Object> following = new HashMap<String, Object>();
		following.put("followingid", followingid);
		following.put("usersuserid", usersuserid);
		
		return dao.getFollowing(following);
		
	}
	
	public int udatePhotoProfile(String userid, String fileName) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		HashMap<String, Object> photoedit = new HashMap<String, Object>();
		photoedit.put("userid", userid);
		photoedit.put("fileName", fileName);
		
		return dao.udatePhotoProfile(photoedit);
	}
	
	@Transactional
	public void insertTransaction(String userid, int photoid, String reposts) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		HashMap<String, Object> repostphotos = new HashMap<String, Object>();
		
		repostphotos.put("userid", userid);
		repostphotos.put("photoid", photoid);
		repostphotos.put("reposts", reposts);
		repostphotos.put("buyyn", false);
		
		dao.insertReposts(repostphotos);
		dao.insertRepostsPhotos(repostphotos);
		
	}
	
	public List<RepostsVo> getReposts(String userid) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.getReposts(userid);
	}
	
	public List<CommentsPhotoIdjoinVo> getAllFeedPhotos(String userid) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.getAllFeedPhotos(userid);
	}
	
	public List<FeedLikesVo> getFeedLikeCount(String userid) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.getFeedLikeCount(userid);
		
	}

}
