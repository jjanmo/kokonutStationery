package order.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class PostDTO {
	private String zipcode;
	private String sido;
	private String sigungu;
	private String yubmyundong;
	private String ri;
	private String roadname;
	private String buildingname;

}
