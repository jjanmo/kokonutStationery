package goods.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import goods.bean.GoodsDTO;
import goods.bean.ProductOptionDTO;
import goods.bean.TotalProductOnSaleDTO;

@Transactional
@Repository
public class GoodsDAOImpl implements GoodsDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GoodsDTO> get_goods_list(Map<String, String> map) {
		List<GoodsDTO> list = null;
		if(map.get("sort").equals("name")) list = sqlSession.selectList("goodsSQL.get_goods_list_name", map);
		else if(map.get("sort").equals("price_desc")) list =  sqlSession.selectList("goodsSQL.get_goods_list_price_desc", map);
		else if(map.get("sort").equals("price_asc")) list = sqlSession.selectList("goodsSQL.get_goods_list_price_asc", map);
		else list = sqlSession.selectList("goodsSQL.get_goods_list", map);
		return list;
	}

	@Override
	public List<GoodsDTO> get_goods_list_newP() {
		return sqlSession.selectList("goodsSQL.get_goods_list_newP");
	}
	
	//상품 개수 가져오기
	@Override
	public List<TotalProductOnSaleDTO> get_count() {
		return sqlSession.selectList("goodsSQL.get_count");
	}

	//상품 상세페이지 정보 가져오기	
	@Override
	public GoodsDTO getGoodsView(int productCode) {
		return sqlSession.selectOne("goodsSQL.getGoodsView", productCode);
	}

	//상품 상세페이지에서 옵션 정보 가져오기
	@Override
	public List<ProductOptionDTO> getOption(int productCode) {
		return sqlSession.selectList("goodsSQL.getOption", productCode);
	}

	//깜짝세일페이지 - 기한 만료 시 discount 0 만들기
	@Override
	public void discountDelete(Map<String, String> map) {
		sqlSession.update("goodsSQL.discountDelete", map);	
	}
}
