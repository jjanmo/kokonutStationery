package ordermanager.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import order.bean.OrderDTO;
import order.bean.OrderlistDTO;
import user.bean.UserDTO;

@Transactional
@Repository
public class OrderManagerImpl implements OrderManagerDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<OrderlistDTO> getOrderList(Map<String, String> map) {
		return sqlSession.selectList("orderManagerSQL.getOrderList", map);
	}
	
	@Override
	public int getTotalA() {
		return sqlSession.selectOne("orderManagerSQL.getTotalA");
	}
	
	@Override
	public List<OrderDTO> getOrderProduct(String orderCode) {
		return sqlSession.selectList("orderManagerSQL.getOrderProduct", orderCode);
	}
	@Override
	public UserDTO getReceiverInform(String userId) {
		return sqlSession.selectOne("orderManagerSQL.getReceiverInform", userId);
	}
	
	@Override
	public List<OrderDTO> orderViewList(String orderCode) {
		return sqlSession.selectList("orderManagerSQL.orderViewList", orderCode);
	}

	@Override
	public int orderStateChange(Map<String, Object> map) {
		return sqlSession.update("orderManagerSQL.orderStateChange", map);
	}

	@Override
	public void selectedOrderStateChange(Map<String, String[]> map) {
		sqlSession.update("orderManagerSQL.selectedOrderStateChange", map);
	}

	@Override
	public void selectedOrderDelete(Map<String, String[]> map) {
		sqlSession.delete("orderManagerSQL.selectedOrderDelete", map);
	}

	

	

	
}
