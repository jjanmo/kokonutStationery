package statisticsmanager.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class StatisticsManagerDAOImpl implements StatisticsManagerDAO {
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<Object> salesList() {
		return sqlsession.selectList("statisticsSQL.salesList");
	}

}
