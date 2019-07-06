package order.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class OrderDTO {
	
	private String orderCode; 
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date orderDate;
	private String userId; 
	private String userName;
	private String thumbImg; 
	private int productCode;
	private String productName;
	private int discountPrice;
	private int purchaseQty; 		// 상품구매수량
	private int totalPrice;			// discountPrice*purchaseQty
	private int paymentType; 		// 1:신용카드 / 2:핸드폰
	private int totalPayment; 		// 해당주문번호에 대한 총 결제금액
	private int productOption;		// 0:없음 / 1:있음
	private String optionContent;	// 옵션내용
	private int orderState;			// 0: 주문취소1: 주문접수2: 배송준비3: 배송중4: 배송완료 5:교환접수6:교환완료7:환불접수8: 환불완료
	private int cancel;				// 취소여부
	private int cancelQty; 
	private int cancelAmount;
	private int exchange; 			//교환여부
	private int exchangeQty; 
	private int refund;				//환불여부
	private int refundQty;
	private int refundAmount; 		//환불금액

}
