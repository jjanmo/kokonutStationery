package user.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import user.bean.UserDTO;
import user.dao.UserDAO;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	UserDAO userDAO;
	
	//헤더의 회원가입 버튼을 눌렀을때 회원가입 입구페이지
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contents", "/user/join.jsp");
		mav.addObject("display", "/user/joinIndex.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//회원가입 약관 동의 페이지
	@RequestMapping(value="/agreement.do", method=RequestMethod.GET)
	public ModelAndView agreement() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contents", "/user/agreement.jsp");
		mav.addObject("display", "/user/joinIndex.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//회원가입폼 페이지
	@RequestMapping(value="/joinForm.do", method=RequestMethod.GET)
	public ModelAndView joinForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/user/joinIndex.jsp");
		mav.addObject("contents", "/user/joinForm.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//회원가입시 중복아이디체크
	@RequestMapping(value="/checkId.do", method=RequestMethod.POST)
	@ResponseBody
	public String checkId(@RequestParam String userId) {
		UserDTO userDTO = userDAO.checkId(userId);
		if(userDTO == null) { //중복아이디 존재하지않음
			return "not_exist";
		}
		else {// (userDTO != null) 중복아이디 존재함 
			return "exist";
		}
	}
	
	//회원가입시 중복이메일체크
	@RequestMapping(value="/checkEmail.do", method=RequestMethod.POST)
	@ResponseBody
	public String checkEmail(@RequestParam String userEmail) {
		UserDTO userDTO = userDAO.checkEmail(userEmail);
		if(userDTO == null) { //중복이메일 존재하지않음
			return "not_exist";
		}
		else {// (userDTO != null) 중복이메일 존재함 
			return "exist";
		}
	}
	
	//회원가입폼에서 submit 후 : 가입ok
	@RequestMapping(value="/joinOk.do", method=RequestMethod.POST)
	public ModelAndView joinOk(@ModelAttribute UserDTO userDTO, HttpSession session) {
		
		//session 생성
		session.setAttribute("memName", userDTO.getUserName());
		session.setAttribute("memId", userDTO.getUserId());
		session.setAttribute("memEmail", userDTO.getUserEmail());
		
		//회원가입폼을 DB로 전달 
		userDAO.join(userDTO);
		System.out.println("회원가입완료");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/user/joinIndex.jsp");
		mav.addObject("contents", "/user/joinOk.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
		
	}
	
	//로그인폼 페이지
	@RequestMapping(value="/loginForm.do", method=RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/user/loginForm.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//로그인 아이디/비밀번호 체크
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	@ResponseBody
	public String checkLogin(@RequestParam Map<String,String> map , HttpSession session) {
		
		UserDTO userDTO = userDAO.login(map);
		
		if(userDTO == null) { //user정보 존재안함 - 로그인 못함
			return "not_exist";
		}
		else { //user정보 존재 - 로그인 가능
			//session 생성
			session.setAttribute("memName", userDTO.getUserName());
			session.setAttribute("memId", userDTO.getUserId());
			session.setAttribute("memEmail", userDTO.getUserEmail());
			return "exist";
		}
		
	}
	
	//로그아웃
	@GetMapping(value="/logout.do")
	public ModelAndView logout(HttpSession session) {
		//세션 종료
		session.invalidate();
		return new ModelAndView("redirect:/main/index.do");
	}
	
	//ID찾기 페이지
	@GetMapping(value="/find_id.do")
	public ModelAndView findId() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/user/find_id.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//비밀번호찾기 페이지
	@GetMapping(value="/find_pwd.do")
	public ModelAndView findPwd() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/user/find_pwd.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//비밀번호찾기
	@RequestMapping(value="/pwdSearch.do", method=RequestMethod.POST)
	@ResponseBody
	public String pwdSearch(HttpSession session,@RequestParam Map<String,String> map) {
		
		UserDTO userDTO = userDAO.pwdSearch(map);
		
		if(userDTO==null)
			return "fail";
		else  {
			session.setAttribute("userEmail",map.get("userEmail"));
			return "ok";
		}
	}
	
	//비밀번호찾기 페이지
	@RequestMapping(value="/find_pwd_ok.do",method=RequestMethod.GET)
	public ModelAndView findPwdOk() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/user/find_pwd_ok.jsp");
		mav.setViewName("/main/nosIndex");
		
		return mav;
	}

	

	
	
	
	
	@RequestMapping(value="/find_id", method=RequestMethod.GET)
	public ModelAndView find_id() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/member/find_id.jsp");
		mav.setViewName("/member/joinIndex");
		return mav;
	}
	
	@RequestMapping(value="/find_pwd", method=RequestMethod.GET)
	public ModelAndView find_pwd() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/member/find_pwd.jsp");
		mav.setViewName("/member/joinIndex");
		return mav;
	}
	
	

	
	@RequestMapping(value="/joinOk", method=RequestMethod.POST)
	public ModelAndView joinOk() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/member/joinOk.jsp");
		mav.addObject("mainContent", "/member/joinIndex.jsp");
		mav.setViewName("/main/index2");
		return mav;
	}

}
