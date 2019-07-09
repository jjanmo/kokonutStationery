<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<link rel="stylesheet" href="../css/post.css" type="text/css">
<style>
.border_none_tr > td{border: none;}

#postSearchBtn{
	border: 0px;
    height: 30px;
    width: 80px;
    line-height: 27px;
    font-size: 12px;
    font-weight: 700;
    background-color: #444;
    color: fff;
    cursor: pointer;
}
</style>

<form name="" method="post" action="">
<table id="postTable" width="100%" border="1" cellspacing="0" class="box_style_01" 
			style="background-color: #fff;padding: 25px; border: 1px solid #ddd;">
<tr class="border_none_tr">
	<td width="130" height="35" style="margin:5px; align:center;" align="center">시도</td>
	<td width="120">
		<select name="sido" id="sido" style="width: 100px; height:30px;">
		<option>시도선택</option>
		<option>서울</option>
		<option>인천</option>
        <option>대전</option>
        <option>대구</option>
        <option>울산</option>
        <option>세종</option>
        <option>광주</option>
        <option>경기</option>
        <option>강원</option>
        <option>전남</option>
        <option>전북</option>
        <option>경남</option>
        <option>경북</option>
        <option>충남</option>
        <option>충북</option>
        <option>부산</option>
        <option>제주</option>
		</select>
	</td>
	<td width="120" height="35" align="center" style="margin:5px; align:center;">시.구.군&nbsp;</td>
	<td width="200"><input type="text" name="sigungu" id="sigungu" style="height:30px" size="20"></td>
</tr>
<tr class="border_none_tr">
	<td height="35" style="margin:5px; align:center;" align="center">도로명</td>
	<td colspan="3">
		<input type="text" name="roadname" id="roadname" style="height:30px" size="30">
		<input type="button" id="postSearchBtn" value="검 색">
	</td>
</tr>


</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/order.js"></script>











