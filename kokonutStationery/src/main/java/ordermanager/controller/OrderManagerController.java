package ordermanager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import order.bean.OrderlistDTO;
import ordermanager.dao.OrderManagerDAO;

@Controller
public class OrderManagerController {
	@Autowired
	private OrderManagerDAO orderManagerDAO;
	
	@RequestMapping(value="/admin/getOrderList", method=RequestMethod.POST)
	public ModelAndView getOrderList(@RequestParam(required=false, defaultValue="1") String pg) {
		List<OrderlistDTO> list = orderManagerDAO.getOrderList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		
		return mav;
	}
}
