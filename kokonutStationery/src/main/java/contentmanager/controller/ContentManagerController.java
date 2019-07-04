package contentmanager.controller;

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

import contentmanager.dao.ContentManagerDAO;
import goods.bean.GoodsDTO;
import noticeboard.bean.NoticeboardDTO;

@Controller
public class ContentManagerController {
	@Autowired
	private ContentManagerDAO contentManagerDAO;

	//상품관리 - 리스트불러오기
	@RequestMapping(value="/admin/reviewboardList.do",method= RequestMethod.POST)
	@ResponseBody
	public ModelAndView reviewboardList() {
		List<GoodsDTO> list = contentManagerDAO.reviewboardList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
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


