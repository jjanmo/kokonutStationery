package goods.dao;

import java.util.List;
import java.util.Map;

import goods.bean.GoodsDTO;

public interface GoodsDAO {
	List<GoodsDTO> get_goods_list(Map<String, String> map);
	List<GoodsDTO> get_goods_list_newP();
	Map<String, String> get_count();
}
