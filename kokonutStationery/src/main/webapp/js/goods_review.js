$(document).ready(function(){
	//submit 버튼 hover
	$('.goods_userPage_searchBtn').hover(function(){
		$(this).css("background-color", "#2b2b2b");
	}, function(){
		$(this).css("background-color", "#444444");
	});
	//게시물 hover 이벤트
	$('.goods_userPage_board').hover(function(){
		$(this).css("background-color", "#f6f6f6");
	}, function(){
		$(this).css("background-color", "#ffffff");
	});
});