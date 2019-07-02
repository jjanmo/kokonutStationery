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
	public GoodsDTO getModifyForm(String productCode) {
		return sqlSession.selectOne("productSQL.getModifyForm", productCode);
	}

	@Override
	public void productDelete(Map<String, String[]> map) {
		sqlSession.delete("productSQL.productDelete", map);
	}

		
}
