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
	
	//주문관리상세페이지에서 주문시 사용한 포인트목록 가져오기
	@Override
	public PointDTO getUsePoint(String orderCode) {
		return sqlSession.selectOne("pointSQL.getUsePoint", orderCode);
	}

}
