package service;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.PhotosDao;
import utils.TranslationUtil;
import vo.CommentsPhotoIdjoinVo;
import vo.CommentsVo;
import vo.CommentsjoinVo;
import vo.FeedLikesVo;
import vo.FollowingVo;
import vo.LikesVo;
import vo.PhotoRegisterVo;
import vo.PhotoTagsJoinVo;
import vo.PhotosVo;
import vo.RankingVo;
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
	
	public void deleteRepost(String userid, int photoid) {
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		HashMap<String, Object> repost = new HashMap<String, Object>();
		
		repost.put("userid", userid);
		repost.put("photoid", photoid);
		
		dao.deleteRepost(repost);
		
	}
	
	public void insertCoordinates(PhotoRegisterVo photoRegisterVo) {
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		dao.insertCoordinates(photoRegisterVo);
	}
	
	public PhotoRegisterVo getCoordinates(int photoid){
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		BigInteger photoNum = BigInteger.valueOf(photoid);
		return dao.getCoordinates(photoNum);
	}
	
	public void deletePhoto(String userid, int photoid) {
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("photoid", photoid);
		dao.deletePhoto(map);
	}
	
	public int commentCount(int photoid) {
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		return dao.commentCount(photoid);
	}
	
	public List<PhotosVo> getAllLimitPhotos(String userid, int limit){
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("limit", limit);
		return dao.getAllLimitPhotos(map);
	}
	
	public List<PhotosVo> getLimitPhotoLikes(String userid, int limit){
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("limit", limit);
		return dao.getLimitPhotoLikes(map);
	}
	
	public List<PhotoTagsJoinVo> getPhotoTags(int photoid){
		
		PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
		
		return dao.getPhotoTags(photoid);
		
	}
	
	public List<String> searchUserid(String keyword){
        PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
        return dao.searchUserid(keyword);
    }
    
    public List<String> searchTagName(String keyword) {
        PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
        HashMap<String, String> map = new HashMap<String, String>();
        String language = "";
        language = TranslationUtil.detectLanguage(keyword);
        System.out.println(language);
        if(language == "") {
            language = "KO";  
        }
        map.put("language", language);
        map.put("keyword", keyword);
        return dao.searchTagName(map);
    }
    
    public List<BigInteger> searchPhotoTags(String keyword) {
        PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
        HashMap<String, String> map = new HashMap<String, String>();
        String language = "";
        language = TranslationUtil.detectLanguage(keyword);
        System.out.println(language);
        if(language == "") {
            language = "KO";  
        }
        map.put("language", language);
        map.put("keyword", keyword);
        return dao.searchPhotoTags(map);
    }
    
    public List<RankingVo> searchPhotoTagsbyRanking(String keyword) {
        PhotosDao dao = sqlsession.getMapper(PhotosDao.class);
        HashMap<String, String> map = new HashMap<String, String>();
        String language = "";
        language = TranslationUtil.detectLanguage(keyword);
        System.out.println(language);
        if(language == "") {
            language = "KO";  
        }
        map.put("language", language);
        map.put("keyword", keyword);
        return dao.searchPhotoTagsbyRanking(map);       
    }
}
