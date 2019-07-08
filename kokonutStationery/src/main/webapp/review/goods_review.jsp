<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품후기 페이지</title>
<link rel="stylesheet" href="../css/goods_userPage.css?alert">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../js/goods_review.js?alert"></script>
</head>
<body>
<div class="main">
	<div class="goods_userPage_area">
		<div class="goods_userPage_main">		
			<div style="font-size:22px; font-weight:700;">이용후기</div>
			<form id="userPage_searchForm">
				<div class="goods_userPage_search">
					<select class="goods_userPage_searchOption" name="searchOption">
						<option name="searchOptionContent">통합검색</option>
						<option name="searchOptionContent">제목</option>
						<option name="searchOptionContent">후기</option>
						<option name="searchOptionContent">작성자</option>
						<option name="searchOptionContent">상품명</option>
					</select>
					<input type="text" class="goods_userPage_searchValue" name="searchKeyword" placeholder="검색어를 입력하세요">
					<input type="submit" class="goods_userPage_searchBtn" value="검색">
				</div>
				<div>
					<select class="goods_userPage_sortOption">
						<option value="10">10개씩 정렬</option>
						<option value="20">20개씩 정렬</option>
					</select>
				</div>
				<br><br>
				<!-- 타이틀 -->
				<div>
					<table class="goods_userPage_table" cellspacing="0" cellpadding="5">
						<tr height="23">
							<th width="80">번호</th>
							<th width="80">이미지</th>
							<th>상품명/제목</th>
							<th width="140">작성자</th>
							<th width="120">작성일</th>
						</tr>
					</table>
				</div>
				<div>
					<table class="goods_userPage_board" cellpadding="5">
						
					</table>
				</div>
				
				<!-- 페이징 -->
				<div class="goods_userPage_paging"></div>
			</form>
		</div>
	</div>
</div>
</body>
</html>