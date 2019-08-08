package usermanager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import point.bean.PointDTO;
import point.dao.PointDAO;
import user.bean.BoardPaging;
import user.bean.UserDTO;
import usermanager.dao.UserManagerDAO;

@Controller
public class UserManagerController {
	@Autowired
	private UserManagerDAO userDAO;
	@Autowired
	private PointDAO pointDAO;
	@Autowired
	private BoardPaging boardPaging;
	

	//글 가져오기
	@RequestMapping(value="/admin/getUserList.do",method = RequestMethod.POST)
	public ModelAndView userSearch(@RequestParam(required=false, defaultValue="1") String pg
									, HttpSession session) {
	
		//세션 관리자 아이디 가져오기
		String adId = (String)session.getAttribute("adId");
		
		//DB - 1페이지당 10개씩
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<UserDTO> list = userDAO.userList(map);
		
		//페이징 처리
		int totalA = userDAO.getTotalA();	
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(3); // 목록 3번까지
		boardPaging.setPageSize(10); // 1페이지에 10개씩 보여줌
		boardPaging.setTotalA(totalA); // 총글수
		
		boardPaging.makePagingHTML();
		
		//list를 json으로 변환
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("adId",adId);
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	
	//회원관리 검색
	@RequestMapping(value="/admin/userSearch.do",method = RequestMethod.POST)
	public ModelAndView userSearch(@RequestParam(required=false) String pg
									, @RequestParam Map<String,String> map
									, HttpSession session) {
	
		//세션 관리자 아이디 가져오기
		String adId = (String)session.getAttribute("adId");
		
		//DB - 1페이지당 10개씩
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("startNum", startNum);
		map2.put("endNum", endNum);
		map2.put("userId", map.get("userId"));
		map2.put("userName", map.get("userName"));
		map2.put("userPhone1", map.get("userPhone1"));
		map2.put("userPhone2", map.get("userPhone2"));
		map2.put("userPhone3", map.get("userPhone3"));
		
		List<UserDTO> list = userDAO.userSearch(map2);
		
		//페이징 처리
		int totalA = userDAO.getTotalAS(map2);	
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(3); // 목록 3번까지
		boardPaging.setPageSize(10); // 1페이지에 10개씩 보여줌
		boardPaging.setTotalA(totalA); // 총글수
		
		boardPaging.makeSearchPagingHTML();
		
		//list를 json으로 변환
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("adId",adId);
		mav.addObject("list", list);
		mav.addObject("userId", map.get("userId"));
		mav.addObject("userName", map.get("userName"));
		mav.addObject("userPhone1", map.get("userPhone1"));
		mav.addObject("userPhone2", map.get("userPhone2"));
		mav.addObject("userPhone3", map.get("userPhone3"));
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	//아이디 클릭 시 회원정보수정 창
	@RequestMapping(value="/admin/userModifyForm.do", method=RequestMethod.GET)
	public String userModifyForm(@RequestParam String userId, Model model) {
		UserDTO userDTO = userDAO.userModifyView(userId);
		
		model.addAttribute("userId", userId);
		model.addAttribute("userDTO", userDTO);
		return "/admin/user/userModifyForm"; 
	}
	
	//아아디 클릭시 회원 포인트 수정
	@RequestMapping(value = "/admin/userPointForm.do", method = RequestMethod.GET)
	public String userPointForm(@RequestParam String userId, Model model) {
		
		UserDTO userDTO = userDAO.userPointModify(userId);
		List<PointDTO> pointList = userDAO.userPointList(userId);
		
		System.out.println(userId);
		System.out.println(userDTO);
		System.out.println(pointList);
		
		model.addAttribute("userId", userId);
		model.addAttribute("userDTO", userDTO);
		model.addAttribute("pointList", pointList);
		return "/admin/user/userPointForm";
	}
	
	//회원정보수정
	@RequestMapping(value="/admin/userModify.do", method=RequestMethod.POST)
	public void userModify(@RequestParam Map<String,Object> map) {
		userDAO.userModify(map);
	}
	
	//회원정보삭제
	@RequestMapping(value="/admin/userDelete.do", method=RequestMethod.POST)
	public ModelAndView userDelete(@RequestParam String[] check) {
		Map<String,String[]> map = new HashMap<String,String[]>();
		map.put("array",check);
		userDAO.userDelete(map);
		
		return new ModelAndView("redirect:/admin/userList.do");
	}
	
}
