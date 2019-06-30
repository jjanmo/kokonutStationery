package goods.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ProductPaging {
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
			pagingHTML.append("[<span id='paging' onclick='productPaging("+(startPage-1)+")'>����</span>]"); 
		}//if
		
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("[<span id='currentPaging' onclick='productPaging("+i+")'>"+i+"</span>]");
			} else {
				pagingHTML.append("[<span id='paging' onclick='productPaging("+i+")'>"+i+"</span>]");
			}//if~else
		}//for
		
		if(endPage<totalPage) {
			pagingHTML.append("[<span id='paging' onclick='productPaging("+(endPage+1)+")'>����</span>]");
		}//if
		
	}
	
	
	public void makeSearchPagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalPage = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalPage) endPage = totalPage;

		if(startPage>pageBlock) {
			pagingHTML.append("[<span id='paging' onclick='productSearchPaging("+(startPage-1)+")'>����</span>]"); 
		}//if
		
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("[<span id='currentPaging' onclick='productSearchPaging("+i+")'>"+i+"</span>]");
			} else {
				pagingHTML.append("[<span id='paging' onclick='productSearchPaging("+i+")'>"+i+"</span>]");
			}//if~else
		}//for
		
		if(endPage<totalPage) {
			pagingHTML.append("[<span id='paging' onclick='productSearchPaging("+(endPage+1)+")'>����</span>]");
		}//if
		
	}
}

