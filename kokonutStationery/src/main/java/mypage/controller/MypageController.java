package mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	//�ֹ�����/�����ȸ ������
	@GetMapping("/mypage_orderlist.do")
	public ModelAndView orderlist() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/mypage/mypage_orderlist.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}

}
