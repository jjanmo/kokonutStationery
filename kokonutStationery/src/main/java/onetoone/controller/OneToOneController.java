package onetoone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import onetoone.dao.OneToOneDAO;

@Controller
@RequestMapping("/onetoone/*")
public class OneToOneController {	
//	@Autowired
//	private OneToOneDAO onetooneDAO;

	//1:1문의 작성
	@GetMapping("/mypage_onetoone_register.do")
	public String onetoone_register() {
		return "/mypage/mypage_onetoone_register";
	}
	
	//1:1문의 삭제
	@GetMapping("/mypage_onetoone_delete.do")
	public String onetoone_delete() {
		return "/mypage/mypage_onetoone_delete";
	}
	
	//1:1문의 수정
	@GetMapping("/mypage_onetoone_modify.do")
	public String onetoone_modify() {
		return "/mypage/mypage_onetoone_modify";
	}
	
	//1:1문의 답변
	@GetMapping("/mypage_onetoone_reply.do")
	public String onetoone_reply() {
		return "/mypage/mypage_onetoone_reply";
	}

}
