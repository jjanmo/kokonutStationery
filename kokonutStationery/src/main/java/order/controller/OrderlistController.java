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
	
	/*
	 * @RequestMapping(value="/order/orderChange.do",method=RequestMethod.POST)
	 * public void orderChange(@RequestParam String orderCode) {
	 * orderlistDAO.orderChange(orderCode); }
	 * 
	 * @RequestMapping(value="/order/orderRefund.do",method=RequestMethod.POST)
	 * public void orderRefund(@RequestParam String orderCode) {
	 * orderlistDAO.orderRefund(orderCode); }
	 */
	
	@RequestMapping(value="/order/orderReceipt.do",method=RequestMethod.POST)
	public void orderReceipt(@RequestParam String orderCode) {
		orderlistDAO.orderReceipt(orderCode);
	}
	
	//상품교환
	@RequestMapping(value="/order/orderExchange.do",method=RequestMethod.POST)
	@ResponseBody
	public String orderExchange(@RequestParam String orderCode,
								@RequestParam String erReason,
								@RequestParam String erDetail,
								@RequestParam String productCodeList,
								@RequestParam String optionContentList,
								@RequestParam String changeRefundQtyList) {
		
		
		System.out.println("[교환]주문코드="+orderCode+" 사유="+erReason+" 세부사유="+erDetail+" 상품코드="+productCodeList+" 옵션내용="+optionContentList+" 교환환불수량="+changeRefundQtyList);
		//상품에 따른 수량변경(옵션있으면체크)
		//상품재고 돌려놓기
		String[] productCodeStr = productCodeList.split(",");
		String[] optionContentStr = optionContentList.split(",");
		String[] changeRefundQtyStr = changeRefundQtyList.split(",");
		
		for(int i=0;i<productCodeStr.length;i++) {
			if(optionContentStr[i].equals("undefined"))
				optionContentStr[i]="";
			orderlistDAO.orderExchange(orderCode,erReason,erDetail,
					productCodeStr[i],optionContentStr[i],changeRefundQtyStr[i]);
		}
		
		
		return "ok";
	}
	
	//상품환불
	@RequestMapping(value="/order/orderRefund.do",method=RequestMethod.POST)
	@ResponseBody
	public String orderRefund(@RequestParam String orderCode,
							@RequestParam String erReason,
							@RequestParam String erDetail,
							@RequestParam String erTotalCost,
							@RequestParam String erCostList,
							@RequestParam String productCodeList,
							@RequestParam String optionContentList,
							@RequestParam String changeRefundQtyList) {
		
		
		System.out.println("[환불]주문코드="+orderCode+" 사유="+erReason+" 총환불금액(포인트제외)="+erTotalCost+" 각환불금액="+erCostList
				+" 상품코드="+productCodeList+" 옵션내용="+optionContentList+" 교환환불수량="+changeRefundQtyList);
		//erCost변경
		//상품에 따른 수량변경(옵션있으면체크)
		//상품재고 돌려놓기
		String[] erCostStr = erCostList.split(",");
		String[] productCodeStr = productCodeList.split(",");
		String[] optionContentStr = optionContentList.split(",");
		String[] changeRefundQtyStr = changeRefundQtyList.split(",");
		
		for(int i=0;i<productCodeStr.length;i++) {
			if(optionContentStr[i].equals("undefined"))
				optionContentStr[i]="";
			orderlistDAO.orderRefund(orderCode,erReason,erDetail,erTotalCost,
					erCostStr[i],productCodeStr[i],optionContentStr[i],changeRefundQtyStr[i]);
		}
		
		return "ok";
	}
		
}
