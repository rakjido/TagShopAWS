package vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class TagsLocaleVo {
	private int tagsId;
	private String tagsNameEn;
	private String tagsNameEs;
	private String tagsNameZh;
	private String tagsNameHi;
	private String tagsNameJa;
	private String tagsNameRu;
	private String tagsNamePt;
	private String tagsNameKo;
}
