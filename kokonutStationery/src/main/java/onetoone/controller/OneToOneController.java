package onetoone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import onetoone.bean.OneToOneDTO;
import onetoone.dao.OneToOneDAO;

@Controller
@RequestMapping("/onetoone/*")
public class OneToOneController {	
	@Autowired
	private OneToOneDAO onetooneDAO;

	//1:1문의 작성 페이지
	@GetMapping("/mypage_onetoone_register.do")
	public String onetoone_register() {
		return "/mypage/mypage_onetoone_register";
	}
	
	//1:1문의 삭제 페이지
	@GetMapping("/mypage_onetoone_delete.do")
	public String onetoone_delete() {
		return "/mypage/mypage_onetoone_delete";
	}
	
	//1:1문의 수정 페이지
	@GetMapping("/mypage_onetoone_modify.do")
	public String onetoone_modify() {
		return "/mypage/mypage_onetoone_modify";
	}
	
	//1:1문의 답변 페이지
	@GetMapping("/mypage_onetoone_reply.do")
	public String onetoone_reply() {
		return "/mypage/mypage_onetoone_reply";
	}
	
	@PostMapping("/register.do")
	@ResponseBody
	public void register(@ModelAttribute OneToOneDTO onetooneDTO) {
		//System.out.println(onetooneDTO);
		onetooneDAO.register(onetooneDTO);
	}
	
//	@PostMapping("onetooneList.do")
//	public ModelAndView onetooneList(@RequestParam String userId) {
//		System.out.println(userId);
//		List<OneToOneDTO> list = onetooneDAO.onetooneList(userId);
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("list", list);
//		return mav;
//	}
}
