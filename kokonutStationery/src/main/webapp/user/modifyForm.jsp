<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
div.passwordStrenth {background-color:#FFFFFF; border:1px #CCCCCC solid; padding:10px; width:263px;display:none; position:absolute;}

div.passwordStrenth p {margin:0;padding:5px 0 0 0; font-size:11px; font-family:dotum;color:#616161; }

div.passwordStrenth dl {margin:0;padding:0 6px 0 0;color:#373737; font-weight:bold;font-size:11px; font-family:dotum; }
div.passwordStrenth dl dt,
div.passwordStrenth dl dd {display:inline;font-size:11px; font-family:dotum;margin:0;height:15px;line-height:15px;}

div.passwordStrenth dl dt {color:#363636; font-weight:bold; width:95px;}

div.passwordStrenth dl dd {text-indent:0px;font-size:12px; width:110px;}
div.passwordStrenth dl dd.lv0 {color:#F52D00;background-position:20px 0;}
div.passwordStrenth dl dd.lv1 {color:#F52D00;background-position:20px 0;}
div.passwordStrenth dl dd.lv2 {color:#028EFF;background-position:20px -29px;}
div.passwordStrenth dl dd.lv3 {color:#46C32D;background-position:20px -59px;}


</style>

<style>
.memberCols1 {
width:100px;
text-align:left;
font-weight:700;
color:#222;
height:60px;
}
.memberCols2 {
text-align:left;
padding-left:10px;
}


#pwdManual { border:2px solid #333; z-index:1000; display:none; position:absolute; width:350px; background:#ffffff; margin:15px 0 0 226px; }
#pwdManual p { margin:-5px 0 0 0;padding:0px 30px 10px 30px;color:#333;font-size:14px;line-height:21px;font-weight:bold;}
#pwdManual p.close { background:none;padding:0;margin:10px 10px 0 0;text-align:right;}
#pwdManual ul {list-style:none;margin:0;padding:0px 30px 30px 30px;color:#999;}
#pwdManual ul li {color:#999; font-size:11px; line-height:17px;}

</style>



<table width=1000px height=100% cellpadding=0 cellspacing=0 border=0>
<tr>

<!-- 우측 실행 화면 (두번째 td태그) -->
<td valign=top width=100% height=100% bgcolor="ffffff">

<form id=modifyForm method=post action="../user/modify.do" >

<div class="indiv" style="margin:0 10px 0 30px;"> <!-- start indiv -->

<!-- 제목 부분 -->
<div class="join_tit in_stt" style="font-size: 18px; font-weight: 700; color:#222222; height:26.4px; text-align: left; margin:0 0 13px 0;">
  개인회원정보<div style="margin:12px 0 0 0;border-bottom: 2px solid #2ac1bc;float:right;font-size:12px;font-weight:700;color:#333;">필수입력사항</div>
</div>

<!-- 정보 입력 부분 -->
<div class="hundred">
 <table width=100% cellpading=0 cellspacing=0 border=0>

  <!-- 아이디 -->
  <tr>
   <td class="memberCols1" style="height:68px;">
    <font style="border-bottom: 2px solid #2ac1bc; font-size:12px;">아이디</font>
   </td>
   <td class="memberCols2">
   <input type="hidden" id="userId" name="userId" value="${sessionScope.memId }">
    <span style="font-size: 13px; font-weight:700;">${sessionScope.memId }</span> <!-- 아이디 출력 -->
   </td>
  </tr>
  
  <!-- 비밀번호 -->
  <tr>
   <td class="memberCols1" style="height:68px;">
    <font style="border-bottom: 2px solid #2ac1bc; font-size:12px;">비밀번호</font>
   </td>
   <!-- 비밀번호 변경 버튼-->
   <td class="memberCols2">
    <a id="pwdChange" href="javascript:void(0);">
     <span style="text-align:center; width:212px; height:38px; background:#444444; position: relative; line-height: 38px; float:left; 
     color:#ffffff; font-size: 12px;" >비밀번호 변경
     </span>
    </a>
    <a id="pwdManualOpen" href="javascript:void(0);" style="font-size:12px; margin:12px 0 0 15px; position:absolute; color:#999;">
    	<u>비밀번호 도움말</u> 
    </a></br>
     <!-- 비밀번호 도움말 창 -->
     <div id="pwdManual">
      <p class="close">
       <a id="pwdManualClose" href="javascript:void(0);">
        <img style="width: 15px;" src="../image/closeBtn.png"/>
       </a> 
      </p>
      <p>
       	비밀번호에 영문 대소문자,숫자,특수문자를 
       	<br/>
       	조합하시면 비밀번호 안전도가 높아져
       	<br/>
       	도용의 위험이 줄어듭니다.
       </p>
       <ul>
        <li>
      	 영문 대소문자는 구분이 되며, 한가지로만 입력은 위험합니다.
        </li>
        <li>
                   사용가능한 특수문자 :
         <br/>
         ! " @ # $ % ^ & ' ( ) * + = , - _ . : ; < > ? / ' ~ | { }
        </li>
        <li>
         ID, 주민번호,생일,전화번호 등의 개인정보와
         </br>
                    통산 사용 순서대로의 3자 이상 연속 사용은 피해주세요.
        </li>
        <li>
                     비밀번호는 주기적으로 바꾸어 사용하시는 것이 안전합니다.
        </li>           
       </ul>
     </div>
   </td> 
  </tr>
  
  <tr id="pwLayer01" style="display:none;">
   <td colspan=2 height=1 bgcolor="#f6f6f6" style="padding:0px;">
   </td>
  </tr>
  <tr id="pwLayer02" style="display:none; background-color: #f6f6f6;">
   <td class="memberCols1">&nbsp;</td>
   <!-- 비밀번호 변경창 -->
   <td class="memberCols2">
    <table cellpadding="0" cellspacing="0" border="0">
     <tr style="border: 0px; padding: 5px 0 5px 0; font-size:12px; color:#333;">
      <td style="border:0px; padding:17px 0 0 0; font-weight:700; ">
       <label>현재 비밀번호</label>
      </td>
      <td style="border:0px; padding:20px 15px 5px 15px;">
       <input type="password" name="userPwd" id="originalPwd" class="line" onchange="changePwd()" required
       style="border:1px solid #DDD; width:200px; height:38px; padding-left:10px; font-size:13px; color:#333; border-radius:0;"/>
       <input type="hidden" id="chkPwd" value="">
       <span style="font-size:11px; color:#999; padding-left:10px;">현재 비밀번호 입력</span>
      </td>
     </tr>
   
     <tr style="border:0px; padding:5px 0 5px 0; font-size:12px; color:#333;">
      <td style="padding:0px; font-weight:700;">
       <lable>새 비밀번호</lable>
      </td>
      <td style="padding:5px 15px;">
       <input type="password" name="newPwd" id="newPwd" class="line" required
       style="border:1px solid #DDD; width:200px; height:38px; padding-left:10px; font-size:13px; color: #333; border-radius:0;"
       maxlength="20" />
       
       
						  	
       <!-- 
       <div class="passwordStrenth" id="pwdAlert0" style="display:none;">
        <dl>
         <dt>비밀번호 안전도</dt>
         <dd id="pwdAlert-main" class="lv0">사용불가</dd>
        </dl>
        <p id="pwdAlert-sub" >비밀번호는 10자 이상 입력해주세요.</p>
       </div>
       
       <div class="passwordStrenth" id="pwdAlert1" style="display:none;">
        <dl>
         <dt>비밀번호 안전도</dt>
         <dd id="pwdAlert-main" class="lv1">사용불가</dd>
        </dl>
        <p id="pwdAlert-sub" >비밀번호는 영어, 숫자, 특수기호 중 <br>2가지 이상을 조합하여 10자리 이상 사용해주세요.</p>
       </div>
       
       <div class="passwordStrenth" id="pwdAlert2" style="display:none;">
        <dl>
         <dt>비밀번호 안전도</dt>
         <dd id="pwdAlert-main" class="lv2">낮음</dd>
        </dl>
        <p id="pwdAlert-sub" >예상하기 쉬운 비밀번호입니다.</p>
       </div>
       
       <div class="passwordStrenth" id="pwdAlert3" style="display:none;">
        <dl>
         <dt>비밀번호 안전도</dt>
         <dd id="pwdAlert-main" class="lv3">높음</dd> 
        </dl>
        <p id="pwdAlert-sub" >예측하기 힘든 비밀번호로 더욱 안전합니다.</p> 
       </div> -->
       
       <span style="font-size:11px; color:#999; padding-left:10px;">새 비밀번호를 입력</span>
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
     <tr style="border:0px; padding:5px 0 5px 0; font-size:12px; color:#333;">
      <td style="padding:0 0 17px 0; font-weight:700;">
       <label>새 비밀번호 확인</label>
      </td>
      <td style="padding:5px 15px 20px 15px;">
       <input type="password" name="confirmPwd" id="confirmPwd" option="regPass" maxLength="20" required
       class="line" style="border:1px solid #DDD; width:200px; height:38px; padding-left:10px; font-size:13px; color:#333; border-radius:0;">
       <span style="font-size:11px; color:#999; padding-left:10px;">새 비밀번호를 다시 입력</span>
      </td>
     </tr>
    </table>
   </td>  
  </tr> 
  
  <tr>
   <td colspan="2" height="20" style="padding:0px;"></td>
  </tr>
  
  <!-- 이름 -->
  <tr>
   <td class="memberCols1" style="height:68px;">
    <label style="border-bottom:2px solid #2ac1bc; font-size:12px;">이름</label>
   </td>
   <td class="memberCols2">
    <input type="text" name="userName" value="${sessionScope.memName }" class="line" style="border:1px solid #DDD; width:200px; height:38px; padding-left:10px; 
    font-size:13px; color:#333; border-radius:0;"  id="userName" required>
   </td>
  </tr> 
  
  <!-- 생년월일 -->
  <tr >
   <td class="memberCols1" style="vertical-align:top; padding-top:17px;">
    <font style="border-bottom:2px solid #2ac1bc; font-size:12px;">생년월일</font>
   </td>
   <td class="memberCols2" >
    <input type="text" name="userBirthYear" value="${userDTO.userBirthYear }" maxlength="4" class="line" 
    style="border:1px solid #DDD; width:60px; height:38px; text-align:center; font-size:13px; color:#333; margin:0 5px 0 0; 
    border-radius:0;" id="userBirthYear" required>년
    <input type="text" name="userBirthMonth" value="${userDTO.userBirthMonth }" maxlength="2" class="line"
    style="border:1px solid #DDD; width:40px; height:38px; text-align:center; font-size:13px; color:#333; margin:0 5px 0 10px; 
    border-radius:0;" id="userBirthMonth" required>월
    <input type="text" name="userBirthDay" value="${userDTO.userBirthDay }" maxlength="2" class="line"
    style="border:1px solid #DDD; width:40px; height:38px; text-align:center; font-size:13px; color:#333; margin:0 5px 0 10px; 
    border-radius:0;" id="userBirthDay" required>일
    
    <span style="padding-left:30px;">
     <input type="radio" name="userCal" style="margin-top:-1px; margin-bottom:0; border-color:#fff; vertical-align:middle;"
     value="s" id="solar" checked>
     <label>양력</label>
     <input type="radio" name="userCal" style="margin-top:-1px; margin-bottom:0; border-color:#fff; vertical-align:middle;"
     value="l" id="lunar">
     <label>음력</label>
    </span>
    
    <div class="noline" style="margin:6px 0 0 0; position:relative;">
     <span class="join_blue01" style="color:#333; font-weight:700; font-size:11px;">
    	회원가입은 만 14세 이상 고객만 가능합니다.&nbsp;&nbsp;
       <a id="contentView" href="javascript:void(0)" style="text-decoration:underline; font-size:11px; weight:700; color:#000000;">내용보기
       </a>
      <div id="content" style="display:none; color:#999; font-weight:300; margin-top:10px;">
       1. 배민문방구 서비스는 만 14세 미만의 아동의 회원가입을 제한하고 있습니다.</br>
       2. 정보통신망 이용촉진 및 정보보호 등에 관한 법률에는 만  14세미만 아동의 개인정보 수집 시 법정대리인의 동의를 받도록 규정하고 있으며, 생년월일을 허위로 기재하여 법정대리인의 
  	      동의없이 회원가입을 하는 경우
  	   <u>회원탈퇴 또는 서비스 이용이 제한 될 수 있음을 안내해 드립니다.</u> 
  	   <br>
  	   <br>
  	   <a id="contentClose" href="javascript:void(0)" style="text-decoration:underline; font-weight:500;">닫기
  	   </a> 		
      </div>
     </span>
    </div>
    <br>
    <br>
   </td>
  </tr>
  
  <!-- 이메일 -->
  <tr>
   <td class="memberCols1" style="vertival-align:top; padding-top:17px; position:absolute; margin-bottom:17px;">
    <label style="border-bottom:2px solid #2ac1bc; font-size:12px;">이메일</label>
   </td>
   <td class="memberCols2" style="padding-bottom:10px; ">
    <input type="text" name="userEmail" value="${sessionScope.memEmail }" id="userEmail" class="line"
    style="border:1px solid #DDD; width:200px; height:38px; padding-left:10px; font-size:13px; color:#333; position:relative; 
    border-radius:0; margin:5px 0 8px 0;" required>
    <a href="javascript:void(0)" onclick="" style="text-decoration:none;">
     <span id="checkEmailBtn" style="text-align:center; border:1px solid #ccc; width:112px; height:38px; position:absolute; margin-left:27px; margin-top:5px;
      padding:1px 0; color:#a4a4a4; line-height:40px; font-weight:700; font-size:12px;" align="absmiddle">메일 중복확인</span>
    </a>
    <div class="noline" style="margin:0 0 7px 0; position:relative;">
     <input type="checkbox" name="mailling" id="mailling" style="margin-top:0; margin-bottom:0; height:13px; vertical-align:middle;">
     <span class="join_blue01" style="color:#333; ">
      <label style="font-weight:700; font-size:11px; ">정보,이벤트메일수신</label>
      <font color="#bbb" style="font-size:11px;">주문 관련 정보,주요 공지사항 및 이벤트 당첨 안내 등은 수신 동의 여부에 관계없이 자동 발송됩니다.</font>
     </span>
    </div>
    <div class="join_red01"></div>
   </td>
  </tr>
  
  <!-- 휴대폰 -->
  <tr>
   <td class="memberCols1" style="vertical-align:top; padding-top:17px;">
    <font style="border-bottom:2px solid #2ac1bc; font-size:12px;">휴대폰</font>
   </td>
   <td class="membercols2" style="padding-bottom:15px; padding-left:10px; height:74px;">
    <input type="text" name="userPhone1" value="${userDTO.userPhone1 }" size="4" maxlength="3" id="userPhone1"
    class="line" style="border:1px solid #DDD; width:50px; height:38px; text-align:center; font-size:13px; color:#333; margin:0 0 8px 0;
    border-radius:0;" required>-
     <input type="text" name="userPhone2" value="${userDTO.userPhone2 }" size="4" maxlength="4" id="userPhone2"
    class="line" style="border:1px solid #DDD; width:50px; height:38px; text-align:center; font-size:13px; color:#333; margin:0 0 8px 0;
    border-radius:0;" required>-
     <input type="text" name="userPhone3" value="${userDTO.userPhone3 }" size="4" maxlength="4" id="userPhone3"
    class="line" style="border:1px solid #DDD; width:50px; height:38px; text-align:center; font-size:13px; color:#333; margin:0 0 8px 0;
    border-radius:0;" required>
    <br>
    <div class="noline" style="margin:0 0 1px 0; position:relative; height:16px;">
     <input type="checkbox" name="sms" id="sms" style="margin-top:0; margin-bottom:0; height:13px; vertical-align:middle;">
     <span class="join_blue01" style="color:#333;">
      <label style="font-weight:700; font-size:11px;">정보,이벤트SMS수신</label>
      <font color="#bbb" style="font-size:11px;">주문 관련 정보 등 주요 안내 사항은 수신 동의 여부에 관계없이 자동 발송됩니다</font>
     </span>
    </div>
   </td>
  </tr>
  
  <!-- 남기는 말씀 -->
  <tr>
   <td class="memberCols1" style="font-size:12px;">
   	 남기는 말씀
   </td>
   <td class="memberCols2">
    <textarea name="userMsg" class="line" style="border:1px solid #ddd; padding:10px; width:610px; height:60px;
    font-size:13px; color:#333; border-radius:0; line-height:1.5; resize:none;">
    </textarea>
   </td>
  </tr>
  
  <!-- 경계선 -->
  <tr>
   <td colspan="2" height="30" style="padding:0px;"></td>
  </tr>
  <tr>
   <td colspan="2" height="1" bgcolor="#e1e1e1" style="padding:0px;"></td>
  </tr>
  
 </table>
</div>

<!-- 뒤로,수정버튼 -->
<table width=100%" cellpadding="0" cellsapcing="0" border="0" style="margin-top:20px;">
 <tr>
  <td align="center" height="100">
   <div style="width:100%" class="noline">
    <div style="width:178px; height:58px; border:1px solid #a4a4a4;  cursor:pointer; display:inline-block;">
     <a href="javascript:void(0);" style="text-decoration:none;" onclick="history.back()">
      <span id="backBtn" style="width:178px; font-size:15px; color:#a4a4a4; font-weight:700; 
      text-align:center; height:60px; line-height:60px; cursor:pointer;">뒤로</span>
     </a>
    </div>
   
    <div style="width:180px; display:inline-block; padding-left:5px;">
     <input type="submit" id="modifyBtn" style="display:inline-block; cursor:pointer; text-align:center; height:60px; width:180px;
     background-color:#444; line-height:60px; font-size:16px; font-weight:700; color:#ffffff; border-radius:0; margin-top:2px;" value="수정">
    </div>
   </div>
  </td>
 </tr>
</table>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
//비밀번호변경버튼
$('#pwdChange').click(function(){
	$('#pwLayer01').css("display","table-row");
	$('#pwLayer02').css("display","table-row");
});

//비밀번호 도움말 열기
$('#pwdManualOpen').click(function(){
	$('#pwdManual').css("display","block");
});
//비밀번호 도움말 닫기
$('#pwdManualClose').click(function(){
	$('#pwdManual').css("display","none");
});

//내용보기 열기
$('#contentView').click(function(){
	$('#content').css("display","block");
});
//내용보기 닫기
$('#contentClose').click(function(){
	$('#content').css("display","none");
});

//새비밀번호 유효성검사
$(document).ready(function(){
	var oldVal='';
	
	$('#newPwd').on('propertychange change keyup paste input', function(){
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
				$('#pwdChkGood').css('visibility','visible');
				$('#pwdChk').addClass('pwdOk');
				$('#pwdChk').removeClass('pwdWarn');
				
			}else if( /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^*+=-]).{10,20}$/.test(currentVal) ){
				//영어대소문자 숫자 특수기호로 10자리 이상으로 만들었을 때 - 보통
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
			}
		}
	    
	});//pwdDiv
	
	$('#newPwd').on('focusout', function() {
		
		$('#pwdChkWarn').css('visibility','hidden');
		$('#pwdChkWarn2').css('visibility','hidden');	
		$('#pwdChkOk').css('visibility','hidden');
		$('#pwdChkGood').css('visibility','hidden');
	 });
	
});

//메일 중복 확인
$('#checkEmailBtn').click(function(){
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
});

function changePwd(){
	var userId=$('#userId').val();
	var originalPwd=$('#originalPwd').val();			
	
	$.ajax({
		type:'post',
		url:'../user/checkPwd.do',
		data:{'userId':userId,
			'userPwd':originalPwd},
		success:function(data){
			
			if(data=='exist'){
				$('#chkPwd').val('exist');	
			}else{
				$('#chkPwd').val('not_exist');	
			}
			
		}				
	});
}

//유효성검사
$('#modifyBtn').click(function(){
	
	var userName = $('#userName').val();
	var userBirthYear = $('#userBirthYear').val();
	var userBirthMonth = $('#userBirthMonth').val();
	var userBirthDay = $('#userBirthDay').val();
	
	//나이계산 변수
	var nowDate = new Date();
	var youDate = new Date(parseInt(userBirthYear),parseInt(userBirthMonth),parseInt(userBirthDay));
	var dif = nowDate - youDate;
    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
    var cMonth = cDay * 30;// 월 만듬
    var cYear = cMonth * 12; // 년 만듬
	
	var userEmail =$('#userEmail').val();
	var userPhone1 = $('#userPhone1').val();
	var userPhone2 = $('#userPhone2').val();
	var userPhone3 = $('#userPhone3').val();
	var newPwd = $('#newPwd').val();
	var pwdChkClass = $('#pwdChk').attr('class');
	
	
	if(!/^(?=.*[가-힣]).{2,20}$/.test(userName)){
		alert('올바른 이름 형식이 아닙니다.');
		$('#userName').focus();
		return false;
	}else if(!/^(?=.*[0-9]).{4,5}$/.test(userBirthYear)){
		alert('올바른 생일 년 형식이 아닙니다.');
		$('#userBirthYear').focus();
		return false;
	}else if(!/^(?=.*[0-9]).{1,2}$/.test(userBirthMonth)){
		alert('올바른 생일 월 형식이 아닙니다.');
		$('#userBirthMonth').focus();
		return false;
	}else if(!/^(?=.*[0-9]).{1,2}$/.test(userBirthDay)){
		alert('올바른 생일 일 형식이 아닙니다.');
		$('#userBirthDay').focus();
		return false;
	}else if(parseInt(dif/cYear)<14){
		//14세 이상만 가입가능
		alert("[오류] 14세 이상만 가입가능");
		$('#userBirthYear').focus();
		return false;
		
	}else if(!/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i.test(userEmail)){
		alert('올바른 이메일 형식이 아닙니다.');
		$('#userEmail').focus();
		return false;
	}else if(!/^(?=.*[0-9]).{3,4}$/.test(userPhone1)){
		alert('올바른 전화번호 앞자리 형식이 아닙니다.');
		$('#userPhone1').focus();
		return false;
	}else if(!/^(?=.*[0-9]).{4,5}$/.test(userPhone2)){
		alert('올바른 전화번호 중간자리 형식이 아닙니다.');
		$('#userPhone2').focus();
		return false;
	}else if(!/^(?=.*[0-9]).{4,5}$/.test(userPhone3)){
		alert('올바른 전화번호 뒷자리 형식이 아닙니다.');
		$('#userPhone3').focus();
		return false;
	}else if($('#pwLayer01').css('display') !='none'){
		if($('#originalPwd').val()==''){
			alert('현재 비밀번호를 입력해주세요.');
			return false;
		}else if($('#newPwd').val()==''){
			alert('새 비밀번호를 입력해주세요.');
			return false;
		}else if($('#confirmPwd').val()==''){
			alert('새 비밀번호 확인을 입력해주세요.');
			return false;
		}else if($('#newPwd').val()!=$('#confirmPwd').val()){
			alert('새 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
			return false;
		}else if(newPwd.length <10){
			alert('새 비밀번호는 10자리 이상 작성해주세요.');
			return false;
		}else if(pwdChkClass!='pwdOk')	{
			alert("[새 비밀번호] 입력형식오류");
			return false;
		}else if($('#chkPwd').val()!='exist'){
			alert('현재 비밀번호를 정확하게 입력하여 주세요.');						
			return false;
		}
	}else
		$('#modifyForm').submit();
		
});  


</script> 


</div> <!-- end indiv -->

</form>

</td> <!-- 두번째td 태그 끝 -->

</tr>
</table>    
    