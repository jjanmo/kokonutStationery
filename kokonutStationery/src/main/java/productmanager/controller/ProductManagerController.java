package productmanager.controller;

import java.io.File;
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

		String thumbImgPath = "C:\\Users\\SEENEW\\Desktop\\최종프로젝트\\source\\배민문방구\\thumb"; 
		String detailedImgPath = "C:\\Users\\SEENEW\\Desktop\\최종프로젝트\\source\\배민문방구\\detail";
		
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
	public String productModifyForm(@RequestParam String productCode, Model model) {
		GoodsDTO goodsDTO = productManagerDAO.getModifyForm(productCode);
		model.addAttribute("goodsDTO", goodsDTO);
		return "/admin/product/productModifyForm";
	}
	
	@RequestMapping(value="/admin/productDelete.do",method= RequestMethod.POST)
	public String productDelete(@RequestParam String[] check, Model model) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("array", check);
		productManagerDAO.productDelete(map);
		return "redirect:/admin/productList.do";
	}
	
	
	
	
}


