package service;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.TagsLocaleDao;
import utils.TranslationUtil;
import vo.PhotoTagsVo;
import vo.TagRankVo;
import vo.TagsLocaleVo;
import vo.TagsTableVo;

@Service
public class TagsLocaleService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private TagsLocaleVo tagsLocaleVo;
	
	
	public void addTags(TagsLocaleVo vo) {
		TagsLocaleDao dao = sqlSession.getMapper(TagsLocaleDao.class);
		dao.insertTagsLocale(vo);
	}
	
	public int idCheck(HashMap<String, String> map) {
		TagsLocaleDao dao = sqlSession.getMapper(TagsLocaleDao.class);
		return dao.idCheck(map);
	}
	
	public TagsLocaleVo getTags(HashMap<String, String> map) {
		TagsLocaleDao dao = sqlSession.getMapper(TagsLocaleDao.class);
		return dao.getTagsLocale(map);
	}
	
	public void addProductTags(BigInteger tagsId) {
		TagsLocaleDao dao = sqlSession.getMapper(TagsLocaleDao.class);
		dao.insertProductTags(tagsId);
	}
	
	public void addPhotoTags(BigInteger tagsId) {
		TagsLocaleDao dao = sqlSession.getMapper(TagsLocaleDao.class);
		dao.insertPhotoTags(tagsId);
	}
	
	public HashMap<String, String> addMultiTags(String tags) {
		TagsLocaleDao dao = sqlSession.getMapper(TagsLocaleDao.class);
		// 해당언어(한국어, 영어등)로 해당 단어가 이미 존재하는지 검사
		
		HashMap<String, String> map = new HashMap<String, String>();
		String origin = TranslationUtil.detectLanguage(tags.trim());
		String tagName = "TagsName" + origin;
		
		map.put("column", tagName);
		map.put("search", tags);
		System.out.println("origin : " + origin);
		System.out.println("search : " + tags);
		if (dao.idCheck(map) == 0) {
			String[] languages = { "en", "es", "zh", "hi", "ja", "ru", "pt", "ko" };
			for (int i = 0; i < languages.length; i++) {
				//origin.equals(languages[i])는 NullPointerror가 발생할 가능성이 있음
				String out="";
				if(!languages[i].equals(origin)) {
					out = TranslationUtil.autoDetectTranslate(tags, languages[i]);
				} else {
					out = tags;
				}
				switch(languages[i]) {
					case "en" : tagsLocaleVo.setTagsNameEn(out); break;
					case "es" : tagsLocaleVo.setTagsNameEs(out); break;
					case "zh" : tagsLocaleVo.setTagsNameZh(out); break;
					case "hi" : tagsLocaleVo.setTagsNameHi(out); break;
					case "ja" : tagsLocaleVo.setTagsNameJa(out); break;
					case "ru" : tagsLocaleVo.setTagsNameRu(out); break;
					case "pt" : tagsLocaleVo.setTagsNamePt(out); break;
					case "ko" : tagsLocaleVo.setTagsNameKo(out); break;
				}
			}
			System.out.println(tagsLocaleVo);
			dao.insertTagsLocale(tagsLocaleVo);
		}

		
		
		return map;

	}
	
	public BigInteger getTagsId(HashMap<String, String> map) {
		TagsLocaleDao dao = sqlSession.getMapper(TagsLocaleDao.class);
		System.out.println("getTagsId : " + dao.getTagsId(map));
		return dao.getTagsId(map);
	}
	
	public List<TagRankVo> getTagRank(String country) {
		TagsLocaleDao dao = sqlSession.getMapper(TagsLocaleDao.class);
		return dao.getTagRank(country);
	}
	
	public void insertTagsPriceHistory(String baseDate) {		
		TagsLocaleDao dao = sqlSession.getMapper(TagsLocaleDao.class);
		HashMap<String, Object> map = new HashMap<>();
		map.put("baseDate", baseDate);
		map.put("currencyCode", "KRW");
		dao.insertTagsPriceHistory(map);
	}
	
	public void insertTagsPriceFx(String baseDate, String currencyCode, double fxRate) {
		TagsLocaleDao dao = sqlSession.getMapper(TagsLocaleDao.class);
		HashMap<String, Object> map = new HashMap<>();
		map.put("baseDate", baseDate);
		map.put("currencyCode", currencyCode);
		map.put("fxRate", fxRate);
		dao.insertTagsPriceFx(map);
	}
	
	public List<TagsTableVo> getTagsTable(String language){
		TagsLocaleDao dao = sqlSession.getMapper(TagsLocaleDao.class);
		
		HashMap<String, Object> currencyMap = new HashMap<>();
		currencyMap.put("EN", "USD");
		currencyMap.put("ES", "EUR");
		currencyMap.put("ZH", "CNY");
		currencyMap.put("HI", "INR");
		currencyMap.put("JA", "JPY");
		currencyMap.put("RU", "RUB");
		currencyMap.put("PT", "BRL");
		currencyMap.put("KO", "KRW");

		HashMap<String, Object> map = new HashMap<>();
		map.put("language", language);
		map.put("currencyCode", currencyMap.get(language));
		
		return dao.getTagsTable(map);
		
	}
	
/*	public void randomInsertPhotoTag() {
		int size = 100;
		int[] tagsId = new int[size];
		int[] photoId = new int[size];
		TagsLocaleDao dao = sqlSession.getMapper(TagsLocaleDao.class);
		
		for(int i = 0; i<size; i++) {
			tagsId[i] = (int)(Math.random()*100);
			photoId[i]= (int)(Math.random()*100);
			PhotoTagsVo vo = new PhotoTagsVo();
			vo.setPhotoId(BigInteger.valueOf(photoId[i]));
			vo.setTagsId(BigInteger.valueOf(tagsId[i]));
			dao.insertPhotoTags(vo);
		}

	}*/
}