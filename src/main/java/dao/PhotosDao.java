package dao;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import vo.CommentsPhotoIdjoinVo;
import vo.CommentsVo;
import vo.CommentsjoinVo;
import vo.FeedLikesVo;
import vo.FollowerVo;
import vo.FollowingVo;
import vo.LikesVo;
import vo.PhotoLikePhotosVo;
import vo.PhotoRegisterVo;
import vo.PhotoTagsJoinVo;
import vo.PhotosVo;
import vo.RankingVo;
import vo.RepostsVo;

public interface PhotosDao {
	
//	public void insertPhotos(PhotosVo dto);
	
	public List<PhotosVo> getAllPhotos(String userid);
	
	public List<PhotosVo> getAllLimitPhotos(HashMap<String, Object> map);
	
//	public void updatePhotos(PhotosVo dto);
	
	public Integer getLikeCount(int photoid);
	
	public Integer getCommentCount(int photoid);
	
	public List<CommentsVo> getAllComments(int photoid);
	
	public List<CommentsjoinVo> getAllCommentsJoin(int photoid);
	
	public CommentsjoinVo getCommentsJoin(HashMap<String, Object> map);
	
	public int insertComments(CommentsVo comments);
	
	public int insertPhotos(PhotosVo photos);
	
	public int getFollowerCount(String userid); 
	
	public int getFollowingCount(String userid); 
	
	public PhotosVo getPhoto(int photoid);
	
	public List<PhotosVo> getPhotoLikes(String userid);
	
	public List<PhotosVo> getLimitPhotoLikes(HashMap<String, Object> map);
	
	public int insertLikes(LikesVo likes);
	
	public LikesVo getLikeCheck(HashMap<String, Object> map);
	
	public int getLikeCheckOk(HashMap<String, Object> map);
	
	public int insertFollow(FollowingVo follow);
	
	public int deleteFollow(FollowingVo follow);
	
	public FollowingVo getFollowing(HashMap<String, Object> map);
	
	public FollowerVo getFollower(HashMap<String, Object> map);
	
	public int udatePhotoProfile(HashMap<String, Object> map);
	
	public int insertReposts(HashMap<String, Object> map);
	
	public int insertRepostsPhotos(HashMap<String, Object> map);
	
	public PhotosVo getRefphotos(int photoid);
	
	public List<RepostsVo> getReposts(String userid);
	
	public List<CommentsPhotoIdjoinVo> getAllFeedPhotos(String userid);
	
	public List<FeedLikesVo> getFeedLikeCount(String userid);
	
	public void deleteRepost(HashMap<String, Object> map);
	
	public void insertCoordinates(PhotoRegisterVo photoRegisterVo);
	
	public PhotoRegisterVo getCoordinates(BigInteger photoId);
	
	public void deletePhoto(HashMap<String, Object> map);
	
	public int commentCount(int photoid);
	
	public List<PhotoTagsJoinVo> getPhotoTags(int photoid);
	
	public List<String> searchUserid(String keyword);
    
    public List<String> searchTagName(String keyword);
    
    public List<BigInteger> searchPhotoTags(HashMap<String, String> map);
    
    public List<RankingVo> searchPhotoTagsbyRanking(HashMap<String, String> map);
    
    public List<PhotoLikePhotosVo> getAllLikePhotos();
    
    public List<FollowerVo> getFollowerList(String userid);
    
    public List<FollowingVo> getFollowingList(String userid);
}
