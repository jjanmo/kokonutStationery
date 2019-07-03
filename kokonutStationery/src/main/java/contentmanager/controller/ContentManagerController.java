package contentmanager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import contentmanager.bean.ReviewboardPaging;
import contentmanager.dao.ContentManagerDAO;
import goods.bean.GoodsDTO;

@Controller
public class ContentManagerController {
	@Autowired
	private ContentManagerDAO contentManagerDAO;
	
	@Autowired
	private ReviewboardPaging reviewboardPaging;

	//상품관리 - 리스트불러오기
	@RequestMapping(value="/admin/reviewboardList.do",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView reviewboardList(@RequestParam(required=false, defaultValue="1") String pg) {
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<GoodsDTO> list = contentManagerDAO.reviewboardList(map);
		
		int totalA = contentManagerDAO.reviewboardTotalA();
		
		reviewboardPaging.setCurrentPage(Integer.parseInt(pg));
		reviewboardPaging.setPageBlock(3);
		reviewboardPaging.setPageSize(5);
		reviewboardPaging.setTotalA(totalA);
		reviewboardPaging.makePagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("reviewboardPaging", reviewboardPaging);
		mav.setViewName("jsonView");
		return mav;
	}

}


