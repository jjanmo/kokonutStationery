package order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import goods.bean.GoodsDTO;
import order.bean.OrderDTO;
import order.bean.PostDTO;
import user.bean.UserDTO;


@Repository
@Transactional
public class OrderDAOImpl implements OrderDAO {
	
	@Autowired
	private SqlSession sqlSession; 

	//1종류의 제품 정보 가져오기 	
	@Override
	public GoodsDTO getProduct(int productCode) {
		return sqlSession.selectOne("orderSQL.getProduct",productCode);
	}
	
	//배송지 검색
	@Override
	public List<PostDTO> postSearch(Map<String, String> map) {
		return sqlSession.selectList("orderSQL.postSearch", map);
	}

	//배송정보 추가
	@Override
	public int updateUserInfo(UserDTO userDTO) {
		return sqlSession.update("orderSQL.updateUserInfo", userDTO);
	}

	//주문정보 추가 : 옵션 없는 경우
	@Override
	public int setOrderInfo(OrderDTO orderDTO) {
		return sqlSession.insert("orderSQL.setOrderInfo", orderDTO);
	}

	//주문정보 추가 : 옵션 있는 경우
	@Override
	public int setOrderInfoOption(OrderDTO orderDTO) {
		return sqlSession.insert("orderSQL.setOrderInfoOption", orderDTO);
	}
	
	//오더정보 가져오기
	@Override
	public List<OrderDTO> getOrderInfo(String userId) {
		return sqlSession.selectList("orderSQL.getOrderInfo", userId);
	}
}