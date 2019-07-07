package statisticsmanager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import goods.bean.GoodsDTO;
import order.bean.OrderDTO;
import statisticsmanager.bean.StatisticsPaging;
import statisticsmanager.dao.StatisticsManagerDAO;

@Controller
public class StatisticsManagerController {
	@Autowired
	private StatisticsManagerDAO statisticsManagerDAO;
	
	@Autowired
	private StatisticsPaging statisticsPaging;
	
	@RequestMapping(value="/admin/salesSearchForm.do",method=RequestMethod.GET)
	public String salesSearchForm(@RequestParam(required=false, defaultValue="1") String pg, Model model) {
		model.addAttribute("pg", pg);
		return "/admin//statistics/salesSearchForm";
	}

	@RequestMapping(value="/admin/salesList.do",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView salesList(@RequestParam(required=false, defaultValue="1") String pg) {
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<OrderDTO> list = statisticsManagerDAO.salesList(map);
		
		int totalA = statisticsManagerDAO.getTotalA();
		
		statisticsPaging.setCurrentPage(Integer.parseInt(pg));
		statisticsPaging.setPageBlock(3);
		statisticsPaging.setPageSize(10);
		statisticsPaging.setTotalA(totalA);
		statisticsPaging.makePagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("statisticsPaging", statisticsPaging);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="/admin/salesSearchList.do",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView salesSearchList(@RequestParam Map<String,String> map) {
		int endNum = Integer.parseInt(map.get("pg"))*10;
		int startNum = endNum-9;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		int dateText1 = 0;
		int dateText2 = 0;
		List<OrderDTO> list = null;
		//기간이 적혀있을 때
		if(map.get("dataText1")!=null && map.get("dataText2")!=null) {
			dateText1 = Integer.parseInt(map.get("dateText1").substring(6,8));
			dateText2 = Integer.parseInt(map.get("dateText2").substring(6,8));
			//1일 부터 31일까지의 값인지 확인
			if(dateText1<=dateText2) {
				if((dateText1>=1 && dateText1<=31) && (dateText2>=1 && dateText2<=31)) {
					list = statisticsManagerDAO.salesSearchList(map);
				}
			}
		}else if(map.get("searchText")!=null) {
			list = statisticsManagerDAO.salesSearchList(map);
		}
		
		int totalA = statisticsManagerDAO.getSearchTotalA(map);
		
		statisticsPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		statisticsPaging.setPageBlock(3);
		statisticsPaging.setPageSize(10);
		statisticsPaging.setTotalA(totalA);
		statisticsPaging.makeSearchPagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", map.get("pg"));
		mav.addObject("list", list);
		mav.addObject("statisticsPaging", statisticsPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
}
