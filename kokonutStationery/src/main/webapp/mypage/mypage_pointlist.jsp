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
          <td class="mem_val_td"><span class="mam_val">3,500</span> 원</td>
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
    <div class="content_title">
      포인트
    </div>

    <div class="tot_point_wrap">
      <table class="tot_point_table">
        <tr>
          <td style="font-size: 18px;">현재 적립된 포인트</td>
          <td style="font-size: 18px; text-align: right;">3,500 원</td>
        </tr>
        <tr>
          <td style="font-size: 15px;">사용 가능 포인트</td>
          <td style="font-size: 15px; text-align: right;">3,500 원</td>
        </tr>
        <tr>
          <td style="font-size: 15px; vertical-align: top;">소멸 예정 포인트</td>
          <td class="color_2ac1bc" style="font-size: 15px; text-align: right;">
            -500 원<br>
            <p style="color: #999; font-size: 13px; margin: 0">2019.12.31까지</p>
          </td>
        </tr>
      </table>
    </div>

    <div>
      <h5>포인트 상세내역</h5>
    </div>
    <table class="mypage_table">
      <tr id="mypage_table_top">
        <th id="point_date">일자</th>
        <th id="point_contents">내용</th>
        <th id="order_code">주문번호</th>
        <th id="point">포인트</th>
      </tr>

      <tr class="mypage_table_content point_table_contents">
        <td>2019.06.25</td>
        <td>주문에 의한 포인트 사용</td>
        <td><a id="order_code">1565369873372</a></td>
        <td style="color: #2ac1bc;">-2,500 원</td>
      </tr>

      <tr class="mypage_table_content point_table_contents">
        <td>2019.06.24</td>
        <td>주문에 의한 포인트 적립</td>
        <td><a id="order_code">1562276387542</a></td>
        <td>1,000 원</td>
      </tr>

      <tr class="mypage_table_content point_table_contents">
        <td>2019.06.24</td>
        <td>주문에 의한 포인트 사용</td>
        <td><a id="order_code">1566336521477</a></td>
        <td style="color: #2ac1bc;">-2,000 원</td>
      </tr>

      <tr class="mypage_table_content point_table_contents">
        <td>2019.06.24</td>
        <td>주문에 의한 포인트 적립</td>
        <td><a id="order_code">1561775748931</a></td>
        <td>1,000 원</td>
      </tr>

      <tr class="mypage_table_content point_table_contents">
        <td>2019.06.24</td>
        <td>주문에 의한 포인트 적립</td>
        <td><a id="order_code">1565272856874</a></td>
        <td>1,000 원</td>
      </tr>

      <tr class="mypage_table_content point_table_contents">
        <td>2019.06.23</td>
        <td>회원가입 포인트 적립</td>
        <td><a id="order_code"></a></td>
        <td>5,000 원</td>
      </tr>

    </table>

    <div class="pageDiv">
      1
    </div>
  </div>
</div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>
</html>
