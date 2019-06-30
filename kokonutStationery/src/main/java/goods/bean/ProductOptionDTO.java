package goods.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ProductOptionDTO {
	private int optionCode;
	private int productCode;
	private String optionContent;
	private int subTotalQty, subStockQty, subSaleQty;
}
