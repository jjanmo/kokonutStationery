package contentmanager.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import goods.bean.GoodsDTO;
import noticeboard.bean.NoticeboardDTO;
import qnaboard.bean.QnaboardDTO;

@Transactional
@Repository
public class ContentManagerDAOImpl implements ContentManagerDAO{
	@Autowired
	private SqlSession sqlSession;

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
	

	
	@Override
	public int qnaboardTotalA() {
		return sqlSession.selectOne("contentSQL.qnaboardTotalA");
	}


	@Override
	public List<QnaboardDTO> qnaboardList(Map<String, String> map) {
		return sqlSession.selectList("contentSQL.qnaboardList", map);
	}

	@Override
	public int reviewboardTotalA() {
		return sqlSession.selectOne("contentSQL.reviewboardTotalA");
	}

	@Override
	public List<GoodsDTO> reviewboardList(Map<String, String> map) {
		return sqlSession.selectList("contentSQL.reviewboardList", map);
	}
	
	@Override
	public void qnaDelete(Map<String, String[]> map) {
		sqlSession.delete("contentSQL.qnaDelete", map);
	}

	@Override
	public void reviewDelete(Map<String, String[]> map) {
		sqlSession.delete("contentSQL.reviewDelete", map);
	}

	@Override
	public void noticeDelete(Map<String, String[]> map) {
		sqlSession.delete("contentSQL.noticeDelete", map);
	}

	@Override
	public QnaboardDTO qnaboardReplyForm(int qnaboardCode) {
		return sqlSession.selectOne("contentSQL.qnaboardReplyForm",qnaboardCode);
	}

	@Override
	public void qnaboardReply(Map<String, Object> map) {
		sqlSession.insert("contentSQL.qnaboardReply",map);
		
	}
	


}
