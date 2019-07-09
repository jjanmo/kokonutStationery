package cart.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
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
import goods.bean.ProductOptionDTO;
import order.bean.OrderDTO;
import user.bean.UserDTO;
import user.dao.UserDAO;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private CartDAO cartDAO;

	// 장바구니에 담기
	@RequestMapping(value = "/goods_cart_insert.do", method = RequestMethod.POST)
	@ResponseBody
	public void cartInsert(@ModelAttribute CartDTO cartDTO) {
		System.out.println(cartDTO);

		int checkCart = cartDAO.checkCart(cartDTO);
		if (checkCart == 0) { // 장바구니에 없는 상품일 경우
			// 장바구니에 추가
			cartDAO.cartInsert(cartDTO);
		}
	}

	// 장바구니페이지
	@RequestMapping(value = "/goods_cart.do", method = RequestMethod.GET)
	public ModelAndView cart(HttpSession session) { // 들고갈파라미터 필요함 + 회원일때와 비회원일때를 구분지어야함!

		String userId = (String) session.getAttribute("memId");

		List<CartDTO> list = cartDAO.getCart(userId);

		//System.out.println(list);
		//System.out.println(userId);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("display", "/cart/goods_cart.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}

	// 장바구니 선택삭제
	@RequestMapping(value = "/deleteCart.do", method = RequestMethod.POST)
	@ResponseBody
	public void deleteCart(@RequestParam String userId, @RequestParam String productCode,
			@RequestParam String optionContent) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("productCode", productCode);
		map.put("optionContent", optionContent);

		cartDAO.deleteCart(map);
	}

	// 전체삭제
	@RequestMapping(value = "/allDeleteCart.do", method = RequestMethod.POST)
	@ResponseBody
	public void allDeleteCart(@RequestParam String userId) {

		cartDAO.allDeleteCart(userId);

	}

	// 선택옵션 수정 페이지
	@RequestMapping(value = "/goods_cart_edit.do", method = RequestMethod.GET)
	public ModelAndView goodsCartEdit(@RequestParam String cartCode) {

		// 상품한개받아오기
		CartDTO cartDTO = cartDAO.goodsCartEdit(Integer.parseInt(cartCode));

		ModelAndView mav = new ModelAndView();
		mav.addObject("cartDTO", cartDTO);
		mav.setViewName("/cart/goods_cart_edit");
		return mav;

	}

	// 수량변경 수정
	@RequestMapping(value = "/goods_cart_modify.do", method = RequestMethod.POST)
	public ModelAndView cartUpdate(@RequestParam int[] productQty, @RequestParam int[] cartCode,
			HttpSession session) {
		for (int i = 0; i < cartCode.length; i++) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setProductQty(productQty[i]);
			cartDTO.setCartCode(cartCode[i]);
			cartDAO.cartUpdate(cartDTO);
		}
		String userId = (String) session.getAttribute("memId");
		List<CartDTO> list = cartDAO.getCart(userId);

		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/cart/goods_cart.jsp");
		mav.addObject("list", list);
		mav.setViewName("/main/nosIndex");
		return mav;
	}

	// 상세페이지에서 option가져오기
	@RequestMapping(value = "/getOption.do", method = RequestMethod.GET)
	public ModelAndView getOption(@RequestParam String productCode) {

		List<ProductOptionDTO> list = cartDAO.getOption(Integer.parseInt(productCode));
		// System.out.println(list.size());
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/option_content_modify.do", method = RequestMethod.POST)
	@ResponseBody
	public void cartOptionModify(@RequestParam Map<String, String> map) {

		cartDAO.cartOptionModify(map);

	}
	
	/*
	 * //선택주문
	 * 
	 * @RequestMapping(value = "/select_order.do", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public ModelAndView cartOrder(HttpSession session) { String
	 * userId = (String) session.getAttribute("memId");
	 * 
	 * List<CartDTO> list = cartDAO.cartOrder(userId);
	 * 
	 * System.out.println(list); System.out.println(userId); ModelAndView mav = new
	 * ModelAndView(); mav.addObject("list", list); mav.addObject("display",
	 * "/order/order_cart.jsp"); mav.setViewName("/main/nosIndex"); return mav; }
	 */
	
	//선택주문하기 페이지 이동테스트
	@RequestMapping(value="/order_cart.do",method=RequestMethod.POST)
	public ModelAndView orderCart(HttpSession session,@RequestParam(value="cartCode[]") List<String> cartCodeVal) {		
		List<CartDTO> list = new ArrayList<CartDTO>();
		
		//선택주문 리스트에 담기
		for(String cartCode : cartCodeVal) {
			list.add(cartDAO.getSelectCart(cartCode));
			System.out.println(cartDAO.getSelectCart(cartCode));
		}
			
		//세션아이디
		String userId = (String) session.getAttribute("memId");
		UserDTO userDTO = userDAO.getUserInfo(userId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("userDTO", userDTO);
		mav.addObject("display", "/order/order_cart.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
}
