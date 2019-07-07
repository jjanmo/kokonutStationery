package point.dao;

import java.util.List;

import point.bean.PointDTO;

public interface PointDAO {
	public List<PointDTO> getPointList(String userId);

}
