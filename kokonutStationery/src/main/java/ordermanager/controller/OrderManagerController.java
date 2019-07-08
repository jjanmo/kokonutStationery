package ordermanager.controller;

import java.sql.Date;
import java.util.HashMap;
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
import order.bean.OrderManagerPaging;
import order.bean.OrderlistDTO;
import ordermanager.dao.OrderManagerDAO;
import user.bean.UserDTO;

@Controller
public class OrderManagerController {
	@Autowired
	private OrderManagerDAO orderManagerDAO;
	
	@Autowired
	private OrderManagerPaging orderManagerPaging;
	
	@RequestMapping(value="/admin/getOrderList.do", method=RequestMethod.POST)
	public ModelAndView getOrderList(@RequestParam(required=false, defaultValue="1") String pg) {
		
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<OrderlistDTO> list = orderManagerDAO.getOrderList(map);
		
		int totalA = orderManagerDAO.getTotalA();
		
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
	
	@RequestMapping(value="/admin/getOrderProduct.do", method=RequestMethod.POST)
	public ModelAndView getOrderProduct(@RequestParam String orderCode) {
		List<OrderDTO> pName = orderManagerDAO.getOrderProduct(orderCode); 
		ModelAndView mav = new ModelAndView();
		mav.addObject("pName", pName);
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
	
	@RequestMapping(value="/admin/orderSearchList.do", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView orderSearchList(@RequestParam Map<String,String> map) {
		int endNum = Integer.parseInt(map.get("pg"))*10;
		int startNum = endNum-9;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		int dateText1 = 0;
		int dateText2 = 0;
		List<OrderDTO> list = null;
		//기간이 적혀있을 때
		if(map.get("dataText1")!=null && map.get("dataText2")!=null) {
			dateText1 = Integer.parseInt(map.get("dateText1").substring(6,8));
			dateText2 = Integer.parseInt(map.get("dateText2").substring(6,8));
			//1일 부터 31일까지의 값인지 확인
			if(dateText1<=dateText2) {
				if((dateText1>=1 && dateText1<=31) && (dateText2>=1 && dateText2<=31)) {
					list = orderManagerDAO.orderSearchList(map);
				}
			}
		}else if(map.get("searchText")!=null) {
			list = orderManagerDAO.orderSearchList(map);
		}
		
		int totalA = orderManagerDAO.getSearchTotalA(map);
		
		orderManagerPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		orderManagerPaging.setPageBlock(3);
		orderManagerPaging.setPageSize(10);
		orderManagerPaging.setTotalA(totalA);
		orderManagerPaging.makeSearchPagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", map.get("pg"));
		mav.addObject("list", list);
		mav.addObject("orderManagerPaging", orderManagerPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/admin/selectedOrderStateChange.do", method=RequestMethod.POST)
	public String selectedOrderStateChange(@RequestParam String[] check
			, @RequestParam String[] orderState, @RequestParam String pg) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		
		map.put("check", check);
		map.put("orderState", orderState);
		orderManagerDAO.selectedOrderStateChange(map);
		return "redirect:/admin/orderList.do?pg="+pg;
	}
	
	@RequestMapping(value="admin/selectedOrderDelete.do", method=RequestMethod.POST)
	public String selectedOrderDelete(@RequestParam String[] check, @RequestParam String pg) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("check", check);
		orderManagerDAO.selectedOrderDelete(map);
		
		return "redirect:/admin/orderList.do?pg="+pg;
	}
	
}
