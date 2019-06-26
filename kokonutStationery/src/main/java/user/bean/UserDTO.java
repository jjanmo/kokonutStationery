package user.bean;


import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data

public class UserDTO {
	private String userId; 
	private String userPwd; 
	private String userName;
	private String userBirthYear, userBirthMonth, userBirthDay; 
	private String userCal;
	private String userEmail;
	private String userPhone1, userPhone2, userPhone3;  
	private String userMsg;
	private int userPoint;
	private int productInCart;
	private String receiverName;
	private String receiverZipcode;
	private String receiverAddr1,receiverAddr2;
	private String receiverPhone1, receiverPhone2, receiverPhone3;
	private String deliveryMsg;
	private String deliveryOption;

}
