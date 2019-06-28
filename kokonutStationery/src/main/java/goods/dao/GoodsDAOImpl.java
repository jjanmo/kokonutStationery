package goods.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import goods.bean.GoodsDTO;

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

	@Override
	public Map<String, String> get_count() {
		String stationery = sqlSession.selectOne("goodsSQL.get_count_stationery");
		String living = sqlSession.selectOne("goodsSQL.get_count_living");
		String travel = sqlSession.selectOne("goodsSQL.get_count_travel");
		String collabo = sqlSession.selectOne("goodsSQL.get_count_collabo");
		Map<String, String> map = new HashMap<String, String>();
		map.put("stationery", stationery);
		map.put("living", living);
		map.put("travel", travel);
		map.put("collabo", collabo);
		return map;
	}
}
