package noticeboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import noticeboard.bean.NoticeboardDTO;

@Repository
public class NoticeboardDAOImpl implements NoticeboardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<NoticeboardDTO> getNoticeboardList() {
		return sqlSession.selectList("noticeboardSQL.getNoticeboardList");
	}

	@Override
	public List<NoticeboardDTO> noticeboardSearch(Map<String, String> map) {
		return sqlSession.selectList("noticeboardSQL.noticeboardSearch",map);
	}

}
