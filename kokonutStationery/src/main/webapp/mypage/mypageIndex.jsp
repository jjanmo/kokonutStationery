<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="../css/mypage.css">    


<table cellpadding=0 cellspacing=0 border=0 class="outline_both">
	<tr>
		<td valign=top width=20% nowrap>
			<!-- 마이페이지 -->
			<jsp:include page="mypageSide.jsp" />
		</td>
		<td valign=top width=80% height=100% bgcolor="" class="outline_side">
			<!-- 내용 -->
			<jsp:include page="${contents}"/>
		</td>
	</tr>
</table>

