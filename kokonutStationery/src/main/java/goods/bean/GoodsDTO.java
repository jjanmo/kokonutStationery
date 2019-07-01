package goods.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class GoodsDTO {
	private int productCode;
	private String productName;
	private int originalPrice;
	private int discountPrice;
	private String origin;
	private String manufacturer;
	private String thumbImg;
	private String detailedImg;
	private int totalQty;
	private int stockQty;
	private int saleQty;
	private int saleStatus;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date regDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date updateDate;
	private int productOption;
	private String[] optionContent;	//옵션 내용
	private int[] subTotalQty;		//옵션 갯수
	private int stationery;
	private int living;
	private int travel;
	private int collabo;
	private int discount;
	private int best;
	private int newP;
	private int deliveryFee;
}
