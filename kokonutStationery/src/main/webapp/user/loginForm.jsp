<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="../css/join.css">   
   
    
<div class="indiv" style="margin:80px 150px 50px 150px;"><!-- Start indiv -->

	<div class="login_bg" style="text-align: center;">
		<form method="post" id="userLoginForm" name="userLoginForm" >
			<div class="form_box">
				<div class="info">
					<p>
						<label style="display: block; position:absolute; top:16px; left:15px; z-index:8; font-size:15px; color:#999; line-height:16px">아이디</label>
						<input type="text" name="userId" placeholder="아이디" id="userId"  
						style="position:relative; border:1px solid #DDD;width:450px; height:50px; padding-left: 20px; font-size:15px; color: #333; background-color:#fff; -webkit-appearance:none; border-radius:0;">
					</p>
					<p>
						<label style="display: block; position:absolute; top:16px; left:15px; z-index:8; font-size:15px; color:#999; line-height:16px">비밀번호</label>
						<input type="password" name="userPwd" tabindex="2" placeholder="비밀번호" id="userPwd" 
						style="position:relative; border:1px solid #DDD; width:450px; height:50px; padding-left: 20px; font-size:15px; color: #333; background-color:#fff; -webkit-appearance:none;border-radius:0;">
					</p>
				</div>
				<div style="width:100%" >
					<div style="width: 470px; display: inline-block;">
						<input type="button" id="loginBtn" class="main-button" style="border:0; text-align:center; height:64px; background-color:#444; width:470px; line-height:64px; -webkit-appearance: none; border-radius:0;" value="로그인">
					</div>
				</div>
			</div>
		</form>
		<div style="text-align:center; margin-top:15px;">
			<div>
				<a href="/kokonutStationery/user/find_id.do" onfocus="blur()" 
				style="font-size:12px; color:#999 ;line-height:13px">아이디 찾기</a>&nbsp;&nbsp;&nbsp;
				<span style="display: inline-block; width: 1px; height: 13px; background: #e4e4e5; text-indent: -999em; color: #999; text-align: center; line-height: 11px;">|</span>&nbsp;&nbsp;&nbsp;
				
				<a href="/kokonutStationery/user/find_pwd.do" onfocus="blur()" 
				style="font-size:12px; color:#999 ;line-height:13px">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;
				<span style="display: inline-block; width: 1px; height: 13px; background: #e4e4e5; text-indent: -999em; color: #999; text-align: center; line-height: 11px;">|</span>&nbsp;&nbsp;&nbsp;
				
				<a href="/kokonutStationery/user/join.do" onfocus="blur()" 
				style="font-size:12px; color:#999 ;line-height:13px">회원가입</a>
			</div>
		</div>
	</div>


	<div class="hundred no_mem_area" style="background:#efefef; margin:60px 0 0 0;">
		<form name="noUserLoginForm" id="noUserLoginForm" method="post" action="" onsubmit="return chkForm">
			<p style="color:#666; line-height: 23px;padding: 20px 0 10px 0;">비회원으로 상품을 구매하셨거나 구입을 원하시면<br>아래에 주문자명과 주문번호를 입력해 주시기 바랍니다.</p>
			<div width="100%" style="text-align:center;padding-bottom: 40px;">
				<table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
					<tbody>
					<tr>
						<td style="width: 8%; text-align: right; padding-right: 10px;">
							<label for="order_name" style="text-align: right; width: 60px;">주문자명</label>
						</td>
						<td style="width: 18%; text-align: left;">
							<input type="text"  class="member_input01" style="width:200px;" required>	
						</td>
						<td style="width: 8%; text-align: right; padding-right: 10px;">
							<label style="text-align: right; width: 60px;">주문번호</label>
						</td>
						<td style="width: 18%; text-align: left;">
							<input type="text"  class="member_input01" style="width:200px;" required>	
						</td>
						<td style="width: 10%;">
							<input type="submit" value="확인" id="order_num" class="main-button-s" 
							style="text-align:center;height: 35px; background-color:#444;width: 85px;margin-left: 10px;border: none;line-height: 35px; -webkit-appearance: none; border-radius:0;">
						</td>
						
					</tr>
					</tbody>
				</table>
			</div>
		</form>

	</div>

</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	
$('#loginBtn').on('click', function(){

	var userId = $('#userId').val();
	var userPwd = $('#userPwd').val();
	
	if(userId == "" || userPwd == ""){
		alert("아이디 또는 비밀번호 입력 형식 오류입니다.");
		
	}	
	else{
		$.ajax({
			type : 'post',
			url  : '/kokonutStationery/user/login.do',
			data : {"userId" : userId,
					"userPwd" : userPwd	},
			dataType : 'text',
			success : function(data){
				if(data == 'not_exist'){
					alert("아이디 또는 비밀번호 오류입니다");
					location.href="/kokonutStationery/user/loginForm.do";
				}
				else{ //data == 'exist' 로그인 성공
					location.href="/kokonutStationery/main/index.do";
				}
			}
		});
	}	
});	


</script>

