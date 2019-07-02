package productmanager.dao;

import java.util.List;
import java.util.Map;

import goods.bean.GoodsDTO;
import goods.bean.ProductOptionDTO;




public interface ProductManagerDAO {
	
	public int productCodeIncrease();
	
	public void productOptionRegist(ProductOptionDTO productOptionDTO);

	public int productRegist(GoodsDTO goodsDTO);
	
	public void totalProductOnSale(GoodsDTO goodsDTO);
	
	public List<GoodsDTO> productList(Map<String, String> map);
	
	public List<GoodsDTO> productSearch(Map<String, String> map);

	public int getTotalA();

	public int getSearchTotalA(Map<String, String> map);

	public GoodsDTO getModifyForm(String productCode);

	public void productDelete(Map<String, String[]> map);

	

	

	

}
