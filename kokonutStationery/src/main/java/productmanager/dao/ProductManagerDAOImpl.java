package productmanager.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import goods.bean.GoodsDTO;
import goods.bean.ProductOptionDTO;

@Transactional
@Repository
public class ProductManagerDAOImpl implements ProductManagerDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int productCodeIncrease() {
		return sqlSession.selectOne("productSQL.productCodeIncrease");
	}

	@Override
	public void productOptionRegist(ProductOptionDTO productOptionDTO) {
		sqlSession.insert("productSQL.productOptionRegist", productOptionDTO);
	}

	@Override
	public int productRegist(GoodsDTO goodsDTO) {
		return sqlSession.insert("productSQL.productRegist", goodsDTO);
	}
	
	@Override
	public void totalProductOnSale(GoodsDTO goodsDTO) {
		sqlSession.update("productSQL.totalProductOnSale", goodsDTO);
	}	
	
	@Override
	public List<GoodsDTO> productList(Map<String, String> map) {
		return sqlSession.selectList("productSQL.productList", map);
	}
	
	@Override
	public List<GoodsDTO> productSearch(Map<String, String> map) {
		return sqlSession.selectList("productSQL.productSearch", map);
	}

	@Override
	public int getTotalA() {
		return sqlSession.selectOne("productSQL.getTotalA");
	}

	@Override
	public int getSearchTotalA(Map<String, String> map) {
		return sqlSession.selectOne("productSQL.getSearchTotalA", map);
	}

	@Override
	public GoodsDTO getModifyForm(int productCode) {
		return sqlSession.selectOne("productSQL.getModifyForm", productCode);
	}
	
	@Override
	public List<GoodsDTO> getProductList(Map<String, String[]> map) {
		return sqlSession.selectList("productSQL.getProductlist", map);
	}
	
	@Override
	public void updateTotalProductOnSale(Map<String, Integer> qtyMap) {
		sqlSession.delete("productSQL.updateTotalProductOnSale", qtyMap);
	}
	
	@Override
	public List<ProductOptionDTO> getProductOption(int productCode) {
		return sqlSession.selectList("productSQL.getProductOption", productCode);
	}
	
	@Override
	public int selectedOptionDelete(int optionCode) {
		return sqlSession.delete("productSQL.selectedOptionDelete", optionCode);
	}
	
	@Override
	public ProductOptionDTO getOptionCode(int optionCode) {
		return sqlSession.selectOne("productSQL.getOptionCode", optionCode);
	}
	
	@Override
	public void productOptionModify(ProductOptionDTO productOptionDTO) {
		sqlSession.update("productSQL.productOptionModify", productOptionDTO);	
	}
	
	@Override
	public void addProductOption(ProductOptionDTO productOptionDTO) {
		sqlSession.insert("productSQL.addProductOption", productOptionDTO);
	}
	
	@Override
	public GoodsDTO getCategories(int seq) {
		return sqlSession.selectOne("productSQL.getCategories", seq);
	}
	
	@Override
	public void reduceCategories(GoodsDTO categoriesDTO) {
		sqlSession.update("productSQL.reduceCategories", categoriesDTO);
	}
	
	@Override
	public void productModify(GoodsDTO goodsDTO) {
		sqlSession.update("productSQL.productModify", goodsDTO);
	}
	
	@Override
	public void productDelete(Map<String, String[]> map) {
		sqlSession.delete("productSQL.productDelete", map);
	}

	@Override
	public void productOptionDelete(Map<String, String[]> map) {
		sqlSession.delete("productSQL.productOptionDelete", map);
	}



		
}
