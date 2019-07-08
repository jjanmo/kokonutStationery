<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="../css/mypage_onetoone_reply.css" rel="stylesheet">
<link href="../css/mypage.css" rel="stylesheet">
</head>

<body>
<div class="onetoone_reply_top">
  1:1 문의 작성하기
  <img id="close_btn_img" src="../image/btn_multioption_del_2.png">
</div>

<div class="onetoone_reply_center">
    <table width="100%" cellpadding="5" cellspacing="10" border="0">
      <colgroup>
        <col width="14%" align="right">
      </colgroup>
      
      <tr>
        <td class="id_text">아이디</td>
        <td class="mem_id">hjlee1811</td>
      </tr>

      <tr>
        <td class="onetoone_reply_subject">제목</td>
        <td>
          <input type="text" name="subject" class="reply_subject_input" required>
        </td>
      </tr>

      <tr>
        <td class="onetoone_reply_content">내용</td>
        <td>
          <textarea name="reply_content" class="reply_textarea" required></textarea>
        </td>
      </tr>

    </table>

    <table width="100%">
      <tr>
        <td style="padding-top:20">
          <input type="submit" class="confirm_btn black_button" value="확 인">
        </td>
      </tr>
    </table>
</div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>
</html>
