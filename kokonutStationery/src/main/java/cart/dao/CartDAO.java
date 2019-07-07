package cart.dao;

import java.util.List;
import java.util.Map;

import cart.bean.CartDTO;
import goods.bean.GoodsDTO;

public interface CartDAO {

	public List<CartDTO> getCart(String userId);

	public void cartInsert(CartDTO cartDTO);

	public int checkCart(CartDTO cartDTO);

	public void deleteCart(Map<String, String> map);

}
