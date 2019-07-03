package noticeboard.dao;

import java.util.List;
import java.util.Map;

import noticeboard.bean.NoticeboardDTO;

public interface NoticeboardDAO {

	public List<NoticeboardDTO> getNoticeboardList();

	public List<NoticeboardDTO> noticeboardSearch(Map<String, String> map);

}
