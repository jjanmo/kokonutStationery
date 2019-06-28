package mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import user.dao.UserDAO;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Autowired	
	private UserDAO userDAO;
	
	//주문내역/배송조회 페이지
	@GetMapping("/mypage_orderlist.do")
	public ModelAndView orderlist() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contents", "/mypage/mypage_orderlist.jsp");
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//상품후기
	@GetMapping("/mypage_review.do")
	public ModelAndView review() {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("contents", "/mypage/mypage_review.jsp");
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//상품문의
	@GetMapping("/mypage_qna.do")
	public ModelAndView qna() {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("contents", "/mypage/mypage_qna.jsp");
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
}
