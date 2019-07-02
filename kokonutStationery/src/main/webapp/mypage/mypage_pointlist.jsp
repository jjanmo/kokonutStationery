<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="../css/mypage.css">

  <!-- mypage right contents -->
  <div class="content">
    <div class="content_title">
      포인트
    </div>

    <div class="tot_point_wrap">
      <table class="tot_point_table">
        <tr>
          <td style="font-size: 18px;">현재 적립된 포인트</td>
          <td style="font-size: 18px; text-align: right;" class="color_2ac1bc"><fmt:formatNumber type="number" value="${userDTO.userPoint }"/> 원</td>
        </tr>
<%--    	<tr>
          <td style="font-size: 15px;">사용 가능 포인트</td>
          <td style="font-size: 15px; text-align: right;"><fmt:formatNumber type="number" value="${userDTO.userPoint }"/> 원</td>
        </tr>
        <tr>
          <td style="font-size: 15px; vertical-align: top;">소멸 예정 포인트</td>
          <td class="color_2ac1bc" style="font-size: 15px; text-align: right;">
            -500 원<br>
            <p style="color: #999; font-size: 13px; margin: 0">2019.12.31까지</p>
          </td>
        </tr> --%>
      </table>
    </div>

	<div>
		<h5>포인트 상세내역</h5>
	</div>
	<table class="mypage_table">
		<tr id="mypage_table_top">
			<th id="point_date">일자</th>
			<th id="point_contents">내용</th>
			<th id="order_code">주문번호</th>
			<th id="point">포인트</th>
		</tr>
	
		<c:forEach var="list" items="${list}">
		<tr class="mypage_table_content point_table_contents">
			<td><fmt:formatDate value="${list.logdate }" pattern="yyyy.MM.dd"/></td>
			<td>${list.contents }</td>
			<td><a id="order_code">${list.orderCode }</a></td>
			
			<c:if test="${list.pointType==0 }">
				<td style="color: #2ac1bc;">
				 	-${list.usePoint } 원
				 </td>
			</c:if>
			
			<c:if test="${list.pointType==1 }">
				<td>
				 	${list.savePoint } 원
				 </td>
			</c:if>
		</tr>
		</c:forEach>
	</table>
    <div class="pageDiv">
      1
    </div>
  </div>
<!-- </div> -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>

