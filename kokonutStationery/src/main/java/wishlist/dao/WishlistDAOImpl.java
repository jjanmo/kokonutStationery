package wishlist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import wishlist.bean.WishlistDTO;

@Repository
public class WishlistDAOImpl implements WishlistDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<WishlistDTO> getWishList(String userId) {
		return sqlSession.selectList("wishlistSQL.getWishList", userId);
	}

	@Override
	public void setWishList(WishlistDTO wishlistDTO) {
		sqlSession.insert("wishlistSQL.setWishList", wishlistDTO);
	}

	@Override
	public int checkWishList(WishlistDTO wishlistDTO) {
		return sqlSession.selectOne("wishlistSQL.checkWishList", wishlistDTO);	
	}

	@Override
	public void deleteWishList(Map<String, String> map) {
		sqlSession.delete("wishlistSQL.deleteWishList", map);
	}

}
