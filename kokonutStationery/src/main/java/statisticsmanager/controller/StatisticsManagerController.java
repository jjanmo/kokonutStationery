package statisticsmanager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import statisticsmanager.dao.StatisticsManagerDAO;

@Controller
public class StatisticsManagerController {
	//@Autowired
	//private StatisticsManagerDAO statisticsManagerDAO;

	@RequestMapping(value="/admin/salesSearchForm.do",method=RequestMethod.GET)
	public String salesSearchForm() {
		return "/admin//statistics/salesSearchForm";
	}

	@RequestMapping(value="/admin/salesList.do",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView salesList() {
		//List<OrderDTO> list = statisticsManagerDAO.salesList();
		ModelAndView mav = new ModelAndView();
		//mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
}
