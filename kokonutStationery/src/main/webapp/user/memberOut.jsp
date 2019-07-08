<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table width=1000 height=100% cellpadding=0 cellspacing=0 border=0>

  <!-- 우측 실행 화면 (두번째 td태그) -->
  <td valign=top width=100% height=100% class=outline_side>
   <div class="indiv" style="margin:0 10px 0 30px;"> <!-- start indiv -->
    <div class="mem_tit" style="font-size:22px; font-weight:700; text-align:left; color:#222;">
    	회원탈퇴
    </div>
    
    <form method="post" action="../user/memberDelete.do" name="memberOutForm" id="memberOutForm">
     <input type="hidden" id="userId" name="userId" value="${sessionScope.memId}">
     <!-- 탈퇴안내 -->
     <div style="margin:30px 0 0 0">
      <h5 class="join_tit in_stt" style="font-size:16px; font-weight:700; border-bottom:0px solid #dfdfdf; text-align:left;
      padding-bottom:0; margin:0 0 15px 0;">
      	탈퇴안내
      </h5>
     </div>
     <table width="100%" cellpadding="0" cellspacing="0" border="0">
      <tr class="box_con" style="font-size:13px; line-height:22px; font-weight:normal; color:#666;">
       <td>
        	불편하셨던 점이나 불만사항을 알려주시면 적극 반영하도록 하겠습니다.<br/>
        	회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.<br/>
        	- 회원 탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보 보호정책에 따라 관리 됩니다.<br/>
        	- 탈퇴 시 고객님께서 보유하셨던 적립금은 삭제 됩니다.
       </td>
      </tr>
     </table>
     
     <!-- 탈퇴하기(비밀번호 입력) -->
     <div style="margin:50px 0 10px 0">
      <h5 style="font-size:16px; font-weight:700; border-bottom:0px solid #dfdfdf; text-align:left;
      psffinh-bottom:0; margin:0;">탈퇴하기</h5>
     </div>
     
     <div style="font-size:13px; line-height:22px; font-weight:700; color:#222; margin-bottom:5px;">
      <label for="userPwd">비밀번호가 어떻게 되세요?</label>
     </div>
     <div>
      <input type="password" name="userPwd" id="userPwd" class="line" onchange="changePwd()"
      style="border:1px solid #DDD; width:200px; height:38px;
      padding-left:10px; font-size:13px; color:#333; border-radius:0;">
      <input type="hidden" id="chkPwd" value="">
     </div>
     
     <!-- 무엇이 불편하셨나요? (불만사항 체크) -->
     <div style="font-size:13px; line-height:22px; font-weight:700; color:#222; margin-top:20px; margin-bottom:5px;">
     	무엇이 불편하셨나요?
     </div>
     <div style="font-size:12px; line-height:21px; font-weight:400; color:#666; margin:0;">
      <div>
       <input type="checkbox" name="outComplain[]" value="01" id="complanChk0" style="height:13px;">
       <label>고객서비스(상담,포장 등) 불만</label>
      </div>
      <div>
       <input type="checkbox" name="outComplain[]" vlaue="02" id="complanChk1" style="height:13px;">
       <label>배송불만</label>
      </div>
      <div>
       <input type="checkbox" name="outComplain[]" value="03" id="complanChk2" style="height:13px;">
       <label>교환/환불/반품 불만</label>
      </div>
      <div>
       <input type="checkbox" name="outComplain[]" value="04" id="complanChk3" style="height:13px;">
       <label>방문 빈도가 낮음</label>
      </div>
      <div>
       <input type="checkbox" name="outComplain[]" value="05" id="complanChk4" style="height:13px;">
       <label>상품가격 불만</label>
      </div>
      <div>
       <input type="checkbox" name="outComplain[]" vlaue="06" id="complanChk5" style="height:13px;">
       <label>개인 정보유출 우려</label>
      </div>
      <div>
       <input type="checkbox" name="outComplain[]" value="07" id="complanChk6" style="height:13px;">
       <label>쇼핑몰의 신뢰도 불만</label>
      </div>
      <div>
       <input type="checkbox" name="outComplain[]" value="08" id="complanChk7" style="height:13px;">
       <label>쇼핑 기능 불만</label>
      </div>
     </div>	
     
     <!-- 고객님의 조언 -->
     <div style="font-size:13px; line-height:22px; font-weight:700; color:#222; 
     margin-top:20px; margin-bottom:5px;">고객님의 진심어린 충고 부탁드립니다.</div>
     <div>
      <textarea name="complainText" id="complainText" style="border:1px solid #DDD; width:100%; height:100px;
      background:#fff; margin-top:5px; padding-left:10px; border:1px solid #DDD; font-size:13px; color:#333; border-radius:0;">
      </textarea>
     </div>
     
     <!-- 탈퇴하기/취소버튼 -->
     <table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top:20px; margin-bottom:70px;">
      <tr>
       <td align="center" height="100">
        <div style="width:100%;" class="noline">
         <div style="width:150px; display:inline-block;">
          <input type="submit" id="memberOutBtn" style="display:inline-block; border:1px solid #DDD; text-align:center; height:60px; 
          width:150px; line-height:60px; border-radius:0; font-size:13px; font-weight:700; color:#a4a4a4; background:#ffffff; margin-top:2px;
          -webkit-appearance: none; cursor:pointer;" value="탈퇴하기">
         </div>
         <div style="width:145px; display:inline-block; padding-left:5px; background:#444444; cursor:pointer; ">
          <a href="javascript:void(0)" onclick="history.back()" style="text-decoration:none;">
           <span id="CancelBtn" style="width:145px; text-align:center; height:60px; line-height:60px; font-size:13px; 
           font-weight:700; color:#ffffff;">취소</span>
          </a>
         </div>
        </div>
       </td>
      </tr>
     </table>
     
    </form>	

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function changePwd(){
	var userId=$('#userId').val();
	var userPwd=$('#userPwd').val();			
	
	$.ajax({
		type:'post',
		url:'../user/checkPwd.do',
		data:{'userId':userId,
			'userPwd':userPwd},
		success:function(data){
			if(data=='exist'){
				$('#chkPwd').val('exist');	
			}else{
				$('#chkPwd').val('not_exist');	
			}
			
		}				
	});
}

$('#memberOutBtn').click(function(){
	if($('#userPwd').val()=='')
		alert('비밀번호를 입력하여 주십시요.');
	else if($("input:checkbox:checked").length == 0)
		alert('서비스불편사항을 1개 이상 체크하여 주십시요. \n\n 해당사항은 개선사항에 반영되어집니다.');
	else 
		var result = confirm("회원 탈퇴를 하시면 회원님의 모든 테이터(개인정보 등)가 삭제 되어집니다. \n 그래도 회원을 탈퇴하시겠습니까?");
		if(!result){return false;}
		
	
	if($('#chkPwd').val()=='not_exist'){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}else {
		alert("회원탈퇴");
		$('#memberOutForm').submit();
	}
});
</script>


   </div><!-- End indiv -->
  </td> <!-- 두번째 td태그 끝 -->

 </tr>
</table>    