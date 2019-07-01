package qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import qna.dao.QnaDAO;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	@Autowired
	private QnaDAO qnaDAO;
	
}
