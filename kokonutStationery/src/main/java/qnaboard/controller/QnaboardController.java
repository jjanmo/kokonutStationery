package qnaboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import qnaboard.dao.QnaboardDAO;

@Controller
@RequestMapping("/qna/*")
public class QnaboardController {
	@Autowired
	private QnaboardDAO qnaDAO;
	
	//상품qna목록페이지
	@GetMapping("/goods_qna.do")
	public ModelAndView getGoodsQnaList() {
		//리스트 정보를 가져오는 코드 필요 : from DB
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/qna/goods_qna.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//상품qna등록페이지
	@GetMapping("/goods_qna_register.do")
	public String goodsQnaRegister() {
		return "goods_qna_register";
	}
}
