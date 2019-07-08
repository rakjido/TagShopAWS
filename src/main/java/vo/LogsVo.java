package vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class LogsVo {
	Timestamp dateTime;
	String userid;
	String ipAddress;
	String uri;	
}
