package productmanager.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import goods.bean.GoodsDTO;
import goods.bean.ProductPaging;
import productmanager.dao.ProductManagerDAO;


@Controller
public class ProductManagerController {
	@Autowired
	private ProductManagerDAO productManagerDAO;
	
	@Autowired
	private ProductPaging productPaging;
	
	@RequestMapping(value="/admin/productRegistForm.do",method=RequestMethod.GET)
	public String productRegist() {
		return "/admin/product/productRegistForm";
	}

	@RequestMapping(value="/admin/productList.do",method= RequestMethod.GET)
	public String productList(@RequestParam(required=false, defaultValue="1") String pg,
									Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/admin/product/productList.jsp");
		return "/admin/index";
	}
	
	
	@RequestMapping(value="/admin/getProductList.do",method= RequestMethod.POST)
	@ResponseBody
	public ModelAndView getProductList(@RequestParam(required=false, defaultValue="1") String pg,
									HttpSession session) {
		
		String adId = (String) session.getAttribute("adId");
		
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<GoodsDTO> list = productManagerDAO.productList(map);
		
		int totalA = productManagerDAO.getTotalA();
		
		productPaging.setCurrentPage(Integer.parseInt(pg));
		productPaging.setPageBlock(3);
		productPaging.setPageSize(10);
		productPaging.setTotalA(totalA);
		productPaging.makePagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("productPaging", productPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	@RequestMapping(value="/admin/productSearch.do",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView productSearch(@RequestParam(required=false) Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg"))*10;
		int startNum = endNum-9;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<GoodsDTO> list = productManagerDAO.productSearch(map);
		
		int totalA = productManagerDAO.getSearchTotalA(map);
		
		productPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		productPaging.setPageBlock(3);
		productPaging.setPageSize(10);
		productPaging.setTotalA(totalA);
		productPaging.makeSearchPagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", map.get("pg"));
		mav.addObject("list", list);
		mav.addObject("productPaging", productPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	

	@RequestMapping(value="/admin/productModifyForm.do",method= RequestMethod.GET)
	public String productModifyForm(@RequestParam String productCode, Model model) {
		GoodsDTO goodsDTO = productManagerDAO.getModifyForm(productCode);
		model.addAttribute("goodsDTO", goodsDTO);
		return "/admin/product/productModifyForm";
	}
	
	//상품 삭제
	@RequestMapping(value="/admin/productDelete.do",method= RequestMethod.POST)
	public String productDelete(@RequestParam String[] check) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("array", check);
		productManagerDAO.productDelete(map);
		return "redirect:/admin/productList.do";
	}
	
	
	
	
}


