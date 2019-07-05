package ordermanager.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
}
