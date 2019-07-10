<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="left_mypage" style="width:160px; position:relative; margin:0 0 30px 20px;">
	<div class="title_mypage">고객센터</div>
	<div class="line_mypage"></div>
	<table width="100%" cellpadding=0 cellspacing=0 border=0 class="lnbMyMenu">
		<tr>
			<th><a href="/kokonutStationery/service/noticeboard.do" >공지사항</a></th>
		</tr>
		<tr>
			<%-- <th>
				<a onclick="checkLogin('${memId}')" id="onettone" style="cursor:pointer">1:1문의게시판</a>
			</th> --%>
		</tr>
		<tr>
			<th><a href="/kokonutStationery/user/find_id.do" >ID찾기</a></th>
		</tr>
		<tr>
			<th><a href="/kokonutStationery/user/find_pwd.do" >비밀번호찾기</a></th>
		</tr>
		
	</table>
</div>

<script>

function checkLogin(memId){
	if(memId == ""){
		alert("로그인하셔야 본 서비스를 이용하실 수 있습니다");
		location.href ="/kokonutStationery/user/loginForm.do";
	}
}

</script>