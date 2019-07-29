package onetoone.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import onetoone.bean.OneToOneDTO;
import onetoone.bean.OrderCodePaging;
import onetoone.dao.OneToOneDAO;
import order.bean.OrderDTO;
import order.bean.OrderlistDTO;


@Controller
@RequestMapping("/onetoone/*")
public class OneToOneController {	
	@Autowired
	private OneToOneDAO onetooneDAO;
	@Autowired
	private OrderCodePaging orderCodePaging;

	
	//1:1문의 리스트 가져오기
	@PostMapping("/getOnetooneList.do")
	public ModelAndView getOnetooneList(@RequestParam String userId) {
		//System.out.println("onetoone : " + userId);
		List<OneToOneDTO> list = onetooneDAO.getOnetooneList(userId);
		//System.out.println(list);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
		
	//1:1문의 등록 창 열기
	@GetMapping("/mypage_onetoone_register.do")
	public String onetoone_register() {
		return "/mypage/mypage_onetoone_register";
	}
	
	//1:1문의 등록
	@PostMapping("/onetoone_register.do")
	@ResponseBody
	public void register(@ModelAttribute OneToOneDTO onetooneDTO) {
		//System.out.println(onetooneDTO);
		onetooneDAO.register(onetooneDTO);
	}
	
	
	//1:1문의 등록시 주문번호 조회
	@RequestMapping(value="/getOrderList.do", method=RequestMethod.POST)
	public ModelAndView getOrderList(@RequestParam(required=false, defaultValue="1") String pg) {
		
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<OrderlistDTO> list = onetooneDAO.getOrderList(map);
		
		int totalA = onetooneDAO.getTotalA();
		
		orderCodePaging.setCurrentPage(Integer.parseInt(pg));
		orderCodePaging.setPageBlock(3);
		orderCodePaging.setPageSize(10);
		orderCodePaging.setTotalA(totalA);
		orderCodePaging.makePagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("orderCodePaging", orderCodePaging);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//1:1문의 등록시 주문번호 조회에서 상품이름
	@RequestMapping(value="/getOrderProduct.do", method=RequestMethod.POST)
	public ModelAndView getOrderProduct(@RequestParam String orderCode) {
		List<OrderDTO> pName = onetooneDAO.getOrderProduct(orderCode); 
		ModelAndView mav = new ModelAndView();
		mav.addObject("pName", pName);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//1:1문의 삭제
	@RequestMapping(value="/mypage_onetoone_delete.do", method=RequestMethod.POST)
	@ResponseBody
	public String onetooneDelete(@RequestParam String onetooneCode) {
		int su = onetooneDAO.onetooneDelete(onetooneCode);
		if(su == 0) {
			return "failure";
		}
		else {
			return "success";
		}
	}
	
	//1:1문의 수정 창 열기
	@RequestMapping(value="/mypage_onetoone_modify.do", method=RequestMethod.GET)
	public ModelAndView onetoone_modify(@RequestParam String onetooneCode) {
		//System.out.println(onetooneCode);
		OneToOneDTO onetooneDTO = onetooneDAO.getOneToOneDTO(onetooneCode);
		ModelAndView mav = new ModelAndView();
		mav.addObject("onetooneDTO", onetooneDTO);
		mav.setViewName("/mypage/mypage_onetoone_modify");
		return mav;
	}
	
	//1:1문의 수정하기
	@RequestMapping(value="/onetoone_modify.do", method=RequestMethod.POST)
	@ResponseBody
	public void onetoone_modify(@ModelAttribute OneToOneDTO onetooneDTO) {
		//System.out.println(onetooneDTO);
		onetooneDAO.onetoone_modify(onetooneDTO);
	} 
	
}
