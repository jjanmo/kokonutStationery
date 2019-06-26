package user.controller;

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
	
	//����� ȸ������ ��ư�� �������� ȸ������ �Ա�������
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contents", "/user/join.jsp");
		mav.addObject("display", "/user/joinIndex.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//ȸ������ ��� ���� ������
	@RequestMapping(value="/agreement.do", method=RequestMethod.GET)
	public ModelAndView agreement() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contents", "/user/agreement.jsp");
		mav.addObject("display", "/user/joinIndex.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//ȸ�������� ������
	@RequestMapping(value="/joinForm.do", method=RequestMethod.GET)
	public ModelAndView joinForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/user/joinIndex.jsp");
		mav.addObject("contents", "/user/joinForm.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//ȸ�����Խ� �ߺ����̵�üũ
	@RequestMapping(value="/checkId.do", method=RequestMethod.POST)
	@ResponseBody
	public String checkId(@RequestParam String userId) {
		UserDTO userDTO = userDAO.checkId(userId);
		if(userDTO == null) { //�ߺ����̵� ������������
			return "not_exist";
		}
		else {// (userDTO != null) �ߺ����̵� ������ 
			return "exist";
		}
	}
	
	//ȸ�����Խ� �ߺ��̸���üũ
	@RequestMapping(value="/checkEmail.do", method=RequestMethod.POST)
	@ResponseBody
	public String checkEmail(@RequestParam String userEmail) {
		UserDTO userDTO = userDAO.checkEmail(userEmail);
		if(userDTO == null) { //�ߺ��̸��� ������������
			return "not_exist";
		}
		else {// (userDTO != null) �ߺ��̸��� ������ 
			return "exist";
		}
	}
	
	//ȸ������������ submit �� : ����ok
	@RequestMapping(value="/joinOk.do", method=RequestMethod.POST)
	public ModelAndView joinOk(@ModelAttribute UserDTO userDTO, HttpSession session) {
		
		//session ����
		session.setAttribute("memName", userDTO.getUserName());
		session.setAttribute("memId", userDTO.getUserId());
		session.setAttribute("memEmail", userDTO.getUserEmail());
		
		//ȸ���������� DB�� ���� 
		userDAO.join(userDTO);
		System.out.println("ȸ�����ԿϷ�");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/user/joinIndex.jsp");
		mav.addObject("contents", "/user/joinOk.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
		
	}
	
	//�α����� ������
	@RequestMapping(value="/loginForm.do", method=RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/user/loginForm.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//�α��� ���̵�/��й�ȣ üũ
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	@ResponseBody
	public String checkLogin(@RequestParam Map<String,String> map , HttpSession session) {
		
		UserDTO userDTO = userDAO.login(map);
		
		if(userDTO == null) { //user���� ������� - �α��� ����
			return "not_exist";
		}
		else { //user���� ���� - �α��� ����
			//session ����
			session.setAttribute("memName", userDTO.getUserName());
			session.setAttribute("memId", userDTO.getUserId());
			session.setAttribute("memEmail", userDTO.getUserEmail());
			return "exist";
		}
		
	}
	
	//�α׾ƿ�
	@GetMapping(value="/logout.do")
	public ModelAndView logout(HttpSession session) {
		//���� ����
		session.invalidate();
		return new ModelAndView("redirect:/main/index.do");
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
