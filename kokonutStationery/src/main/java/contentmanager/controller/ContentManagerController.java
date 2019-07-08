package contentmanager.controller;

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

import contentmanager.bean.QnaboardManagerPaging;
import contentmanager.bean.ReviewboardManagerPaging;
import contentmanager.dao.ContentManagerDAO;
import goods.bean.GoodsDTO;
import noticeboard.bean.NoticeboardDTO;
import qnaboard.bean.QnaboardDTO;
import reviewboard.bean.ReviewboardDTO;


@Controller
public class ContentManagerController {
	@Autowired
	private ContentManagerDAO contentManagerDAO;
	
	@Autowired
	private QnaboardManagerPaging qnaboardManagerPaging;
	
	@Autowired
	private ReviewboardManagerPaging reviewboardManagerPaging;

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
	
	//상품문의 - 답변 창 띄우기
	@RequestMapping(value="/admin/qnaboardReplyForm.do",method=RequestMethod.GET)
	public String qnaboardReplyForm(@RequestParam String qnaboardCode, Model model ) {
		QnaboardDTO qnaboardDTO = contentManagerDAO.qnaboardReplyForm(Integer.parseInt(qnaboardCode));
		
		model.addAttribute("qnaboardDTO", qnaboardDTO);
		model.addAttribute("qnaboardCode", qnaboardCode);
		return "/admin/content/qnaboardReplyForm";
	}
	
	//상품문의 - 답변 등록
	@RequestMapping(value="/admin/qnaboardReply.do",method=RequestMethod.POST)
	public void qnaboardReply(@RequestParam Map<String,Object> map) {
		contentManagerDAO.qnaboardReply(map);
	}
	
	
	//상품후기 - 리스트불러오기
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
		
		reviewboardManagerPaging.setCurrentPage(Integer.parseInt(pg));
		reviewboardManagerPaging.setPageBlock(3);
		reviewboardManagerPaging.setPageSize(5);
		reviewboardManagerPaging.setTotalA(totalA);
		reviewboardManagerPaging.makePagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("reviewboardManagerPaging", reviewboardManagerPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//컨텐츠 삭제 - 공통 삭제
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
			
		}else if(boardOption.equals("tbl_noticeboard")) {
			contentManagerDAO.noticeDelete(map);
			pagingCheck="notice";
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
		return "/admin/content/noticeboardModifyForm";
	}
	
	// 공지사항 수정
	@RequestMapping(value="/admin/noticeboardModify.do",method=RequestMethod.POST)
	public void noticeboardModify(@RequestParam Map<String,String> map) {
		contentManagerDAO.noticeboardModify(map);
	}
	
	// 공지사항 글쓰기 창 띄우기
	@RequestMapping(value="/admin/noticeboardWriteForm.do",method=RequestMethod.GET)
	public String noticeboardWriteForm() {
		return "/admin/content/noticeboardWriteForm";
	}
	
	// 공지사항 글쓰기
	@RequestMapping(value="/admin/noticeboardWrite.do",method=RequestMethod.POST)
	public void noticeboardWrite(@RequestParam Map<String,String> map) {
		contentManagerDAO.noticeboardWrite(map);
	}
	
	
	
	
	//////////      검색               ///////////
	@RequestMapping(value="/admin/contentListSearch.do",method = RequestMethod.POST)
	public ModelAndView contentListSearch(@RequestParam(required=false, defaultValue="1") String pg
									, @RequestParam Map<String,String> map
									, HttpSession session) {
	
		
		//세션 관리자 아이디 가져오기
		String adId = (String)session.getAttribute("adId");
		
		//DB - 1페이지당 10개씩
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("startNum", startNum);
		map2.put("endNum", endNum);
		map2.put("keyword",map.get("keyword"));
		map2.put("option",map.get("option"));
		map2.put("table",map.get("table"));
		
		ModelAndView mav = new ModelAndView();
		
		
		//공지사항 일 때
		if(map.get("table").equals("tbl_noticeboard")) {
			
			List<NoticeboardDTO> list = contentManagerDAO.noticeboardSearch(map2);
			
			mav.addObject("list", list);
			mav.addObject("keyword",map.get("keyword"));
			mav.addObject("option",map.get("option"));
			mav.addObject("table",map.get("table"));
			mav.setViewName("jsonView");
		}//if 공지사항
		
		
		//상품문의 일 때
		else if(map.get("table").equals("tbl_qnaboard")) {
				
			List<QnaboardDTO> list = contentManagerDAO.qnaboardSearch(map2);
			
			int totalA = contentManagerDAO.qnaboardTotalAS(map2);
					
			qnaboardManagerPaging.setCurrentPage(Integer.parseInt(pg));
			qnaboardManagerPaging.setPageBlock(3);
			qnaboardManagerPaging.setPageSize(10);
			qnaboardManagerPaging.setTotalA(totalA);
			qnaboardManagerPaging.makeSearchPagingHTML();
			
			mav.addObject("pg", pg);
			mav.addObject("list", list);
			mav.addObject("qnaboardManagerPaging", qnaboardManagerPaging);
			mav.setViewName("jsonView");
		}//if 상품문의
		
		
		//상품후기 일 때
		else if(map.get("table").equals("tbl_reviewboard")) {
					
			List<ReviewboardDTO> list = contentManagerDAO.reviewboardSearch(map2);
			
			int totalA = contentManagerDAO.reviewboardTotalAS(map2);
			
			reviewboardManagerPaging.setCurrentPage(Integer.parseInt(pg));
			reviewboardManagerPaging.setPageBlock(3);
			reviewboardManagerPaging.setPageSize(10);
			reviewboardManagerPaging.setTotalA(totalA);
			reviewboardManagerPaging.makeSearchPagingHTML();
			
			mav.addObject("pg", pg);
			mav.addObject("list", list);
			mav.addObject("reviewboardManagerPaging", reviewboardManagerPaging);
			mav.setViewName("jsonView");
		}//if 상품후기	
		
		return mav;
	}
	
}


