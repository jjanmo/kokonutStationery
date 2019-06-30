<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
//font-family: 'Hanna', sans-serif;
*{
	margin:0; padding:0;
	list-style-type:none;
}
a{color:#000000; text-decoration:none;}

#top_1{width:1100px; margin:auto;}
#top_menu_area{width:1100px; height:84px; position:relative;}
#top_logo{width:200px; height:66px; padding:19px 0 0 10px; float:left;
}

#top_cate{width:1100px; height:40px;}
#top_cate>table{padding-left:50px; width:730px;}
#top_cate td>div{margin-top:36px;}
.cate1{margin:30px; font-size:23px; color:#888888;}
.cate1:hover{color:#000000;}

#top_menu{float:right;}

</style>


<div id="top_1" style="width:1100px;">
	<div id="top_menu_area">
		<div id="top_logo">
			<a href="/kokonutStationery/admin/index.do">
				<image src="../image/admin_logo.png" />
			</a>
		</div><!-- top_logo 끝 -->
		
		<div id="top_cate">
			<table>
				<tbody>
					<tr>
						<td><!-- 상품관리 -->
							<div>
								<a href="/kokonutStationery/admin/productList.do" class="cate1">상품관리</a>
							</div>
						</td>
						
						<td><!-- 주문관리 -->
							<div>
								<a href="/kokonutStationery/admin/orderList.do" class="cate1">주문관리</a>
							</div>
						</td>
						<td><!-- 회원관리 -->
							<div>
								<a href="/kokonutStationery/admin/userList.do" class="cate1">회원관리</a>
							</div>
						</td>
						<td><!-- 게시물관리 -->
							<div>
								<a href="/kokonutStationery/admin/contentList.do" class="cate1">게시물관리</a>
							</div>
						</td>
					</tr>
				</tbody>			
			</table>
		</div><!-- top_cate 끝 -->
		
		<ul id="top_menu" class="utilMenu">
			<li><a href="#" class="utilMenuText">로그아웃</a></li>
		</ul>
		
	</div><!-- top_menu_area 끝-->
</div><!-- top_1 끝-->




<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.utilMenuText').click(function(){
		location.replace('/kokonutStationery/admin/logout.do');
	});

});
</script>

