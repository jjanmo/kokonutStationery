<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko" class="windows chrome pc">
<head>
<title>배민문방구 파이널프로젝트</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">

<link rel="shortcut icon" href="../image/favicon.ico" type='image/x-ico' />
<link rel="stylesheet" type="text/css" href="../css/slick.css" />
<link rel="stylesheet" type="text/css" href="../css/slick-theme.css" />

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{
	margin:0; padding:0;
	list-style-type:none;
}

#wrap{width:100%;}
#topBtn{position:absolute; right:5%; bottom:50px;}

#header_main{
	width:100%; height:90px; position:fixed; top:0px; border-bottom:1px solid #f0f0f0;
	z-index:10; background:#ffffff;
	}

#main_wrap{width:100%; margin-top:90px;z-index:11;}

#slider_wrap{width:1000px; height:500px; margin:auto;}
#main_slider{width:2500px; height:500px; overflow:visible; position:relative; left:-70%;}
#main_slider img{left:-20%;}

#content_wrap{padding-top:40px;}

/* private */
#private_all{
	width:1000px;
	margin-left: 20%;
	margin-top: 140px;
	font-size: 13px;
}

.privateContent{
	font-size: 12px;
    color: #666;
    line-height: 22px;
}
</style>
</head>

<body>
	<div id="wrap"><!-- 페이지 전체를 감싸는 div -->
		<!-- header 시작 -->
		<div id="header_main">
			<jsp:include page="../template/header.jsp" />
		</div>
		<!-- header 끝 -->
	
	
		<!-- main container 시작 -->
		<div id="private_all">
		<div style="font-size: 22px; font-weight: 700; margin-bottom: 32px;">
		이용안내
		</div>

		<div style="margin: 20px 0 0 0; line-height: 22px; font-size:13px; color: #666;">
<b style="color:#333;">회원가입안내</b><br>
- 저희 배민문방구는 회원제로 운영하고 있습니다. <br>
- 회원가입비나 월회비, 연회비등 어떠한 비용도 청구하지 않는 100% 무료입니다. <br>
<br>
<br>
<b style="color:#333;">상품주문방법</b><br>
저희 배민문방구에서 상품을 주문하는 방법은 크게 6단계입니다. <br>
&nbsp; &nbsp; &nbsp;  •&nbsp; 상품검색<br>
&nbsp; &nbsp; &nbsp;  •&nbsp; 장바구니에 담기 <br>
&nbsp; &nbsp; &nbsp;  •&nbsp; 회원ID 로그인<br>
&nbsp; &nbsp; &nbsp;  •&nbsp; 주문서 작성 <br>
&nbsp; &nbsp; &nbsp;  •&nbsp; 결제방법 선택 및 결제 <br>
&nbsp; &nbsp; &nbsp;  •&nbsp; 주문 성공 화면 (주문번호) <br>
<br>
<br>
<b style="color:#333;">주문확인 및 실시간 배송 조회 시스템</b><br>
배민문방구에서 주문을 하셨을 경우 주문/배송 확인을 통해서 실제 주문이 어떻게 처리되고 있는지 확인 하실 수 있습니다. 마이페이지에서 주문/배송 확인을 클릭해 보세요. 회원일 경우 ID와 비밀번호를 입력하시면 됩니다. 현재 배송은 우체국 택배 서비스를 이용하고 있습니다. 본 서비스는 상품 추적을 통해 상품이 어디쯤 도착해 있는지 실시간으로 확인하실 수 있습니다. <br>
<br>
<br>
<b style="color:#333;">안전한 대금 결제 시스템</b><br>
저희 배민문방구는 신용카드와 실시간 계좌이체, 휴대폰 결제, 3가지 결제 방법을 제공하여 드립니다. 신용카드 결제와 실시간 계좌이체 결제는 KCP(한국사이버결제) PG사의 전자결제를 이용하므로 보안문제는 걱정하지 않으셔도 되며, 고객님의 이용내역서에는 KCP로 기록됩니다. 휴대폰 결제는 다날 PG사의 전자결제를 이용하며 고객님의 이용내역서에는 다날로 기록됩니다. <br>
<br>
&nbsp; &nbsp; &nbsp;  •&nbsp;  이용 가능한 신용카드 : 국내 발행 모든 신용 카드, 해외 발생 신용카드(VISA Card, MASTER Card, AMEX Card)<br>
&nbsp; &nbsp; &nbsp;  •&nbsp;  실시간 계좌 이체 : 국내 모든 은행 <br>
&nbsp; &nbsp; &nbsp;  •&nbsp;  휴대폰 결제 : SKT, KT, LGT, 알뜰폰<br>
<br>
<br>
<br>
<b style="color:#333;">배송기간 및 배송방법</b><br>
- 당일 오후 2시 결제건에 한해 당일발송됩니다.<br>
- CJ대한통운 택배로 발송됩니다. <br>
<br>
<br>
<b style="color:#333;">주문취소, 교환 및 환불</b><br>
배민문방구는 소비자의 보호를 위해서 규정한 제반 법규를 준수합니다. 결제후 취소는 저희 고객센터(1670-9902)로 문의해 주시기 바랍니다.  <br>
  &nbsp;  •&nbsp;  신용 카드로 결제하신 경우, 승인 취소가 가능하면 취소을 해드리지만 승인 취소가 불가능한 경우 해당 금액을 모두 송금해 드립니다.<br>
  &nbsp;  •&nbsp;  배송된 상품이 주문한 상품이 아닌 경우, 상품 수령일로부터 3일 이내에 교환 및 환불 처리를 해드립니다. 1:1 문의 게시판이나 고객센터로 연락주세요.
	</div>
</div>
<!-- main_wrap_end -->
	<jsp:include page="../template/footer.jsp" />	
</div><!-- wrap_end -->
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js" ></script>
<script type="text/javascript" src="../js/slick.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	$('.main_slider').slick({
		autoplay : true, // 자동슬라이드여부
		autoplaySpeed : 3000,
		slidesToShow : 1, // 한번에 몇개의 이미지를 보여줄 것인지
		slidesToScroll : 1,
		arrows : true,
		fade : false,
		infinite : true,
		dots : true
	});
	
});
</script>
</html>




