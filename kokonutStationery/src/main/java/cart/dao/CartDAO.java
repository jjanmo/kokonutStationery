package cart.dao;

import java.util.List;
import java.util.Map;

import cart.bean.CartDTO;
import goods.bean.GoodsDTO;
import goods.bean.ProductOptionDTO;

public interface CartDAO {

	public List<CartDTO> getCart(String userId);

	public void cartInsert(CartDTO cartDTO);

	public int checkCart(CartDTO cartDTO);

	public void deleteCart(Map<String, String> map);

	public void allDeleteCart(String userId);

	public void cartUpdate(CartDTO cartDTO);

	public CartDTO goodsCartEdit(int cartCode);

	public List<ProductOptionDTO> getOption(int productCode);

	public void cartOptionModify(Map<String, String> map);

	public CartDTO getSelectCart(String cartCode);

	/* public List<CartDTO> cartOrder(String userId); */

	public CartDTO getCartDTO(int cartCode);

	public void deleteCartAfterPay(int cartCode);


}
