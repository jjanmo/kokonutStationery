package statisticsmanager.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class StatisticsDTO {
	private String orderDate;
	private int discountPrice;
}
