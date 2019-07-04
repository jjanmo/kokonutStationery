package goods.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import goods.bean.GoodsDTO;
import goods.bean.ProductOptionDTO;
import goods.bean.TotalProductOnSaleDTO;
import goods.dao.GoodsDAO;
import qnaboard.dao.QnaboardDAO;

@Controller
@RequestMapping("/goods/*")
public class GoodsController {
	@Autowired
	private GoodsDAO goodsDAO;
	@Autowired
	private QnaboardDAO qnaDAO;
	
	//카테고리 문구류 페이지
	@GetMapping("/category_stationery.do")
	public ModelAndView stationery(@RequestParam(required=false, defaultValue="productCode") String sort) {	
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", "stationery");
		map.put("sort", sort);
		List<GoodsDTO> list = goodsDAO.get_goods_list(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("display", "/goods/category_stationery.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//카테고리 리빙 페이지
	@GetMapping("/category_living.do")
	public ModelAndView living(@RequestParam(required=false, defaultValue="productCode") String sort) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", "living");
		map.put("sort", sort);
		List<GoodsDTO> list = goodsDAO.get_goods_list(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("display", "/goods/category_living.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//카테고리 여행 페이지
	@GetMapping("/category_travel.do")
	public ModelAndView travel(@RequestParam(required=false, defaultValue="productCode") String sort) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", "travel");
		map.put("sort", sort);
		List<GoodsDTO> list = goodsDAO.get_goods_list(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("display", "/goods/category_travel.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//카테고리 콜라보레이션 페이지
	@GetMapping("/category_collabo.do")
	public ModelAndView collabo(@RequestParam(required=false, defaultValue="productCode") String sort) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", "collabo");
		map.put("sort", sort);
		List<GoodsDTO> list = goodsDAO.get_goods_list(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("display", "/goods/category_collabo.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//깜짝세일 페이지
	@GetMapping("/category_discount.do")
	public ModelAndView discount() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", "discount");
		map.put("sort", "productCode");
		List<GoodsDTO> list = goodsDAO.get_goods_list(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("display", "/goods/category_discount.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//잘나가요 페이지
	@GetMapping("/category_best.do")
	public ModelAndView best() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", "best");
		map.put("sort", "productCode");
		List<GoodsDTO> list = goodsDAO.get_goods_list(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("display", "/goods/category_best.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//장바구니 페이지
	@GetMapping("/goods_cart.do")
	public ModelAndView cart() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/goods/goods_cart.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//카테고리 상품수 받아오기
	@GetMapping("/get_count.do")
	public ModelAndView get_count() {
		List<TotalProductOnSaleDTO> count = goodsDAO.get_count();
		ModelAndView mav = new ModelAndView();
		mav.addObject("count", count);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//상품상세 페이지
	@RequestMapping(value="/goods_view.do", method=RequestMethod.GET)
	public ModelAndView goodView(@RequestParam String productCode) {
		
		//상품한개받아오기
		GoodsDTO goodsDTO = goodsDAO.getGoodsView(Integer.parseInt(productCode));
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsDTO", goodsDTO);
		mav.addObject("display", "/goods/goods_view.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
		
	}
	
	//상세페이지에서 option가져오기
	@RequestMapping(value="/getOption.do", method=RequestMethod.GET)
	public ModelAndView getOption(@RequestParam String productCode) {
		
		List<ProductOptionDTO> list = goodsDAO.getOption(Integer.parseInt(productCode));
		//System.out.println(list.size());
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	

}
