package reviewboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import reviewboard.dao.ReviewboardDAO;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	@Autowired
	private ReviewboardDAO reviewboardDAO;
	
	//상품리뷰목록 페이지
	@GetMapping("/goods_review.do")
	public ModelAndView getGoodsReviewList() {
		//리스트 정보를 가져오는 코드 필요 : from DB
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/review/goods_review.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//상품리뷰등록페이지
	@GetMapping("/goods_review_register.do")
	public String goodsReviewRegister() {
		return "goods_review_register";
	}

}
