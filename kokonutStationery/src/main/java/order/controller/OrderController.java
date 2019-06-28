package order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/order")
public class OrderController {

	//주문확인페이지
	@GetMapping("/order.do")
	public ModelAndView order() {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("contents", "/order/order.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	
}
