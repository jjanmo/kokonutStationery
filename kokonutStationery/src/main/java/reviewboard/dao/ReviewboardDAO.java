package reviewboard.dao;

import java.util.List;
import java.util.Map;

import reviewboard.bean.ReviewboardDTO;

public interface ReviewboardDAO {

	public List<ReviewboardDTO> getReviewList(Map<String, Integer> map);

	public void reviewboardWrite(ReviewboardDTO reviewboardDTO);

	public void reviewboardModify(ReviewboardDTO reviewboardDTO);

	public void reviewboardDelete(int reviewboardCode);

	public ReviewboardDTO getReviewboard(int reviewboardCode);

	public List<ReviewboardDTO> getAllReviewList(Map<String, Integer> map);

	public List<ReviewboardDTO> reviewboardAllSearch(Map<String, String> map);

	public List<ReviewboardDTO> reviewboardSearch(Map<String, String> map);

	public int getTotalAllR();
	
	public int getTotalR(int productCode);
	
	public int getTotalAllSearchR(String searchContent);
	
	public int getTotalSearchR(Map<String, String> map);

	public int getTotalMyR(String userId);

	public List<ReviewboardDTO> getMyReviewList(Map<String, String> map);

}
