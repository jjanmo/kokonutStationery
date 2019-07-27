package onetoone.dao;

import java.util.List;
import java.util.Map;

import onetoone.bean.OneToOneDTO;
import order.bean.OrderDTO;
import order.bean.OrderlistDTO;

public interface OneToOneDAO {

	public void register(OneToOneDTO onetooneDTO);
	
	public List<OneToOneDTO> getOnetooneList(String userId);
	
	public List<OrderlistDTO> getOrderList(Map<String, String> map);

	public int getTotalA();

	public List<OrderDTO> getOrderProduct(String orderCode);

	public int onetooneDelete(String onetooneCode);

	public OneToOneDTO getOneToOneDTO(String onetooneCode);

	public void onetoone_modify(OneToOneDTO onetooneDTO);

}
