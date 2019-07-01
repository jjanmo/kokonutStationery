<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품후기작성</title>
<link rel="stylesheet" href="../css/goods_review_register.css?alert">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../js/goods_review_register.js?alert"></script>
</head>
<body>
<form id="goods_review_registerForm" method="post" action="">
<div class="main">
	<!-- 헤더부분 + close창 -->
	<div class="goods_review_register_header">상품후기작성
		<a href="javascript:this.close()">
			<img src="../image/close_btn.png" class="goods_review_register_closeBtn">
		</a>
	</div>
	<!-- 내용부분 -->
	<div class="goods_review_register_content">
		<div style="border-bottom: 1px solid #eee; height: 82px;">
			<div style="width: 500px; margin: 0 auto 20px auto;">
				<img src="${goodsDTO.thumbImg }" 
					 class="goods_review_register_img" name="thumbImg">
				<div class="goods_review_register_goodsName">
					<b name="productName">${goodsDTO.productName }</b><br>
					<span name="discountPrice">${goodsDTO.discountPrice }</span>
				</div>
			</div>
		</div>
		<div style="width:100%; margin-top: 20px;">
			<table class="goods_review_register_content_table">
				<tr>
					<td class="goods_review_register_category" >작성자</td>
					<td>
						<input type="text" name="userName" required
						style="border: 1px solid #ddd; width: 150px; height: 36px; padding: 1px 0 1px 10px; ">
					</td>
				</tr>
				<tr>
					<td class="goods_review_register_category" >제목</td>
					<td>
						<input type="text" name="reviewSubject" required
						style="border: 1px solid #ddd; width: 430px; height: 36px; padding: 1px 0 1px 10px; ">
					</td>
				</tr>
				<tr>
					<td class="goods_review_register_category">내용</td>
					<td>
						<textarea name="reviewContent" required
						style="border: 1px solid #ddd; width: 430px; height:115px; padding: 1px 0 1px 10px; "></textarea>
					</td>
				</tr>
				<tr>
					<td class="goods_review_register_category" style="padding-bottom: 45px;" >이미지</td>
					<td>
						<input type="file" name="reviewImage" style="margin-top: 10px; font-size: 12px;"><br><br>
						- 파일은 최대 1개까지 업로드가 지원됩니다. <br>
						- 파일은 가로 사이즈가 500px보다 클 경우 자동 리사이즈 됩니다.
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 푸터(작성완료 버튼) -->
	<div class="goods_review_register_submitDiv">
		<input type="submit" class="goods_review_register_submitBtn" value="글올리기">
	</div>
</div>
</form>
</body>
</html>