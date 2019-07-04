package qnaboard.dao;

import java.util.List;
import java.util.Map;

import qnaboard.bean.QnaboardDTO;

public interface QnaboardDAO {

	public List<QnaboardDTO> getQnaList(Map<String,Integer> map);

	public void qnaboardWrite(QnaboardDTO qnaboardDTO);

	public List<QnaboardDTO> getAllQnaList(Map<String, Integer> map);

	public int getTotalQ(int productCode);

	public List<QnaboardDTO> qnaboardSearch(Map<String, String> map);

	public int getTotalAllQ();

	public List<QnaboardDTO> qnaboardAllSearch(Map<String, String> map);

	public int getTotalSearchQ(Map<String, String> map);

	public int getTotalAllSearchQ(String searchContent);

}
