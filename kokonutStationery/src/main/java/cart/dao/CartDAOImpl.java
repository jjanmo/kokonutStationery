package cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cart.bean.CartDTO;

@Transactional
@Repository
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public CartDTO getCart(int productCode) {
		
		return sqlsession.selectOne("cartSQL.getCart", productCode);
	}
	
	/*
	 * @Override public List<CartDTO> getCart(Map<String, String> map) {
	 * 
	 * return sqlsession.selectList("cartSQL.getCart"); }
	 */

}
