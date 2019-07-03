package service.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import noticeboard.bean.NoticeboardDTO;
import noticeboard.dao.NoticeboardDAO;

@Controller
@RequestMapping("/service/*")
public class ServiceController {

	@RequestMapping(value="/guide.do", method = RequestMethod.GET)
	public String guide() {
		return "/service/guide";
	}

	@RequestMapping(value="/private.do", method = RequestMethod.GET)
	public String servicePrivate() {
		return "/service/private";
	}
	
	@RequestMapping(value="/agreement.do", method = RequestMethod.GET)
	public String agreement() {
		return "/service/agreement";
	}
	
	@RequestMapping(value="/noticeboard.do", method = RequestMethod.GET)
	public ModelAndView noticeboard() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/notice/noticeboard.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	@RequestMapping(value="/noticeboardView.do", method = RequestMethod.GET)
	public String noticeboardView() {
		return "/service/noticeboardView";
	}
	

	@RequestMapping(value="/sendEmail.do", method = RequestMethod.GET)
	public String sendEmail() {
		return "/service/sendEmail";
	}

}
