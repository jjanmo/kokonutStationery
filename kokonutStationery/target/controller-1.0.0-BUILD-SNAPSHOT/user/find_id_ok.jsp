<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="../css/join.css">    
	
<div class="indiv" style="margin:80px 200px 150px 200px;"><!-- Start indiv -->
	<div class="mem_tit" style="margin-bottom:13px; font-size: 26px; font-weight: 700; text-align: center;">
	아이디 찾기
	</div>

	<div class="hundred result_search">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tbody>
				<tr>
					<td align="center">
						" <span class="span_red">${search_name}</span> 회원님의 아이디는 <span class="span_blue">${userId}</span> 입니다. "
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="search_other_btn">
		<a href="/kokonutStationery/user/loginForm.do" class="member_btn_style03">로그인하기</a>
		<a href="/kokonutStationery/user/find_pwd.do" class="member_btn_style04">비밀번호찾기</a>
	</div>

</div>