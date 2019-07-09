package order.dao;

import java.util.List;
import java.util.Map;

import cart.bean.CartDTO;
import goods.bean.GoodsDTO;
import order.bean.OrderDTO;
import order.bean.PostDTO;
import user.bean.UserDTO;


public interface OrderDAO {

	public GoodsDTO getProduct(int productCode);

	public List<PostDTO> postSearch(Map<String, String> map);

	public int updateUserInfo(UserDTO userDTO);

	public int setOrderInfo(OrderDTO orderDTO);

	public int setOrderInfoOption(OrderDTO orderDTO);

	public List<OrderDTO> getOrderInfo(String userId);

	public int cartOrderInfo(OrderDTO orderDTO);

	

	

}
