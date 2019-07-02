package noticeboard.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class NoticeboardDTO {
	private int noticeboardCode;
	private String noticeboardSubject;
	private String noticeboardContent;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date regDate;
}
