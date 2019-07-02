package reviewboard.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class ReviewboardDTO {
	private String userId; 
	private String userEmail; 
	private int reviewboardCode; ;
	private String reviewboardSubject; ;
	private String reviewboardContent; 
	private String reviewboardImg;
	private String thumbImg; 
	private int productCode; 
	private String productName; 
	private int discountPrice; 
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date regDate;
}
