package ordermanager.controller;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import order.bean.OrderDTO;
import order.bean.OrderlistDTO;
import ordermanager.dao.OrderManagerDAO;
import user.bean.UserDTO;

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
	
	@RequestMapping(value="/admin/orderView.do", method=RequestMethod.GET)
	public String orderView(@RequestParam String orderCode, @RequestParam String orderDate, 
			@RequestParam String userId, Model model) {
		UserDTO userDTO = orderManagerDAO.getReceiverInform(userId);
		model.addAttribute("userDTO", userDTO);
		model.addAttribute("orderDate", orderDate);
		model.addAttribute("orderCode", orderCode);
		return "/admin/order/orderView";
	}
	
	@RequestMapping(value="/admin/orderViewList.do", method=RequestMethod.POST)
	public ModelAndView orderViewList(@RequestParam String orderCode) {
		List<OrderDTO> list = orderManagerDAO.orderViewList(orderCode);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="/admin/orderStateChange.do", method=RequestMethod.POST)
	@ResponseBody
	public String orderStateChange(@RequestParam Map<String, Object> map, Model model) {
		orderManagerDAO.orderStateChange(map);
		return "success";
	}
}
