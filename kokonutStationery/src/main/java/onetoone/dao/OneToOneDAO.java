package onetoone.dao;

import java.util.List;

import onetoone.bean.OneToOneDTO;

public interface OneToOneDAO {

	public void register(OneToOneDTO onetooneDTO);
	public List<OneToOneDTO> onetooneList(String userId);

}
