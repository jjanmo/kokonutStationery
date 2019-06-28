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
	<!-- 상단 메뉴바 -->
	<div class="header">
		<div class="header_area">
			<img class="banner_img" src="../image/banner.PNG">
		</div>
	</div>
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
							<td width="80" name="review_no">10</td>
							<td width="80">
								<a href=""><img src="http://store.baemin.com/shop/data/goods/1556617064338s0.png"
									 class="goods_userPage_img" name="thumbImg"/></a>
							</td>
							<td class="goods_userPage_board_content">
								<div>
									<span style="font-weight: 700;" name="productName">오뚜기X배달의민족. 사골곰탕</span>
									&nbsp;&nbsp;
									<a href="">
										<u style="color:#999999; font-weight:600;">보러가기</u></a>
									<br>
									<div style="margin: 8px 0;">이렇게 귀여운 건 반칙입니다.</div>
								</div>
							</td>
							<td width="140">zamongpow**</td>
							<td width="120">2019.05.14</td>
						</tr>
					</table>
				</div>
				<div>
					<table class="goods_userPage_board" cellpadding="5">
						<tr height="25">
							<td width="80">9</td>
							<td width="80">
								<a href=""><img src="http://store.baemin.com/shop/data/goods/1556617064338s0.png"
									 class="goods_userPage_img"/></a>
							</td>
							<td class="goods_userPage_board_content">
								<div>
									<span style="height:20px; color: #2AC1BC; font-weight: 700;">답변 : </span>
									<span style="font-weight: 700;">오뚜기X배달의민족. 사골곰탕</span>
									&nbsp;&nbsp;
									<a href="">
										<u style="color:#999999; font-weight:600;">보러가기</u></a>
									<br>
									<div style="margin: 8px 0;">[배민문방구] 답변드립니다.</div>
								</div>
							</td>
							<td width="140">admin</td>
							<td width="120">2019.05.14</td>
						</tr>
					</table>
				</div>
				<!-- 페이징 -->
				<div class="goods_userPage_paging"><b>1</b></div>
			</form>
		</div>
	</div>
	<!-- 푸터이미지 -->
	<div id="footer">
		<div id="footer_img_area">
			<img src="../image/footer.PNG" id="footer_img">
		</div>
	</div>
</div>
</body>
</html>