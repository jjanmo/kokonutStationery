package order.dao;

import java.util.List;
import java.util.Map;

import order.bean.OrderlistDTO;

public interface OrderlistDAO {

	public List<OrderlistDTO> mypage_orderlist(Map<String, String> map);

	public int getTotalAS(Map<String, String> map);

}
