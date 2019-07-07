package admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.bean.AdminDTO;
import admin.dao.AdminDAO;


@Controller
public class AdminController {
	@Autowired
	private AdminDAO adminDAO;
	
	// 관리자 로그인폼 화면
	@RequestMapping(value="/admin/login.do",method=RequestMethod.GET)
	public String login() {
		return "/admin/loginForm";
	}
	
	//관리자 로그인 처리
	@RequestMapping(value="/admin/loginProcess", method=RequestMethod.POST)
	@ResponseBody
	public String loginProcess(@RequestParam String id, @RequestParam String pwd, HttpSession session) {
		AdminDTO adminDTO = new AdminDTO();
		adminDTO = adminDAO.loginProcess(id, pwd);
		if(adminDTO==null) {
			return "login_fail";
		} else {
			//세션
			session.setAttribute("adName",adminDTO.getName());
			session.setAttribute("adId",adminDTO.getId());
			return "login_ok";
		}
	}
	
	//관리자 로그아웃 처리
	@RequestMapping(value="/admin/logout.do",method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
	
		//바로 /admin/login.do 로 가게끔 하는 것!
		//일종의 url 값을 요청하는 것으로, 바로 adminController로 돌아와 해당 작업 진행
		return new ModelAndView("redirect:/admin/login.do");
	}

	
	//관리자 주문관리
	@RequestMapping(value="/admin/orderList.do",method=RequestMethod.GET)
	public ModelAndView orderList(@RequestParam(required=false, defaultValue="1") String pg){
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("display","/admin/order/orderList.jsp");
		mav.setViewName("/admin/index");
		return mav;
	}
	

	//관리자 메인 - 통계 페이지 뜨도록
	@RequestMapping(value="/admin/index.do", method=RequestMethod.GET)
	public ModelAndView statisticsList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display","/admin/statistics/statisticsList.jsp");
		mav.setViewName("/admin/index");
		return mav;
	}
	
	//관리자 회원관리
	@RequestMapping(value="/admin/userList.do", method=RequestMethod.GET)
	public ModelAndView userList(@RequestParam(required=false, defaultValue="1") String pg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("display","/admin/user/userList.jsp");
		mav.setViewName("/admin/index");
		return mav;
	}
	
	//관리자 게시물 관리
	@RequestMapping(value="/admin/contentList.do",method=RequestMethod.GET)
	public ModelAndView contentList(@RequestParam(required=false, defaultValue="0") String pagingCheck,
									@RequestParam(required=false, defaultValue="1") String pg) {
		ModelAndView mav = new ModelAndView();
		if(pagingCheck.equals("qna")) mav.addObject("pagingCheck", "qna");
		else if(pagingCheck.equals("review")) mav.addObject("pagingCheck", "review");
		
		mav.addObject("pg", pg);
		mav.addObject("display","/admin/content/contentList.jsp");
		mav.setViewName("/admin/index");
		return mav;
   }
	
	
}
