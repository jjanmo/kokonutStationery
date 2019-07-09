<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="../css/mypage_onetoone.css" rel="stylesheet">

<div class="content">
	<div class="content_title">
		1:1 문의게시판
	</div>
	
	<table class="onetoone_table">
		<tr id="onetoone_top">
			<th id="onetoone_type">질문유형</th>
			<th id="onetoone_title">제목</th>
			<th id="onetoone_writer">작성자</th>
			<th id="onetoone_Date">작성일</th>
		</tr>
		
		<%-- <c:forEach var="list" items="${list}">
			<tr id="onetoone_content">
				<td id="question_type"><b>${list.type}</b></td>
				<td id="question_content">${list.subject}</td>
				<td id="mem_id">${list.userId}</td>
				<td id="writeDate"><fmt:formatDate value="${list.logdate}" pattern="yyyy.MM.dd"/></td>
			</tr>
		
			<tr>
				<td colspan="5">
					<div class="question hide">
						<div class="question_show">
							<font style="color:#333; font-weight:700; line-height: 30px;">
								주문번호 ${list.orderCode} 문의
							</font>
							<br>${list.contents}
							<div class="question_btns_div">
								<li class="white_btn btn_size_xs" id="onetone_delete">삭제</li>
								<li class="white_btn btn_size_xs" id="onetoone_modify">수정</li>
								<li class="white_btn btn_size_xs" id="onetone_answer">답변</li>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</c:forEach> --%>
	</table>
</div>

<!-- <div class="pageDiv">
	1
</div> -->

<div class="question_btn" style="cursor: pointer;">
	문의하기
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>
<script type="text/javascript">
/* $(function() {
	$.ajax({
		type: 'POST',
		url: '/kokonutStationey/onetoone/onetooneList.do',
		date: {'userId': '${memId}'}
	});
}); */
</script>

    