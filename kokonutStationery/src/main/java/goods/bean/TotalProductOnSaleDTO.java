package goods.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class TotalProductOnSaleDTO {
	private int stationery;
	private int living;
	private int travel;
	private int collabo;
	private int discount;
	private int best;
	private int newP;
}
