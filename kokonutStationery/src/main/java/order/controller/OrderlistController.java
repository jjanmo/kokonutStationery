package order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import order.bean.OrderManagerPaging;
import order.bean.OrderlistDTO;
import order.dao.OrderlistDAO;

@Controller
public class OrderlistController {
	@Autowired
	private OrderlistDAO orderlistDAO;
	
	@Autowired
	private OrderManagerPaging orderManagerPaging;
	
	@RequestMapping(value="/order/mypage_orderlist.do", method=RequestMethod.POST)
	public ModelAndView getOrderList(
				@RequestParam(required=false, defaultValue="1") String pg
				,@RequestParam Map<String,String> map ) {
		
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<OrderlistDTO> list = orderlistDAO.mypage_orderlist(map);
		
		int totalA = orderlistDAO.getTotalAS(map);
		
		orderManagerPaging.setCurrentPage(Integer.parseInt(pg));
		orderManagerPaging.setPageBlock(3);
		orderManagerPaging.setPageSize(10);
		orderManagerPaging.setTotalA(totalA);
		orderManagerPaging.makePagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("orderManagerPaging", orderManagerPaging);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="/order/orderCancel.do",method=RequestMethod.POST)
	public void orderCancel(@RequestParam Map<String,String> map) {
		orderlistDAO.orderCancel(map);
	}
	
	@RequestMapping(value="/order/orderChange.do",method=RequestMethod.POST)
	public void orderChange(@RequestParam String orderCode) {
		orderlistDAO.orderChange(orderCode);
	}
	
	@RequestMapping(value="/order/orderRefund.do",method=RequestMethod.POST)
	public void orderRefund(@RequestParam String orderCode) {
		orderlistDAO.orderRefund(orderCode);
	}
	
}
