<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 보내기</title>
<style>
.email_header{
	padding-left: 5%;
	width: 100%;
	background-color: #777;
	hegiht : 43px;
	line-height: 44px;
	font-size: 15px;
	font-weight: 700;
	color: #fff;
	margin: 0 ;
}
.email_table{
	margin : 0 auto;
}

.inputText{
	border:1px solid #DDD;
    padding-left: 10px;
    font-size:14px;
    line-height: 25px; 
    color: #333; 
    background-color:#fff;
    width:300px;

}
#content{
	width:95%;
	height: 300px;
}
.sendBtn{
	background-color: #444;
	color: #fff;
	width: 150px;
	height: 45px;
	border: none;
	cursor: pointer;
}
.sendTd{
    text-align: left;
    font-weight: normal;
    font-size: 12px;
    color: #A4A4A4;
    width: 20%;
}
.inputTitle{
	border:1px solid #DDD;
    padding-left: 10px;
    font-size:14px;
    line-height: 25px; 
    color: #333; 
    background-color:#fff;
    width:94%;
}
td{
	padding-left: 3%;
	width: 100%;
}
body{
	margin: 0;
}
</style>
</head>
<body>
<div class="email_header">
메일 보내기
	<a href="#" onclick="exit()"><img src="../image/closeBtn.png" style="position: absolute; left: 96%; top:10px ; width: 20px; height:20px;"></a>
</div>

<br>
<table id="email_table" width="100%">

<tr>

	<td class="sendTd">보내는사람</td>
	<td>
		<input type="text" class="inputText" name="sendUser" >
	</td>
</tr>
<tr>
	<td class="sendTd">보내는이메일</td>
	<td>
		<input type="text" class="inputText" name="sendEmail">
	</td>
</tr>
<tr>
	<td class="sendTd">제목</td>
	<td>
		<input type="text" class="inputTitle" name="title" >
	</td>
</tr>
<tr>
	<td colspan="2" height="300">
		<textarea class="inputText" id="content"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="center" style="padding-top: 20px;">
		<input type="button" value="보내기" class="sendBtn">
	</td>
</tr>
</table>
</body>
<script>
function exit(){
	window.close();
}
</script>
</html>