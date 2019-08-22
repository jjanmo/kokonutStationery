package ordermanager.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import goods.bean.GoodsDTO;
import goods.bean.ProductOptionDTO;
import order.bean.OrderDTO;
import order.bean.OrderlistDTO;
import user.bean.UserDTO;

public interface OrderManagerDAO {

	public List<OrderlistDTO> getOrderlist(Map<String, String> map);
	
	public int getTotalA();
	
	public List<OrderDTO> getOrderProduct(String orderCode);
	
	public UserDTO getUserInfo(String orderCode);
	
	public List<OrderDTO> orderViewList(String orderCode);

	public List<OrderlistDTO> orderSearchList(Map<String, String> map);

	public int getSearchTotalA(Map<String, String> map);
	
	//public void selectedOrderStateChange(Map<String, String[]> map);

	public void selectedOrderDelete(Map<String, String[]> map);

	public OrderlistDTO getOrderlistInCancelForm(String orderCode);

	public void updateOrderlist(Map<String, String> map);

	public List<OrderDTO> getOrder(String orderCode);

	public void updateOrder(Map<String, Object> uMap);

	public OrderlistDTO getWhoCancel(String orderCode);
		
	public void changeOrderlistState(Map<String, Object> map);

	public int changeOrderState(Map<String, Object> map);

	public void updateTotalPaymentInUser(String orderCode);

	public int setErAdminMemo(@RequestParam Map<String, String> map);

	public void setErReason(Map<String, String> map);

	public OrderDTO getOrderErState(Map<String, Object> map);

	public void changeErState(Map<String, Object> map);

	public void changeOrderlistErState(Map<String, Object> map);

	public void changeTotalPayment(Map<String, String> map);

	public List<GoodsDTO> searchProductInRegOrder(Map<String, String> map);

	public List<ProductOptionDTO> getOptionContent(int productCode);

	public List<UserDTO> searchUserInRegOrder(Map<String, String> map);
	
	public int setOrderlistInManagerOrder(OrderlistDTO orderlistDTO);
	
	public int setOrderInManagerOrder(OrderDTO orderDTO);

	public int changeStockInManagerOrder(Map<String, Object> map);

	public int setPointInfoInManagerOrder(Map<String, Object> map);

	public int changeUserInfo(Map<String, Object> map);

	public void updateOrderStateOfOrderlist(String userId);

	

}
