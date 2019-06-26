package user.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import user.bean.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//ȸ�����Խ� �ߺ����̵�üũ
	@Override
	public UserDTO checkId(String userId) {
		UserDTO userDTO = sqlSession.selectOne("userSQL.checkId", userId);
		return userDTO;
	}

	//ȸ�����Խ� �ߺ��̸���üũ
	@Override
	public UserDTO checkEmail(String userEmail) {
		UserDTO userDTO = sqlSession.selectOne("userSQL.checkEmail", userEmail);
		return userDTO;
	}
	
	//ȸ������
	@Override
	public void join(UserDTO userDTO) {
		sqlSession.insert("userSQL.join", userDTO);
	}

	//�α��� ���̵�/��й�ȣ üũ
	@Override
	public UserDTO login(Map<String, String> map) {
		return sqlSession.selectOne("userSQL.login", map);
	}

}
