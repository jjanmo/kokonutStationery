package onetoone.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import onetoone.bean.OneToOneDTO;
import order.bean.OrderDTO;
import order.bean.OrderlistDTO;

@Repository
public class OneToOneDAOImpl implements OneToOneDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//1:1문의 페이지 
	@Override
	public List<OneToOneDTO> getOnetooneList(String userId) {
		return sqlSession.selectList("onetooneSQL.getOnetooneList", userId);
	}
	
	//1:1문의 등록
	@Override
	public void register(OneToOneDTO onetooneDTO) {
		sqlSession.insert("onetooneSQL.register", onetooneDTO);	
	}
	
	//주문번호조회시 주문리스트 가져오기
	@Override
	public List<OrderlistDTO> getOrderList(Map<String, String> map) {
		return sqlSession.selectList("onetooneSQL.getOrderList", map);
	}
	
	//주문리스트 전체수 가져오기
	@Override
	public int getTotalA() {
		return sqlSession.selectOne("onetooneSQL.getTotalA");
	}

	//주문번호 조회시 상품이름 가져오기
	@Override
	public List<OrderDTO> getOrderProduct(String orderCode) {
		return sqlSession.selectList("onetooneSQL.getOrderProduct", orderCode);
	}

	//1:1문의 삭제
	@Override
	public int onetooneDelete(String onetooneCode) {
		return sqlSession.delete("onetooneSQL.onetooneDelete", onetooneCode);
	}

	//1:1문의 수정 : 수정할 정보 가져오기
	@Override
	public OneToOneDTO getOneToOneDTO(String onetooneCode) {
		return sqlSession.selectOne("onetooneSQL.getOneToOneDTO",onetooneCode);
	}
	
	//1:1문의 수정하기 
	@Override
	public void onetoone_modify(OneToOneDTO onetooneDTO) {
		sqlSession.update("onetooneSQL.onetoone_modify", onetooneDTO);
		
	}

	

}
