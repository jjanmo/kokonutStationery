<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="../css/mypage.css">
</head>
<body>
<div class="contents_wrap">
  <!-- mypage left menu -->
  <div class="mypage_list">
    <div class="mypae_title">
      <span>마이페이지</span>
    </div>
    <div class="mem_box">
      <table class="mem_box_table">
        <tr>
          <td class="mem_menu" colspan="2"><span class="mem_name">김기현</span> 님</td>
        </tr>
        <tr>
          <td class="mem_menu">총구매액</td>
          <td class="mem_val_td"><span class="mam_val">0</span> 원</td>
        </tr>
        <tr>
          <td class="mem_menu"><a>포인트</a></td>
          <td class="mem_val_td"><span class="mam_val">0</span> 매</td>
        </tr>
        <tr>
          <td class="mem_menu"><a>장바구니</a></td>
          <td class="mem_val_td"><span class="mam_val">0</span> 개</td>
        </tr>
        <tr>
          <td class="mem_menu"><a>찜목록</a></td>
          <td class="mem_val_td"><span class="mam_val">0</span> 개</td>
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
            <a>주문내역 · 배송조회</a>
          </td>
        </tr>
        <tr>
          <th><a>1:1 문의게시판</a></th>
        </tr>
        <tr>
          <th><a>나의 상품후기<a></th>
        </tr>
        <tr>
          <th><a>나의 상품문의</a></th>
        </tr>
        <tr>
          <th id="mem_info">개인정보</th>
        </tr>
        <tr>
          <td><a>회원정보수정</a><br>
        </tr>
        <tr>
          <td><a>회원탈퇴</a></td>
        </tr>
      </table>
    </div>
  </div>

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
        <tr class="mypage_table_content orderview_content">
          <td id="product_thumb" style="background-image: url(../image/neck_pillow.jpg);"></td>
          <td>목베개. 여기목좋아요</td>
          <td>14,000원</td>
          <td>1개</td>
          <td><span class="color_2ac1bc">결제시도</span></td>
          <td></td>
        </tr>
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
          <td>김기현</td>
        </tr>
        <tr>
          <td>주문자 핸드폰 :</td>
          <td>010-0000-0000</td>
        </tr>
        <tr>
          <td>이메일 :</td>
          <td>ken29511@gmail.com</td>
        </tr>
      </table>
      <table class="box_style1">
        <tr>
          <td id="box_title1" colspan="2">배송정보</td>
        </tr>
        <tr>
          <td id="box_name">주문자 이름 :</td>
          <td>김기현</td>
        </tr>
        <tr>
          <td>주문자 핸드폰 :</td>
          <td>010-0000-0000</td>
        </tr>
        <tr>
          <td>우편번호 :</td>
          <td>000-00</td>
        </tr>
        <tr>
          <td>주소 :</td>
          <td>
            지번주소<br>
            도로명주소
          </td>
        </tr>
      </table>
      <table class="box_style1">
        <tr>
          <td id="box_title1" colspan="2">결제금액</td>
        </tr>
        <tr>
          <td id="box_name">총주문금액 :</td>
          <td>14,000원</td>
        </tr>
        <tr>
          <td>사용포인트 :</td>
          <td>- 0원</td>
        </tr>
        <tr>
          <td>배송비 :</td>
          <td>2,500원</td>
        </tr>
        <tr>
          <td>결제금액 :</td>
          <td><span class="color_2ac1bc">16,500원</span></td>
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
          <td>신용카드</td>
        </tr>
      </table>
    </div>

    <div id="order_info">
      [ 주문취소·교환·반품을 원하시면 마이페이지의 <a id="mantoman">1:1문의게시판</a>을 이용하세요. ]
    </div>

    <div>
      <li class="white_btn back_btn">뒤로</li>
    </div>
  </div>
</div>
</body>
</html>
