package ordermanager.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import point.bean.PointDTO;
import point.dao.PointDAO;
import user.bean.UserDTO;

@Controller
public class OrderManagerController {
	@Autowired
	private OrderManagerDAO orderManagerDAO;
	@Autowired
	private PointDAO pointDAO;
	@Autowired
	private OrderManagerPaging orderManagerPaging;
	
	//주문관리페이지에서 orderlist가져오기
	@RequestMapping(value="/admin/getOrderList.do", method=RequestMethod.POST)
	public ModelAndView getOrderList(@RequestParam(required=false, defaultValue="1") String pg) {
		
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<OrderlistDTO> list = orderManagerDAO.getOrderlist(map);
		
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
	
	//주문관리에서 orderlist에서 각 리스트마다 이름 만들기(~~외 n건)
	@RequestMapping(value="/admin/getOrderProduct.do", method=RequestMethod.POST)
	public ModelAndView getOrderProduct(@RequestParam String orderCode) {
		List<OrderDTO> pName = orderManagerDAO.getOrderProduct(orderCode); 
		ModelAndView mav = new ModelAndView();
		mav.addObject("pName", pName);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//주문취소 등록팝업창
	@RequestMapping(value="/admin/orderCancelRegisterForm.do",method=RequestMethod.GET)
	public ModelAndView orderCancelRegisterForm(@RequestParam String orderCode) {
		OrderlistDTO orderlistDTO = orderManagerDAO.getOrderlistInCancelForm(orderCode);
		//System.out.println(orderlistDTO);
		
		//날짜변환
		Date pOrderDate = orderlistDTO.getOrderDate();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String orderDate = sdf.format(pOrderDate);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("orderlistDTO", orderlistDTO);
		mav.addObject("orderDate", orderDate);
		mav.setViewName("/admin/order/orderCancelRegisterForm");
		return mav;
	}
	
	//주문취소 등록
	@RequestMapping(value="/admin/orderCancelRegister.do",method=RequestMethod.POST)
	@ResponseBody
	public String orderCancelRegister(@RequestParam Map<String, String> map) {
		
		//1) orderlist 수정(update)
		orderManagerDAO.updateOrderlist(map); 
		//2) order가져오기
		List<OrderDTO> list = orderManagerDAO.getOrder(map.get("orderCode")); 
		System.out.println(list);
		
		//3) order수정
		Map<String, Object> uMap  = new HashMap<String, Object>();
		int cnt = 0;
		for(int i = 0; i < list.size(); i++) {
			uMap.put("orderCode", map.get("orderCode"));
			uMap.put("purchaseQty",list.get(i).getPurchaseQty());
			uMap.put("totalPrice",list.get(i).getTotalPrice());
			orderManagerDAO.updateOrder(uMap);
			cnt++;
		}
		//4) user 수정(총구매액)
		orderManagerDAO.updateTotalPaymentInUser(map.get("orderCode"));  		
		System.out.println("cnt : " + cnt);
		if(cnt == list.size()) return "success";
		else return "fail";
	}
	
	//주문취소상세 팝업창
	@RequestMapping(value="/admin/orderCancelDetail.do", method=RequestMethod.GET)
	public String orderCancelDetail(@RequestParam String orderCode, Model model) {
		OrderlistDTO orderlistDTO = orderManagerDAO.getOrderlistInCancelForm(orderCode);
		//날짜변환
		Date pOrderDate = orderlistDTO.getOrderDate();
		Date pCancelDate = orderlistDTO.getCancelDate();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String orderDate = sdf.format(pOrderDate);
		String cancelDate = sdf.format(pCancelDate);
		model.addAttribute("orderlistDTO", orderlistDTO);
		model.addAttribute("orderDate", orderDate);
		model.addAttribute("cancelDate", cancelDate);
		return "/admin/order/orderCancelDetail";
	}
	
	//주문취소시 누가 취소했는지 알기위해서
	@RequestMapping(value="/admin/getWhoCancel.do", method=RequestMethod.POST)
	@ResponseBody
	public OrderlistDTO getWhoCancel(@RequestParam String orderCode) {
		OrderlistDTO orderlistDTO = orderManagerDAO.getWhoCancel(orderCode);
		return orderlistDTO;
	}
	
	//주문관리에서 주문리스트(orderlist) 검색
	@RequestMapping(value="/admin/orderSearchList.do", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView orderSearchList(@RequestParam Map<String,String> map) {
		//System.out.println("map : " + map);
		
		int endNum = Integer.parseInt(map.get("pg"))*10;
		int startNum = endNum-9;
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		int totalA = orderManagerDAO.getSearchTotalA(map);
		//System.out.println("totalA : " + totalA);
		
		orderManagerPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		orderManagerPaging.setPageBlock(3);
		orderManagerPaging.setPageSize(10);
		orderManagerPaging.setTotalA(totalA);
		orderManagerPaging.makeSearchPagingHTML();
		
		List<OrderlistDTO> list = orderManagerDAO.orderSearchList(map);
		//System.out.println("list : " + list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", map.get("pg"));
		mav.addObject("list", list);
		mav.addObject("orderManagerPaging", orderManagerPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//제품상세페이지
	@RequestMapping(value="/admin/orderView.do", method=RequestMethod.GET)
	public String orderView(@RequestParam String orderCode, Model model) {
		List<OrderDTO> list = orderManagerDAO.orderViewList(orderCode);
		//orderlistDTO에서 orderState얻기위해서 이용함
		OrderlistDTO orderlistDTO =  orderManagerDAO.getWhoCancel(orderCode);
		int orderState = orderlistDTO.getOrderState();
		
		//날짜변환
		Date pOrderDate = list.get(0).getOrderDate();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String orderDate = sdf.format(pOrderDate);
		
		model.addAttribute("orderState", orderState);
		model.addAttribute("orderDate",orderDate);
		model.addAttribute("orderCode", orderCode);
		model.addAttribute("list", list);
		return "/admin/order/orderView";
	}
	
	//제품상세페이지에서 유저정보 가져오기
	@RequestMapping(value="/admin/getUserInfo.do", method=RequestMethod.POST)
	public ModelAndView orderViewList(@RequestParam String orderCode) {
		UserDTO userDTO = orderManagerDAO.getUserInfo(orderCode);
		//System.out.println(userDTO);
		ModelAndView mav = new ModelAndView();
		mav.addObject("userDTO", userDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//제품상세페이지에서 사용한 포인트 가져오기
	@RequestMapping(value="/admin/getUsePoint.do",method=RequestMethod.POST)
	public ModelAndView getUsePoint(@RequestParam String orderCode) {
		PointDTO pointDTO = pointDAO.getPointDTO(orderCode);
		//System.out.println(pointDTO);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pointDTO", pointDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//상세페이지에서 orderState갱신
	@RequestMapping(value="/admin/changeOrderState.do", method=RequestMethod.POST)
	@ResponseBody
	public String changeOrderState(@RequestParam Map<String, Object> map) {
		orderManagerDAO.changeOrderlistState(map);
		int su = orderManagerDAO.changeOrderState(map);
		System.out.println(su);
		if(su == -1) {
			return "fail";
		}
		else {
			return "success";
		}
	}
	
//	@RequestMapping(value="/admin/selectedOrderStateChange.do", method=RequestMethod.POST)
//	public String selectedOrderStateChange(@RequestParam String[] check
//			, @RequestParam String[] orderState, @RequestParam String pg) {
//		Map<String, String[]> map = new HashMap<String, String[]>();
//		
//		map.put("check", check);
//		map.put("orderState", orderState);
//		orderManagerDAO.selectedOrderStateChange(map);
//		return "redirect:/admin/orderList.do?pg="+pg;
//	}
	
	//주문관리에서 주문내역(orderlist) 삭제
	@RequestMapping(value="admin/selectedOrderDelete.do", method=RequestMethod.POST)
	public String selectedOrderDelete(@RequestParam String[] check, @RequestParam String pg) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("check", check);
		orderManagerDAO.selectedOrderDelete(map);
		
		return "redirect:/admin/orderList.do?pg="+pg;
	}
	
	//주문관리에서 교환/환불 상세 페이지 이동
	@RequestMapping(value="/admin/erDetailForm.do", method=RequestMethod.GET)
	public String erDetailForm(@RequestParam String orderCode, @RequestParam String erState, Model model) {
		List<OrderDTO> list = orderManagerDAO.getOrder(orderCode);
		model.addAttribute("list", list);
		model.addAttribute("orderCode", orderCode);
		model.addAttribute("erState",erState);
		return "/admin/order/erDetailForm";	
	}
	
	//교환/환불 상세페이지에서 orderlist불러오기
	@RequestMapping(value="/admin/getOrderlistInErDetail.do", method=RequestMethod.POST)
	public ModelAndView getOrderlistInErDetail(@RequestParam String orderCode) {
		OrderlistDTO orderlistDTO = orderManagerDAO.getWhoCancel(orderCode); 
		//orderlistDTO를 가져오는것을 같이 사용함(method이름이 이상한데...어쩔수 없이 사용함, 나중에 리펙토링(이름통일)필요)
		ModelAndView mav = new ModelAndView();
		mav.addObject("orderlistDTO", orderlistDTO);
		mav.setViewName("jsonView");
		return mav;
		
	}
	
	//교환환불관련 관리자 메세지 등록
	@RequestMapping(value="/admin/setErAdminMemo.do", method=RequestMethod.POST)
	@ResponseBody
	public String setErAdminMemo(@RequestParam Map<String, String> map) {
		int su = orderManagerDAO.setErAdminMemo(map);
		if(su == 1) {
			return "success";
		}
		else {
			return "fail";
		}
	}
	
	//교환환불사유 팝업창
	@RequestMapping(value="/admin/erReasonPopup.do", method=RequestMethod.GET)
	public String erReasonPopup(@RequestParam String orderCode, Model model) {
		model.addAttribute("orderCode", orderCode);
		return "/admin/order/erReasonPopup";
	}
	
	//교환환불사유등록
	@RequestMapping(value="/admin/setErReason.do", method=RequestMethod.POST)
	@ResponseBody
	public void setErReason(@RequestParam Map<String, String> map) {
		orderManagerDAO.setErReason(map);
	}
	
	//erState를 위해서 order를 가져오기
	@RequestMapping(value="/admin/getOrderErState.do", method=RequestMethod.POST)
	public ModelAndView getOrderErState(@RequestParam Map<String, Object> map) {
		OrderDTO orderDTO = orderManagerDAO.getOrderErState(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("orderDTO", orderDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//erState갱신 : tbl_order에서 정보 수정
	@RequestMapping(value="/admin/changeErState.do",method=RequestMethod.POST)
	@ResponseBody
	public void changeErState(@RequestParam Map<String, Object> map) {
		System.out.println(map);
		orderManagerDAO.changeErState(map);
	}
	
	
	//erState갱신 : tbl_orderlist에서 정보수정
	@RequestMapping(value="/admin/changeOrderlistErState.do", method=RequestMethod.POST)
	@ResponseBody
	public void changeOrderlistErState(@RequestParam Map<String, Object> map) {
		System.out.println(map);
		orderManagerDAO.changeOrderlistErState(map);
	}
	
	//erState갱신 : 환불완료 후에 user의 총구매액 변경
	@RequestMapping(value="/admin/changeTotalPayment.do", method=RequestMethod.POST)
	@ResponseBody
	public void changeTotalPayment(@RequestParam Map<String, String> map) {
		orderManagerDAO.changeTotalPayment(map);

	}
}




