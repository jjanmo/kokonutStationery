<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
		
		<tr id="onetoone_content">
			<td id="question_type"><b>기타문의</b></td>
			<td id="question_content">깜짝세일을 하는 이유가 무엇인가요</td>
			<td id="mem_id">hjlee18**</td>
			<td id="writeDate">2019.06.22</td>
		</tr>
	
		<tr>
			<td colspan="5">
				<div class="question hide">
					<div class="question_show">
						<font style="color:#333; font-weight:700; line-height: 30px;">주문번호 0 문의</font>
						<br> 잡지 말고 물품은 세일 안하나요??
						<div class="question_btns_div">
							<li class="white_btn btn_size_xs" id="onetone_delete">삭제</li>
							<li class="white_btn btn_size_xs" id="onetoone_modify">수정</li>
							<li class="white_btn btn_size_xs" id="onetone_answer">답변</li>
						</div>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>

<div class="pageDiv">
	1
</div>

<div class="question_btn" style="cursor: pointer;">
	문의하기
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$('#onetoone_content').click(function(){
	$('.question').toggleClass('hide');
});

//팝업창
$('.question_btn').click(function(){
	window.open('/kokonutStationery/onetoone/mypage_onetoone_register.do',
				'1:1 문의 작성',
				'width=560, height=630');
});

$('#onetone_delete').click(function(){
	window.open('/kokonutStationery/onetoone/mypage_onetoone_delete.do',
	            '1:1 문의 삭제',
				'width=500, height=280');
});

$('#onetoone_modify').click(function(){
	window.open('/kokonutStationery/onetoone/mypage_onetoone_modify.do',
	            '1:1 문의 수정',
	            'width=560, height=630');
});
	
$('#onetone_answer').click(function(){
	window.open('/kokonutStationery/onetoone/mypage_onetoone_reply.do',
	            '1:1 문의 답변',
	            'width=560, height=630');
});
</script>

    