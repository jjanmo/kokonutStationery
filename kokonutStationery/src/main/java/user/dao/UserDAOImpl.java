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

	//회원가입시 중복아이디체크
	@Override
	public UserDTO checkId(String userId) {
		UserDTO userDTO = sqlSession.selectOne("userSQL.checkId", userId);
		return userDTO;
	}

	//회원가입시 중복이메일체크
	@Override
	public UserDTO checkEmail(String userEmail) {
		UserDTO userDTO = sqlSession.selectOne("userSQL.checkEmail", userEmail);
		return userDTO;
	}

	//회원가입
	@Override
	public void join(UserDTO userDTO) {
		sqlSession.insert("userSQL.join", userDTO);
	}

	//로그인시 아이디/비밀번호 체크
	@Override
	public UserDTO login(Map<String, String> map) {
		return sqlSession.selectOne("userSQL.login", map);
	}

	@Override
	public UserDTO pwdSearch(Map<String, String> map) {
		UserDTO userDTO = sqlSession.selectOne("userSQL.pwdSearch",map);
		return userDTO;
	}
	
	//비밀번호변경
	@Override
	public void changePwd(Map<String, String> map) {
		sqlSession.update("userSQL.changePwd",map);
	}
	
	//아이디 찾기
	@Override
	public UserDTO idSearch(Map<String, String> map) {
		return sqlSession.selectOne("userSQL.idSearch", map);

	}

	@Override
	public void modify(Map<String,String> map) {
		sqlSession.update("userSQL.modify",map);
	}

	@Override
	public void memberDelete(Map<String, String> map) {
		sqlSession.delete("userSQL.memberDelete",map);
	}
	
	@Override
	public UserDTO getUserInfo(String userId) {
		return sqlSession.selectOne("userSQL.getUserInfo", userId);
	}

	@Override
	public void addWishListCount(String userId) {
		sqlSession.update("userSQL.addWishListCount", userId);	
	}

	@Override
	public void subWishListCount(String userId) {
		sqlSession.update("userSQL.subWishListCount", userId);	
	}
	
	@Override
	public int IncreaseKokonutSeq() {
		return sqlSession.selectOne("userSQL.IncreaseKokonutSeq");
	}
	
	@Override
	public void createKokonutId(int seq) {
		sqlSession.insert("userSQL.createKokonutId", seq);
	}

	@Override
	public UserDTO getKokonutId(int seq) {
		return sqlSession.selectOne("userSQL.getKokonutId", seq);
	}

	@Override
	public int kokonutIdCancel(String userId) {
		return sqlSession.delete("userSQL.kokonutIdCancel", userId);
	}

	@Override
	public void addCartCount(String userId) {
		sqlSession.update("userSQL.addCartCount", userId);	
	}

	@Override
	public void subCartCount(String userId) {
		sqlSession.update("userSQL.subCartCount", userId);	
	}

	@Override
	public void allDeleteCartCount(String userId) {
		sqlSession.update("userSQL.allDeleteCartCount", userId);
	}

	

}
