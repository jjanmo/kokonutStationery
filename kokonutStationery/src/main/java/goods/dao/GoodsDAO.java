package goods.dao;

import java.util.List;
import java.util.Map;

import goods.bean.GoodsDTO;
import goods.bean.ProductOptionDTO;
import goods.bean.TotalProductOnSaleDTO;

public interface GoodsDAO {
	public List<GoodsDTO> get_goods_list(Map<String, String> map);
	public List<GoodsDTO> get_goods_list_newP();
	public List<TotalProductOnSaleDTO> get_count();
	public GoodsDTO getGoodsView(int productCode);
	public List<ProductOptionDTO> getOption(int productCode);
}
