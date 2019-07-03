package wishlist.dao;

import java.util.List;

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
		if(wishlistDTO.getOptionContent()==null) {
			sqlSession.insert("wishlistSQL.setWishList", wishlistDTO);
		}
		
	}

	@Override
	public int checkWishList(int productCode) {
		return sqlSession.selectOne("wishlistSQL.checkWishList", productCode);
	}

}
