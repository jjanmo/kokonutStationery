package user.dao;

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

	public void addWishListCount(String userId);

	public void subWishListCount(String userId);

	public int IncreaseKokonutSeq();
	
	public void createKokonutId(int seq);

	public UserDTO getKokonutId(int seq);

	public int kokonutIdCancel(String userId);

	


}
