package mypage.controller;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import point.bean.PointDTO;
import point.dao.PointDAO;
import user.bean.UserDTO;
import user.dao.UserDAO;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Autowired	
	private UserDAO userDAO;
	@Autowired
	private PointDAO pointDAO;
	
	//포인트
	@GetMapping("/mypage_pointlist.do")
	public ModelAndView pointlist(HttpSession session) {
		//포인트 리스트 가져오기
		String userId = (String) session.getAttribute("memId");
		List<PointDTO> list = pointDAO.getPointList(userId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("contents", "/mypage/mypage_pointlist.jsp");
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
		
	//찜목록
	@GetMapping("/mypage/mypage_wishlist.do")
	public ModelAndView wishlist() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contents", "/mypage/mypage_wishlist.jsp");
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	
	//주문내역/배송조회 페이지
	@GetMapping("/mypage_orderlist.do")
	public ModelAndView orderlist(HttpSession session) {
		//헤더를 통한 마이페이지 접속 시 마이페이지 정보 가져오기
		String userId = (String) session.getAttribute("memId");
		UserDTO userDTO = userDAO.getUserInfo(userId);
		session.setAttribute("userDTO", userDTO);
		
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
	
}
