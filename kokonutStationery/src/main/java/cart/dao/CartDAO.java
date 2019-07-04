package cart.dao;

import java.util.List;

import cart.bean.CartDTO;
import goods.bean.GoodsDTO;

public interface CartDAO {

	public List<CartDTO> getCart(String userId);

	public void cartInsert(CartDTO cartDTO);

}
