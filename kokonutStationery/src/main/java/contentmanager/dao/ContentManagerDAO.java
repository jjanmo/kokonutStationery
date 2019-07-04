package contentmanager.dao;

import java.util.List;
import java.util.Map;

import goods.bean.GoodsDTO;

public interface ContentManagerDAO {
	public int reviewboardTotalA();
	
	public List<GoodsDTO> reviewboardList(Map<String, String> map);

	public void reviewDelete(Map<String, String[]> map);

	

}
