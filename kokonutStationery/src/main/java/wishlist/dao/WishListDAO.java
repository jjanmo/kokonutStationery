package wishlist.dao;

import java.util.List;
import java.util.Map;

import wishlist.bean.WishListDTO;

public interface WishListDAO {

	public List<WishListDTO> getWishList(String userId);
	public void setWishList(WishListDTO wishlistDTO);
	public int checkWishList(WishListDTO wishlistDTO);
	public void deleteWishList(Map<String, String> map);

}
