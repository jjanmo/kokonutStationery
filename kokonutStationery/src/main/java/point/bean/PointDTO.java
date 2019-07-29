package point.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class PointDTO {
	private String userId;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date logdate;
	private String contents;
	private String orderCode;
	private int usePoint;
	private int savePoint;
	private int totalPoint;
	private int pointType;		// 0: 구매에 의한 적립, 1: 교환에 의한 포인트 적립 , 2: 구매에 의한 포인트 사용
}

