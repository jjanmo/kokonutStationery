package reviewboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import reviewboard.bean.ReviewboardDTO;

@Transactional
@Repository
public class ReviewboardDAOImpl implements ReviewboardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ReviewboardDTO> getReviewList(Map<String, Integer> map) {
		return sqlSession.selectList("reviewSQL.getReviewList",map);
	}

	@Override
	public void reviewboardWrite(ReviewboardDTO reviewboardDTO) {
		sqlSession.insert("reviewSQL.reviewboardWrite",reviewboardDTO);
	}

	@Override
	public void reviewboardModify(ReviewboardDTO reviewboardDTO) {
		sqlSession.update("reviewSQL.reviewboardModify",reviewboardDTO);
	}

	@Override
	public void reviewboardDelete(int reviewboardCode) {
		sqlSession.delete("reviewSQL.reviewboardDelete",reviewboardCode);
	}

	@Override
	public ReviewboardDTO getReviewboard(int reviewboardCode) {
		return sqlSession.selectOne("reviewSQL.getReviewboard",reviewboardCode);
	}

	@Override
	public List<ReviewboardDTO> getAllReviewList(Map<String, Integer> map) {
		return sqlSession.selectList("reviewSQL.getAllReviewList",map);
	}

	@Override
	public List<ReviewboardDTO> reviewboardAllSearch(Map<String, String> map) {
		return sqlSession.selectList("reviewSQL.reviewboardAllSearch",map);
	}
	
	@Override
	public List<ReviewboardDTO> reviewboardSearch(Map<String, String> map) {
		return sqlSession.selectList("reviewSQL.reviewboardSearch",map);
	}
	
	@Override
	public int getTotalR(int productCode) {
		return sqlSession.selectOne("reviewSQL.getTotalR",productCode);
	}

	@Override
	public int getTotalAllSearchR(String searchContent) {
		return sqlSession.selectOne("reviewSQL.getTotalAllSearchR",searchContent);
	}

	@Override
	public int getTotalSearchR(Map<String, String> map) {
		return sqlSession.selectOne("reviewSQL.getTotalSearchR",map);
	}

	@Override
	public int getTotalAllR() {
		return sqlSession.selectOne("reviewSQL.getTotalAllR");
	}

	@Override
	public int getTotalMyR(String userId) {
		return sqlSession.selectOne("reviewSQL.getTotalMyR",userId);
	}

	@Override
	public List<ReviewboardDTO> getMyReviewList(Map<String, String> map) {
		return sqlSession.selectList("reviewSQL.getMyReviewList",map);
	}
	
}
