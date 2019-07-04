package contentmanager.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import goods.bean.GoodsDTO;
import noticeboard.bean.NoticeboardDTO;

@Transactional
@Repository
public class ContentManagerDAOImpl implements ContentManagerDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GoodsDTO> reviewboardList() {
		return sqlSession.selectList("contentSQL.reviewboardList");
	}

	@Override
	public List<NoticeboardDTO> noticeboardList() {
		return sqlSession.selectList("contentSQL.noticeboardList");
	}

	@Override
	public NoticeboardDTO noticeboardModifyForm(int noticeboardCode) {
		return sqlSession.selectOne("contentSQL.noticeboardModifyForm", noticeboardCode);
	}

	@Override
	public void noticeboardModify(Map<String, String> map) {
		sqlSession.update("contentSQL.noticeboardModify",map);
		
	}

	@Override
	public void noticeboardWrite(Map<String, String> map) {
		sqlSession.insert("contentSQL.noticeboardWrite",map);
		
	}

}
