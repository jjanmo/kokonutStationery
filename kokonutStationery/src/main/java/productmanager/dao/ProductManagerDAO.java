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

	public GoodsDTO getModifyForm(int productCode);

	public List<GoodsDTO> getProductList(Map<String, String[]> map);
	
	public void updateTotalProductOnSale(Map<String, Integer> qtyMap);
	
	public List<ProductOptionDTO> getProductOption(int productCode);
	
	public ProductOptionDTO getOptionCode(int optionCode);
	
	public void productOptionModify(ProductOptionDTO productOptionDTO);
	
	public GoodsDTO getCategories(int seq);
	
	public void reduceCategories(GoodsDTO categoriesDTO);
	
	public void addProductOption(ProductOptionDTO productOptionDTO);
	
	public int selectedOptionDelete(int optionCode);
	
	public void productModify(GoodsDTO goodsDTO);
	
	public void productDelete(Map<String, String[]> map);

	public void productOptionDelete(Map<String, String[]> map);




	

	

	

}
