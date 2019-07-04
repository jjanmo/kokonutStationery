package mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import point.bean.PointDTO;
import point.dao.PointDAO;
import user.bean.UserDTO;
import user.dao.UserDAO;
import wishlist.bean.WishListDTO;
import wishlist.dao.WishListDAO;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {	
	@Autowired	
	private UserDAO userDAO;
	@Autowired
	private PointDAO pointDAO;
	@Autowired
	private WishListDAO wishlistDAO;
	
	//포인트
	@GetMapping("/mypage_pointlist.do")
	public ModelAndView pointlist(HttpSession session) {
		//포인트 리스트 가져오기
		String userId = (String) session.getAttribute("memId");
		UserDTO userInfo = userDAO.getUserInfo(userId);
		List<PointDTO> list = pointDAO.getPointList(userId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("userInfo", userInfo);
		mav.addObject("list", list);
		mav.addObject("contents", "/mypage/mypage_pointlist.jsp");
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
		
	//찜목록 
	@GetMapping("/mypage_wishlist.do")
	public ModelAndView wishlist(HttpSession session) {
		//찜목록 리스트 가져오기
		String userId = (String) session.getAttribute("memId");
		List<WishListDTO> list = wishlistDAO.getWishList(userId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("contents", "/mypage/mypage_wishlist.jsp");
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	
	//주문내역/배송조회 페이지
	@GetMapping("/mypage_orderlist.do")
	public ModelAndView orderlist() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contents", "/mypage/mypage_orderlist.jsp");
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//1:1문의페이지
	@GetMapping("/mypage_onetoone.do")
	public ModelAndView onetoone() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contents", "/mypage/mypage_onetoone.jsp");
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//1:1문의하기
	@GetMapping("/mypage_onetoone_register.do")
	public String onetoone_register() {
		return "/mypage/mypage_onetoone_register";
	}
	
	//상품후기페이지
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
	
	//찜목록 추가
	@PostMapping("/setWishList.do")
	@ResponseBody
	public void setWishList(@ModelAttribute WishListDTO wishlistDTO) {
		//찜목록에 있는지 확인
		int checkWishList = wishlistDAO.checkWishList(wishlistDTO);
		if(checkWishList==0) { //찜목록에 없는 상품만 추가
			//찜목록 테이블에 추가
			wishlistDAO.setWishList(wishlistDTO);
			
			//유저 찜목록수 + 1
			userDAO.addWishListCount(wishlistDTO.getUserId());
		} //if
	}
	
	//마이페이지 정보 가져오기
	@PostMapping("/getUserInfo.do")
	public ModelAndView getUserInfo(@RequestParam String userId) {
		UserDTO userDTO = userDAO.getUserInfo(userId);
		ModelAndView mav = new ModelAndView();
		mav.addObject("userDTO", userDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//찜목록 삭제
	@PostMapping("/deleteWishList.do")
	@ResponseBody
	public void deleteWishList(@RequestParam String userId, @RequestParam String productCode, @RequestParam String optionContent) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("productCode", productCode);
		map.put("optionContent", optionContent);
		
		//찜목록 삭제
		wishlistDAO.deleteWishList(map);
		
		//유저 찜목록수 -1
		userDAO.subWishListCount(userId);
	}

	
	
}
