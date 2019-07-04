package cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cart.bean.CartDTO;
import goods.bean.GoodsDTO;

@Transactional
@Repository
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void cartInsert(CartDTO cartDTO) {
		sqlSession.insert("cartSQL.cartInsert", cartDTO);
	}

	@Override
	public List<CartDTO> getCart(String userId) {
		return sqlSession.selectList("cartSQL.getCart", userId);
	}

	
	
	

	
	
	

}
