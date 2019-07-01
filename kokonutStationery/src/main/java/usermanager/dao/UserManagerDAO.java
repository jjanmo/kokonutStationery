package usermanager.dao;

import java.util.List;
import java.util.Map;

import user.bean.UserDTO;

public interface UserManagerDAO {

	public List<UserDTO> userSearch(Map<String, Object> map2);

	public int getTotalAS(Map<String, Object> map2);

	public List<UserDTO> userList(Map<String, Object> map);

	public int getTotalA();

	public UserDTO userModifyView(String userId);

	public void userModify(Map<String, Object> map);

	public void userDelete(Map<String, String[]> map);

}
