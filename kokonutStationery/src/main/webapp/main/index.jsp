<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko" class="windows chrome pc">
<head>
<title>KOKONUT STATIONERY</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">

<!-- 파비콘 각 페이지마다 들어가야 함 -->
<link rel="shortcut icon" href="../image/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../css/slick.css" />
<link rel="stylesheet" type="text/css" href="../css/slick-theme.css" />

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{
	margin:0; padding:0;
	list-style-type:none;
}

#wrap{width:100%;}

#header_main{
	width:100%; height:90px; position:fixed; top:0px; border-bottom:1px solid #f0f0f0;
	z-index:10; background:#ffffff;
	}

#main_wrap{width:100%; margin-top:90px;z-index:11;}

#slider_wrap{width:1000px; height:500px; margin:auto;}
#main_slider{width:2500px; height:500px; overflow:visible; position:relative; left:-70%;}
#main_slider img{left:-20%;}

/* #content_wrap{padding-top:40px;} */

a#topBtn{
	position:fixed;
	right:4%;
	bottom:50px;
	display:none;
	z-index:999;
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
		<div id="main_wrap">
			
			<!-- slider -->
			<div id="slider_wrap">
				<div id="main_slider" class="main_slider">
					<div><a href="#"><img src="../image/main_banner1.png" style="height:500px;" /></a></div>
					<div><a href="#"><img src="../image/main_banner2.png" style="height:500px;" /></a></div>
					<div><a href="#"><img src="../image/main_banner3.png" style="height:500px;" /></a></div>
					<div><a href="#"><img src="../image/main_banner4.png" style="height:500px;" /></a></div>
					<div><a href="#"><img src="../image/main_banner5.png" style="height:500px;" /></a></div>
				</div>
				<div class="slider_nav">
					
				</div>
			</div><!-- slider_wrap -->
			
			
			<!-- content_wrap -->
			<jsp:include page="${display }" />
	<!-- 	<div id="">
				<jsp:include page="${display }" />
			</div> -->
			
			<a href="#" id="topBtn">
				<img src="../image/topBtn.png" />
			</a>
		
			<jsp:include page="../template/footer.jsp" />	
		</div><!-- main_wrap_end -->
	
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
	
	$(window).scroll(function(){
		if($(this).scrollTop() > 400){
			$('#topBtn').fadeIn();
		} else {
			$('#topBtn').fadeOut();
		}
	});
	
	$('#topBtn').click(function(){
		$('html, body').animate({
			scrollTop : 0
		}, 400);
		return false;
	});

});
</script>
</html>




