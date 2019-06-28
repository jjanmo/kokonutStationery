<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="../css/mypage.css">
</head>
<body>
<div class="mp_pop_top">
  상품문의
  <img id="close_btn_img" src="../image/btn_multioption_del_2.png">
</div>

<div class="mp_pop_top_product_wrap">
  <div class="mp_pop_top_product">
    <img class="mp_pop_pimg" src="../image/living_thumb/towel_set.jpg">
    <div class="mp_pop_pName">
      <strong>누가 나 좀 말려줘요. 수건세트</strong><br>
      25,000원
    </div>
  </div>
</div>

<div class="mp_pop_center">
  <div class="mp_rv_pop_table_wrap">
    <table class="mp_pop_table">
      <tr>
        <td width="70">작성자</td>
        <td colspan="2">
          <input type="text" id="mp_qna_pop_textBox" value="김기현">
        </td>
      </tr>
      <tr>
        <td width="50">이메일</td>
        <td colspan="2" style="color: #4C4C4C;">
          <input type="text" id="mp_qna_pop_textBox" value="ken29511@gmail.com">
          <input type="checkbox">&ensp;받습니다.
        </td>
      </tr>
      <tr>
        <td width="50">문자메시지</td>
        <td colspan="2" style="color: #4C4C4C;">
          <input type="text" id="mp_qna_pop_textBox" value="">
          <input type="checkbox">&ensp;받습니다.
        </td>
      </tr>
      <tr>
        <td width="50">비밀글</td>
        <td colspan="2" style="color: #4C4C4C;">
          <input type="checkbox">비밀글
        </td>
      </tr>
      <tr>
        <td>제목</td>
        <td colspan="2">
          <input type="text" id="mp_qna_pop_subject" value="재입고문의">
        </td>
      </tr>
      <tr>
        <td>내용</td>
        <td colspan="2">
          <textarea class="summernote" id="mp_qna_pop_content" rows="10">재입고 예정있나요?</textarea>
        </td>
      </tr>
      <tr>
        <td rowspan="2" style="vertical-align: top;">이미지</td>
        <td width="10px" align="center">1</td>
        <td style="color: #4C4C4C;">
          <input type="file" name="file[]" id="imgfile_upload">
          <input type="checkbox" name="del_file[0]" value="on">삭제
          <img class="mp_rv_pop_pimg" src="../image/living_thumb/towel_set.jpg"
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
  
  <div class="private_wrap">
    <div id="private_title">
      개인정보 수집 및 이용에 대한 안내
    </div>
    회사는 제휴안내 및 상품문의와 관련하여 최소한의 범위 내에서 아래와 같이 개인정보 수집·이용합니다.
    <br><br>
    <img id="private" src="../image/private.gif">
    <p style="text-align:center; margin-top: 20px;">
			<input type="radio" name="agree" value="y" style="height:13px;">
      <label style="font-size:13px; color:#222; font-weight:700;">동의합니다</label>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="agree" value="n" style="height:13px;">
      <label style="font-size:13px; color:#666; font-weight:500;">동의하지 않습니다</label>
		</p>
  </div>

  <div class="mp_rv_pop_btn_div">
    <li class="black_btn pop_btn">확인</li>
  </div>
</div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>
</html>
