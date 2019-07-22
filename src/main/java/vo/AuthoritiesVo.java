package vo;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class AuthoritiesVo {
	private String userid;
	private String authority;
}
