package goods.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/goods/*")
public class GoodsController {
	
	//ī�װ� ������ ������
	@GetMapping("/category_stationery.do")
	public ModelAndView stationery() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/goods/category_stationery.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	//ī�װ� ���� ������
	@GetMapping("/category_living.do")
	public ModelAndView living() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/goods/category_living.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	//ī�װ� ���� ������
	@GetMapping("/category_travel.do")
	public ModelAndView travel() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/goods/category_travel.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	//ī�װ� �ݶ󺸷��̼� ������
	@GetMapping("/category_collabo.do")
	public ModelAndView collabo() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/goods/category_collabo.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	//��¦���� ������
	@GetMapping("/category_discount.do")
	public ModelAndView discount() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/goods/category_discount.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	//�߳����� ������
	@GetMapping("/category_best.do")
	public ModelAndView best() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/goods/category_best.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//��ٱ��� ������
	@GetMapping("/goods_cart.do")
	public ModelAndView cart() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/goods/goods_cart.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	
}
