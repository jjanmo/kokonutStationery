package order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import order.bean.OrderlistDTO;

@Repository
@Transactional
public class OrderlistDAOImpl implements OrderlistDAO {
	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public List<OrderlistDTO> mypage_orderlist(Map<String, String> map) {
		return sqlSession.selectList("orderlistSQL.mypage_orderlist", map);
	}

	@Override
	public int getTotalAS(Map<String, String> map) {
		return sqlSession.selectOne("orderlistSQL.getTotalAS", map);
	}

	@Override
	public void orderCancel(Map<String,String> map) {
		sqlSession.update("orderlistSQL.orderCancel",map);	
	}

	@Override
	public void orderChange(String orderCode) {
		sqlSession.update("orderlistSQL.orderChange",orderCode);
	}

	@Override
	public void orderRefund(String orderCode) {
		sqlSession.update("orderlistSQL.orderRefund",orderCode);	
	}

	@Override
	public void orderReceipt(String orderCode) {
		sqlSession.update("orderlistSQL.orderReceipt",orderCode);	
	} 
	
	
}
