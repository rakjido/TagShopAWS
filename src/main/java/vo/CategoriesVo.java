package vo;

import org.springframework.stereotype.Service;

import lombok.Data;
@Service
@Data
public class CategoriesVo {
	private String categoryCode;
	private String categoryName;
}