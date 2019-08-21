package order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import order.bean.OrderDTO;
import order.bean.OrderManagerPaging;
import order.bean.OrderlistDTO;
import order.dao.OrderDAO;
import order.dao.OrderlistDAO;
import productmanager.dao.ProductManagerDAO;

@Controller
public class OrderlistController {
	
	@Autowired
	private ProductManagerDAO productManagerDAO;
	
	@Autowired
	private OrderDAO orderDAO;
	
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
		System.out.println("x_totalPayment="+map.get("x_totalPayment")+" x_userPoint="+map.get("x_userPoint"));
		String orderCode = map.get("orderCode");
		List<OrderDTO> list= orderDAO.getOrder(orderCode);
		//재고 돌려놓기
		Map<String,String> map2 = new HashMap<String,String>();
		for(int i=0;i<list.size();i++) {
			
			map2.put("purchaseQty",list.get(i).getPurchaseQty()+"");
			map2.put("productCode",list.get(i).getProductCode()+"");
			String optionContent = list.get(i).getOptionContent();
			
			if(list.get(i).getOptionContent()==null) {
				optionContent=null;
			}
				
			map2.put("optionContent",optionContent);
			
			//재고변화
			productManagerDAO.changeStock(map2);
			
		}
		
		//상태변경
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
	public void orderReceipt(@RequestParam String orderCode,@RequestParam String totalPayment, HttpSession session) {
		String userId = (String)session.getAttribute("memId");
		System.out.println("userId="+userId);
		if(userId==null) {//비회원일때
			userId = orderlistDAO.getKokonutId(orderCode);	
			System.out.println("비회원userId="+userId);
		}
		
		double savePoint = Integer.parseInt(totalPayment)*(0.1);
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("orderCode", orderCode);
		map.put("userId", userId);
		map.put("savePoint",savePoint+"");
		
		orderlistDAO.orderReceipt(map);
	}
	
	//상품교환
	@RequestMapping(value="/order/orderExchange.do",method=RequestMethod.POST)
	@ResponseBody
	public String orderExchange(@RequestParam String orderCode,
								@RequestParam String erReason,
								@RequestParam String erDetail,
								@RequestParam String productCodeList,
								@RequestParam String optionContentList,
								@RequestParam String changeExchangeQtyList) {
		
		
		System.out.println("[교환]주문코드="+orderCode+" 사유="+erReason+" 세부사유="+erDetail);
		
		//상품에 따른 수량변경(옵션있으면체크)
		//상품재고 돌려놓기
		String[] productCodeStr = productCodeList.split(",");
		String[] optionContentStr = optionContentList.split(",");
		String[] changeExchangeQtyStr = changeExchangeQtyList.split(",");
		
		//재고 돌려놓기
		Map<String,String> map = new HashMap<String,String>();
		
		for(int i=0;i<productCodeStr.length;i++) {
			
			map.put("purchaseQty",changeExchangeQtyStr[i]);
			map.put("productCode",productCodeStr[i]);
			String optionContent = optionContentStr[i];
			
			if(optionContentStr[i].equals("undefined")) {
				optionContentStr[i]=null;
				optionContent=null;
			}
			map.put("optionContent",optionContent);
			
			//재고변화
			productManagerDAO.changeStock(map);
			System.out.println("[map] "+map);
			
			//상태변화
			orderlistDAO.orderExchange(orderCode,erReason,erDetail,
					productCodeStr[i],optionContentStr[i],changeExchangeQtyStr[i]);
		
			System.out.println(" 상품코드="+productCodeStr[i]
								+" 옵션내용="+optionContentStr[i]
								+" 교환수량="+changeExchangeQtyStr[i]);
			
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
		
		System.out.println("[환불]주문코드="+orderCode+" 사유="+erReason+" 세부사유="+erDetail+" 총환불금액(포인트제외)="+erTotalCost);
		
		//erCost변경
		//상품에 따른 수량변경(옵션있으면체크)
		//상품재고 돌려놓기
		String[] erCostStr = erCostList.split(",");
		String[] productCodeStr = productCodeList.split(",");
		String[] optionContentStr = optionContentList.split(",");
		String[] changeRefundQtyStr = changeRefundQtyList.split(",");
		
		//재고 돌려놓기
		Map<String,String> map = new HashMap<String,String>();
				
		for(int i=0;i<productCodeStr.length;i++) {
			
			map.put("purchaseQty",changeRefundQtyStr[i]);
			map.put("productCode",productCodeStr[i]);
			String optionContent = optionContentStr[i];			
			
			if(optionContentStr[i].equals("undefined")) {
				optionContentStr[i]=null;
				optionContent=null;
			}
			map.put("optionContent",optionContent);
			
			//재고변화
			productManagerDAO.changeStock(map);
			System.out.println("[map] "+map);
			
			//상태변화
			orderlistDAO.orderRefund(orderCode,erReason,erDetail,erTotalCost,
					erCostStr[i],productCodeStr[i],optionContentStr[i],changeRefundQtyStr[i]);
				
			System.out.println(" 각환불금액="+erCostStr[i]
								+" 상품코드="+productCodeStr[i]
								+" 옵션내용="+optionContentStr[i]
								+" 환불수량="+changeRefundQtyStr[i]);
			
		}
		
		return "ok";
	}
		
}
