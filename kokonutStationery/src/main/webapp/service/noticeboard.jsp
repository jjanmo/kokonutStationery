<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KOKONUT STATIONERY</title>
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

/* noticeboard */
.notice_wrap{
	width: 1000px;
	margin: 0 auto;
}
.notice_top{
	width: 96%;
	font-size: 22px;
	font-weight: 700;
	text-align: left;
	margin: 135px 0 20px 20px;
}
.notice_list td{

	text-align: center;
	height: 51px;
	width: 64px;
}
.notice_list{
	padding-left: 20px;
	font-size: 12px;
	margin-bottom: 150px;
	
}
.list_menu{
	background: #f6f6f6;
	color: #999;
}
.list_content td{
	height: 71px;
	font-size: 13px;
}

.notice_view_link{
	font-weight: bold;
	color: #000;
}

.list_menu a{
	text-decoration: underline;
	font-weight: bold;
}

.notice_search{
	padding-top: 60px;
	height: 60px;
	
}
.notice_search label{
	font-size: 12px;
	margin-right: 15px;
}

.notice_BtnGroup{
	width: 50px;
	height: 30px;
	margin-left: 5px;
	text-align: center;
	line-height: 30px;
	border: none;
}

.notice_check{
	width: 15px;
	height: 15px;
}
.notice_selectBtn{
	width: 100%;
	height: 100%;
	padding-top: 30px;

}
.notice_viewBtn{
	text-align: center;
	width : 130px;
	height: 60px;
	line-height: 60px;
	font-size: 13px;
	font-weight: 700;
	background-color: #fff;
	color: #a4a4a4;
	border: 1px solid #ccc;
	cursor: pointer;
	
}

.list_content td{
	border-bottom: 1px solid #ebebeb;
}
#notice_table{
	border-top: 1px solid #999;
    border-spacing: 0;
}
#list_title{
	text-align: left;
	padding-left: 20px;
}

#notice_searchBtn{
	cursor: pointer; 
	background-color: #444;
	font-weight: 500;
	color: #fff;
}

#notice_resetBtn{
	cursor: pointer; 
	background-color: #fff;
	font-weight: 500; 
	color: #a4a4a4;
}

#notice_searchText{
	width: 200px;
	height: 30px;
	border-style: none;
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
		
		<div class="notice_wrap"><!-- 공지 -->
			<div class="notice_top">
				공지사항
			</div>
			<div class="notice_list">
				<table id="notice_table" >
					<tr class="list_menu">
						<td><a href="#" id="checkAll">선택</a></td>
						<td>번호</td>
						<td style="width: 704px;">제목</td>
						<td style="width: 128px;">날짜</td>
					</tr>
					<tr class="list_content">
						<td>
							<input type="checkbox" class="notice_check">
						</td>
						<td>
							<img src="../image/board_notice.gif">
						</td>
						<td id="list_title" >
							<a href="/kokonutStationery/service/noticeboardView.do" class="notice_view_link">[공지] 개인정보처리방침 일부 변경에 관한 안내</a>
						</td>
						<td>
							2018-11-21
						</td>
					</tr>
					
					<tr class="list_content">
						<td>
							<input type="checkbox" class="notice_check">
						</td>
						<td>
							<img src="../image/board_notice.gif">
						</td>
						<td id="list_title" >
							<a href="/kokonutStationery/service/noticeboardView.do" class="notice_view_link">[공지] 개인정보처리방침 일부 변경에 관한 안내</a>
						</td>
						<td>
							2018-11-21
						</td>
					</tr>
					
					
					<tr><!-- Search -->
						<td colspan="4" class="notice_search">
							<div style="background-color: #ddd; height: 60px;">
								<div style="padding: 13px 0px;">
									<input type="checkbox" id="title_checkBox" name="group" class="notice_check">
									<label>&nbsp;제목</label>
									<input type="checkbox" name="group" class="notice_check">
									<label>&nbsp;내용</label>
									<input type="text" id="notice_searchText">
									<input type="button" id="notice_searchBtn" class="notice_BtnGroup" value="검색" >
									<input type="button" id="notice_resetBtn" class="notice_BtnGroup" value="취소" >
								</div>
							</div>
							
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<div class="notice_selectBtn">
								<input type="button"  class="notice_viewBtn" value="선택보기">
								<input type="button" id="notice_listBtn" class="notice_viewBtn" value="목록">
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<!-- footer 시작 -->
		<div>
			<jsp:include page="../template/footer.jsp" />	
		</div>
		<!-- footer 끝 -->
</div><!-- wrap_end -->
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

/*search 체크박스 하나만 선택 가능*/
$(document).ready(function() {
	$('#title_checkBox').prop('checked', true);
    $('input[type="checkbox"][name="group"]').click(function(){
        if ($(this).prop('checked')) {
            $('input[type="checkbox"][name="group"]').prop('checked', false);
            $(this).prop('checked', true);
        }
    });
});

/* 리스트 전체 선택, 해제 */
var check = 0;

$('#checkAll').click(function(){
	if(check==0) {
		$(".list_content input[type=checkbox]").prop("checked",true); 
		check=1;
	} else {
		$(".list_content input[type=checkbox]").prop("checked",false); 
		check=0;
	}

});

$('#notice_resetBtn').click(function(){
	location.href="/kokonutStationery/service/noticeboard.do";
});

$('#notice_listBtn').click(function(){
	location.href="/kokonutStationery/service/noticeboard.do";
});
</script>
</html>