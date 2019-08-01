<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="../css/mypage.css">  

<!-- mypage left menu -->
<div class="mypage_list">
  
    <div class="mypae_title">
      <span>마이페이지</span>
    </div>
    <div class="mem_box">
      <table class="mem_box_table">
        <tr>
          <td class="mem_menu" colspan="2"><span class="mem_name">${memName}</span> 님</td>
        </tr>
        <tr>
          <td class="mem_menu">총구매액</td>
          <td class="mem_val_td">
	          <span class="mam_val" id="totalPayment"></span> 원
	          <input type="hidden" id="x_totalPayment">
          </td>
        </tr>
        <tr>
          <td class="mem_menu"><a href="../mypage/mypage_pointlist.do">포인트</a></td>
          <td class="mem_val_td">
          	<span class="mam_val" id="userPoint"></span> 원
          	<input type="hidden" id="x_userPoint">
          </td>
        </tr>
        <tr>
          <td class="mem_menu"><a href="../cart/goods_cart.do">장바구니</a></td>
          <td class="mem_val_td"><span class="mam_val" id="productInCart"></span> 개</td>
        </tr>
        <tr>
          <td class="mem_menu"><a href="../mypage/mypage_wishlist.do">찜목록</a></td>
          <td class="mem_val_td"><span class="mam_val" id="productInWishList"></span> 개</td>
        </tr>
      </table>
    </div>

    <div class="mypage_menu">
      <table class="mypage_menu_table">
        <tr>
          <th id="menu_top">내 쇼핑정보</th>
        </tr>
        <tr>
          <td id="mem_order">
            <a href="../mypage/mypage_orderlist.do">주문내역 · 배송조회</a>
          </td>
        </tr>
    	<tr>
          <th><a href="../mypage/mypage_onetoone.do">1:1 문의게시판</a></th>
        </tr> 
        <tr>
          <th><a href="../mypage/mypage_review.do">나의 상품후기<a></th>
        </tr>
        <tr>
          <th><a href="../mypage/mypage_qna.do">나의 상품문의</a></th>
        </tr>
        <tr>
          <th id="mem_info">개인정보</th>
        </tr>
        <tr>
          <td><a href="../user/checkUser.do">회원정보수정</a><br>
        </tr>
        <tr>
          <td><a href="../user/memberOut.do">회원탈퇴</a></td>
        </tr>
      </table>
    </div>
  
 </div>
 
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(function(){	
	$.ajax({	
		type: 'post',
		url: '/kokonutStationery/mypage/getUserInfo.do',
		data: {'userId' : '${memId}'},
		dataType: 'json',
		success: function(data){
			$('#totalPayment').text(Number(data.userDTO.totalPayment).toLocaleString('en').split(".")[0]);
			$('#userPoint').text(Number(data.userDTO.userPoint).toLocaleString('en').split(".")[0]);
			$('#productInCart').text(data.userDTO.productInCart);
			$('#productInWishList').text(data.userDTO.productInWishList);
			
			$('#x_totalPayment').val(data.userDTO.totalPayment); //총 구매금액
			$('#x_userPoint').val(data.userDTO.userPoint); //현재 포인트 금액
		}
	});
});
</script>
 
 
 
 
 
 