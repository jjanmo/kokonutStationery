<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="../css/join.css">    

    
<div class="indiv" style="margin:80px 150px 50px 150px;"><!-- Start indiv -->
	<div class="mem_tit" style="margin-bottom:13px; font-size: 26px; font-weight: 700; text-align: center;">
	비밀번호 찾기
	</div>
	<form method="post" name="fm" action="" onsubmit="return chkPwd();" id="form">
		<div class="hundred no_mem_area" style="background:#efefef;">
		
			<div class="login_bg" style="padding-bottom:5px;">
				<h4 style="font-size:13px; color:#666; line-height: 23px;padding: 20px 0 0 0; font-weight: normal;">가입하실 때 입력하신 정보와 일치할 경우<br><b>E-mail로 비밀번호</b>를 보내드립니다.</h4>
				<div class="form_box" style="padding-bottom:0;">
					<div class="info" style="padding-bottom:0;">
						<p style="padding:0;">
							<label style="display: block; position:absolute; top:16px; left:15px; z-index:8; font-size:15px; color:#999; line-height:16px">아이디</label>
							<input name="userId" type="text" placeholder="아이디" id="userId" required
							style="position:relative; border:1px solid #DDD;width:460px; height:50px; padding-left: 20px; font-size:15px; color: #333; background-color:#fff; -webkit-appearance:none; border-radius:0;">
						</p>
						<p style="padding:0;">
							<label style="display: block; position:absolute; top:16px; left:15px; z-index:8; font-size:15px; color:#999; line-height:16px">이름</label>
							<input name="userName" type="text" placeholder="이름" id="userName" required
							style="position:relative; border:1px solid #DDD;width:460px; height:50px; padding-left: 20px; font-size:15px; color: #333; background-color:#fff; -webkit-appearance:none; border-radius:0;">
						</p>
						<p style="padding:0;">
							<label style="display: block; position:absolute; top:16px; left:15px; z-index:8; font-size:15px; color:#999; line-height:16px">메일주소</label>
							<input name="userEmail" type="text" placeholder="메일주소" id="userEmail" required
							style="position:relative; border:1px solid #DDD;width:460px; height:50px; padding-left: 20px; font-size:15px; color: #333; background-color:#fff; -webkit-appearance:none; border-radius:0;">
						</p>
					</div>					
				</div>
				
				<div style="width:100%">
					<div style="width: 470px; display: inline-block;">
						<input type="submit" value="찾기" class="main-button" 
						style="border:0px; text-align:center; height:64px; background-color:#444; width:470px; line-height:64px; -webkit-appearance: none; border-radius:0;">
					</div>
				</div>
				
				
			</div>
		</div>
		
		
			
		<div align="center" style="padding:0 0 80px 0" class="noline">
			<div style="width: 150px; display: inline-block; padding-left: 3px;">
				<a href="/kokonutStationery/user/loginForm.do">
					<li class="main-button-s" style="text-align:center; height:50px; width:150px; line-height:50px;">로그인하기</li>
				</a>
			</div>
			<div style="width: 150px; display: inline-block; padding-left: 3px;">
				<a href="/kokonutStationery/user/find_id.do">
					<li class="sub-button-s" style="text-align:center; height:50px; width:150px; line-height:50px;">아이디찾기</li>
				</a>
			</div>
		</div>
	
	</form>

</div>

<script type="text/javascript">
function chkPwd(){
	if($('#userName')!='aaa'){
		alert("사용자정보가 존재하지 않습니다.");
		return false;
	}
	
}
</script>
