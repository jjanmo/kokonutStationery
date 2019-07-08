<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품후기 페이지</title>
<link rel="stylesheet" href="../css/goods_userPage.css?alert">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../js/goods_review.js?alert"></script>
</head>
<body>
<div class="main">
	<div class="goods_userPage_area">
		<div class="goods_userPage_main">		
			<div style="font-size:22px; font-weight:700;">이용후기</div>
			<form id="userPage_searchForm">
				<div class="goods_userPage_search">
					<select id="searchOption" class="goods_userPage_searchOption" name="searchOption">
						<option value="all">통합검색</option>
						<option value="reviewboardSubject">제목</option>
						<option value="userId">작성자</option>
						<option value="productName">상품명</option>
					</select>
					<input type="hidden" name="pg" value="1">
					<input type="text"  id="searchContent" name="searchContent" value="" class="goods_userPage_searchValue" placeholder="검색어를 입력하세요">
					<input type="button" id="goods_userPage_searchBtn" class="goods_userPage_searchBtn" value="검색">
				</div>
				<div>
					<select id="pageNum" name="pageNum" class="goods_userPage_sortOption">
						<option value="10">10개씩 정렬</option>
						<option value="20">20개씩 정렬</option>
					</select>
				</div>
				<br><br>
				<!-- 타이틀 -->
				<div id="titleDiv">
					<table class="goods_userPage_table" cellspacing="0" cellpadding="5">
						<tr height="23">
							<th width="80">번호</th>
							<th width="80">이미지</th>
							<th>상품명/제목</th>
							<th width="140">작성자</th>
							<th width="120">작성일</th>
						</tr>
					</table>
				</div>
				<!-- 리스트 -->
				<div id="contentDiv">
					
				</div>
				
				<!-- 페이징 -->
				<div class="goods_userPage_paging"></div>
			</form>
		</div>
	</div>
</div>
</body>

<script type="text/javascript">

//검색했을때 작성자 제목 유지하도록
window.onload=function(){
	if('${searchOption}'=='all'||'${searchOption}'=='reviewboardSubject'
		||'${searchOption}'=='userId'||'${searchOption}'=='productName'){
		document.getElementById('searchOption').value='${searchOption}';
	}
}

$(document).ready(function(){
	$.ajax({
		type:'post',
		url:'../review/goods_reviewAllList.do',
		dataType:'json',
		success:function(data){
			//alert(JSON.stringify(data));
			
			if(data!=null){
				$('#contentDiv').append($('<table/>',{
					class:'goods_userPage_board',
					cellpadding:'5'
				}));
				
				$.each(data.list, function(index, item) {
					//////////////////후기///////////////////					
					
					$('.goods_userPage_board').append($('<tr/>',{
						
						height : '25',
						id : 'review_'+index
						
						}).append($('<td/>',{ //번호
							width : '80',
							text : item.reviewboardCode
							
						})).append($('<td/>',{//썸네일이미지
							width : '80',
							id : 'reviewThumbImg_'+index
						
						})).append($('<td/>',{ // 제목
							id : 'reviewSubject_'+index,
							style : 'text-align:left;'
							
							}).append($('<span/>',{
								text : item.reviewboardSubject
							
						}))).append($('<td/>',{
							width:'140',
							text:item.userId
							
						})).append($('<td/>',{
							width:'120',
							text:item.regDate
					})));
					 
					//이미지,a태그추가
					$('#reviewThumbImg_'+index).append($('<a/>',{
						href:'../goods/goods_view.do?productCode='+item.productCode
					
						}).append($('<img/>',{
							class:'goods_userPage_img',
							src:'../image/thumb/'+item.thumbImg
					})));
					
					//내용부분 붙이기
					$('.goods_userPage_board').append($('<tr/>',{
						class:'userPage_content_'+index,
						id:'review_'+index+'_content'
						
					}).append($('<td/>',{
						colspan:'5',
						style:'text-align:left; padding:25px; white-space: pre-wrap;',
						height:'100%',
						text:item.reviewboardContent
					})));
					
					
					//답변내용숨기기
					$('#review_'+index+'_content').hide();
					//답변내용클릭시 보이게
					$('#review_'+index).on('click', function(){
						$('#review_'+index+'_content').toggle(function(){
						});//toggle				
					});//내용이벤트
						
					//후기 문의 게시물 hover 이벤트
					$('#review_'+index).hover(function(){
						$(this).css("background-color", "#f6f6f6");
					},function(){
						$(this).css("background-color", "#ffffff");
					});	
					$('#review_'+index+'_content').hover(function(){
						$(this).css("background-color", "#f6f6f6");
					},function(){
						$(this).css("background-color", "#ffffff");
					});			
									
				});//each문
						
				//페이징
				$('.goods_userPage_paging').append($('<div/>',{
					html : data.reviewboardPaging.pagingHTML
				}));
				
			}//if문
			
		}//success
	});//ajax
	
	$('#goods_userPage_searchBtn').on('click',function(event,str){
		if(str!='trigger') $('input[name=pg]').val(1);
		var pg = $('input[name=pg]').val();
		searchFunction(pg);
		
	});//clickevent
	
	
});

//서치시 페이징
function reviewboardSearchPaging(pg){
	$('input[name=pg]').val(pg);
	//검색버튼을 클릭한 효과를 주어야한다
	$('#goods_userPage_searchBtn').trigger('click','trigger');//'trigger'를 전달
	$('#pageNum').trigger('change','trigger');//'trigger'를 전달
}

//기본페이징
function reviewboardPaging(pg){
	
	$.ajax({
		type:'POST',
		url:'../review/goods_reviewAllList.do',
		data:{'pg':pg},
		dataType:'json',
		success:function(data){
			
			$('#contentDiv').children().remove();
			$('.goods_userPage_paging').children().remove();
			
			
			if(data!=null){
				$('#contentDiv').append($('<table/>',{
					class:'goods_userPage_board',
					cellpadding:'5'
				}));
				
				$.each(data.list, function(index, item) {
					//////////////////후기///////////////////					
					
					$('.goods_userPage_board').append($('<tr/>',{
						
						height : '25',
						id : 'review_'+index
						
						}).append($('<td/>',{ //번호
							width : '80',
							text : item.reviewboardCode
							
						})).append($('<td/>',{//썸네일이미지
							width : '80',
							id : 'reviewThumbImg_'+index
						
						})).append($('<td/>',{ // 제목
							id : 'reviewSubject_'+index,
							style : 'text-align:left;'
							
							}).append($('<span/>',{
								text : item.reviewboardSubject
							
						}))).append($('<td/>',{
							width:'140',
							text:item.userId
							
						})).append($('<td/>',{
							width:'120',
							text:item.regDate
					})));
					 
					//이미지,a태그추가
					$('#reviewThumbImg_'+index).append($('<a/>',{
						href:'../goods/goods_view.do?productCode='+item.productCode
					
						}).append($('<img/>',{
							class:'goods_userPage_img',
							src:'../image/thumb/'+item.thumbImg
					})));
					
					//내용부분 붙이기
					$('.goods_userPage_board').append($('<tr/>',{
						class:'userPage_content_'+index,
						id:'review_'+index+'_content'
						
					}).append($('<td/>',{
						colspan:'5',
						style:'text-align:left; padding:25px; white-space: pre-wrap;',
						height:'100%',
						text:item.reviewboardContent
					})));
					
					
					//답변내용숨기기
					$('#review_'+index+'_content').hide();
					//답변내용클릭시 보이게
					$('#review_'+index).on('click', function(){
						$('#review_'+index+'_content').toggle(function(){	
						});//toggle				
					});//내용이벤트
						
					//후기 문의 게시물 hover 이벤트
					$('#review_'+index).hover(function(){
						$(this).css("background-color", "#f6f6f6");
					},function(){
						$(this).css("background-color", "#ffffff");
					});	
					$('#review_'+index+'_content').hover(function(){
						$(this).css("background-color", "#f6f6f6");
					},function(){
						$(this).css("background-color", "#ffffff");
					});			
									
				});//each문
						
				//페이징
				$('.goods_userPage_paging').append($('<div/>',{
					html : data.reviewboardPaging.pagingHTML
				}));				
			}//if문				
		}
	});
}//reviewboardPaging
</script>

<script type="text/javascript">

//정렬이벤트
$(function() {
	$("#pageNum").change(function(event,str) {
		if(str!='trigger') $('input[name=pg]').val(1);
		var pg = $('input[name=pg]').val();	
		searchFunction(pg);	
	});
	
});


//서치,정렬함수
function searchFunction(pg){
	var pageNum=$('select[name=pageNum]').val();
	var searchOption = $('#searchOption').val();
	var searchContent = $('#searchContent').val();
	
		$.ajax({
			type:'POST',
			url:'../review/reviewboardSearch.do',
			data:{'pg':pg,
				'pageNum':pageNum,
				'searchOption':searchOption,
				'searchContent':searchContent},
			dataType:'json',
			success:function(data){
				//alert("search다!"+JSON.stringify(data));
				
				$('#contentDiv').children().remove();//0보다 큰 tr은 제거
				$('.goods_userPage_paging').children().remove();
				
				if(data!=null){
					$('#contentDiv').append($('<table/>',{
						class:'goods_userPage_board',
						cellpadding:'5'
					}));
					
					$.each(data.list, function(index, item) {
						//////////////////후기///////////////////					
						
						$('.goods_userPage_board').append($('<tr/>',{
							
							height : '25',
							id : 'review_'+index
							
							}).append($('<td/>',{ //번호
								width : '80',
								text : item.reviewboardCode
								
							})).append($('<td/>',{//썸네일이미지
								width : '80',
								id : 'reviewThumbImg_'+index
							
							})).append($('<td/>',{ // 제목
								id : 'reviewSubject_'+index,
								style : 'text-align:left;'
								
								}).append($('<span/>',{
									text : item.reviewboardSubject
								
							}))).append($('<td/>',{
								width:'140',
								text:item.userId
								
							})).append($('<td/>',{
								width:'120',
								text:item.regDate
						})));
						 
						//이미지,a태그추가
						$('#reviewThumbImg_'+index).append($('<a/>',{
							href:'../goods/goods_view.do?productCode='+item.productCode
						
							}).append($('<img/>',{
								class:'goods_userPage_img',
								src:'../image/thumb/'+item.thumbImg
						})));
						
						//내용부분 붙이기
						$('.goods_userPage_board').append($('<tr/>',{
							class:'userPage_content_'+index,
							id:'review_'+index+'_content'
							
						}).append($('<td/>',{
							colspan:'5',
							style:'text-align:left; padding:25px; white-space: pre-wrap;',
							height:'100%',
							text:item.reviewboardContent
						})));
						
						
						//답변내용숨기기
						$('#review_'+index+'_content').hide();
						//답변내용클릭시 보이게
						$('#review_'+index).on('click', function(){
							$('#review_'+index+'_content').toggle(function(){	
							});//toggle				
						});//내용이벤트
							
						//후기 문의 게시물 hover 이벤트
						$('#review_'+index).hover(function(){
							$(this).css("background-color", "#f6f6f6");
						},function(){
							$(this).css("background-color", "#ffffff");
						});	
						$('#review_'+index+'_content').hover(function(){
							$(this).css("background-color", "#f6f6f6");
						},function(){
							$(this).css("background-color", "#ffffff");
						});			
										
					});//each문
							
					//페이징
					$('.goods_userPage_paging').append($('<div/>',{
						html : data.reviewboardPaging.pagingHTML
					}));				
				}//if문	
						
			}//data
		});//ajax
}

</script>







</html>