package contentmanager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import contentmanager.dao.ContentManagerDAO;
import goods.bean.GoodsDTO;

@Controller
public class ContentManagerController {
	@Autowired
	private ContentManagerDAO contentManagerDAO;

	//상품관리 - 리스트불러오기
	@RequestMapping(value="/admin/reviewboardList.do",method= RequestMethod.POST)
	@ResponseBody
	public ModelAndView reviewboardList() {
		List<GoodsDTO> list = contentManagerDAO.reviewboardList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

}


