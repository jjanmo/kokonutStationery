package statisticsmanager.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import statisticsmanager.bean.StatisticsDTO;
import statisticsmanager.bean.StatisticsPaging;
import statisticsmanager.dao.StatisticsManagerDAO;

@Controller
public class StatisticsManagerController {
	@Autowired
	private StatisticsManagerDAO statisticsManagerDAO;
	
	@Autowired
	private StatisticsPaging statisticsPaging;
	
	//상세 매출 폼
	@RequestMapping(value="/admin/salesSearchForm.do",method=RequestMethod.GET)
	public String salesSearchForm(@RequestParam(required=false, defaultValue="1") String pg, Model model) {
		model.addAttribute("pg", pg);
		return "/admin//statistics/salesSearchForm";
	}
	
	//상세 매출 폼에서 리스트 로딩
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
	
	//상세매출 검색 시에 선택리스트
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
		int totalA=0;
		if(map.get("dateText1")!="" && map.get("dateText2")!="") {
			System.out.println("날짜있음");
			dateText1 = Integer.parseInt(map.get("dateText1").substring(6,8));
			dateText2 = Integer.parseInt(map.get("dateText2").substring(6,8));
		
			//1일 부터 31일까지의 값인지 확인
			if(dateText1<=dateText2) {
				if((dateText1>=1 && dateText1<=31) && (dateText2>=1 && dateText2<=31)) {
					list = statisticsManagerDAO.salesSearchList(map);
					totalA = statisticsManagerDAO.getSearchTotalA(map);
				}
			}
		}else if(map.get("searchText")!=null) {
			System.out.println("?");
			list = statisticsManagerDAO.salesSearchList(map);
			totalA = statisticsManagerDAO.getSearchTotalA(map);
		}
		
		
		
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
	
	//통계 그래프에 필요한 하루치 배열
	@RequestMapping(value="/admin/dayStatisticsArray.do",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView dayStatisticsArray() {
		String sysDate = new SimpleDateFormat("yy/MM").format(new Date());
		String month = sysDate.split("/")[1];
		List<StatisticsDTO> dayList = statisticsManagerDAO.dayStatisticsArray(month);
		List<StatisticsDTO> monthList = statisticsManagerDAO.monthStatisticsArray();
		ModelAndView mav = new ModelAndView();
		mav.addObject("sysDate", sysDate);
		mav.addObject("dayList",dayList);
		mav.addObject("monthList",monthList);
		mav.setViewName("jsonView");
		return mav;
	}
}
