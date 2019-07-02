package cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cart.bean.CartDTO;
import cart.dao.CartDAO;

@Controller
@RequestMapping("/goods/*")
public class CartController {
	
	@Autowired
	private CartDAO cartDAO;

	//장바구니 페이지
	@RequestMapping(value="/goods_cart.do")
	public ModelAndView cart() { //들고갈파라미터 필요함 + 회원일때와 비회원일때를 구분지어야함!
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/goods/goods_cart.jsp");
		return mav;	
	}
	
	//장바구니에 뿌리기
	@RequestMapping(value="/goods_cart.do", method=RequestMethod.POST)
	public ModelAndView getCart(@RequestParam String productCode) {
		
		CartDTO cartDTO = cartDAO.getCart(Integer.parseInt(productCode));
		
		System.out.println(cartDTO);
		ModelAndView mav = new ModelAndView();
		mav.addObject("cartDTO", cartDTO);
		mav.addObject("display", "/goods/goods_cart.jsp");
		mav.setViewName("/main/nosIndex");
		
		return mav;
		
		/*
		 * Map<String,String> map = new HashMap<String,String>(); map.put("cart",
		 * "cart"); List<CartDTO> cartList = cartDAO.getCart(map);
		 * 
		 * System.out.println(cartList);
		 * 
		 * ModelAndView mav = new ModelAndView(); mav.addObject("cartList", cartList);
		 * mav.addObject("display", "/goods/goods_cart.jsp");
		 * mav.setViewName("/main/nosIndex");
		 * 
		 * return mav;
		 */
	}
}
