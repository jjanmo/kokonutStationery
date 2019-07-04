package wishlist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import wishlist.bean.WishListDTO;

@Repository
public class WishListDAOImpl implements WishListDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<WishListDTO> getWishList(String userId) {
		return sqlSession.selectList("wishlistSQL.getWishList", userId);
	}

	@Override
	public void setWishList(WishListDTO wishlistDTO) {
		sqlSession.insert("wishlistSQL.setWishList", wishlistDTO);
	}

	@Override
	public int checkWishList(WishListDTO wishlistDTO) {
		if(wishlistDTO.getProductOption()==0) {
			return sqlSession.selectOne("wishlistSQL.checkWishListNoOption", wishlistDTO);
		} else {
			return sqlSession.selectOne("wishlistSQL.checkWishListOption", wishlistDTO);	
		}
	}

	@Override
	public void deleteWishList(Map<String, String> map) {
		sqlSession.delete("wishlistSQL.deleteWishList", map);
	}

}
