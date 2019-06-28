<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="../css/mypage.css">
</head>
<body>
<div class="mp_rv_pop_top">
  상품후기작성
  <img id="close_btn_img" src="../image/btn_multioption_del_2.png">
</div>
<div class="mp_rv_pop_center">
  <div class="mp_rv_pop_center_top">
    <img class="mp_rv_pop_pimg" src="../image/neck_pillow.jpg">
    <div class="mp_rv_pop_pName">
      <strong>목베개. 여기목좋아요</strong><br>
      14,000원
    </div>
  </div>
  <div class="mp_rv_pop_center_mid">
    <table class="mp_rv_pop_table">
      <tr>
        <td width="50">작성자</td>
        <td colspan="2">
          <input type="text" id="mp_rv_pop_name" value="김기현">
        </td>
      </tr>
      <tr>
        <td>제목</td>
        <td colspan="2">
          <input type="text" id="mp_rv_pop_subject" value="목베개 귀여워요">
        </td>
      </tr>
      <tr>
        <td>내용</td>
        <td colspan="2">
          <textarea id="mp_rv_pop_content" rows="6">아빠가 탐내서 드렸어요..</textarea>
        </td>
      </tr>
      <tr>
        <td rowspan="2" style="vertical-align: top;">이미지</td>
        <td width="10px" align="center">1</td>
        <td style="color: #4C4C4C;">
          <input type="file" name="file[]" id="imgfile_upload">
          <input type="checkbox" name="del_file[0]" value="on">삭제
          <img class="mp_rv_pop_pimg" src="../image/neck_pillow.jpg"
               style="width: 40px; height: 40px; vertical-align: bottom">
        </td>
      </tr>
      <tr>
        <td colspan="3" style="color: #4C4C4C;">
          - 파일은 최대 1개까지 업로드가 지원됩니다.<br>
          - 파일은 가로 사이즈가 500px보다 클 경우 자동 리사이즈 됩니다.
        </td>
      </tr>
    </table>
  </div>
  <div class="mp_rv_pop_btn_div">
    <li class="black_btn pop_btn">글올리기</li>
  </div>
</div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>
</html>
