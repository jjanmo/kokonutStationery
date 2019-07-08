package statisticsmanager.dao;

import java.util.List;
import java.util.Map;

import order.bean.OrderDTO;
import statisticsmanager.bean.StatisticsDTO;

public interface StatisticsManagerDAO {

	public List<OrderDTO> salesList(Map<String, String> map);

	public int getTotalA();

	public List<OrderDTO> salesSearchList(Map<String, String> map);

	public int getSearchTotalA(Map<String, String> map);

	public List<StatisticsDTO> dayStatisticsArray(String month);

	public List<StatisticsDTO> monthStatisticsArray();

}
