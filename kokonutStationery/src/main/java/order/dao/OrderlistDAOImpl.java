package order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import order.bean.OrderlistDTO;

@Repository
@Transactional
public class OrderlistDAOImpl implements OrderlistDAO {
	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public List<OrderlistDTO> mypage_orderlist(Map<String, String> map) {
		return sqlSession.selectList("orderlistSQL.mypage_orderlist", map);
	}

	@Override
	public int getTotalAS(Map<String, String> map) {
		return sqlSession.selectOne("orderlistSQL.getTotalAS", map);
	}

	@Override
	public void orderCancel(Map<String,String> map) {
		sqlSession.update("orderlistSQL.orderCancel",map);	
	}

	/*
	 * @Override public void orderChange(String orderCode) {
	 * sqlSession.update("orderlistSQL.orderChange",orderCode); }
	 */

	@Override
	public void orderRefund(String orderCode, String erReason, String erDetail, String erTotalCost, 
			String erCostStr,String productCodeStr, String optionContentStr, String changeRefundQtyStr) {
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("orderCode", orderCode);
		map.put("erReason", erReason);
		map.put("erDetail", erDetail);
		map.put("erTotalCost", erTotalCost);
		map.put("erCostStr", erCostStr);
		map.put("productCodeStr", productCodeStr);
		map.put("optionContentStr", optionContentStr);
		map.put("changeRefundQtyStr", changeRefundQtyStr);
		
		sqlSession.update("orderlistSQL.orderRefund",map);
		
	}
	
	@Override
	public void orderRefundNoOption(String orderCode, String erReason, String erDetail, String erTotalCost,
			String erCostStr, String productCodeStr, String changeRefundQtyStr) {
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("orderCode", orderCode);
		map.put("erReason", erReason);
		map.put("erDetail", erDetail);
		map.put("erTotalCost", erTotalCost);
		map.put("erCostStr", erCostStr);
		map.put("productCodeStr", productCodeStr);
		map.put("changeRefundQtyStr", changeRefundQtyStr);
		
		sqlSession.update("orderlistSQL.orderRefundNoOption",map);
	} 
	
	@Override
	public void orderReceipt(Map<String, String> map) {
		sqlSession.update("orderlistSQL.orderReceipt",map);	
	}

	@Override
	public void orderExchange(String orderCode, String erReason, String erDetail, 
			String productCodeStr, String optionContentStr,	String changeRefundQtyStr) {
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("orderCode", orderCode);
		map.put("erReason", erReason);
		map.put("erDetail", erDetail);
		map.put("productCodeStr", productCodeStr);
		map.put("optionContentStr", optionContentStr);
		map.put("changeRefundQtyStr", changeRefundQtyStr);
		
		sqlSession.update("orderlistSQL.orderExchange",map);
	}

	@Override
	public void orderExchangeNoOption(String orderCode, String erReason, String erDetail, 
			String productCodeStr,	String changeRefundQtyStr) {
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("orderCode", orderCode);
		map.put("erReason", erReason);
		map.put("erDetail", erDetail);
		map.put("productCodeStr", productCodeStr);
		map.put("changeRefundQtyStr", changeRefundQtyStr);
		
		sqlSession.update("orderlistSQL.orderExchangeNoOption",map);
	}

		
	
}
