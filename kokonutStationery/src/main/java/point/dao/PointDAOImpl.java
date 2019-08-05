package point.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import point.bean.PointDTO;


@Repository
public class PointDAOImpl implements PointDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PointDTO> getPointList(String userId) {
		return sqlSession.selectList("pointSQL.getPointList", userId);
	}

	@Override
	public String getUsePoint(String orderCode) {		
		
		return sqlSession.selectOne("pointSQL.getUsePoint",orderCode);		 
	}

}
