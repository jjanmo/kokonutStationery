<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품문의작성</title>
<link rel="stylesheet" href="../css/goods_qna_register.css?alert">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
<body>

<form id="qnaboardForm" name="qnaboardForm" method="post" action="" >
<div class="main">
	<!-- 헤더부분 + close창 -->
	<div class="goods_qna_register_header">상품문의
		<a href="javascript:this.close()">
			<img src="../image/close_btn.png" class="goods_qna_register_closeBtn">
		</a>
	</div>
	<!-- 내용부분 -->
	<div class="goods_qna_register_content">
		<div style="border-bottom: 1px solid #eee; height: 82px;">
			<div style="width: 830px; margin: 0 auto 20px auto;">
				<img src="${qnaboardDTO.thumbImg }" 
					 class="goods_qna_register_img" name="thumbImg" >
				<input type="hidden" name="thumbImg" value="${qnaboardDTO.thumbImg }">
				<div class="goods_qna_register_goodsName">
					<input type="hidden" name="qnaboardCode" value="${qnaboardDTO.qnaboardCode }">
					<input type="hidden" name="productCode" value="${qnaboardDTO.productCode }">
					<input type="hidden" name="productName" value="${qnaboardDTO.productName }">
					<input type="hidden" name="discountPrice" value="${qnaboardDTO.discountPrice }">
					<b name="productName">${qnaboardDTO.productName }</b><br>
					<span name="discountPrice">${qnaboardDTO.discountPrice }</span>
				</div>
			</div>
		</div>
		<div style="width:100%; margin-top: 20px;">
			<table class="goods_qna_register_content_table">
				<tr>
					<td class="goods_qna_register_category" >작성자</td>
					<td>
						<input type="hidden" name="userId" value="${sessionScope.memId }">
						<input type="text"  value="${sessionScope.memName }" required
						style="border: 1px solid #ddd; width: 300px; height: 36px; padding: 1px 0 1px 10px;">
					</td>
				</tr>
				<tr>
					<td class="goods_qna_register_category" >이메일</td>
					<td>
						<input type="text" name="userEmail" value="${qnaboardDTO.userEmail }"
						style="border: 1px solid #ddd; width: 300px; height: 36px; padding: 1px 0 1px 10px; ">
						&nbsp;<input type="checkbox">&nbsp;&nbsp;받습니다.
					</td>
				</tr>
				<tr>
					<td class="goods_qna_register_category">문자메세지</td>
					<td>
						<input type="text" name="userPhone" value="${qnaboardDTO.userPhone }"
						style="border: 1px solid #ddd; width: 300px; height: 36px; padding: 1px 0 1px 10px; ">
						&nbsp;<input type="checkbox">&nbsp;&nbsp;받습니다.
					</td>
				</tr>
				<tr>
					<td class="goods_qna_register_category">비밀글</td>
					<td><input type="checkbox" name="secret" value="1"> 비밀글</td>
				</tr>
				<tr>
					<td class="goods_qna_register_category">제목</td>
					<td>
						<input type="text" id="qnaboardSubject" name="qnaboardSubject" value="${qnaboardDTO.qnaboardSubject }"required
						style="border: 1px solid #ddd; width: 700px; height: 36px; padding: 10px; ">
					</td>
				</tr>
				<tr>
					<td class="goods_qna_register_category">내용</td>
					<td>
						<textarea id="qnaboardContent" name="qnaboardContent"  required
						style="border: 1px solid #ddd; width: 700px; height:250px; padding: 10px 0 1px 10px; ">${qnaboardDTO.qnaboardContent }</textarea>					    
					</td>
				</tr>
			</table>
			<div class="goods_qna_register_information">
				<span style="font-weight: 700; font-size:14px; padding-bottom:10px;">개인정보 수집 및 이용에 대한 안내</span>
				<br>
				회사는 제휴안내 및 상품문의에 관련하여 최소한의 범위 내에서 아래와 같이 개인정보 수집·이용합니다.
				<img src="../image/private.gif" class="goods_qna_register_privateImg" style="width: 100%;">
			
				<p style="text-align:center; margin-top:20px;">
					<input type="radio" name="goods_qna_register_privateRadio" value="yes" >&nbsp;
					<label style="color: #222; font-weight:700;">동의합니다</label>
					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					<input type="radio" name="goods_qna_register_privateRadio" value="no" id="privateRadio_agree">&nbsp;
					<label style="color: #666; font-weight:500;">동의하지 않습니다</label>
				</p>
			</div>
		</div>
	</div>
	<div class="goods_qna_register_submitDiv">
		<input type="button" class="goods_qna_modify_submitBtn" value="확인">
	</div>
</div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
//개인정보 동의 
function private_agree(){
	var privateRadio = $('input[name="goods_qna_register_privateRadio"]:checked').val();
	
	if(privateRadio!='yes'){
		alert('개인정보 수집 및 이용에 대한 안내에 동의해주셔야합니다.');
		return false;
	}
}
</script>
<script>
$(document).ready(function(){
	
	//서브밋버튼
	$('.goods_qna_modify_submitBtn').click(function(){
		var param =$('#qnaboardForm').serialize();
		var privateRadio = $('input[name="goods_qna_register_privateRadio"]:checked').val();
		
		
		if($('#qnaboardSubject').val()=='')
			alert("제목을 입력해주세요.");
		else if($('#qnaboardContent').val()=='')
			alert("내용을 입력해주세요.");
		else if(privateRadio!='yes'){
			alert('개인정보 수집 및 이용에 대한 안내에 동의해주셔야합니다.');
		}else{
			
			$.ajax({
				type:'post',
				url:'../qna/qnaboardModify.do',
				data:param,
				success:function(){
					alert("문의 수정을 완료했습니다.");
					window.close();
				}
				
			});
			
		}
	});
	
	//서브밋버튼 hover
	$('.goods_qna_register_submitBtn').hover(function(){
		$(this).css("background-color", '#2b2b2b');
	}, function(){
		$(this).css("background-color", '#444444');
	});
});





</script>
</body>
</html>