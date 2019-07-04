package contentmanager.dao;

import java.util.List;
import java.util.Map;

import goods.bean.GoodsDTO;
import qnaboard.bean.QnaboardDTO;

public interface ContentManagerDAO {
	
	public int qnaboardTotalA();
	
	public List<QnaboardDTO> qnaboardList(Map<String, String> map);
	
	public int reviewboardTotalA();
	
	public List<GoodsDTO> reviewboardList(Map<String, String> map);

	public void qnaDelete(Map<String, String[]> map);

	public void reviewDelete(Map<String, String[]> map);

	




	

}
