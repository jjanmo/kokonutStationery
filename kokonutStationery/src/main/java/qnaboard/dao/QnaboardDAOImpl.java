package qnaboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import qnaboard.bean.QnaboardDTO;

@Transactional
@Repository
public class QnaboardDAOImpl implements QnaboardDAO {
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public void qnaboardWrite(QnaboardDTO qnaboardDTO) {
		sqlSession.insert("qnaSQL.qnaboardWrite",qnaboardDTO);
	}
	
	@Override
	public int getTotalQ(int productCode) {
		return sqlSession.selectOne("qnaSQL.getTotalQ",productCode);
	}
	
	@Override
	public List<QnaboardDTO> getQnaList(Map<String,Integer> map) {
		return sqlSession.selectList("qnaSQL.getQnaList",map);
	}
	@Override
	public int getTotalAllQ() {
		return sqlSession.selectOne("qnaSQL.getTotalAllQ");
	}
	@Override
	public List<QnaboardDTO> getAllQnaList(Map<String, Integer> map) {		
		return sqlSession.selectList("qnaSQL.getAllQnaList",map);
	}
	@Override
	public List<QnaboardDTO> qnaboardSearch(Map<String, String> map) {
		return sqlSession.selectList("qnaSQL.qnaboardSearch",map);
	}

	@Override
	public List<QnaboardDTO> qnaboardAllSearch(Map<String,String> map) {
		return sqlSession.selectList("qnaSQL.qnaboardAllSearch",map);
	}

	@Override
	public int getTotalSearchQ(Map<String, String> map) {
		return sqlSession.selectOne("qnaSQL.getTotalSearchQ",map);
	}

	@Override
	public int getTotalAllSearchQ(String searchContent) {
		return sqlSession.selectOne("qnaSQL.getTotalAllSearchQ",searchContent);
	}

	@Override
	public void qnaboardModify(QnaboardDTO qnaboardDTO) {
		sqlSession.update("qnaSQL.qnaboardModify",qnaboardDTO);
	}

	@Override
	public QnaboardDTO getQnaboard(int qnaboardCode) {
		return sqlSession.selectOne("qnaSQL.getQnaboard",qnaboardCode);
	}

	@Override
	public void qnaboardDelete(int qnaboardCode) {
		sqlSession.delete("qnaSQL.qnaboardDelete",qnaboardCode);
	}

	@Override
	public List<QnaboardDTO> getMyQnaList(Map<String, String> map) {
		return sqlSession.selectList("qnaSQL.getMyQnaList",map);
	}

	@Override
	public int getTotalMyQ(String userId) {
		return sqlSession.selectOne("qnaSQL.getTotalMyQ",userId);
	}
	

	

}
