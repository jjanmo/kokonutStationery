package wishlist.dao;

import java.util.List;
import java.util.Map;

import wishlist.bean.WishlistDTO;

public interface WishlistDAO {

	public List<WishlistDTO> getWishList(String userId);
	public void setWishList(WishlistDTO wishlistDTO);
	public int checkWishList(WishlistDTO wishlistDTO);
	public void deleteWishList(Map<String, String> map);

}
