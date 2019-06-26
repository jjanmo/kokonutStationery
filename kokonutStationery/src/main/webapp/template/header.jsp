<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="shortcut icon" href="../image/favicon.ico" type="image/x-icon" />
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
//font-family: 'Hanna', sans-serif;
*{
	margin:0; padding:0;
	list-style-type:none;
}
a{color:#1E1E1E; text-decoration:none;}
.fixed{position:fixed; top:0px;}

#top_1{width:1000px; margin:auto;}
#top_menu_area{width:1000px; height:84px; position:relative;}

#top_logo{width:140px; height:66px; padding:19px 0 0 10px; float:left;
		}

#top_cate{
	position:relative;
	width:490px; height:20px; padding-top:31px; float:left;
	left:50px;
	}
#top_cate>table{width:420px;}

#top_cate>table>tbody>tr>td{float:left; padding-right:40px;}
#top_cate>table>tbody>tr>td>div>a.cate1{
	font-family: 'Hanna', sans-serif; font-size:17px; font-weight:normal;
	}
#top_cate>table>tbody>tr>td>div>a.cate1:hover{ 
	padding-bottom:2px;
	border-bottom:3px solid #000000;
	}
#top_cate .catebar{width:60px; height:100px;}
#top_cate .catebar .subLayer{
	position:absolute; top:72px; left:-15px;
	font-size:12px;
	width:140px; height:140px;
	background:#f9f9f9;	
	box-shadow:2px 2px 2px #efefef;
	}
#top_cate .catebar .subLayer>ul>li{padding-top:14px; padding-left:15px;}
.cate2:hover{font-weight:bolder;}


#top_menu{
	font-size:12px; width:350px; height:20px;
	float:left; padding-left:10px;
	}
#top_menu>li{float:left; padding:37px 0 0 27px; font-weight:bold;}
#top_menu>li>a:hover{color:#000000;}

.utilMenuText{color:#c1c1c1;}


</style>


<div id="top_1" style="width:1000px;">
	<div id="top_menu_area">
		<div id="top_logo">
			<a href="/kokonutStationery/main/index.do">
				<img src="../image/logo.png" alt="코코넛 문방구" style="width:130px; height:48px;"/>
			</a>
		</div><!-- top_logo 끝 -->
		
		<div id="top_cate">
			<table>
				<tbody>
					<tr>
						<td class="catebar"><!-- 카테고리:펼쳐지는 부분 -->
							<div>
								<a href="/kokonutStationery/goods/category_stationery.do" id="main_cate" class="cate1">카테고리</a>
							</div>
							<div>
								<div class="subLayer" style="display:none;">
									<ul class="cate_detail">
										<li><a href="/kokonutStationery/goods/category_stationery.do" class="cate2">문구</a></li>
										<li><a href="/kokonutStationery/goods/category_living.do" class="cate2">리빙</a></li>
										<li><a href="/kokonutStationery/goods/category_travel.do" class="cate2">여행</a></li>
										<li><a href="/kokonutStationery/goods/category_collabo.do" class="cate2">콜라보레이션</a></li>
									</ul>
								</div>
							</div>
						</td><!-- catebar 끝 -->
						
						<td><!-- 깜짝세일 -->
							<div>
								<a href="/kokonutStationery/goods/category_discount.do" class="cate1">깜짝세일</a>
							</div>
						</td>
						<td><!-- 잘나가요 -->
							<div>
								<a href="/kokonutStationery/goods/category_best.do" class="cate1">잘나가요</a>
							</div>
						</td>
					</tr>
				</tbody>			
			</table>
		</div><!-- top_cate 끝 -->
		
		<ul id="top_menu" class="utilMenu">
			<c:if test="${memId == null}">
			<li><a href="/kokonutStationery/user/loginForm.do" class="utilMenuText">로그인</a></li>
			<li><a href="/kokonutStationery/user/join.do" class="utilMenuText">회원가입</a></li>
			</c:if>
			<c:if test="${memId != null}">
			<li><a href="/kokonutStationery/user/logout.do" class="utilMenuText">로그아웃</a></li>
			</c:if>
			<li><a href="/kokonutStationery/goods/goods_cart.do" class="utilMenuText">장바구니</a></li>
			
			<c:if test="${memId == null}">
			<li><a href="/kokonutStationery/user/loginForm.do" class="utilMenuText">마이페이지</a></li>
			</c:if>
			
			<c:if test="${memId != null}">
			<li><a href="/kokonutStationery/mypage/mypage_orderlist.do" class="utilMenuText">마이페이지</a></li>
			</c:if>
			
		</ul>
		
	</div><!-- top_menu_area 끝-->
</div><!-- top_1 끝-->




<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//카테고리 hover 시 sub 카테고리 나타나게
	$('#main_cate').mouseover(function(){
		$('.subLayer').css('display','block');
	});
	$('.catebar').mouseover(function(){
		$('.subLayer').css('display','block');
	});
	$('.catebar').mouseout(function(){
		$('.subLayer').css('display','none');
	});
	$('#main_cate').mouseleave(function(){
		$('.subLayer').css('display','none');
	});
	$('.subLayer').mouseleave(function(){
		$('.subLayer').css('display','none');
	});

});



function mypage(){
	alert("aaa");
//	var memId = ${memId};
//	alert(memId);
	// /kokonutStationery/user/mypage_orderlist.do
});

</script>

