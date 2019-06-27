<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="../css/join.css">    

<div class="indiv" style="margin:80px 150px 150px 150px;"><!-- Start indiv -->
	<div class="mem_tit" style="margin-bottom:13px; font-size: 26px; font-weight: 700; text-align: center;">
		비밀번호 찾기
	</div>

	<form name="findPwdOkForm" method="post" action="../mail/auth">
		<table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-top:30px;">
			
			<tbody>
				<tr align="center" valign="middle">
					<td>
						<div class="method-wrap" style="width: 450px; height: 210px;">
							<div class="method" style="background:#fff">
								<div style="font-size: 16px; font-weight: bold; color: #333; padding: 45px 50px 10px 50px;">
								등록한 '이메일주소' 인증 후 재발급
								</div>
								<div style="font-size: 13px; line-height:21px; color: #777; padding: 0 50px 30px 50px;">
								회원정보상에 등록되어 있는 이메일주소로 인증 후<br>비밀번호가 재발급 됩니다.
								</div>
								<table cellpadding="0" cellspacing="0" border="0" 
								style="width: 100%; background: #666; font-size: 13px; color: #fff; font-weight: bold; margin: 15px 0 0 0;">
									<tbody>
										<tr>
											<td style="padding: 18px 20px; text-align:center;">
												<div id="userEmail" name="userEmail">
													앞에서 입력한 이메일값
												</div>
											</td>
											<td style="padding: 0; width: 150px;">												
												<div id="acceptAuth" style="background:#444; cursor:pointer; text-align:center; height:50px; line-height:50px; vertical-align: middle;">
													인증번호 받기
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
</div>
<!-- find_pwd_ok.jsp 끝  -->

<!-- 인증번호창 -->
<div id="modalLayer" class="password-auth-form-wrapper">
	<div class="modalContent contents">
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>	
			<h3 style="color:#A6A6A6;">이메일주소 인증</h3>
		</td>
	</tr>
	
	<tr>
		<td>
			<div style="font-size: 13px; line-height:21px; color: #777; padding: 30px 50px 30px 50px;">
				<b style="color:#333;">고객님의 이메일주소로 인증번호가 전송되었습니다.</b><br>
				전송된 인증번호를 입력하여 주세요.<br>
				전송량이 많을 경우 지연될 수 있습니다.
			</div>		
		</td>
	</tr>
	
	<tr>
		<td>
			<form name="authForm" method="post" action="../mail/confirmAuth">
				<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-bottom:30px;">
				<tbody>
					<tr>
						<td align="center">
							<div style="background:#F6F6F6;">
								<input type="text" name="authKey" id="authKey" maxlength="8" placeholder="인증번호" required
								style="position:relative; border:1px solid #DDD; width: 210px; height:40px; padding-left: 10px; margin:20px 10px 20px 20px; font-size:14px; color: #333; background-color:#fff; -webkit-appearance:none; border-radius:0;">
								<div class="main-button-s" id="reSubmit"
								style="text-align:center;height: 38px;float: right;margin-top: 21px;margin-right: 20px;width: 80px;line-height: 38px;">재전송</div>
							</div>
						</td>
					<tr>
						<td>			
							<div style="margin-left:80px; width:100%; padding:15px;">
								<div style="width: 120px; display: inline-block; padding-left: 3px;">
									<input type="button" id="okBtn" class="main-button-s" 
									style="text-align:center; height:45px; background-color:#444; width:120px; line-height:45px; -webkit-appearance: none; border-radius:0; border:none;" value="확인"> 
								</div>
								<div style="width: 120px; display: inline-block; padding-left: 3px;">
									<li id="cancelBtn" class="sub-button-s" style="text-align:center; height:45px; line-height:45px;">취소</li>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
				</table>
			</form>
		</td>
	</tr>	
	</table>
	</div>
</div>


<!-- 비밀번호 변경/등록 -->

<div id="modalLayer2" class="password-auth-form-wrapper">		
	
		<div class="modalContent">
			<h3 style="color:#A6A6A6;">비밀번호 변경/등록</h3>
			<p style="text-align:center; font-size:14px; padding:5px 0 5px 0;">
				<b style="font-size:13px; color:#333">인증이 완료되었습니다.</b> 새로운 비밀번호를 등록하여 주세요.
			</p>
		

			<form name="pwdForm" method="post" >
				<input type="hidden" name="passwordSkin" value="Y"><!-- 비밀번호 작성 규칙 보완 스킨패치 여부 -->
	
				<div class="form">
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tbody>
					<tr>
						<th>
							<div style="font-size:12px; color: #222; margin-left: 20px; font-weight: 500; margin-top: 8px;">새 비밀번호</div>
						</th>
						<th></th>
						<td style="position:relative;">
							<input type="password" name="userPwd" id="userPwd"  maxlength="20" required
							style="border:1px solid #DDD;width: 90%; height:40px; padding-left: 10px; margin:10px 0px 3px 0; font-size:14px; color: #333; background-color:#fff; -webkit-appearance:none; border-radius:0;">
							
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
							  		비밀번호는 영어, 숫자, 특수기호 중 <br>2가지 이상을 조합하여 10자리 이상 사용해주세요.
							  	</div>
							  	<div id="pwdChkOk" style="visibility:hidden;
							  	width:300px; height:35px; font-size:11px; position:absolute; background:#fff; border:1px solid #DDD; padding:8px; margin:-5 0 0 5;">
							  		<strong>비밀번호 안전도 <font style="color:#2ac1bc">낮음</font></strong><br>
							  		예상하기 쉬운 비밀번호 입니다.
							  	</div>
							  	<div id="pwdChkGood" style="visibility:hidden;
							  	width:300px; height:35px; font-size:11px; position:absolute; background:#fff; border:1px solid #DDD; padding:8px; margin:-5 0 0 5;">
							  		<strong>비밀번호 안전도 <font style="color:blue">높음</font></strong><br>
							  		예측하기 힘든 비밀번호로 더욱 안전합니다.
							  	</div>
					  		</div>
							
							
						</td>
					</tr>
					<tr>
						<th>
							<div style="font-size:12px; color: #222; margin-left: 20px; font-weight: 500; margin-top: -5px;">새 비밀번호 확인</div>
						</th>
						<th></th>
						<td>
							<input type="password" name="rePwd" id="rePwd" maxlength="20" required
							style="border:1px solid #DDD;width: 90%; height:40px; padding-left: 10px; margin:3px 0px 10px 0px; font-size:14px; color: #333; background-color:#fff; -webkit-appearance:none; border-radius:0;">
						</td>
					</tr>
					</tbody>
					</table>
				</div>

				
				<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-bottom:15px;">
					<tbody>
					<tr>
						<td align="center">
							<div style="width:100%" class="noline">
								<div style="width: 120px; display: inline-block; padding-left: 3px;">
									<li id="cancelBtn2" class="sub-button-s" style="text-align:center; height:45px; line-height:45px;">취소</li></a>
								</div>
								<div style="width: 120px; display: inline-block; padding-left: 3px;">
									<input type="button" id="okBtn2" class="main-button-s" style="text-align:center; height:45px; width:120px; line-height:45px; -webkit-appearance: none; border-radius:0; border:none;" value="확인"> 
								</div>
							</div>
						</td>
					</tr>
					</tbody>
				</table>
			</form>

		<div id="pwManual">
			<p style="text-align:center; font-size: 12px; line-height:21px; color: #777; ">
				비밀번호에 영문 대소문자, 숫자, 특수문자를 조합하시면<br>비밀번호 안전도가 높아져 도용의 위험이 줄어듭니다.
			</p>		
		</div>
	</div>
</div>




<style type="text/css">

#modalLayer{display:none; position:relative;}
#modalLayer .modalContent{width:440px; height:300px; padding:20px; border:1px solid #ccc; position:fixed; left:50%; top:50%; z-index:1; background:#fff;}
#modalLayer .modalContent button{position:absolute; right:0; top:0; cursor:pointer;}

#modalLayer2{display:none; position:relative;}
#modalLayer2 .modalContent{width:440px; height:300px; padding:20px; border:1px solid #ccc; position:fixed; left:50%; top:50%; z-index:1; background:#fff;}
#modalLayer2 .modalContent button{position:absolute; right:0; top:0; cursor:pointer;}


</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	  var modalLayer = $("#modalLayer");
	  var modalLayer2 = $('#modalLayer2');
	  var modalCont = $(".modalContent");
	  var marginLeft = modalCont.outerWidth()/2;
	  var marginTop = modalCont.outerHeight()/2; 
		
	  
	  //인증번호 받기
	  $("#acceptAuth").click(function(){
		  $.ajax({
				type:'POST',
				url:'/finalproject/mail/auth',
				data:{'userEmail':'sing2song@naver.com' },//'pg='+$('#pg').val() ==> board.js로 빼내어 hidden값으로 pg를 넘겨줬을때
				dataType:'json',
				success:function(data){	
					alert(JSON.stringify(data));
				}
			}); 
		alert("인증번호가 고객님의 이메일로 전송되었습니다.");
	    modalLayer.fadeIn("slow");
	    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
	    $(this).blur();
	    $("#authKey").focus(); 
	    return false;
	  });
	
	  //재전송
	  $('#reSubmit').click(function(){
		  if (confirm("인증번호를 재전송 하시겠습니까?\n ※인증번호를 재전송하시면 \n 이전에 전송되었던 인증번호는 사용하실 수 없습니다.") == true){
			  ////확인
				alert("인증번호가 재전송 되었습니다.");
				 $.ajax({
						type:'POST',
						url:'/finalproject/mail/auth',
						data:{'userEmail':'sing2song@naver.com' },//'pg='+$('#pg').val() ==> board.js로 빼내어 hidden값으로 pg를 넘겨줬을때
						dataType:'json',
						success:function(data){	
							alert(JSON.stringify(data));
						}
				}); 
			 }else{   
				 //취소
			     return false;
			 }
	  });
	  
	  //인증번호 확인
	  $('#okBtn').click(function(){
		  var authKey = $('#authKey').val();
		  
		  $.ajax({
				type:'POST',
				url:'/finalproject/mail/confirmAuth',
				data:{'authKey': authKey },
				success:function(data){
					
					 if(data=='auth_fail'){
						alert("인증번호를 정확히 입력해 주세요.");
					}else if(data=='auth_ok'){
						modalLayer.fadeOut();
						modalLayer2.fadeIn("slow");
					} 
					
				}
		}); 
		  authKey='';
	  });
	  
	  //인증번호취소
	  $("#cancelBtn").click(function(){
		  $('#authKey').val('');
		  modalLayer.fadeOut();
		  
	  });
	  
	  
		//비밀번호 유효성
		var oldVal='';
		
		$('#userPwd').on('propertychange change keyup paste input', function(){
			var currentVal = $(this).val();
			
			if(currentVal.length == 0){
				
				//$('#pwdChk').hide();
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
		    	$('#pwdChkWarn').css('visibility','visible').css('z-index','2');	
		    	$('#pwdChk').addClass('pwdWarn');
		    	$('#pwdChk').removeClass('pwdOk');
		    	
			}else if(currentVal.length>=10){
				//10자리이상일 때
				if( /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,20}$/.test(currentVal) ){
					//영어대소문자 숫자 특수기호로 10자리 이상으로 만들었을 때 
					//alert("영어숫자특수기호");
					$('#pwdChkGood').css('visibility','visible').css('z-index','2');
					$('#pwdChk').addClass('pwdOk');
					$('#pwdChk').removeClass('pwdWarn');
					
				}else if( /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]).{10,20}$/.test(currentVal) ){
					//영어대소문자  특수기호로 10자리 이상으로 만들었을 때 
					//alert("영어특수기호");
					$('#pwdChkOk').css('visibility','visible').css('z-index','2');
					$('#pwdChk').addClass('pwdOk');
					$('#pwdChk').removeClass('pwdWarn');
					
				}else if( /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,20}$/.test(currentVal) ){
					//영어대소문자 숫자 10자리 이상으로 만들었을 때 
					//alert("영어숫자");
					$('#pwdChkOk').css('visibility','visible').css('z-index','2');
					$('#pwdChk').addClass('pwdOk');
					$('#pwdChk').removeClass('pwdWarn');
					
				}else{
					$('#pwdChkWarn2').css('visibility','visible').css('z-index','2');
					$('#pwdChk').addClass('pwdWarn');
					$('#pwdChk').removeClass('pwdOk');
					
					//alert("에러");	
				}
			}
		    
		});
		
		$('#userPwd').on('focusout', function() {
			
			$('#pwdChkWarn').css('visibility','hidden');
			$('#pwdChkWarn2').css('visibility','hidden');	
			$('#pwdChkOk').css('visibility','hidden');
			$('#pwdChkGood').css('visibility','hidden');
		 });
	  	
	  
	  //비밀번호재설정확인
	  $('#okBtn2').click(function(){
		  
		  var userPwd = $('#userPwd').val();
		  
		  if(pwdChkClass!='pwdOk'){
			
			$('#userPwd').focus();
			alert("올바른 비밀번호가 아닙니다.");
			
		}else if($('#userPwd').val()!=$('#rePwd').val()){
			
			alert("비밀번호가 같지않습니다.");
			$('#rePwd').focus();
		}else{
			$.ajax({
				type:'POST',
				url:'/finalproject/mail/changePwd',
				data:{'userPwd': userPwd },
				success:function(){
					
						alert("비밀번호가 변경되었습니다.");
						location.href="../member/loginForm";
					
				}
				
			});
			
		}
	  });
	  
	  //비밀번호재설정취소
	  $("#cancelBtn2").click(function(){
		  $('#userPwd').val('');
		  $('#rePwd').val('');
		  modalLayer2.fadeOut();
	  });
	  
	});
</script>