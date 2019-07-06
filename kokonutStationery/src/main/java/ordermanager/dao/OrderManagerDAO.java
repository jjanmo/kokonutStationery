package ordermanager.dao;

import java.util.List;
import java.util.Map;

import order.bean.OrderDTO;
import order.bean.OrderlistDTO;

public interface OrderManagerDAO {

	public List<OrderlistDTO> getOrderList();

	public List<OrderDTO> orderViewList(String orderCode);

	public int orderStateChange(Map<String, Object> map);

}
