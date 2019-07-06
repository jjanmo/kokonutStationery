package ordermanager.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import order.bean.OrderDTO;
import order.bean.OrderlistDTO;

@Transactional
@Repository
public class OrderManagerImpl implements OrderManagerDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<OrderlistDTO> getOrderList() {
		return sqlSession.selectList("orderManagerSQL.getOrderList");
	}

	@Override
	public List<OrderDTO> orderViewList(String orderCode) {
		return sqlSession.selectList("orderManagerSQL.orderViewList", orderCode);
	}

	@Override
	public int orderStateChange(Map<String, Object> map) {
		return sqlSession.update("orderManagerSQL.orderStateChange", map);
	}
}
