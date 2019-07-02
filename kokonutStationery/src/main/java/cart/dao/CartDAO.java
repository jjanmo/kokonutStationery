package cart.dao;

import cart.bean.CartDTO;

public interface CartDAO {

	public CartDTO getCart(int productCode);

}
