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
<!-- </div> -->
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>
</html>
