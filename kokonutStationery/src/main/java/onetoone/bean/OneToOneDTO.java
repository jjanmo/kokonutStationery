package onetoone.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class OneToOneDTO {
	private int seq;
	private String userId;
	private String type;
	private int orderCode;
	private String email;
	private String tel1;
	private String tel2;
	private String tel3;
	private String subject;
	private String contents;
	private int ref;
	private int lev;
	private int step;
	private int pseq;
	private int reply;
	private Date logdate;	
}

