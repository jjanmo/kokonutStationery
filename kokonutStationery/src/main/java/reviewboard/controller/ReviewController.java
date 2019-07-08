package reviewboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import goods.bean.GoodsDTO;
import goods.dao.GoodsDAO;
import qnaboard.bean.QnaboardDTO;
import reviewboard.bean.ReviewboardDTO;
import reviewboard.bean.ReviewboardPaging;
import reviewboard.dao.ReviewboardDAO;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	@Autowired
	private GoodsDAO goodsDAO;
	@Autowired
	private ReviewboardDAO reviewboardDAO;
	@Autowired
	private ReviewboardPaging reviewboardPaging;
	
	//모든 상품 리뷰 목록 페이지
	@GetMapping("/goods_review.do")
	public ModelAndView getGoodsReviewList() {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/review/goods_review.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//나의 상품후기 가져오기
	@RequestMapping(value="/goods_reviewMyList.do",method=RequestMethod.POST)
	public ModelAndView getMyReviewList(@RequestParam(required=false,defaultValue="1") String pg,@RequestParam String userId) {
		
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		Map<String, String> map = new HashMap<String,String>();
		
		//페이징처리
		int totalA = reviewboardDAO.getTotalMyR(userId);
		reviewboardPaging.setCurrentPage(Integer.parseInt(pg));
		reviewboardPaging.setPageBlock(5);
		reviewboardPaging.setPageSize(5);
		reviewboardPaging.setTotalA(totalA);
		
		reviewboardPaging.makePagingHTML();
		
		map.put("startNum",	startNum+"");
		map.put("endNum",	endNum+"");
		map.put("userId",userId);
		
		List<ReviewboardDTO> list = reviewboardDAO.getMyReviewList(map);
		//System.out.println("내 상품문의갯수="+list.size());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("reviewboardPaging", reviewboardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
		
	//개별상품페이지의 review리스트
	@RequestMapping(value="/goods_reviewList.do",method=RequestMethod.POST)
	public ModelAndView getReviewList(@RequestParam(required=false,defaultValue="1") String pg,@RequestParam String productCode) {
		
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		Map<String,Integer> map = new HashMap<String,Integer>();
		
		map.put("startNum",	startNum);
		map.put("endNum",	endNum);
		map.put("productCode",	Integer.parseInt(productCode));
		
		//상품문의리스트가져오기
		List<ReviewboardDTO> list = reviewboardDAO.getReviewList(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);

		mav.setViewName("jsonView");
		return mav;
	}
	
	//상품 review 등록페이지
	@GetMapping("/goods_review_register.do")
	public ModelAndView goodsReviewRegister(@RequestParam String productCode) {
		//상품한개받아오기
		GoodsDTO goodsDTO = goodsDAO.getGoodsView(Integer.parseInt(productCode));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsDTO", goodsDTO);			
		mav.setViewName("/review/goods_review_register");
		return mav;
	}
	
	//후기작성
	@RequestMapping(value="/reviewboardWrite.do",method=RequestMethod.POST)
	@ResponseBody
	public void reviewboardWrite(@ModelAttribute ReviewboardDTO reviewboardDTO) {
		reviewboardDAO.reviewboardWrite(reviewboardDTO);
	}
	
	//상품review수정페이지
	@GetMapping("/goods_review_modify.do")
	public ModelAndView goodsReviewModify(@RequestParam String reviewboardCode) {
		//문의 한 개 받아오기
		ReviewboardDTO reviewboardDTO = reviewboardDAO.getReviewboard(Integer.parseInt(reviewboardCode));
		System.out.println(reviewboardDTO);
		ModelAndView mav = new ModelAndView();
		mav.addObject("reviewboardDTO", reviewboardDTO);			
		mav.setViewName("/review/goods_review_modify");
		return mav;
	}
	
	//후기수정
	@RequestMapping(value="/reviewboardModify.do",method=RequestMethod.POST)
	@ResponseBody
	public void reviewboardModify(@ModelAttribute ReviewboardDTO reviewboardDTO) {
		reviewboardDAO.reviewboardModify(reviewboardDTO);
	}
	
	//후기삭제
	@RequestMapping(value="/reviewboardDelete.do",method=RequestMethod.POST)
	@ResponseBody
	public void reviewboardDelete(@RequestParam String reviewboardCode) {
		reviewboardDAO.reviewboardDelete(Integer.parseInt(reviewboardCode));
	}
	
	//모든 상품 review목록페이지
	@RequestMapping(value="/goods_reviewAllList.do",method=RequestMethod.POST)
	public ModelAndView getAllReviewList(@RequestParam(required=false,defaultValue="1") String pg,
								@RequestParam(required=false,defaultValue="10") String pageNum) {
		
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		Map<String,Integer> map = new HashMap<String,Integer>();
		
		map.put("startNum",	startNum);
		map.put("endNum",	endNum);
		
		//상품문의리스트가져오기
		List<ReviewboardDTO> list = reviewboardDAO.getAllReviewList(map);
		
		//페이징처리
		int totalA = reviewboardDAO.getTotalAllR();
		reviewboardPaging.setCurrentPage(Integer.parseInt(pg));
		reviewboardPaging.setPageBlock(5);
		reviewboardPaging.setPageSize(Integer.parseInt(pageNum));
		reviewboardPaging.setTotalA(totalA);
		
		reviewboardPaging.makePagingHTML();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("reviewboardPaging", reviewboardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	// 후기 검색
	@RequestMapping(value="/reviewboardSearch.do",method=RequestMethod.POST)
	public ModelAndView reviewboardSearch(@RequestParam(required=false) Map<String,String> map) {		
		
		int endNum = Integer.parseInt(map.get("pg"))*Integer.parseInt(map.get("pageNum"));
		int startNum = endNum-(Integer.parseInt(map.get("pageNum"))-1);
		
		map.put("startNum",	startNum+"");
		map.put("endNum",	endNum+"");
		//System.out.println("검색옵션="+map.get("searchOption")+"검색내용="+map.get("searchContent"));
		
		//목록처리
		List<ReviewboardDTO> list;
		int totalA=0;
		
		if(map.get("searchOption").equals("all")) {
			list = reviewboardDAO.reviewboardAllSearch(map);
			totalA = reviewboardDAO.getTotalAllSearchR(map.get("searchContent"));
		}else {
			list = reviewboardDAO.reviewboardSearch(map);	
			totalA = reviewboardDAO.getTotalSearchR(map);
		}
		//System.out.println("모든리스트의 담긴길이="+list.size());
		
		//페이징처리
		
		reviewboardPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		reviewboardPaging.setPageBlock(5);
		reviewboardPaging.setPageSize(Integer.parseInt(map.get("pageNum")));
		reviewboardPaging.setTotalA(totalA);
		
		reviewboardPaging.makeSearchPagingHTML();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.addObject("reviewboardPaging", reviewboardPaging);
		mav.addObject("searchOption", map.get("searchOption"));
		mav.addObject("searchContent", map.get("searchContent"));
		mav.addObject("display", "/review/goods_review.jsp");
		mav.setViewName("/main/nosIndex");
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	


}
