package qnaboard.dao;

import java.util.List;

import qnaboard.bean.QnaboardDTO;

public interface QnaboardDAO {

	public List<QnaboardDTO> getQnaList(int parseInt);

}
