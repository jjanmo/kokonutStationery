package cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cart.bean.CartDTO;
import cart.dao.CartDAO;
import goods.bean.GoodsDTO;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired
	private CartDAO cartDAO;
	
	//장바구니에 담기
	@RequestMapping(value = "/goods_cart_insert.do", method = RequestMethod.POST)
	public void cartInsert(@ModelAttribute CartDTO cartDTO) {
		System.out.println(cartDTO);
		
		int checkCart = cartDAO.checkCart(cartDTO);
		if(checkCart == 0) { //장바구니에 없는 상품일 경우
			//장바구니에 추가
			cartDAO.cartInsert(cartDTO);
		}	
	}

	//상세페이지
	@RequestMapping(value="/goods_cart.do", method=RequestMethod.GET)
	public ModelAndView cart(HttpSession session) { //들고갈파라미터 필요함 + 회원일때와 비회원일때를 구분지어야함!
		
		String userId = (String) session.getAttribute("memId");
		
		List<CartDTO> list = cartDAO.getCart(userId);
		
		System.out.println(list);
		System.out.println(userId);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("display", "/cart/goods_cart.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;	
	}
	
	//장바구니 삭제
	@RequestMapping(value="/deleteCart.do", method=RequestMethod.POST)
	public void deleteCart(@RequestParam String userId, @RequestParam String productCode, @RequestParam String optionContent) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("productCode", productCode);
		map.put("optionContent", optionContent);
		
		cartDAO.deleteCart(map);
	}
	

}
