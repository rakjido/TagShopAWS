package vo;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class TagsTableVo {
	int rank;
	int previous;
	int differ;
	String tagsName;
	double price;
}
