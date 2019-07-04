package wishlist.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class WishListDTO {
	private String userId;
	private int productCode;
	private String productName;
	private int productOption;
	private String thumbImg;
	private int discountPrice;
	private int optionCode;
	private String optionContent;
	private Date logdate;
}
