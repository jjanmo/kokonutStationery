package cart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/goods/*")
public class CartController {

	//장바구니 페이지
	@RequestMapping(value="/goods_cart.do")
	public ModelAndView cart() { //들고갈파라미터 필요함 + 회원일때와 비회원일때를 구분지어야함!
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/goods/goods_cart.jsp");
		return mav;	
	}
	
		
}
