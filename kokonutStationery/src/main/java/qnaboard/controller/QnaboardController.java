package qnaboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import qnaboard.bean.QnaboardPaging;
import qnaboard.dao.QnaboardDAO;

@Controller
@RequestMapping("/qna/*")
public class QnaboardController {
	@Autowired
	private GoodsDAO goodsDAO;
	@Autowired
	private QnaboardDAO qnaboardDAO;
	@Autowired
	private QnaboardPaging qnaboardPaging;
	
	//개별상품페이지의 qna리스트
	@GetMapping("/goods_qnaList.do")
	public ModelAndView getQnaList(@RequestParam(required=false,defaultValue="1") String pg,@RequestParam String productCode) {
		
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		Map<String,Integer> map = new HashMap<String,Integer>();
		
		map.put("startNum",	startNum);
		map.put("endNum",	endNum);
		map.put("productCode",	Integer.parseInt(productCode));
		
		//상품문의리스트가져오기
		List<QnaboardDTO> list = qnaboardDAO.getQnaList(map);
		
		//페이징처리
		int totalA = qnaboardDAO.getTotalQ(Integer.parseInt(productCode));
		qnaboardPaging.setCurrentPage(Integer.parseInt(pg));
		qnaboardPaging.setPageBlock(5);
		qnaboardPaging.setPageSize(5);
		qnaboardPaging.setTotalA(totalA);
		
		qnaboardPaging.makePagingHTML();
				
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("qnaboardPaging", qnaboardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//모든 상품qna목록페이지이동
	@GetMapping("/goods_qna.do")
	public ModelAndView getQna() {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/qna/goods_qna.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//모든 상품qna목록페이지
	@GetMapping("/goods_qnaAllList.do")
	public ModelAndView getAllQnaList() {
		//상품문의리스트가져오기
		List<QnaboardDTO> list = qnaboardDAO.getAllQnaList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//문의검색
	@RequestMapping(value="/qnaboardSearch.do",method=RequestMethod.POST)
	public ModelAndView qnaboardSearch(@RequestParam(required=false) Map<String,String> map) {		
		
		
		//목록처리
		List<QnaboardDTO> list = qnaboardDAO.qnaboardSearch(map);		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.addObject("searchOption", map.get("searchOption"));
		mav.addObject("searchContent", map.get("searchContent"));
		mav.addObject("display", "/qna/goods_qna.jsp");
		mav.setViewName("/main/nosIndex");
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//상품qna등록페이지
	@GetMapping("/goods_qna_register.do")
	public ModelAndView goodsQnaRegister(@RequestParam String productCode) {
		//상품한개받아오기
		GoodsDTO goodsDTO = goodsDAO.getGoodsView(Integer.parseInt(productCode));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsDTO", goodsDTO);			
		mav.setViewName("/qna/goods_qna_register");
		return mav;
	}
	
	//문의작성
	@RequestMapping(value="/qnaboardWrite.do",method=RequestMethod.POST)
	@ResponseBody
	public void qnaboardWrite(@ModelAttribute QnaboardDTO qnaboardDTO) {
		qnaboardDAO.qnaboardWrite(qnaboardDTO);
	}
}
