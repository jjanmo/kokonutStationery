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

import onetoone.bean.OneToOneDTO;
import onetoone.dao.OneToOneDAO;
import order.bean.OrderDTO;
import order.dao.OrderDAO;
import point.bean.PointDTO;
import point.dao.PointDAO;
import user.bean.UserDTO;
import user.dao.UserDAO;
import wishlist.bean.WishlistDTO;
import wishlist.dao.WishlistDAO;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {	
	@Autowired	
	private UserDAO userDAO;
	@Autowired
	private PointDAO pointDAO;
	@Autowired
	private WishlistDAO wishlistDAO;
	@Autowired
	private OneToOneDAO onetooneDAO;
	@Autowired
	private OrderDAO orderDAO;
	
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
		List<WishlistDTO> list = wishlistDAO.getWishList(userId);
		
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
	
	//주문내역 상세보기
	@GetMapping("/mypage_orderview.do")
	public ModelAndView orderview(HttpSession session ,@RequestParam String orderCode) {
		//userDTO 받아서 주문내역뿌려주기
		String userId = (String) session.getAttribute("memId");
		UserDTO userDTO = userDAO.getUserInfo(userId);
		List<OrderDTO> list = orderDAO.getOrder(orderCode);
		for(int i=0;i<list.size();i++) {
			System.out.println("상세보기페이지의 상품"+list.get(i));
		}
		String usePoint = pointDAO.getUsePoint(orderCode);
		int usePoint2=0;
		
		if(usePoint==null)			
			usePoint2=0;
		else
			usePoint2=Integer.parseInt(usePoint);
		
		ModelAndView mav = new ModelAndView();		
		
		mav.addObject("contents", "/mypage/mypage_orderview.jsp");
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.addObject("userDTO", userDTO);
		mav.addObject("usePoint", usePoint2);
		mav.addObject("list", list);
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//1:1문의페이지
	@GetMapping("/mypage_onetoone.do")
	public ModelAndView onetoone(HttpSession session) {
//		String userId = (String) session.getAttribute("memId");
//		List<OneToOneDTO> list = onetooneDAO.onetooneList(userId);
		
		ModelAndView mav = new ModelAndView();
//		mav.addObject("list", list);
		mav.addObject("contents", "/mypage/mypage_onetoone.jsp");
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
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
	public void setWishList(@ModelAttribute WishlistDTO wishlistDTO) {
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
