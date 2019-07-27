<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<link rel="stylesheet" href="../css/mypage.css">

<form name="" method="post" action="">
	<table class="mypage_table">
		<tr>
			<th>주문번호 </th>
			<td>${orderCode}</td>
		</tr>
		<tr>
			<th>주문날짜 </th>
			<td></td>
		</tr>
		<tr>
			<td>
				<select name="selectContent">
					<option value="" selected>구분</option>
					<option value="교환">교환</option>
					<option value="환불">환불</option>
				</select>
			</td>
			<td>
				<select name="selectContent">
					<option value="" selected>사유</option>
					<option value="고객변심">고객변심</option>
					<option value="배송지연">배송지연</option>
					<option value="포장불량">포장불량</option>
					<option value="상품불만족">상품불만족</option>
					<option value="상품불량">상품불량</option>
					<option value="서비스불만족">서비스불만족</option>
					<option value="품절">품절</option>
					<option value="기타">기타</option>
				</select>
			</td>
		</tr>
	</table>
	
	<table class="mypage_table">
      <tr id="mypage_table_top">
        <th >체크박스</th>
        <th >상품정보(상품이름/이미지)</th>
        <th >주문수량</th>
        <th >교환/환불수량</th>
        <th >주문가격</th>
        <th >교환/환불가격</th>
        
      </tr>
      <c:forEach var="orderDTO" items="${list }" varStatus="status">
      <tr id="mypage_table_content_${status.count }">
      	<td>
      		<input type="checkbox" value="${status.count}">
      	</td>
		<td id="productName">
			<img id="thumbimg" src="../image/thumb/${orderDTO.thumbImg }">
			<br>${orderDTO.productName }
			
			<!-- 옵션이 있으면 옵션내용보이기 -->
			<br>
			<c:if test="${orderDTO.productOption ==1 }">
				${orderDTO.optionContent }
				<input type="hidden" id="optionContent_${status.count}" value="${ orderDTO.optionContent}">
			</c:if>
		</td>
	    <td id="purchaseQty_${status.count}">
	    	${orderDTO.purchaseQty }개
	    	<input type="hidden" name="purchaseQty_${status.count}" value="${orderDTO.purchaseQty }">
	    </td>
	    <td>
	    	<input type="number" id="changeRefundQty_${status.count}" class="changeRefundQty">개
	    </td>
	    <td id="totalPayment_${status.count}">
		    ${orderDTO.totalPrice }원
		    <!-- 기본가격 -->
		    <input type="hidden" name="eachPayment_${status.count}" value=" ${(orderDTO.totalPrice/orderDTO.purchaseQty) }">
	    </td>
	    <td>
	    	<input type="number" id="changeRefundPayment_${status.count }" value="" class="changeRefundPayment" readonly>원
	    </td>
      </tr>      
      </c:forEach>
    </table>
    <input type="button" value="교환/환불신청">
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('.changeRefundQty').on('propertychange change keyup paste input', function(){
		//구분자
		var status=$(this).attr('id').split("_");
		//구매수량
		var purchaseQty = $('#purchaseQty_'+status[1]).val();
		//변한수량
		var changeRefundQty = $(this).val();		
		//기본가격
		var eachPayment= $("input[name=eachPayment_"+status[1]+"]").val();
		//변한수량만큼액수
		var changeRefundPayment = $('#changeRefundPayment_'+status[1]);
		
		console.log("변한수량="+changeRefundQty+" 몇번째?"+status[1]+" 한개가격="+eachPayment)
		
		changeRefundPayment.val(eachPayment*changeRefundQty);
	});
	
});//ready

</script>










