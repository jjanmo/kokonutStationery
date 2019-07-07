<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="../css/mypage.css">
</head>
<body>
  <!-- mypage right contents -->
  <div class="content">
    <div class="content_title">
      나의 상품후기
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
          <img class="product_thumb" src="../image/neck_pillow.jpg">
        </td>
        <td id="pName_td">
          <span><strong>목베개. 여기목좋아요</strong></span><br>
          <span>
            목베개 귀여워요
            <img id="disk_icon" src="../image/disk_icon.gif">
          </span>
        <td>2019.06.24</td>
        <td>
          <li class="white_btn product_view_btn">제품보기</li>
        </td>
      </tr>

      <tr>
        <td colspan="5">
          <div class="review hide">
            <div class="review_show_img">
              <img src="">
              <br>아빠가 탐내서 드렸어요..
            </div>
            <div class="review_btns_div">
              <li class="white_btn btn_size_xs" id="review_deleteBtn">삭제</li>
              <li class="white_btn btn_size_xs" id="review_modifyBtn">수정</li>
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
