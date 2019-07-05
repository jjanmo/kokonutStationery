package ordermanager.dao;

import java.util.List;

import order.bean.OrderlistDTO;

public interface OrderManagerDAO {

	public List<OrderlistDTO> getOrderList();

}
