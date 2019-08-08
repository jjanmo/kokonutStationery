package order.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class OrderlistDTO {
	private String orderCode;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd HH:mm:ss", timezone = "GMT+9")
	private Date orderDate;
	private String userName;
	private String userId;
	private int totalProductPayment; 	//상품합계금액 : 배송료를 제외한 상품을 합한 금액
	private int paymentType;			//결제방법 (1 : 신용카드 / 2 : 핸드폰)
	private int deliveryFee; 
	private int totalPayment;			//총결제금액 ( = 상품합계금액 + 배송비) 해당주문번호에 대한 총 결제금액
	private int crPayment;				//취소/환불금액(cancel /refund) 둘다 있다면,합산금액으로
	private int orderState;				//주문상태
	private String erState;				//환불 관련 상태 : 0:교환접수 1:교환완료 2:환불접수 3:환불완료
	private String erReason; 			//교환/환불 사유 1.배송지연 2.배송오류 3.상품불량 4.상품불만족 5.서비스불만족 6.기타
	private String erDetail;  			//교환/환불에 대한 구체적인 사유
	private String cancelReason; 		//취소사유
	private String cancelDetail; 		//취소구체적인 사유
	private Date cancelDate;			//취소날짜
	private int whoCancel; 				//취소한 사람이 누구인지 0 : 주문자 / 1 : 관리자		
	private Date exchangeRegDate;		//교환신청날짜		
	private Date exchangeFinDate; 		//교환완료날짜
	private Date refundRegDate; 		//환불신청날짜		
	private Date refundFinDate; 		//환불완료날짜
	private String erAdminMemo;			//교환/환불에 관한 관리자메모	
}

