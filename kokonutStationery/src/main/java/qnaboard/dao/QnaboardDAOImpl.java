package qnaboard.dao;

import java.util.List;

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
	public List<QnaboardDTO> getQnaList(int productCode) {
		return sqlSession.selectList("qnaSQL.getQnaList",productCode);
	}

	@Override
	public void qnaboardWrite(QnaboardDTO qnaboardDTO) {
		sqlSession.insert("qnaSQL.qnaboardWrite",qnaboardDTO);
	}

}
