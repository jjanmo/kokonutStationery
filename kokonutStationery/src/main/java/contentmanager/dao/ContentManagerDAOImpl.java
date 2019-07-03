package contentmanager.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import goods.bean.GoodsDTO;

@Transactional
@Repository
public class ContentManagerDAOImpl implements ContentManagerDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GoodsDTO> reviewboardList() {
		return sqlSession.selectList("contentSQL.reviewboardList");
	}

}
