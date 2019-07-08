package vo;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class TagRankVo {
	String tag;
	int count;
}
