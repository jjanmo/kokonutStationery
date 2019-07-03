package wishlist.dao;

import java.util.List;

import wishlist.bean.WishListDTO;

public interface WishListDAO {

	public List<WishListDTO> getWishList(String userId);
	public void setWishList(WishListDTO wishlistDTO);
	public int checkWishList(int productCode);

}
