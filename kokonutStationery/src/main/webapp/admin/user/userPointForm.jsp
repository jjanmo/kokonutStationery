<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{font-family:'Hanna', sans-serif;}


</style>

<title>Insert title here</title>
</head>
<!-- modal window div 부분 -->
 <!-- The Modal -->
 <div id="open_confirmModal" class="modal">

   <!-- Modal content -->
   <div class="modal-content">
             <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">정 보 수 정</span></b></span></p>
             <p style="text-align: center; line-height: 1.5;"><br />회원정보를 수정하시겠습니까?</p>
             <p><br /></p>

         <div class="modalDiv" id="confirmOK_Modal" style="display: inline-block;">
             <span class="pop_bt" style="font-size: 13pt; " >
             	확인
             </span>

         </div>
         <div class="modalDiv" id="close_Modal" style="float:right;">
             <span class="pop_bt" style="font-size: 13pt;" >
				취소
             </span>
         </div>
   </div>

 </div>
 <!--End Modal-->

<div id="main_wrap" align="left" style="width: 750px; margin: 30px auto;">

	<div>
		<h1 style="font-weight:normal;">회원포인트관리</h1>
	</div>
	<div id="user_">
		<table id="user_info_table" border="1" style="width:100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5; margin-top: 50px;">
			<tr>
				<th>아 이 디</th>
				<td>
					<div id="userId">${userId}</div>
				</td>
			</tr>
			<tr>
				<th>포 인 트</th>
				<td>
					<input type="text" id="userPoint" value="${userDTO.userPoint}" />
				</td>
			</tr>
			<tr>
				<th>사유</th>
				<td>
					<p>
						<select name="pointContent">
							<option selected>구매에 의한 포인트 적립</option>
							<option>교환에 의한 포인트 적립</option>
							<option>구매에 의한 포인트 사용</option>
						</select>
					</p>
				</td>
			</tr>
			<tr>
				<th>적립포인트</th>
				<td>
					<input type="text" id="savePoint" value="0"/>
				</td>
			</tr>
			<tr>
				<th>차감포인트</th>
				<td>
					<input type="text" id="deductPoint" value="0"/>
				</td>
			</tr>
			
		</table>
	</div>
	<div align="center" style="margin-top:50px;">
		<input type="button" class="regist_reset" id="registBtn" value="정보 수정">
		<input type="button" class="regist_reset" id="registResetBtn" value="취소">
	</div>
	
	<div id="userSeach_list" align="left" style="margin-top: 50px;">
		<table id="userSearchTable" border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
			<tr>
				<th style="width: 150px;">일자</th>
				<th style="width: 280px;">내 용</th>
				<th style="width: 360px;">관 련 주 문</th>
				<th style="width: 150px;">증 감</th>
				<th style="width: 200px;">잔 액</th>
			</tr>
			
			<c:forEach var="pointList" items="${pointList}">
			<tr>
				<td><fmt:formatDate value="${pointList.logdate}" pattern="yyyy.MM.dd"/></td>
				<td>${pointList.contents}</td>
				<td>${pointList.orderCode}</td>
				
				<c:if test="${pointList.pointType==0}">
					<td>${pointList.savePoint} 원</td>
				</c:if>
				
				<c:if test="${pointList.pointType==1}">
					<td>${pointList.savePoint} 원</td>
				</c:if>
				
				<c:if test="${pointList.pointType==2}">
					<td>$-{pointList.usePoint} 원</td>
				</c:if>
				
				<td></td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>

<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>