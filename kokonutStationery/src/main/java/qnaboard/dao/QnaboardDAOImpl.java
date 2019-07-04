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
	public List<QnaboardDTO> getAllQnaList() {		
		return sqlSession.selectList("qnaSQL.getAllQnaList");
	}
	@Override
	public List<QnaboardDTO> getQnaList(Map<String,Integer> map) {
		return sqlSession.selectList("qnaSQL.getQnaList",map);
	}

	@Override
	public void qnaboardWrite(QnaboardDTO qnaboardDTO) {
		sqlSession.insert("qnaSQL.qnaboardWrite",qnaboardDTO);
	}
	@Override
	public int getTotalQ(int productCode) {
		return sqlSession.selectOne("qnaSQL.getTotalQ",productCode);
	}
	@Override
	public List<QnaboardDTO> qnaboardSearch(Map<String, String> map) {
		return sqlSession.selectList("qnaSQL.qnaboardSearch",map);
	}

	

}
