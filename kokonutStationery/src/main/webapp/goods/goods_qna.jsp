<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품문의 페이지</title>
<link rel="stylesheet" href="../css/goods_userPage.css?alert">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../js/goods_qna.js?alert"></script>
</head>
<body>
<div class="main">
	<div class="goods_userPage_area">
		<div class="goods_userPage_main">		
			<div style="font-size:22px; font-weight:700;">상품문의</div>
			<form id="userPage_searchForm">
				<div class="goods_userPage_search">
					<select class="goods_userPage_searchOption">
						<option>통합검색</option>
						<option>제목</option>
						<option>후기</option>
						<option>작성자</option>
						<option>상품명</option>
					</select>
					<input type="text" class="goods_userPage_searchValue" placeholder="검색어를 입력하세요">
					<input type="submit" class="goods_userPage_searchBtn" value="검색">
				</div>
				<div>
					<select class="goods_userPage_sortOption">
						<option>10개씩 정렬</option>
						<option>20개씩 정렬</option>
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
				<!-- 내용 div / 갯수만큼 생성되기때문에 실제론 jquery이용 -->
				<div>
					<table class="goods_userPage_board" cellpadding="5">
						<tr height="25">
							<td width="80">10</td>
							<td width="80">
								<a href=""><img src="http://store.baemin.com/shop/data/goods/1476870027237s0.jpg"
									 class="goods_userPage_img"/></a>
							</td>
							<td class="goods_userPage_board_content">
								<span style="font-weight:700; color:#2AC1BC;">질문 :   </span>
								<span>붉게 변색이 되었는데 돌릴수 있는 방법 없나요?</span>
							</td>
							<td width="140">may10**</td>
							<td width="120">2019.06.20</td>
						</tr>
					</table>
				</div>
				<div>
					<table class="goods_userPage_board" cellpadding="5">
						<tr height="25">
							<td width="80">10</td>
							<td width="80">
								
							</td>
							<td class="goods_userPage_board_content">
								<span style="font-weight:700; color:#2AC1BC;">답변 :   </span>
								<span>[배민문방구] 답변드립니다.</span>
							</td>
							<td width="140">admin</td>
							<td width="120">2019.06.20</td>
						</tr>
					</table>
				</div>
				<!-- 페이징 -->
				<div class="goods_userPage_paging"><b>1</b></div>
			</form>
		</div>
	</div>
</div>
</body>
</html>