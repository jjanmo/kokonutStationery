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
import reviewboard.bean.ReviewboardDTO;

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

	//게시물 관리 검색 - 공지사항
	@Override
	public List<NoticeboardDTO> noticeboardSearch(Map<String, Object> map2) {
		return sqlSession.selectList("contentSQL.noticeboardSearch", map2);
	}

	@Override
	public List<QnaboardDTO> qnaboardSearch(Map<String, Object> map2) {
		return sqlSession.selectList("contentSQL.qnaboardSearch",map2);
	}

	@Override
	public int qnaboardTotalAS(Map<String, Object> map2) {
		return sqlSession.selectOne("contentSQL.qnaboardTotalAS",map2);
	}

	@Override
	public List<ReviewboardDTO> reviewboardSearch(Map<String, Object> map2) {
		return sqlSession.selectList("contentSQL.reviewboardSearch",map2);
	}

	@Override
	public int reviewboardTotalAS(Map<String, Object> map2) {
		return sqlSession.selectOne("contentSQL.reviewboardTotalAS",map2);
	}


}
