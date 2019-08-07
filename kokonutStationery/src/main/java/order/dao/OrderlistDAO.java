package order.dao;

import java.util.List;
import java.util.Map;

import order.bean.OrderlistDTO;

public interface OrderlistDAO {

	public List<OrderlistDTO> mypage_orderlist(Map<String, String> map);

	public int getTotalAS(Map<String, String> map);

	public void orderCancel(Map<String,String> map);
	
	public void orderProductCancel(Map<String, String> map2);
	
	/* public void orderChange(String orderCode); */

	public void orderRefund(String orderCode, String erReason, String erDetail, String erTotalCost, 
			String erCostStr,String productCodeStr, String optionContentStr, String changeRefundQtyStr);

	public void orderReceipt(Map<String, String> map);

	public void orderExchange(String orderCode, String erReason, String erDetail, 
			String productCodeStr, String optionContentStr,	String changeExchangeQtyStr);

	
}

