package contentmanager.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import contentmanager.bean.QnaboardManagerPaging;
import contentmanager.bean.ReviewboardPaging;
import contentmanager.dao.ContentManagerDAO;
import goods.bean.GoodsDTO;
import noticeboard.bean.NoticeboardDTO;
import qnaboard.bean.QnaboardDTO;

@Controller
public class ContentManagerController {
	@Autowired
	private ContentManagerDAO contentManagerDAO;
	
	@Autowired
	private QnaboardManagerPaging qnaboardManagerPaging;
	
	@Autowired
	private ReviewboardPaging reviewboardPaging;

	//상품문의 - 리스트불러오기
	@RequestMapping(value="/admin/qnaboardList.do",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView qnaboardList(@RequestParam(required=false, defaultValue="1") String pg) {
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<QnaboardDTO> list = contentManagerDAO.qnaboardList(map);
		
		int totalA = contentManagerDAO.qnaboardTotalA();
		
		qnaboardManagerPaging.setCurrentPage(Integer.parseInt(pg));
		qnaboardManagerPaging.setPageBlock(3);
		qnaboardManagerPaging.setPageSize(5);
		qnaboardManagerPaging.setTotalA(totalA);
		qnaboardManagerPaging.makePagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("qnaboardManagerPaging", qnaboardManagerPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//상품관리 - 리스트불러오기
	@RequestMapping(value="/admin/reviewboardList.do",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView reviewboardList(@RequestParam(required=false, defaultValue="1") String pg) {
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<GoodsDTO> list = contentManagerDAO.reviewboardList(map);
		
		int totalA = contentManagerDAO.reviewboardTotalA();
		
		reviewboardPaging.setCurrentPage(Integer.parseInt(pg));
		reviewboardPaging.setPageBlock(3);
		reviewboardPaging.setPageSize(5);
		reviewboardPaging.setTotalA(totalA);
		reviewboardPaging.makePagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("reviewboardPaging", reviewboardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/admin/contentDelete.do",method= RequestMethod.POST)
	public String contentDelete(@RequestParam String[] check,
								@RequestParam String boardOption) {
		System.out.println(boardOption);

		String pagingCheck=null;
		
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("array", check);
		
		if(boardOption.equals("tbl_qnaboard")) {
			contentManagerDAO.qnaDelete(map);
			pagingCheck="qna";
			
		}else if(boardOption.equals("tbl_reviewboard")) {
			contentManagerDAO.reviewDelete(map);
			pagingCheck="review";
		}
		
		return "redirect: contentList.do?pagingCheck="+pagingCheck+"";
	}
	
	
	// 공지사항 - 리스트 전체 불러오기
	@RequestMapping(value="/admin/noticeboardList.do",method=RequestMethod.POST)
	public ModelAndView noticeboardList() {
		List<NoticeboardDTO> list = contentManagerDAO.noticeboardList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	// 공지사항 수정 창 띄우기
	@RequestMapping(value="/admin/noticeboardModifyForm.do",method=RequestMethod.GET)
	public String noticeboardModifyForm(@RequestParam String noticeboardCode, Model model ) {
		NoticeboardDTO noticeboardDTO = contentManagerDAO.noticeboardModifyForm(Integer.parseInt(noticeboardCode));
		
		model.addAttribute("noticeboardCode", noticeboardCode);
		model.addAttribute("noticeboardDTO", noticeboardDTO);
		return "/notice/noticeboardModifyForm";
	}
	
	// 공지사항 수정
	@RequestMapping(value="/admin/noticeboardModify.do",method=RequestMethod.POST)
	public void noticeboardModify(@RequestParam Map<String,String> map) {
		contentManagerDAO.noticeboardModify(map);
	}
	
	// 공지사항 글쓰기 창 띄우기
	@RequestMapping(value="/admin/noticeboardWriteForm.do",method=RequestMethod.GET)
	public String noticeboardWriteForm() {
		return "/notice/noticeboardWriteForm";
	}
	
	@RequestMapping(value="/admin/noticeboardWrite.do",method=RequestMethod.POST)
	public void noticeboardWrite(@RequestParam Map<String,String> map) {
		contentManagerDAO.noticeboardWrite(map);
	}
	
}


