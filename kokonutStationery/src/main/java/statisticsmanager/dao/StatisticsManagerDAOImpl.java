package statisticsmanager.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import order.bean.OrderDTO;

@Transactional
@Repository
public class StatisticsManagerDAOImpl implements StatisticsManagerDAO {
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<OrderDTO> salesList(Map<String, String> map) {
		return sqlsession.selectList("statisticsSQL.salesList", map);
	}

	@Override
	public int getTotalA() {
		return sqlsession.selectOne("statisticsSQL.getTotalA");
	}

	@Override
	public List<OrderDTO> salesSearchList(Map<String, String> map) {
		return sqlsession.selectList("statisticsSQL.salesSearchList", map);
	}

	@Override
	public int getSearchTotalA(Map<String, String> map) {
		return sqlsession.selectOne("statisticsSQL.getSearchTotalA", map);
	}
}
