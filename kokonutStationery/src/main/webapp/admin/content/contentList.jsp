<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<meta charset="UTF-8">
<title>Admin 페이지</title>
<style type="text/css">
#userSeach_list th{
	height: 53px;
	font-weight: 500;
	font-weight: 500;
    background-color: #f5f4f4;
}

.board_menuBar{
	float: left;
    font-size: 16px;
    margin: 10px 0 20px 20px;
}

.content_menuBar{
	color: gray;
}

</style>
</head>
<input type="hidden" id="boardOption" value="tbl_admin">
<input type="hidden" id="ajaxCheck" value=0><!-- 상품 후기 클릭 시 ajax 반복 막기 -->
<!-- 메인컨텐츠 시작 -->
<div id="mainContent_wrap">
	<div id="user_search_wrap" style="width: 1000px; margin: 0 auto;">
		<div id="user_search_title" style="margin-bottom: 20px;">
			<h1 style="font-weight:normal;">게시글 관리</h1>
		</div>
		
	
		<div class="board_menuBar" style="margin: 10px 0 20px 0;">
			<a href="#" id="notice_board" class="content_menuBar">공 지 사 항</a>
		</div>
		<div class="board_menuBar">
			<a href="#" id="product_qna" class="content_menuBar">상 품 문 의</a>
		</div>
		<div class="board_menuBar">
			<a href="#" id="product_review" class="content_menuBar">상 품 후 기</a>
		</div>

		<div id="userSeach_list" align="left" style="margin-top: 50px;">
			<table id="contentTable" border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 20px;">
						<input type="checkbox">
					</th>
					<th style="width: 60px;">번&emsp;&nbsp;호</th>
					<th  id="reviewTh" style="width: 300px;">제&emsp;&nbsp;목</th>
					<th id="writerTh" style="width: 80px;">날&emsp;&nbsp;짜</th>
				</tr>
			</table>
		</div>
	</div><!-- search_wrap -->
</div><!-- 메인컨텐츠 끝 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

$('#notice_board').click(function(){
	$('#boardOption').val('tbl_admin');
});

$('#product_qna').click(function(){
	$('#boardOption').val('tbl_qnaboard');
});

$('#product_review').click(function(){
	$('#boardOption').val('tbl_reviewboard');
});

//상품 후기 리스트
$('#product_review').click(function(){
	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/admin/reviewboardList.do',
		dataType : 'json',
		success : function(data){
			if($('#ajaxCheck').val()==0){
				//테이블 이미지th 추가
				$('#reviewTh').before($('<th/>',{text: '상품 이미지'}).css('width', '70px'));	
				$('#writerTh').before($('<th/>',{text: '작성자'}).css('width', '70px'));
				$('#ajaxCheck').val(1);
				
				//후기 리스트
				$.each(data.list, function(index,items){
					$('<tr/>').append($('<td/>',{
						align: 'center'
					}).append($('<input/>',{
						type : 'checkbox'
					}))).append($('<td/>',{
						align : 'center',
						text : items.reviewboardCode
					})).append($('<td/>',{
							align : 'center',
						}).append($('<img/>',{
							src : '../image/thumb/'+items.reviewboardImg
						}).css('width','65px'))).append($('<td/>',{
							text : items.reviewboardSubject
						}).css('padding-left', '5px')).append($('<td/>',{
							align : 'center',
							text : items.userId
						})).append($('<td/>',{
							align : 'center',
							text : items.regDate
						})).appendTo($('#contentTable'));
				});
			}//if
		}
	});
});
</script>