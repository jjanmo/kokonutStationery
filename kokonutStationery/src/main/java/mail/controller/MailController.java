package mail.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import user.dao.UserDAO;

@Controller
@RequestMapping(value="/mail")
public class MailController {
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private JavaMailSender mailSender;
	 
	    // 회원가입 이메일 인증
	    @RequestMapping(value = "/auth", method = RequestMethod.POST)
	    public ModelAndView auth(HttpSession session, @RequestParam String userEmail) {
	    	System.out.println("find_pwd_ok의 userEmail="+userEmail);
	    	   
	        String setfrom = "kokonutStationery@gmail.com";         
	         
	        //인증번호랜덤생성
	    	int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
	        String joinCode = String.valueOf(ran);
	        
	        //세션에 인증번호 저장
	        session.setAttribute("joinCode", joinCode);	 
	       
	        System.out.println("인증코드 = "+joinCode);
	        
	        ModelAndView mav = new ModelAndView();
	        
	        try {
	          MimeMessage message = mailSender.createMimeMessage();
	          MimeMessageHelper messageHelper 
	                            = new MimeMessageHelper(message, true, "UTF-8");
	     
	          messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	          messageHelper.setTo(userEmail);  // 받는사람 이메일
	          messageHelper.setSubject("[kokonut Stationery] 비밀번호찾기 인증번호 안내입니다."); // 메일제목은 생략이 가능하다
	          messageHelper.setText("요청하신 비밀번호찾기 인증번호를 안내드립니다.\r\n" + 
					          		"아래 번호를 인증번호 입력란에 입력해주세요.\r\n" + 
					          		"귀하의 인증 코드는 " + joinCode + " 입니다.");  // 메일 내용
	         
	          mailSender.send(message);
	        
	        } catch(Exception e){
	          System.out.println(e);
	        }
	       mav.addObject("joinCode", joinCode);
	        return mav;
	      }
	    
	    //인증번호확인
	    @RequestMapping(value="/confirmAuth",method = RequestMethod.POST)
	    @ResponseBody
	    public String confirmAuth(HttpSession session,@RequestParam String authKey){
	    	
	    	String joinCode = (String)session.getAttribute("joinCode");   	
	    	
	    		
	    	if(joinCode.equals(authKey)==false) {
	    		return "auth_fail";
	    		
	    	}else 
	    		return "auth_ok";
	    		    	
	    	
	    }
	    
	    //새비밀번호변경
	    @RequestMapping(value="/changePwd",method=RequestMethod.POST)
	    @ResponseBody
	    public void changePwd(@RequestParam String userPwd,@RequestParam String userEmail) {
	    	System.out.println(userEmail+"의 변경할 pwd="+userPwd);
	    	Map<String,String> map = new HashMap<String,String>();
	    	
	    	map.put("userPwd", userPwd);
	    	map.put("userEmail",userEmail);
	    	
	    	userDAO.changePwd(map);
	    	
	    }
}
