package productmanager.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import goods.bean.GoodsDTO;
import goods.bean.ProductPaging;
import goods.bean.ProductOptionDTO;
import productmanager.dao.ProductManagerDAO;


@Controller
public class ProductManagerController {
	@Autowired
	private ProductManagerDAO productManagerDAO;
	
	@Autowired
	private ProductPaging productPaging;
	
	//상품등록폼
	@RequestMapping(value="/admin/productRegistForm.do",method=RequestMethod.GET)
	public String productRegist() {
		return "/admin/product/productRegistForm";
	}
	
	@RequestMapping(value="/admin/productRegist.do", method=RequestMethod.POST)
	public String productRegist(@ModelAttribute GoodsDTO goodsDTO
			, @RequestParam MultipartFile thumbFile, @RequestParam MultipartFile detailedFile) {
		
		System.out.println("상품등록프로세스실행");		
		//상품코드 1증가
		int seq = productManagerDAO.productCodeIncrease();		
		System.out.println(seq);
		
		//파일경로설정 - 옮겨받으시면 경로수정 꼭 해주세용

		String thumbImgPath = "C:\\Users\\hjlee\\git\\kokonutStationery2\\kokonutStationery\\src\\main\\webapp\\image\\thumb"; 
		String detailedImgPath = "C:\\Users\\hjlee\\git\\kokonutStationery2\\kokonutStationery\\src\\main\\webapp\\image\\detailed";

		//파일 이름 지정
		String thumbImgName = seq+".jpg";
		String detailedImgName = seq+"d.jpg";
		
		//파일 생성 
		File thumbImgFile = new	File(thumbImgPath, thumbImgName); 
		File detailedImgFile = new File(detailedImgPath, detailedImgName);
		 
		try { 
			FileCopyUtils.copy(thumbFile.getInputStream(), new FileOutputStream(thumbImgFile));
			FileCopyUtils.copy(detailedFile.getInputStream(), new FileOutputStream(detailedImgFile));
		} catch (IOException e)	{ 
			// TODO Auto-generated catch block e.printStackTrace(); }
		}
		//파일이름부여
		goodsDTO.setThumbImg(thumbImgName);
		goodsDTO.setDetailedImg(detailedImgName);
		
		//깜짝세일이 아닐때 originPrice==discountPrice
		if(goodsDTO.getDiscount()!=1||goodsDTO.getDiscountPrice()==0) {
			goodsDTO.setDiscountPrice(goodsDTO.getOriginalPrice());
		}
		
		//옵션이 있음일때
		if(goodsDTO.getProductOption()==1) {
			int totalQty = 0; // 옵션 갯수 총합용
			
			//옵션 설정
			for(int i=0; i<goodsDTO.getOptionContent().length; i++) {
				ProductOptionDTO productOptionDTO = new ProductOptionDTO();
				productOptionDTO.setOptionContent(goodsDTO.getOptionContent()[i]);
				productOptionDTO.setSubTotalQty(goodsDTO.getSubTotalQty()[i]);
				System.out.println(productOptionDTO.getOptionContent()+"///"+productOptionDTO.getSubTotalQty());
			
				//옵션 DB
				productManagerDAO.productOptionRegist(productOptionDTO);
				
				totalQty += goodsDTO.getSubTotalQty()[i];
				
			}
			System.out.println(totalQty);
			goodsDTO.setTotalQty(totalQty);
		}
		//상품등록 본체 db
		int su = productManagerDAO.productRegist(goodsDTO);
		
		//카테고리별 상품갯수 파악용 테이블에 등록
		productManagerDAO.totalProductOnSale(goodsDTO);
		
		if(su==1) 			
			return "/admin/product/productRegistOk";
		else
			return "/admin//product/productRegistFail";
	}
	
	//상품관리 리스트 페이지
	@RequestMapping(value="/admin/productList.do",method= RequestMethod.GET)
	public String productList(@RequestParam(required=false, defaultValue="1") String pg,
									Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/admin/product/productList.jsp");
		return "/admin/index";
	}
	
	//상품관리 - 리스트불러오기
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
	
	//상품관리 - 검색
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
	public String productModifyForm(@RequestParam int productCode, Model model) {
		GoodsDTO goodsDTO = productManagerDAO.getModifyForm(productCode);
		model.addAttribute("goodsDTO", goodsDTO);
		return "/admin/product/productModifyForm";
	}
	
	@RequestMapping(value="/admin/getProductOption.do", method=RequestMethod.POST)
	public ModelAndView getProductOption(@RequestParam int productCode) {
		List<ProductOptionDTO> list = productManagerDAO.getProductOption(productCode);
		//System.out.println(list);
		
		ModelAndView mav = new ModelAndView();	
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/admin/selectedOptionDelete.do", method=RequestMethod.POST)
	@ResponseBody
	public int selectedOptionDelete(@RequestParam int optionCode) {
		int su = productManagerDAO.selectedOptionDelete(optionCode);
		return su;
	}
	
	@RequestMapping(value="/admin/productModify.do", method=RequestMethod.POST)
	public String productModify(@ModelAttribute GoodsDTO goodsDTO
			, @RequestParam MultipartFile thumbFile, @RequestParam MultipartFile detailedFile) {
		//System.out.println(goodsDTO);
		//System.out.println("상품수정프로세스 실행");		
		
		//이미지파일이 삽입여부
		int seq = goodsDTO.getProductCode();
		
		if(thumbFile.isEmpty()==false) {//썸네일 있을때 이미지 수정
			String thumbImgName = seq+".jpg";
			String thumbImgPath = "C:\\Users\\Jun\\git\\kokonutStationery\\kokonutStationery\\src\\main\\webapp\\image\\thumb";
			File thumbImgFile = new	File(thumbImgPath, thumbImgName); 
			try {
				FileCopyUtils.copy(thumbFile.getInputStream(), new FileOutputStream(thumbImgFile));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			goodsDTO.setThumbImg(thumbImgName);
		}
		
		if(detailedFile.isEmpty()==false) {//상세이미지 있을때 이미지 수정
			String detailedImgName = seq+"d.jpg";
			String detailedImgPath = "C:\\Users\\Jun\\git\\kokonutStationery\\kokonutStationery\\src\\main\\webapp\\image\\detailed";
			File detailedImgFile = new File(detailedImgPath, detailedImgName);
			try {
				FileCopyUtils.copy(detailedFile.getInputStream(), new FileOutputStream(detailedImgFile));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			goodsDTO.setDetailedImg(detailedImgName);
		}
		
		//옵션 여부
		if(goodsDTO.getProductOption()==1) {
			int addSubQty = 0;
			int addOptionQty = 0;
			
			//옵션 재고추가
			if(goodsDTO.getOptionContent()!=null) {
				for(int i=0; i<goodsDTO.getOptionContent().length; i++) {
					int optionCode = goodsDTO.getOptionCode()[i];
					ProductOptionDTO productOptionDTO = productManagerDAO.getOptionCode(optionCode);
					//System.out.println(productOptionDTO);
					productOptionDTO.setOptionContent(goodsDTO.getOptionContent()[i]);
					productOptionDTO.setSubTotalQty(productOptionDTO.getSubTotalQty()+goodsDTO.getAddSubQty()[i]);
					productOptionDTO.setSubStockQty(productOptionDTO.getSubStockQty()+goodsDTO.getAddSubQty()[i]);
					//System.out.println(productOptionDTO);
					
					//옵션 수정 DB
					productManagerDAO.productOptionModify(productOptionDTO);
					
					addSubQty += goodsDTO.getAddSubQty()[i];
					//System.out.println("옵션 재고추가 :"+addSubQty);
				}
			}
			//새 옵션 추가
			if(goodsDTO.getAddOptionContent()!=null) {
				for(int i=0; i<goodsDTO.getAddOptionContent().length; i++) {
					ProductOptionDTO productOptionDTO = new ProductOptionDTO();
					productOptionDTO.setProductCode(seq);
					productOptionDTO.setOptionContent(goodsDTO.getAddOptionContent()[i]);
					productOptionDTO.setSubTotalQty(goodsDTO.getAddSubTotalQty()[i]);
					System.out.println(productOptionDTO.getOptionContent()+"///"+productOptionDTO.getSubTotalQty());
					
					//새 옵션 추가 DB
					productManagerDAO.addProductOption(productOptionDTO);
					
					addOptionQty += goodsDTO.getAddSubTotalQty()[i];
					//System.out.println("새 옵션 추가 :"+addOptionQty);
				}
			}
			//추가 재고 총합
			int addQty = addSubQty + addOptionQty;
			//System.out.println("총 추가 재고 : "+addQty);
			goodsDTO.setAddQty(addQty);
		}
		
		//재고추가기능
		goodsDTO.setStockQty(goodsDTO.getStockQty()+goodsDTO.getAddQty());
		goodsDTO.setTotalQty(goodsDTO.getTotalQty()+goodsDTO.getAddQty());
		
		
		
		//깜짝세일이 아닐때 originPrice==discountPrice
		if(goodsDTO.getDiscount()!=1||goodsDTO.getDiscountPrice()==0) {
			goodsDTO.setDiscountPrice(goodsDTO.getOriginalPrice());
		}
		
		//카테고리 값 가져오기
		GoodsDTO categoriesDTO = productManagerDAO.getCategories(seq);
		//카테고리 기존값 빼기
		productManagerDAO.reduceCategories(categoriesDTO);
		//카테고리 수정값 더하기
		productManagerDAO.totalProductOnSale(goodsDTO);
		
		//상품 수정 DB
		productManagerDAO.productModify(goodsDTO);
		
		return "/admin/product/productModifyResult";
	}
	
	@RequestMapping(value="/admin/productDelete.do",method= RequestMethod.POST)
	public String productDelete(@RequestParam String[] check, Model model) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("array", check);
		
		//TBL_TOTALPRODUCTONSALE값 줄여주기 위한 for문
		List<GoodsDTO> list = productManagerDAO.getProductList(map);
		int stationery=0;
		int living=0;
		int travel=0;
		int collabo=0;
		int discount=0;
		int best=0;
		int newP=0;
		for(int i=0; i<map.get("array").length; i++) {
			if(list.get(i).getStationery()!=0) stationery++;
			if(list.get(i).getLiving()!=0) living++;
			if(list.get(i).getTravel()!=0) travel++;
			if(list.get(i).getCollabo()!=0) collabo++;
			if(list.get(i).getDiscount()!=0) discount++;
			if(list.get(i).getBest()!=0) best++;
			if(list.get(i).getNewP()!=0) newP++;
		}
		
		Map<String, Integer> qtyMap = new HashMap<String, Integer>();
		qtyMap.put("stationery", stationery);
		qtyMap.put("living", living);
		qtyMap.put("travel", travel);
		qtyMap.put("collabo", collabo);
		qtyMap.put("discount", discount);
		qtyMap.put("best", best);
		qtyMap.put("newP", newP);
		productManagerDAO.updateTotalProductOnSale(qtyMap);
		productManagerDAO.productDelete(map);
		productManagerDAO.productOptionDelete(map);
		return "redirect:/admin/productList.do";
	}
	
	
	//옵션없는 재고파악
	@RequestMapping(value="/admin/checkStock.do",method=RequestMethod.POST)
	public ModelAndView checkStock(@RequestParam Map<String,String> map) {
		
		int stock = productManagerDAO.checkStock(map);
		String result="";
		
		if(stock >= Integer.parseInt(map.get("input")))
			result="ok";
		else if(stock < Integer.parseInt(map.get("input")))
			result="fail";
		
		System.out.println("재고는 "+stock+" 입력한 수량은 "+map.get("input")+" result="+result);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("result", result);
		mav.addObject("stock", stock);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//옵션있는 상품 재고파악
	@RequestMapping(value="/admin/checkOptionStock.do",method=RequestMethod.POST)
	public ModelAndView checkOptionStock(@RequestParam Map<String,String> map) {
		
		int stock = productManagerDAO.checkOptionStock(map);
		String result="";
		
		if(stock >= Integer.parseInt(map.get("input")))
			result="ok";
		else if(stock < Integer.parseInt(map.get("input")))
			result="fail";
		
		System.out.println("재고는 "+stock+" 입력한 수량은 "+map.get("input")+" result="+result);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("result", result);
		mav.addObject("stock", stock);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
}


