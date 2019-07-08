package cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cart.bean.CartDTO;
import goods.bean.GoodsDTO;
import goods.bean.ProductOptionDTO;

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

	@Override
	public int checkCart(CartDTO cartDTO) {
		return sqlSession.selectOne("cartSQL.checkCart", cartDTO);
	}

	@Override
	public void deleteCart(Map<String, String> map) {
		sqlSession.delete("cartSQL.deleteCart", map);
	}

	@Override
	public void allDeleteCart(String userId) {
		sqlSession.delete("cartSQL.allDeleteCart", userId);
		
	}

	@Override
	public void cartUpdate(CartDTO cartDTO) {
		sqlSession.update("cartSQL.cartUpdate", cartDTO);
	}

	@Override
	public List<ProductOptionDTO> getOption(int productCode) {
		return sqlSession.selectList("cartSQL.getOption", productCode);
	}

	@Override
	public CartDTO goodsCartEdit(int cartCode) {
		return sqlSession.selectOne("cartSQL.goodsCartEdit", cartCode);
	}

	@Override
	public void cartOptionModify(Map<String, String> map) {
		sqlSession.update("cartSQL.cartOptionModify", map);
	}

	
}

	
	
	
	

	
	
	
