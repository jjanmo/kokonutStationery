<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="../css/mypage.css">
</head>
<body>
 <!-- mypage right contents -->
  <div class="content">
    <div class="content_top">
      <div class="content_title">
        주문내역 상세보기
      </div>
      <table class="mypage_table">
        <tr id="mypage_table_top">
          <th id="product_info">상품정보</th>
          <th id="product_subject"></th>
          <th id="product_price">판매가</th>
          <th id="qty">수량</th>
          <th id="delivery">배송상태</th>
          <th id="delivery_ps">배송추적·이용후기</th>
        </tr>
        <c:forEach var="orderDTO" items="${list}">
	        <tr class="mypage_table_content orderview_content">
	          <td id="product_thumb"><img src="../image/"${orderDTO.thumbImg }></td>
	          <td>${orderDTO.productName }</td>
	          <td>${orderDTO.totalPrice }원</td>
	          <td>${orderDTO.purchaseQty }개</td>
	          <td><span class="color_2ac1bc">결제시도</span></td>
	          <td></td>
	        </tr>
        </c:forEach>
      </table>
    </div>

    <div class="content_bottom">
      <h5>주문상세내역</h5>
      <table class="box_style1">
        <tr>
          <td id="box_title1" colspan="2">주문자정보</td>
        </tr>
        <tr>
          <td id="box_name">주문자 이름 :</td>
          <td>${userDTO.userName }</td>
        </tr>
        <tr>
          <td>주문자 핸드폰 :</td>
          <td>${userDTO.userPhone1 }-${userDTO.userPhone2 }-${userDTO.userPhone3 }</td>
        </tr>
        <tr>
          <td>이메일 :</td>
          <td>${userDTO.userEmail }</td>
        </tr>
      </table>
      <table class="box_style1">
        <tr>
          <td id="box_title1" colspan="2">배송정보</td>
        </tr>
        <tr>
          <td id="box_name">받는 분 이름 :</td>
          <td>${userDTO.receiverName}</td>
        </tr>
        <tr>
          <td>핸드폰 :</td>
          <td>${userDTO.receiverPhone1}-${userDTO.receiverPhone2}-${userDTO.receiverPhone3}</td>
        </tr>
        <tr>
          <td>우편번호 :</td>
          <td>${userDTO.receiverZipcode }</td>
        </tr>
        <tr>
          <td>주소 :</td>
          <td>
	           ${userDTO.receiverAddr1 }<br>
	           ${userDTO.receiverAddr2 }
          </td>
        </tr>
      </table>
      <table class="box_style1">
        <tr>
          <td id="box_title1" colspan="2">결제금액</td>
        </tr>
        <tr>
          <td id="box_name">총주문금액 :</td>
          <td>
          		<c:set var="sum" value="0"/>
	          <c:forEach var="orderDTO" items="${list}">
	          	<c:set var="sum" value="${sum+orderDTO.totalPrice}"/>
	          </c:forEach>
	          	<c:out value="${sum}"/>
          	원</td>
        </tr>
        <tr>
          <td>사용포인트 :</td>
          <td>- 0원</td>
        </tr>
        <tr>
          <td>배송비 :</td>
          <td>
          <c:if test="${sum>=30000 }">
          0원 (조건부 무료)
          </c:if>
          <c:if test="${sum<30000 }">
          2,500원
          </c:if>
          	</td>
        </tr>
        <tr>
          <td>결제금액 :</td>
          <td>
	          <span class="color_2ac1bc">
	          <c:if test="${sum>=30000 }">
	          	<c:out value="${sum}"/>원
	          </c:if>
	          <c:if test="${sum<30000 }">
	          	<c:out value="${sum+2500}"/>원
	          </c:if>
	          </span>
          </td>
        </tr>
        <tr>
          <td id="pament_info" colspan="2">
            <span>- 네이버 마일리지가 사용된 결제시도건의 경우 마일리지 사용액이 저장되지 않아 재결제시에 결제금액이 다르게 보일 수 있습니다.</span>
          </td>
        </tr>
      </table>
      <table class="box_style1">
        <tr>
          <td id="box_title1" colspan="2">결제수단</td>
        </tr>
        <tr>
          <td id="box_name">결제방법 :</td>
          <td>
          	<c:if test="${orderDTO.paymentType == 0 }">
          		신용카드
          	</c:if>
          	<c:if test="${orderDTO.paymentType == 1 }">
          		핸드폰
          	</c:if>
          </td>
        </tr>
      </table>
    </div>

    <!-- <div id="order_info">
      [ 주문취소·교환·반품을 원하시면 마이페이지의 <a id="mantoman">1:1문의게시판</a>을 이용하세요. ]
    </div> -->

    <div>
      <li class="white_btn back_btn" onclick="javascript:history.go(-1)">뒤로</li>
    </div>
  </div>

</body>
</html>
