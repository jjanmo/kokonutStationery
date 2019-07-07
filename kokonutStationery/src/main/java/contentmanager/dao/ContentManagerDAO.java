package contentmanager.dao;

import java.util.List;
import java.util.Map;

import goods.bean.GoodsDTO;
import noticeboard.bean.NoticeboardDTO;
import qnaboard.bean.QnaboardDTO;
import reviewboard.bean.ReviewboardDTO;

public interface ContentManagerDAO {

	public int qnaboardTotalA();
	
	public List<QnaboardDTO> qnaboardList(Map<String, String> map);
	
	public int reviewboardTotalA();
	
	public List<GoodsDTO> reviewboardList(Map<String, String> map);

	public void qnaDelete(Map<String, String[]> map);

	public void reviewDelete(Map<String, String[]> map);

	 List<NoticeboardDTO> noticeboardList();

	public NoticeboardDTO noticeboardModifyForm(int noticeboardCode);

	public void noticeboardModify(Map<String, String> map);

	public void noticeboardWrite(Map<String, String> map);

	public void noticeDelete(Map<String, String[]> map);

	public QnaboardDTO qnaboardReplyForm(int qnaboardCode);

	public void qnaboardReply(Map<String, Object> map);

	public List<NoticeboardDTO> noticeboardSearch(Map<String, Object> map2);

	public List<QnaboardDTO> qnaboardSearch(Map<String, Object> map2);

	public int qnaboardTotalAS(Map<String, Object> map2);

	public List<ReviewboardDTO> reviewboardSearch(Map<String, Object> map2);

	public int reviewboardTotalAS(Map<String, Object> map2);

}
