package ordermanager.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import order.bean.OrderDTO;
import order.bean.OrderlistDTO;
import user.bean.UserDTO;

@Transactional
@Repository
public class OrderManagerImpl implements OrderManagerDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<OrderlistDTO> getOrderList(Map<String, String> map) {
		return sqlSession.selectList("orderManagerSQL.getOrderList", map);
	}
	
	@Override
	public int getTotalA() {
		return sqlSession.selectOne("orderManagerSQL.getTotalA");
	}
	
	@Override
	public List<OrderDTO> getOrderProduct(String orderCode) {
		return sqlSession.selectList("orderManagerSQL.getOrderProduct", orderCode);
	}
	
	//주문상세팝업창에 유저정도 가져오기
	@Override
	public UserDTO getUserInfo(String orderCode) {
		return sqlSession.selectOne("orderManagerSQL.getUserInfo", orderCode);
	}
	
	//주문상세팝업창에 order정보 가져오기
	@Override
	public List<OrderDTO> orderViewList(String orderCode) {
		return sqlSession.selectList("orderManagerSQL.orderViewList", orderCode);
	}
	
	//orderState 갱신
	@Override
	public int changeOrderState(Map<String, Object> map) {
		return sqlSession.update("orderManagerSQL.changeOrderState", map);
	}

	//orderlist 갱신	
	@Override
	public void changeOrderlistState(Map<String, Object> map) {
		sqlSession.update("orderManagerSQL.changeOrderlistState", map);
	}
	
	@Override
	public List<OrderlistDTO> orderSearchList(Map<String, String> map) {
		return sqlSession.selectList("orderManagerSQL.orderSearchList", map);
	}

	@Override
	public int getSearchTotalA(Map<String, String> map) {
		return sqlSession.selectOne("orderManagerSQL.getSearchTotalA", map);
	}
	
	@Override
	public void selectedOrderStateChange(Map<String, String[]> map) {
		sqlSession.update("orderManagerSQL.selectedOrderStateChange", map);
	}

	@Override
	public void selectedOrderDelete(Map<String, String[]> map) {
		sqlSession.delete("orderManagerSQL.selectedOrderDelete", map);
	}
	
	//주문취소폼(form)
	@Override
	public OrderlistDTO getOrderlistInCancelForm(String orderCode) {
		return sqlSession.selectOne("orderManagerSQL.getOrderlistInCancelForm", orderCode);
	}

	//주문취소 등록1 : orderlist수정하기
	@Override
	public void updateOrderlist(Map<String, String> map) {
		sqlSession.update("orderManagerSQL.updateOrderlist", map);
	}
	//주문취소 등록2 : order가져오기
	@Override
	public List<OrderDTO> getOrder(String orderCode) {
		return sqlSession.selectList("orderManagerSQL.getOrder",orderCode);
	}
	//주문취소 등록3 : order수정하기
	@Override
	public void updateOrder(Map<String, Object> uMap) {
		sqlSession.update("orderManagerSQL.updateOrder", uMap);
	}
	//주문취소 등록4 : user수정하기
	@Override
	public void updateTotalPaymentInUser(String orderCode) {
		sqlSession.update("orderManagerSQL.updateTotalPaymentInUser", orderCode);
	}
	
	//주문취소한 사람 찾기
	@Override
	public OrderlistDTO getWhoCancel(String orderCode) {
		return sqlSession.selectOne("orderManagerSQL.getWhoCancel", orderCode);
	}

	

	



	

	
}
