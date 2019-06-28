<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="../css/mypage.css">
</head>
<body>
<!-- <div class="contents_wrap">
  mypage left menu
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
  </div> -->

  <!-- mypage right contents -->
  <div class="content">
    <div class="content_title">
      나의 상품문의
    </div>
    <table class="mypage_table">
      <tr id="mypage_table_top">
        <th id="rownum">번호</th>
        <th id="thumbimg">이미지</th>
        <th id="pName_review">상품명 · 후기</th>
        <th id="review_date">작성일</th>
        <th id="productview"></th>
      </tr>

      <tr class="mypage_table_content review_content">
        <td>1</td>
        <td>
          <img class="product_thumb" src="../image/living_thumb/towel_set.jpg">
        </td>
        <td id="pName_td">
          <span><strong>누가 나 좀 말려줘요. 수건세트</strong></span><br>
          <span>
            재입고문의
            <img id="disk_icon" class="hide" src="../image/disk_icon.gif">
          </span>
        <td>2019.06.25</td>
        <td>
          <li class="white_btn product_view_btn">제품보기</li>
        </td>
      </tr>

      <tr>
        <td colspan="5">
          <div class="review hide">
            <div class="review_show_img">
              <img src="">
              <br>재입고 예정있나요?
            </div>
            <div class="review_btns_div">
              <li class="white_btn btn_size_xs" id="qna_deleteBtn">삭제</li>
              <li class="white_btn btn_size_xs" id="qna_modifyBtn">수정</li>
              <li class="white_btn btn_size_xs" id="qna_replyBtn">답변</li>
            </div>
          </div>
        </td>
      </tr>
    </table>

    <div class="pageDiv">
      1
    </div>
  </div>
<!-- </div> -->
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>
</html>
