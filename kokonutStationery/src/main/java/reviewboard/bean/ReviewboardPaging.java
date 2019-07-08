package reviewboard.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ReviewboardPaging {
	private int currentPage;
	private int pageBlock;
	private int pageSize;
	private int totalA;
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalPage = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalPage) endPage = totalPage;

		if(startPage>pageBlock) {
			pagingHTML.append("[<span id='paging' onclick='reviewboardPaging("+(startPage-1)+")'>이전</span>]"); 
		}//if
		
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("<span id='currentPaging' onclick='reviewboardPaging("+i+")'>"+i+"</span>");
			} else {
				pagingHTML.append("<span id='paging' onclick='reviewboardPaging("+i+")'>"+i+"</span>");
			}//if~else
		}//for
		
		if(endPage<totalPage) {
			pagingHTML.append("[<span id='paging' onclick='reviewboardPaging("+(endPage+1)+")'>다음</span>]");
		}//if
		
	}
	
	
	public void makeSearchPagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalPage = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalPage) endPage = totalPage;

		if(startPage>pageBlock) {
			pagingHTML.append("[<span id='paging' onclick='reviewboardSearchPaging("+(startPage-1)+")'>이전</span>]"); 
		}//if
		
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("<span id='currentPaging' onclick='reviewboardSearchPaging("+i+")'>"+i+"</span>");
			} else {
				pagingHTML.append("<span id='paging' onclick='reviewboardSearchPaging("+i+")'>"+i+"</span>");
			}//if~else
		}//for
		
		if(endPage<totalPage) {
			pagingHTML.append("[<span id='paging' onclick='reviewboardSearchPaging("+(endPage+1)+")'>다음</span>]");
		}//if
		
	}
	
}

