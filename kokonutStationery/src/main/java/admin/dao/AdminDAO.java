package admin.dao;

import admin.bean.AdminDTO;

public interface AdminDAO {

	public AdminDTO loginProcess(String id, String pwd);
	
}
