<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form id="joinForm" method="post" action="/kokonutStationery/user/joinOk.do" onsubmit="return chkForm();">
	<div class="indiv"><!-- Start indiv -->

		<div class="in_tit" style="font-size: 22px; font-weight: 700; text-align: left;color:#222;">
			회원가입
		</div>
	
		
		<div class="join_tit" style="font-size: 18px; font-weight: 700; text-align: left; margin: 35px 0 13px 0;">
 				개인회원정보
			<div class="small" 
			style="margin:12px 0 0 0;border-bottom: 2px solid #2ac1bc;float:right;font-size:12px;font-weight:700;color:#333;">필수입력사항</div>				   
		</div>	
		
		<!-- 회원정보쓰기 -->
		<div class="memberInfo">
		
			<table id="join_table_01" width="100%" cellpadding="5" cellspacing="0" border="0">
					<tbody>
						
						<!-- 아이디 -->
						<tr>
						  <td class="memberCols1">
						  	<font style="font-weight:700;color:#333; border-bottom: 2px solid #2ac1bc;">아이디</font>
						  </td>
						  <td class="memberCols2">
							  <input type="text" name="userId" id="userId" value="" maxlength="16" required >
							  <input type="hidden" name="chkId" id="chkId" >
							  <input type="button" class="sub-button-s" id="checkIdBtn" 
							  style="text-align:center; width: 112px; height: 42px; position: absolute; margin: -41px 0 0 223px; padding: 12px 0; line-height: 16px; font-size: 12px;" align="absmiddle"
							  value="아이디중복체크">
							  
						  </td>
						</tr>
						
						<!-- 비밀번호 -->
						<tr>
						  <td class="memberCols1">
						  	<font style="font-weight:700;color:#333; border-bottom: 2px solid #2ac1bc;">비밀번호</font>
						  </td>
						  <td class="memberCols2">
						  	<input type="password" name="userPwd" id="userPwd" maxlength="20" required>
						  	
						  	<div id="pwdChk" class="pwdWarn">
							  	<!-- 비밀번호 안전단계 -->
							  	<div id="pwdChkWarn" style="visibility:hidden;
							  	width:300px; height:35px; font-size:11px; position:absolute; background:#fff; border:1px solid #DDD; padding:8px; margin:-5 0 0 5;">
							  		<strong>비밀번호 안전도 <font style="color:red">사용불가</font></strong><br>
							  		비밀번호는 10자리 이상 사용해주세요.
							  	</div>
							  	<div id="pwdChkWarn2" style="visibility:hidden;
							  	width:300px; height:40px; font-size:11px; position:absolute; background:#fff; border:1px solid #DDD; padding:8px; margin:-5 0 0 5;">
							  		<strong>비밀번호 안전도 <font style="color:red">사용불가</font></strong><br>
							  		비밀번호는 영어, 숫자, 특수기호 중 영어를 포함한<br> 2가지 이상을 조합하여 10자리 이상 사용해주세요.
							  	</div>
							  	<div id="pwdChkOk" style="visibility:hidden;
							  	width:300px; height:35px; font-size:11px; position:absolute; background:#fff; border:1px solid #DDD; padding:8px; margin:-5 0 0 5;">
							  		<strong>비밀번호 안전도 <font style="color:#9FC93C">낮음</font></strong><br>
							  		예상하기 쉬운 비밀번호 입니다.
							  	</div>
							  	<div id="pwdChkOk2" style="visibility:hidden;
							  	width:300px; height:35px; font-size:11px; position:absolute; background:#fff; border:1px solid #DDD; padding:8px; margin:-5 0 0 5;">
							  		<strong>비밀번호 안전도 <font style="color:#2ac1bc">보통</font></strong><br>
							  		적절한 비밀번호 입니다.
							  	</div>
							  	<div id="pwdChkGood" style="visibility:hidden;
							  	width:300px; height:35px; font-size:11px; position:absolute; background:#fff; border:1px solid #DDD; padding:8px; margin:-5 0 0 5;">
							  		<strong>비밀번호 안전도 <font style="color:blue">높음</font></strong><br>
							  		예측하기 힘든 비밀번호로 더욱 안전합니다.
							  	</div>
						  	</div>
						  	
						  </td>
						</tr>
						
						<!-- 비밀번호 확인 -->
						<tr>
						  <td class="memberCols1">
						  	<font style="font-weight:700;color:#333; border-bottom: 2px solid #2ac1bc;">비밀번호확인</font>
						  </td>
						  <td class="memberCols2">
						  	<input type="password" name="rePwd" id="rePwd" maxlength="16" required>
						  	
						  </td>
						</tr>
						
						<!-- 이름 -->
						<tr>
						  <td class="memberCols1">
						  	<font style="font-weight:700;color:#333; border-bottom: 2px solid #2ac1bc;">이름</font>
						  </td>
						  <td class="memberCols2">
						    <input type="text" name="userName" id="userName" value="" required>
						  	
						  </td>
						</tr>
						
						<!-- 생년월일 -->
						<tr>
						  <td class="memberCols1" style="vertical-align: top; padding-top:17px">
						    <font style="font-weight:700;color:#333; border-bottom: 2px solid #2ac1bc;">생년월일</font> 
						    
						  </td>
						  <td class="memberCols2">
						  	<input type="text" name="userBirthYear" id="userBirthYear" maxlength="4" 
						  	style="width:60px;" required>년
						    <input type="text" name="userBirthMonth" id="userBirthMonth" maxlength="2" 
						    style="width:40px;" required>월
						    <input type="text" name="userBirthDay" id="userBirthDay" maxlength="2" 
						    style="width:40px;"required>일
							
						    <span style="padding-left:30px">
						      <input type="radio" name="userCal" 
						      style="margin-top:-1px; margin-bottom:0; border-color: #fff; vertical-align: middle;" value="s" id="solar" checked>양력
						      <input type="radio" name="userCal" 
						      style="margin-top:-1px; margin-bottom:0; border-color: #fff; vertical-align: middle;" value="l" id="lunar"> 음력
						    </span>
						    <br>
						    
							
							  <span class="join_blue01" style="margin:12px 0 0 0; position: relative; font-size:13px; color:#333; font-weight:500;">
							   	 회원가입은 만 14세 이상 고객만 가능합니다.&nbsp;&nbsp;
								  <a href="javascript:void(0)" id="contentShow" style="font-weight:300; color:#222; text-decoration: underline;">
									내용보기
								  </a>
							 </span>
							 
								<div id="ageLimitDiv" class="join_blue01" style="display: none; color:#999; font-weight:300; margin-top:5px;">
								     1. 배민문방구 서비스는 만 14세 미만의 아동의 회원가입을 제한하고 있습니다.<br>
								     2. 정보통신망 이용촉진 및 정보보호 등에 관한 법률에는 만 14세미만 아동의 개인정보 수집 시 법정대리의 동의를 받도록 규정하고 있으며, 생년월일을 허위로 기재하여 법정대리인의 동의없이 회원가입을 하는 경우 
								     <strong>회원탈퇴 또는 서비스 이용이 제한 될 수 있음을 안내해 드립니다.</strong>
								</div>
									
							  <br><br>
						  </td>
						</tr>


						<!-- 이메일 -->
						<tr>
						    <td class="memberCols1" style="vertical-align: top; padding-top:17px">
						      <font style="font-weight:700;color:#333; border-bottom: 2px solid #2ac1bc;">이메일</font>											 
						    </td>
					        <td class="memberCols2" style="padding-bottom: 10px;">
					          <input type="text" name="userEmail" id="userEmail" 
					          style="position:absolute; margin:0 0 8px 0" required>
					          <input type="hidden" name="chkEmail" id="chkEmail" >          
					          <input type="button" class="sub-button-s" id="checkEmailBtn"
							  style="text-align:center;width: 112px;height: 42px; position:relative; margin-left:227px;  padding: 12px 0; line-height: 16px; font-size:12px;" align="absmiddle"
							  value="메일 중복확인">
					        
					          
					          <div style="margin:12px 0 0 0; position: relative;">
						          <input type="checkbox" name="mailling" id="mail_confirm" style="margin-top:0; margin-bottom:0; height:13px; vertical-align:middle;">
						          <span class="join_blue01" style="color:#333;">
							          <label style="font-weight:500;">정보,이벤트메일수신&nbsp;&nbsp;&nbsp;
							          	<font color="#bbb"> 주문 관련 정보, 주요 공지사항 및 이벤트 당첨 안내 등은 수신 동의 여부에 관계없이 자동 발송됩니다.</font>
							          </label>
						          </span>
					          </div>
					         
					        </td>
						</tr>

						<!-- 휴대폰 -->
						<tr>
							  <td class="memberCols1" style="vertical-align: top; padding-top: 17px;">
							    <font style="font-weight:700;color:#333; border-bottom: 2px solid #2ac1bc;">휴대폰</font>
							  </td>
							  <td class="memberCols2" style="padding-bottom:15px;">
						          <input type="text" name="userPhone1" id="userPhone1" value="" size="4" maxlength="4" 
						          style=" width:50px;"required> -
						          <input type="text" name="userPhone2" id="userPhone2" value="" size="4" maxlength="4" 
						          style=" width:50px;"required> -
						          <input type="text" name="userPhone3" id="userPhone3" value="" size="4" maxlength="4" 
						          style=" width:50px;"required>
						          <br>
						          <div style="margin:4px 0 0 0; position: relative;">
							          <input type="checkbox" name="sms" id="sms" 
							          style="margin-top:0; margin-bottom:0; height: 13px; vertical-align: middle;">
							          <span class="join_blue01" style="color:#333;">
								          <label style="font-weight:500;">정보,이벤트SMS수신&nbsp;&nbsp;&nbsp;
								          	<font color="#bbb">주문 관련 정보 등 주요 안내 사항은 수신 동의 여부에 관계없이 자동 발송됩니다.</font>
								          </label>
							          </span>
						          </div>
					          </td>
						</tr>
						
						<!-- 말씀 -->
						<tr>
						  <td class="memberCols1">
						    	<font style="font-weight:700;color:#333;"> 남기는 말씀 </font>
						  </td>
						  <td class="memberCols2">
						  	<textarea name="userMsg" class="line" 
						  	style="border:1px solid #ddd; padding: 10px; width:610px; height: 100px; font-size:13px; color:#333; -webkit-appearance:none; border-radius:0; line-height: 1.5; resize: none;"></textarea>
						  </td>
						</tr>
						
					</tbody>
			</table>
		
		</div>
		
		<!-- 이전/다음 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top:20px; margin-bottom:70px;">
		      <tbody>
			      <tr>
			        <td align="center" height="100">
			          <div style="width:100%" class="noline">
			            <div style="width: 180px; display: inline-block;">
			            	<div onclick="location.href='/kokonutStationery/user/join.do'" class="sub-button-s" 
							style="text-align:center; height:60px; width:150px; line-height:55px; font-size: 14px; font-weight:700;">뒤로</div>
			            
			            </div>
			            <div style="width: 180px; display: inline-block; padding-left: 5px;">
							<input type="submit" id="userWriteBtn" class="main-button-s" 
							style="border:0px; text-align:center; height:60px; width:150px; line-height:55px; font-size: 14px; font-weight:700;" value="회원가입">			
						</div>					
			          </div>
			        </td>
			      </tr>
		    </tbody>
	    </table>
	    <!-- 이전/다음 table끝 -->
	    
	
	</div>	
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/joinForm.js"></script>
<script type="text/javascript">
//비밀번호유효성검사
$(document).ready(function(){
	//가입제한나이안내
	$('#contentShow').click(function(){
		$('#ageLimitDiv').toggle();
	});
	
	//비밀번호 유효성
	var oldVal='';
	
	$('#userPwd').on('propertychange change keyup paste input', function(){
		var currentVal = $(this).val();
		
		if(currentVal.length == 0){

			$('#pwdChkWarn').css('visibility','hidden');
			$('#pwdChkWarn2').css('visibility','hidden');	
			$('#pwdChkOk').css('visibility','hidden');
			$('#pwdChkGood').css('visibility','hidden');
		}
		
	    if(currentVal == oldVal) {
	        return;
	    }
	 	
	    oldVal = currentVal;
	    
	    if(currentVal.length<10){
	    	//10자리미만일 때 
	    	$('#pwdChkWarn').css('visibility','visible');	
	    	$('#pwdChk').addClass('pwdWarn');
	    	$('#pwdChk').removeClass('pwdOk');
	    	
		}else if(currentVal.length>=10){
			//10자리이상일 때
			
			if( /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{15,20}$/.test(currentVal) ){
				//영어대소문자 숫자 특수기호로 15자리 이상으로 만들었을 때 - 높음
				//alert("영어숫자특수기호");
				$('#pwdChkGood').css('visibility','visible');
				$('#pwdChk').addClass('pwdOk');
				$('#pwdChk').removeClass('pwdWarn');
				
			}else if( /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^*+=-]).{10,20}$/.test(currentVal) ){
				//영어대소문자  숫자 특수기호로 10자리 이상으로 만들었을 때 - 보통
				//alert("영어특수기호");
				$('#pwdChkOk2').css('visibility','visible');
				$('#pwdChk').addClass('pwdOk');
				$('#pwdChk').removeClass('pwdWarn');
				
			}else if( /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]).{10,20}$/.test(currentVal) ){
				//영어대소문자  특수기호로 10자리 이상으로 만들었을 때 - 낮음
				//alert("영어특수기호");
				$('#pwdChkOk').css('visibility','visible');
				$('#pwdChk').addClass('pwdOk');
				$('#pwdChk').removeClass('pwdWarn');
				
			}else if( /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,20}$/.test(currentVal) ){
				//영어대소문자 숫자 10자리 이상으로 만들었을 때 - 낮음
				//alert("영어숫자");
				$('#pwdChkOk').css('visibility','visible');
				$('#pwdChk').addClass('pwdOk');
				$('#pwdChk').removeClass('pwdWarn');
				
			}else if( /^(?=.*[0-9])(?=.*[!@#$%^*+=-]).{10,20}$/.test(currentVal) ){
				//숫자  특수기호로 10자리 이상으로 만들었을 때 - 낮음
				//alert("숫자특수기호");
				$('#pwdChkOk').css('visibility','visible');
				$('#pwdChk').addClass('pwdOk');
				$('#pwdChk').removeClass('pwdWarn');
				
			}else{
				$('#pwdChkWarn2').css('visibility','visible');
				$('#pwdChk').addClass('pwdWarn');
				$('#pwdChk').removeClass('pwdOk');
				//alert("에러");	
			}
		}
	    
	});//pwdDiv
	
	$('#userPwd').on('focusout', function() {
		
		$('#pwdChkWarn').css('visibility','hidden');
		$('#pwdChkWarn2').css('visibility','hidden');	
		$('#pwdChkOk').css('visibility','hidden');
		$('#pwdChkOk2').css('visibility','hidden');
		$('#pwdChkGood').css('visibility','hidden');
	 });
	
});//document.ready

//아이디 중복체크
$('#checkIdBtn').on('click', function(){
	$.ajax({
		type : 'post',
		url  : '/kokonutStationery/user/checkId.do',
		data : "userId=" + $('#userId').val(),
		dataType : 'text',
		success : function(data){
			if(data == 'exist'){
				alert("이미 등록된 아이디입니다");
			}
			else if(data == 'not_exist'){
				alert("사용 가능합니다");
				$('#chkId').val($('#userId').val());
			}
		}
	});
});

//이메일 중복체크
$('#checkEmailBtn').on('click', function(){
	
	if($('#userEmail').val()==''){
		alert("이메일을 입력해주세요.");
	}else{
		$.ajax({
			type : 'post',
			url  : '/kokonutStationery/user/checkEmail.do',
			data : "userEmail=" + $('#userEmail').val(),
			dataType : 'text',
			success : function(data){
				if(data == 'exist'){
					alert("이미 등록된 이메일입니다. 다시 작성해 주십시요!");
				}
				else if(data == 'not_exist'){
					alert("사용 가능합니다");
					$('#chkEmail').val($('#userEmail').val());
				}
			}
		});
	}
});

</script>
