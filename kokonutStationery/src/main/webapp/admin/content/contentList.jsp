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
			<table border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 20px;">
						<input type="checkbox">
					</th>
					<th style="width: 60px;">번&emsp;&nbsp;호</th>
					<th style="width: 300px;">제&emsp;&nbsp;목</th>
					<th style="width: 80px;">날&emsp;&nbsp;짜</th>
				</tr>
			</table>
		</div>
	</div><!-- search_wrap -->
	
</div><!-- 메인컨텐츠 끝 -->
