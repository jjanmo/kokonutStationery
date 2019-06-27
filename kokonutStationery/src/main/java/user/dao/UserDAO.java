package user.dao;

import java.util.Map;

import user.bean.UserDTO;

public interface UserDAO {

	public  UserDTO checkId(String userId);

	public UserDTO checkEmail(String userEmail);

	public void join(UserDTO userDTO);

	public UserDTO login(Map<String, String> map);

	public UserDTO checkFindId(Map<String, String> map);

}
