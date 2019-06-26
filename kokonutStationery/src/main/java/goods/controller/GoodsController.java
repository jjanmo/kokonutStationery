package goods.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/goods/*")
public class GoodsController {
	
	//카테고리 문구류 페이지
	@GetMapping("/category_stationery.do")
	public ModelAndView stationery() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/goods/category_stationery.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	//카테고리 리빙 페이지
	@GetMapping("/category_living.do")
	public ModelAndView living() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/goods/category_living.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	//카테고리 여행 페이지
	@GetMapping("/category_travel.do")
	public ModelAndView travel() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/goods/category_travel.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	//카테고리 콜라보레이션 페이지
	@GetMapping("/category_collabo.do")
	public ModelAndView collabo() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/goods/category_collabo.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	//깜짝세일 페이지
	@GetMapping("/category_discount.do")
	public ModelAndView discount() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/goods/category_discount.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	//잘나가요 페이지
	@GetMapping("/category_best.do")
	public ModelAndView best() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/goods/category_best.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//장바구니 페이지
	@GetMapping("/goods_cart.do")
	public ModelAndView cart() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/goods/goods_cart.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	
}
