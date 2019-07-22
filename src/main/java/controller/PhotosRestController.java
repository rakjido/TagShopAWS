package controller;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    
    
    @RequestMapping(value="/searchUserid/{keyword}", method=RequestMethod.GET)
    public List<String> searchUserid(@PathVariable("keyword") String keyword){
    	System.out.println(keyword);
    	System.out.println("리턴 값 : " + photoservice.searchUserid(keyword));
        return photoservice.searchUserid(keyword);
    }
    
    @RequestMapping(value="/searchTagName/{keyword}", method=RequestMethod.GET)
    public List<String> searchTagName(@PathVariable("keyword") String keyword){
    	System.out.println(keyword);
        System.out.println("리턴 값 : " + photoservice.searchTagName(keyword));
        return photoservice.searchTagName(keyword);
    }
    
    @RequestMapping(value="/searchPhotoTags/{keyword}", method=RequestMethod.GET)
    public List<BigInteger> searchPhotoTags(@PathVariable("keyword") String keyword){
        return photoservice.searchPhotoTags(keyword);
    }
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
