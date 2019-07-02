package usermanager.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import user.bean.UserDTO;

@Repository
public class UserManagerDAOImpl implements UserManagerDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<UserDTO> userList(Map<String, Object> map) {
		return sqlSession.selectList("userSQL.userList",map);
	}
	
	@Override
	public List<UserDTO> userSearch(Map<String, Object> map2) {
		return sqlSession.selectList("userSQL.userSearch",map2);
	}

	@Override
	public int getTotalA() {
		return sqlSession.selectOne("userSQL.getTotalA");
	}
	
	@Override
	public int getTotalAS(Map<String, Object> map2) {
		return sqlSession.selectOne("userSQL.getTotalAS",map2);
	}

	@Override
	public UserDTO userModifyView(String userId) {
		return sqlSession.selectOne("userSQL.userModifyView", userId);
	}

	@Override
	public void userModify(Map<String, Object> map) {
		sqlSession.update("userSQL.userModify", map); 
	}

	@Override
	public void userDelete(Map<String, String[]> map) {
		sqlSession.delete("userSQL.userDelete", map);
		
	}

	
}