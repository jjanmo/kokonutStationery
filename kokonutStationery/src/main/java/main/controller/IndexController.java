package main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import goods.bean.GoodsDTO;
import goods.dao.GoodsDAO;

@Controller
public class IndexController {
	@Autowired
	private GoodsDAO goodsDAO;
	
	@RequestMapping(value="/main/index.do", method=RequestMethod.GET)
	public ModelAndView index() {
		List<GoodsDTO> list = goodsDAO.get_goods_list_newP();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("display", "/main/main_goods.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
}

