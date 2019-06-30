package cart.bean;

import org.springframework.stereotype.Component;
import lombok.Data;

@Component
@Data
public class CartDTO {
	private String userId; 
	private String userEmail;
	private int productCode;
	private String productName;
	private String thumbImg;
	private int discountPrice; 
	private int optionCode; 
	private int productQty; //장바구니에 담은 상품수량
	
}
