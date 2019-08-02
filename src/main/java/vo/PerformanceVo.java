package vo;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class PerformanceVo {
	String baseDate;
	int users;
	int signup;
	int photoViews;
	int prdtPhoto;
	int buyPhoto;
	int buyShop;
	int rebuy;
	int sales;
}
