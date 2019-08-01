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
	private String erState;				//교환/환불상태
	private String erReason;			//이유
	private String erDetail;			//교환/환불에 대한 세부사항
	private String cancelReason;			//이유
	private String cancelDetail;
	private Date cancelDate;
	private int whoCancel;
	private Date exchangeRegDate;
	private Date exchangeFinDate;
	private Date refundRegDate;
	private Date refundFinDate;
	private String erAdminMemo;
}

