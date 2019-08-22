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
          <th id="delivery">주문상태</th>
          <th id="exchangeRefund">교환/환불</th>
        </tr>
        <c:forEach var="orderDTO" items="${list}">
	        <tr class="mypage_table_content orderview_content">
	          <td id="product_thumb"><img id="thumbimg" src="../image/thumb/${orderDTO.thumbImg }"></td>
	          <td>
	          <span id="product_name">${orderDTO.productName }</span>
	          <c:if test="${orderDTO.optionContent!=null }">
	          <br>
	          <span id="option_name">${orderDTO.optionContent }</span>
	          </c:if>
	          </td>
	          <td>${orderDTO.totalPrice }원</td>
	          <td>${orderDTO.purchaseQty }개</td>
	          <td>
	          	<span class="color_2ac1bc">
	          		
	          		<c:if test="${orderDTO.orderState==0 }">
	          			주문취소
	          		</c:if>
	          		<c:if test="${orderDTO.orderState==1 }">
	          			주문접수	          			
	          		</c:if>
	          		<c:if test="${orderDTO.orderState==2 }">
	          			배송준비	          			
	          		</c:if>
	          		<c:if test="${orderDTO.orderState==3 }">
	          			배송중
	          		</c:if>
	          		<c:if test="${orderDTO.orderState==4 }">
	          			배송완료	          			
	          		</c:if>
	          		<c:if test="${orderDTO.orderState==5 }">
	          			주문완료
	          		</c:if>
	          		
	          	</span>
          		<c:if test="${orderDTO.orderState==1 }">
          			<br>
          			<!-- <input type="button" id="order_cancle" class="orderStateBtn" value="주문취소"> -->
          		</c:if>
          		<c:if test="${orderDTO.orderState==2 }">
          			<br>
          			<!-- <input type="button" id="order_cancle" class="orderStateBtn" value="주문취소"> -->
          		</c:if>
          		<c:if test="${orderDTO.orderState==4 }">
          			<!-- <br>
          			<input type="button" id="order_exchange" class="orderStateBtn" value="교환신청">
          			<br>
          			<input type="button" id="order_refund" class="orderStateBtn" value="환불신청">
          			<br>
          			<input type="button" id="order_receiptOk" class="orderStateBtn" value="수령확인"> -->
          		</c:if>
	          </td>
	          <td>
	          	<span class="color_2ac1bc">
	          		<c:if test="${orderDTO.exchange==1 }">
	          			교환접수<br>
	          			[${orderDTO.exchangeQty}개]
	          		</c:if>
	          		<c:if test="${orderDTO.exchange==2 }">
	          			교환완료<br>
	          			[${orderDTO.exchangeQty}개]
	          		</c:if>
	          		<c:if test="${orderDTO.refund==1 }">
	          			환불접수<br>
	          			[${orderDTO.refundQty}개]
		          	</c:if>
		          	<c:if test="${orderDTO.refund==2 }">
	          			환불완료<br>
	          			[${orderDTO.refundQty}개]
		          	</c:if>
	          	</span>
	          </td>
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
          <td>${usePoint}원</td>
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
	          	<c:out value="${sum-usePoint}"/>원
	          </c:if>
	          <c:if test="${sum<30000 }">
	          	<c:out value="${sum+2500-usePoint}"/>원
	          </c:if>
	          </span>
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
          <c:set var="loop" value="false"/>
           <c:forEach var="orderDTO" items="${list}">
	          <c:if test="${not loop }">
	          <c:if test="${orderDTO.paymentType == 0 }">
	          	신용카드 <c:set var="loop" value="true"/>
	          </c:if>
	          <c:if test="${orderDTO.paymentType == 1 }">
	          	핸드폰 <c:set var="loop" value="true"/>
	          </c:if>
	          </c:if>
          	</c:forEach>
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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

</script>
</html>
