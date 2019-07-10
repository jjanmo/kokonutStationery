package order.dao;

import java.util.List;
import java.util.Map;

import goods.bean.GoodsDTO;
import order.bean.OrderDTO;
import order.bean.OrderlistDTO;
import order.bean.PostDTO;
import user.bean.UserDTO;


public interface OrderDAO {

	public GoodsDTO getProduct(int productCode);

	public List<PostDTO> postSearch(Map<String, String> map);

	public int updateUserInfo(UserDTO userDTO);

	public int setOrderInfo(OrderDTO orderDTO);

	public int setOrderInfoOption(OrderDTO orderDTO);

	public List<OrderDTO> getOrderInfo(String userId);

	public int insertOrderlist(Map<String, Object> map);
	//public int insertOrderlist(OrderlistDTO orderlistDTO);
	
	public void orderCancel(String userId);

	public void reduceSaleProduct(Map<String, Object> map);

	public void reduceSaleProductOption(Map<String, Object> map);

	public List<OrderDTO> getKokonutOrder(Map<String, String> map);	

	public List<OrderDTO> getOrder(String orderCode);

	public UserDTO getKokonutInform(Map<String, String> map);

	

}
