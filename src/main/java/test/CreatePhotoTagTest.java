package test;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.TagsLocaleDao;

@Service
public class CreatePhotoTagTest {
	
	@Autowired
	private SqlSession sqlsession;
	
	public static void main(String[] args) {
		int size = 100;
		int[] tagsId = new int[size];
		int[] photoId = new int[size];
		
		
		for(int i =0; i<size; i++) {
			tagsId[i] = (int)(Math.random()*100);
			photoId[i]= (int)(Math.random()*100);
		}
		
	}
		
}
