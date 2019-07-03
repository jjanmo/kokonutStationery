package noticeboard.dao;

import java.util.List;

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

}
