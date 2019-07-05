<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>1:1 문의작성</title>
    <link href="../css/mypage_onetoone_register.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/mypage.css">
  </head>
  <body>
    <form class="" action="" method="post">
    <div class="onetoone_register_top">
      1:1 문의 작성하기
      <img id="close_btn_img" src="../image/btn_multioption_del_2.png">
    </div>

    <div class="order_Number_search">
      <p style="margin-top: 30px; font-size: 18px; text-align: center;">
        <strong>문의하실 주문번호를 선택하세요.</strong>
      </p>
      <img id="hide_btn_img" src="../image/btn_multioption_del.png">
      <table cellspacing="0" style="width: 96%; margin: 10px 10px;">
        <tr id="table_top">
          <td width="107px">주문번호</td>
          <td width="64px">주문일자</td>
          <td width="192px">상품명</td>
          <td width="52px">수량</td>
          <td width="80px">주문금액</td>
        </tr>
        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
      </table>
    </div>
    <div class="onetoone_register_center">
      <div id="onetoone_register_mid">
        <table width="100%" cellpadding="5" cellspacing="10" border="0">
          <colgroup>
            <col width="14%" align="right">
          </colgroup>
          <tr>
            <td class="id_text">아이디</td>
            <td class="mem_id">${memId }</td>
          </tr>
          <tr>
            <td class="qNa_type">질문유형</td>
            <td><!-- select name 불문명-->
                <select class="qNa_select" name="itemcd">
                  <option value>상담내용을 선택하세요.</option>
                  <option value="01">배송지연 불만</option>
                  <option value="02">반품문의</option>
                  <option value="03">A/S문의</option>
                  <option value="04">환불문의</option>
                  <option value="05">주문결제문의</option>
                  <option value="06">회원정보문의</option>
                  <option value="07">취소문의</option>
                  <option value="08">교환문의</option>
                  <option value="09">상품정보문의</option>
                  <option value="10">기타문의</option>
                </select>
            </td>
          </tr>

          <tr>
            <td class="order_number">주문번호</td>
            <td>
              <input class="orderNumber_Input" type="text" name="orderNumber" required>
              <li class="order_Number_Btn"style="text-align: center; font-size: 12px;">주문조회</li>
            </td>
          </tr>
          <tr>
            <td class="email_td">이메일</td>
            <td>
              <input type="text" name="email" class="mem_email" value="" required>
              <div class="mail_checkbox">
                <input type="checkbox" name="mailing" value="">
                <div class="mailing-div">받습니다</div>
              </div>
            </td>
          </tr>
          <tr>
            <td class="message_td">문자메시지</td>
            <td>
              <input type="text" name="tel1" class="tel_input" value="" required>
              -
              <input type="text" name="tel2" class="tel_input" value="" required>
              -
              <input type="text" name="tel3" class="tel_input" value="" required>
              <div class="message_checkbox">
                <input type="checkbox" name="message" value="">
                <div class="message_div">받습니다</div>
              </div>
            </td>
          </tr>
          <tr>
            <td class="onetoone_register_subject">제목</td>
            <td>
              <input type="text" name="subject_input" class="subject_input" value="" required>
            </td>
          </tr>
          <tr>
            <td class="onetoone_register_content">내용</td>
            <td>
              <textarea name="contents" class="content_textarea" required></textarea>
            </td>
          </tr>
        </table>

        <table width="100%">
          <tr>
            <td align="center" style="padding-top:20; width: 590px; height:76px;">
              <input type="submit" class="confirm_btn" value="확인">
            </td>
          </tr>
        </table>
      </div>
    </div>

    </form>
  </body>
  <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="../js/mypage.js"></script>
  <script type="text/javascript">
    $('.order_Number_Btn').click(function(){
      $('.order_Number_search').addClass('show');
    });

    $('#hide_btn_img').click(function(){
      $('.order_Number_search').removeClass('show');
    });
  </script>
</html>
