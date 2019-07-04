package contentmanager.dao;

import java.util.List;
import java.util.Map;

import goods.bean.GoodsDTO;
import noticeboard.bean.NoticeboardDTO;

public interface ContentManagerDAO {
	public List<GoodsDTO> reviewboardList();

	public List<NoticeboardDTO> noticeboardList();

	public NoticeboardDTO noticeboardModifyForm(int noticeboardCode);

	public void noticeboardModify(Map<String, String> map);

	public void noticeboardWrite(Map<String, String> map);

}
