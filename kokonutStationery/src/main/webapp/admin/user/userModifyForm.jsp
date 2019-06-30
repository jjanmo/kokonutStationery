<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{font-family:'Hanna', sans-serif;}
#user_info th{
	width: 154px;
    height: 35px;
    text-align: center;
    font-weight: 500;
    background-color: #f5f4f4;
    padding: 9px 9px 7px;
}

#user_info td{
	width:80%;
	padding-left:10px;
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

</style>
</head>

<div id="main_wrap" align="left" style="width: 1000px; margin: 30px auto;">

	<div>
		<h1 style="font-weight:normal;">회원정보관리</h1>
	</div>
	<div id="user_info">
		<table id="user_info_table" border="1" style="width:100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5; margin-top: 50px;">
			<tr>
				<th>아이디</th>
				<td>
					<div id="userId"></div>
				</td>
			</tr>
			<tr>
				<th>이 름</th>
				<td>
					<input type="text"  class="inputText" />
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" />
					<input type="text" />
					<input type="text" />
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" class="inputText" />
				</td>
			</tr>
			<tr>
				<th>휴대폰 번호</th>
				<td>
					<input type="text" />
				</td>
			</tr>
			<tr>
				<th>포인트</th>
				<td>
					<input type="text"  class="inputText" />
				</td>
			</tr>
			<tr>
				<th>배송주소</th>
				<td>
					<input type="text" />
				</td>
			</tr>
			<tr>
				<th>배송 연락처</th>
				<td>
					<input type="text" />
				</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>
					<input type="text" class="inputText" readonly />
				</td>
			</tr>
		</table>
	</div>
	<div align="center" style="margin-top:50px;">
		<input type="button" class="regist_reset" id="registBtn" value="정보 수정">
		<input type="button" class="regist_reset" id="registResetBtn" value="취소">
	</div>

</div>



</form>