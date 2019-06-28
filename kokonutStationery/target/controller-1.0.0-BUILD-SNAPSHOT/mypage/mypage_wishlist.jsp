<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>찜목록</title>
  <link rel="stylesheet" href="../css/mypage_wishlist.css">
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
          <th><a>나의 상품후기</a></th>
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

  <div class="wishlist_content">
    <div class="wishlist_title">
      찜목록
    </div>
    <table class="wishlist_table">
      <colgroup>
        <col width="8%">
        <col>
        <col width="10%">
        <col width="14%">
        <col width="16%">

      </colgroup>
      <tr id="wishlist_top">
        <th id="wishlist_select">선택</th>
        <th id="wishlist_info">상품정보</th>
        <th id="savepoint">적립금</th>
        <th id="">판매가</th>
        <th id="">보관일</th>
      </tr>
      <tr id="wishlist_middle">
        <td id="wishilist_checkbox">
          <input type="checkbox" name="wishCheckbox" value="" checked>
        </td>
        <td id="wishlist_img">
          <img src="http://store.baemin.com/shop/data/goods/154780651448s0.jpg" width="70px">
          <a href=""  style="text-decoration:none">
          볼펜세트. 어머 펜이에요~
          </a>
        </td>

        <td id="wishlist_savepoint">
          0원
        </td>

        <td id="wishlist_price">
          3,500원
        </td>

        <td id="wishlist_storedate">
          2019.06.26
        </td>
      </tr>
    </table>

    <div class="pageDiv">
     1
    </div>

    <div class="wishlist_button">
      <div class="delete_button white_btn">
        선택 삭제
      </div>
      <div class="putcart_button black_btn">
        장바구니 담기
      </div>
    </div>
  </div>
</body>
</html>
