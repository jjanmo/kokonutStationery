package order.dao;

import java.util.List;
import java.util.Map;

import order.bean.OrderlistDTO;

public interface OrderlistDAO {

	public List<OrderlistDTO> mypage_orderlist(Map<String, String> map);

	public int getTotalAS(Map<String, String> map);

	public void orderCancel(Map<String,String> map);

	public void orderChange(String orderCode);

	public void orderRefund(String orderCode);

	public void orderReceipt(String orderCode);

}