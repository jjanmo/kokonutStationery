package noticeboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import noticeboard.bean.NoticeboardDTO;
import noticeboard.dao.NoticeboardDAO;

@Controller
public class NoticeboardController {
	@Autowired
	private NoticeboardDAO noticeboardDAO;
	
	//공지사항 전체 리스트 뿌리기
	@RequestMapping(value="/service/getNoticeboardList.do",method = RequestMethod.POST)
	public ModelAndView getNoticeboardList() {
		List<NoticeboardDTO> list = noticeboardDAO.getNoticeboardList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//공지사항 검색 리스트 뿌리기
	@RequestMapping(value="/service/noticeboardSearch.do",method = RequestMethod.GET)
	public ModelAndView noticeboardSearch(
								@RequestParam String keyword, 
								@RequestParam String option) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("keyword",keyword);
		map.put("option",option);
		
		List<NoticeboardDTO> list = noticeboardDAO.noticeboardSearch(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("keyword", keyword);
		mav.setViewName("jsonView");
		return mav;
	}


}
