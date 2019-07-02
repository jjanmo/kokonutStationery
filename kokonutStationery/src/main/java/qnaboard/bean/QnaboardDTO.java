package qnaboard.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import goods.bean.GoodsDTO;
import lombok.Data;

@Component
@Data
public class QnaboardDTO {
	private String userId;
	private String userEmail;
	private String userPhone;
	private int qnaboardCode;
	private String qnaboardSubject;
	private String qnaboardContent;
	private String thumbImg;
	private int secret ;
	private int productCode ;
	private String productName;
	private int discountPrice;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date regDate;
}
