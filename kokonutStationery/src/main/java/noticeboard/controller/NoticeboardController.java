package noticeboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import noticeboard.bean.NoticeboardDTO;
import noticeboard.dao.NoticeboardDAO;

@Controller
public class NoticeboardController {
	@Autowired
	private NoticeboardDAO noticeboardDAO;
	
	//공지사항 
	@RequestMapping(value="/service/getNoticeboardList.do",method = RequestMethod.POST)
	public ModelAndView getNoticeboardList() {
		List<NoticeboardDTO> list = noticeboardDAO.getNoticeboardList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
}
