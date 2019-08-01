package onetoone.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class OneToOneDTO {
	private String userId;
	private String userName;
	private String userEmail;
	private int onetooneCode; 
	private String questionType;
	//0. 배송지연/불만 1.반품문의 2.A/S문의 3.환불문의 4.주문결제문의 5.회원정보문의 6.취소문의 7.교환문의 8.상품정보문의 9.기타문의
	private String subject;
	private String contents;
	private String orderCode;
	private String userPhone;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd", timezone = "GMT+9")
	private Date logdate;	
}
