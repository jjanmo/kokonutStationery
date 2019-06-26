package service.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String noticeboard() {
		return "/service/noticeboard";
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
