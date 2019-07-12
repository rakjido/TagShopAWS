package dao;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import vo.PhotoTagsVo;
import vo.TagRankVo;
import vo.TagsLocaleVo;
import vo.TagsTableVo;

public interface TagsLocaleDao {
	public void insertTagsLocale(TagsLocaleVo vo);
	
	public int idCheck(HashMap<String, String> map);
	
	public TagsLocaleVo getTagsLocale(HashMap<String, String> map);
	
	public void insertProductTags(BigInteger tagsId);
	
	public void insertPhotoTags(PhotoTagsVo vo);
	
	public BigInteger getTagsId(HashMap<String, String> map);
	
	public List<TagRankVo> getTagRank(String country);
	
	public void insertTagsPriceHistory(HashMap<String, Object> map);
	
	public void insertTagsPriceFx(HashMap<String, Object> map);
	
	public List<TagsTableVo> getTagsTable(HashMap<String, Object> map);
}