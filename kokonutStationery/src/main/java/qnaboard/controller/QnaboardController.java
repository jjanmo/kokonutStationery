package qnaboard.controller;

import java.util.List;

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
import qnaboard.dao.QnaboardDAO;

@Controller
@RequestMapping("/qna/*")
public class QnaboardController {
	@Autowired
	private GoodsDAO goodsDAO;
	@Autowired
	private QnaboardDAO qnaboardDAO;
	
	//상품페이지의 qna리스트
	@GetMapping("/goods_qnaList.do")
	public ModelAndView getQnaList(@RequestParam String productCode) {
		//상품문의리스트가져오기
		List<QnaboardDTO> list = qnaboardDAO.getQnaList(Integer.parseInt(productCode));
		System.out.println("개별상품코드="+productCode);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
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
