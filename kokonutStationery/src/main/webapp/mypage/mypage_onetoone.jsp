<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>마이페이</title>
  <link href="../css/mypage_onetoone.css" rel="stylesheet">
</head>
<body>
  <div class="contents_wrap">
    <!-- mypage left menu -->
    <div class="mypage_list">
      <div class="mypae_title">
        <span>마이페이지</span>
      </div>
      <div class="mem_box">
        <span class="mem_name">김기현</span> 님
        <table class="mem_box_table">
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

    <div class="content">
      <div class="content_title">
        1:1 문의게시판
      </div>
      <table class="onetoone_table">
        <tr id="onetoone_top">
          <th id="onetoone_type">질문유형</th>
          <th id="onetoone_title">제목</th>
          <th id="onetoone_writer">작성자</th>
          <th id="onetoone_Date">작성일</th>
        </tr>
        <tr id="onetoone_content">
          <td id="question_type"><b>기타문의</b></td>
          <td id="question_content">깜짝세일을 하는 이유가 무엇인가요</td>
          <td id="mem_id">hjlee18**</td>
          <td id="writeDate">2019.06.22</td>
        </tr>

        <tr>
          <td colspan="5">
            <div class="question hide">
              <div class="question_show">
                <font style="color:#333; font-weight:700; line-height: 30px;">주문번호 0 문의</font>
                <br> 잡지 말고 물품은 세일 안하나요??
                <div class="question_btns_div">
                  <li class="white_btn btn_size_xs" id="onetoone_modify">수정</li>
                  <li class="white_btn btn_size_xs" id="onetone_answer">답변</li>
                </div>
              </div>
            </div>
          </td>
        </tr>
      </table>

      <!-- 댓글  -->
    </div>

    <div class="pageDiv">
     1
   </div>

    <div class="question_btn" style="cursor: pointer;"
    href="mypage_onetoone_register.jsp">
      문의하기</div>

  </div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$('#onetoone_content').click(function(){
  $('.question').toggleClass('hide');
});

//팝업창
  $(function(){
   $('.question_btn').click(function(event){
      var href = $(this).attr('href');
      var width = $(this).attr('data-width');
      var height = $(this).attr('data-height');

      //팝업창 생성
      window.open(href,'question_btn','width=600, height=600');

      //기본이벤트 제거
      event.preventDefault();
   });
  });

  $('#onetoone_modify').click(function(){
  window.open('mypage_onetoone_reply.jsp',
              '일대일 문의 수정',
              'width=600, height=600');
});
</script>
</html>
    