<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{font-family:'Hanna', sans-serif;}
#user_info th{
	width: 90px;
    height: 50px;
    text-align: center;
    font-weight: 500;
    font-size:20px;
    background-color: #f5f4f4;
    padding: 9px 9px 7px;
}

#user_info td{
	width:250px;
	padding-left:10px;
	font-size:18px;
}

#user_info td>input{
	font-size:18px;
}

.regist_reset{
	min-width: 140px;
    padding: 0 30px;
    font-size: 16px;
    font-weight: bold;
    line-height: 40px;
    cursor: pointer;
}

#registBtn{
    color: #fff;
    border: 1px solid transparent;
    background-color: #1b87d4;
    font-weight:normal;
}

#registResetBtn{
    color: #1b87d4;
    border: 1px solid #1b87d4;
    background-color: #fff;
    font-weight:normal;
}

.inputText{
	height: 27px;
	padding-left: 5px;
}

#userName{width:100px;}
.birthInput{width:50px;}
.phoneInput{width:50px;}
#userPoint{width:80px; text-align:right;}
#totalPayment{width:120px; text-align:right;}

.modal {
   display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 1; /* Sit on top */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgb(0,0,0); /* Fallback color */
   background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
    
   /* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 30%; /* Could be more or less, depending on screen size */                          
}

.modalDiv{
   width:130px;
   cursor:pointer;
   background-color:#DDDDDD;
   text-align: center;
   padding-bottom: 10px;
   padding-top: 10px;
}

</style>
</head>

<!-- modal window div 부분 -->
 <!-- The Modal -->
 <div id="open_confirmModal" class="modal">

   <!-- Modal content -->
   <div class="modal-content">
             <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">정 보 수 정</span></b></span></p>
             <p style="text-align: center; line-height: 1.5;"><br />회원정보를 수정하시겠습니까?</p>
             <p><br /></p>

         <div class="modalDiv" id="confirmOK_Modal" style="display: inline-block;">
             <span class="pop_bt" style="font-size: 13pt; " >
             	확인
             </span>

         </div>
         <div class="modalDiv" id="close_Modal" style="float:right;">
             <span class="pop_bt" style="font-size: 13pt;" >
				취소
             </span>
         </div>
   </div>

 </div>
 <!--End Modal-->

<div id="main_wrap" align="left" style="width: 750px; margin: 30px auto;">

	<div>
		<h1 style="font-weight:normal;">회원정보관리</h1>
	</div>
	<div id="user_info">
		<table id="user_info_table" border="1" style="width:100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5; margin-top: 50px;">
			<tr>
				<th>아 이 디</th>
				<td>
					<div id="userId">${userId }</div>
				</td>
			</tr>
			<tr>
				<th>이  름</th>
				<td>
					<input type="text" id="userName" value="${userDTO.userName }" class="inputText"/>
					<span id="userNameDiv"></span>
				</td>
			</tr>
			<tr>
				<th>생 년 월 일</th>
				<td>
					<input type="text" class="birthInput" id="userBirthYear" value="${userDTO.userBirthYear }"/>
					<input type="text" class="birthInput" id="userBirthMonth" value="${userDTO.userBirthMonth }"/>
					<input type="text" class="birthInput" id="userBirthDay" value="${userDTO.userBirthDay }"/>
					<span id="userBirthDiv"></span>
				</td>
			</tr>
			<tr>
				<th>이 메 일</th>
				<td>
					<input type="text" class="inputText" id="userEmail" value="${userDTO.userEmail }" />
					<span id="userEmailDiv"></span>
				</td>
			</tr>
			<tr>
				<th>휴대폰 번호</th>
				<td>
					<input type="text" class="phoneInput" id="userPhone1" value="${userDTO.userPhone1 }"/>
					<input type="text" class="phoneInput" id="userPhone2" value="${userDTO.userPhone2 }"/>
					<input type="text" class="phoneInput" id="userPhone3" value="${userDTO.userPhone3 }"/>
					<span id="userPhoneDiv"></span>
				</td>
			</tr>
			<tr>
				<th>포 인 트</th>
				<td>
					<input type="text" id="userPoint" value="${userDTO.userPoint }" />
				</td>
			</tr>
			<tr>
				<th>총 구매금액</th>
				<td>
					<input type="text" id="totalPayment" value="${userDTO.totalPayment }"/>
				</td>
			</tr>
			<tr>
				<th>가 입 일</th>
				<td>
					<div id="joinDate"><fmt:formatDate pattern="yyyy-MM-dd" value="${userDTO.joinDate }"/></div>
				</td>
			</tr>
		</table>
	</div>
	<div align="center" style="margin-top:50px;">
		<input type="button" class="regist_reset" id="registBtn" value="정보 수정">
		<input type="button" class="regist_reset" id="registResetBtn" value="취소">
	</div>

</div>

<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$().ready(function(){
	
	$('#registBtn').click(function(){
		$('#userNameDiv').empty();
		$('#userBirthDiv').empty();
		$('#userEmailDiv').empty();
		$('#userPhoneDiv').empty();
		
		if($('#userName').val()=='')
			$('#userNameDiv').text("이름을 입력하세요").css('color', 'red').css('font-size','8pt');
		else if($('#userBirthYear').val()=='' || $('#userBirthMonth').val()=='' || $('#userBirthDay').val()=='')
			$('#userBirthDiv').text("생일을 입력하세요").css('color', 'red').css('font-size','8pt');
		else if($('#userEmail').val()=='')
			$('#userEmailDiv').text("이메일을 입력하세요").css('color', 'red').css('font-size','8pt');
		else if($('#userPhone1').val()=='' || $('#userPhone2').val()=='' || $('#userPhone3').val()=='')
			$('#userPhoneDiv').text("핸드폰 번호을 입력하세요").css('color', 'red').css('font-size','8pt');	
		else {
			$('#open_confirmModal').show();
		}
	});
	
	$('#registResetBtn').click(function(){
		window.close();
	});
	
	/* 모달 창 닫기 */
	$('#close_Modal').click(function(){
	   $('#open_confirmModal').hide();
	});
	
	//모달 창에서 확인버튼 클릭 시 수정 진행
	$('#confirmOK_Modal').click(function(){
		$.ajax({
			type : 'post',
			url : '/kokonutStationery/admin/userModify.do',
			data : {'userId' : '${userId}',
					'userName' : $('#userName').val(),
					'userBirthYear' : $('#userBirthYear').val(),
					'userBirthMonth' : $('#userBirthMonth').val(),
					'userBirthDay' : $('#userBirthDay').val(),
					'userEmail' : $('#userEmail').val(),
					'userPhone1' : $('#userPhone1').val(),
					'userPhone2' : $('#userPhone2').val(),
					'userPhone3' : $('#userPhone3').val(),
					'userPoint' : $('#userPoint').val(),
					'totalPayment' : $('#totalPayment').val()
					}				
		});
		alert('수정 성공');
		window.close();
	});
	
	
	
});

</script>