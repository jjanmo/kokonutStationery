package user.dao;

import java.util.List;
import java.util.Map;

import user.bean.UserDTO;

public interface UserDAO {

	public  UserDTO checkId(String userId);

	public UserDTO checkEmail(String userEmail);

	public void join(UserDTO userDTO);

	public UserDTO login(Map<String, String> map);

	public void changePwd(Map<String, String> map);

	public UserDTO pwdSearch(Map<String, String> map);

	public UserDTO idSearch(Map<String, String> map);

	public void modify(Map<String,String> map);

	public void memberDelete(Map<String, String> map);

	public UserDTO getUserInfo(String userId);


}
