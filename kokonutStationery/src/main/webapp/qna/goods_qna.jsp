<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품문의 페이지</title>
<link rel="stylesheet" href="../css/goods_userPage.css?alert">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../js/goods_qna.js?alert"></script>
</head>
<body>
<div class="main">
	<div class="goods_userPage_area">
		<div class="goods_userPage_main">		
			<div style="font-size:22px; font-weight:700;">상품문의</div>
			<form id="userPage_searchForm">
				<div class="goods_userPage_search">
					<select id="searchOption" name="searchOption" class="goods_userPage_searchOption">
						<option value="">통합검색</option>
						<option value="qnaboardSubject">제목</option>
						<option value="userId">작성자</option>
						<option value="productName">상품명</option>
					</select>
					<input type="text"  id="searchContent" name="searchContent" class="goods_userPage_searchValue" placeholder="검색어를 입력하세요">
					<input type="submit" id="goods_userPage_searchBtn" class="goods_userPage_searchBtn" value="검색">
				</div>
				<div>
					<select class="goods_userPage_sortOption">
						<option>10개씩 정렬</option>
						<option>20개씩 정렬</option>
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
				<div class="goods_userPage_paging"><b>1</b></div>
			</form>
		</div>
	</div>
</div>
</body>


<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		typd:'post',
		url:'../qna/goods_qnaAllList.do',
		dataType:'json',
		success:function(data){
			//alert(JSON.stringify(data));
			
			if(data!=null){
				$('#contentDiv').append($('<table/>',{
					class:'goods_userPage_board',
					cellpadding:'5'
				}));
				
				$.each(data.list, function(index, item) {
					
					//////////////////질문///////////////////					
					if(item.admin==0){
						//타이틀
						$('.goods_userPage_board').append($('<tr/>',{
							
							height:'25',
							id:'qna_'+index
							
							}).append($('<td/>',{
								width:'80',
								text:item.qnaboardCode
								
							})).append($('<td/>',{
								width:'80',
								id:'qnaThumbImg_'+index
								
							})).append($('<td/>',{							
								id:'qnaSubject_'+index,
								style:'text-align:left;'
								
								}).append($('<span/>',{
									style:'font-weight:700; color:#a0a0a0;',
									text: '질문 : '
								
								})).append($('<sapn/>',{
									text:item.qnaboardSubject
								
							}))).append($('<td/>',{
								width:'140',
								text:item.userId
								
							})).append($('<td/>',{
								width:'120',
								text:item.regDate
							})));
						
							//이미지,a태그추가
							$('#qnaThumbImg_'+index).append($('<a/>',{
								href:'../goods/goods_view.do?productCode='+item.productCode
							
								}).append($('<img/>',{
									class:'goods_userPage_img',
									src:'../image/thumb/'+item.thumbImg
							})));
						
						//내용
						if(item.secret==0){
							
							$('.goods_userPage_board').append($('<tr/>',{
								class:'userPage_content_'+index,
								id:'qna_'+index+'_content'
								
							}).append($('<td/>',{
								colspan:'5',
								style:'text-align:left; padding:25px; white-space: pre-wrap;',
								height:'100%',
								text:item.qnaboardContent
							})));
						
						 
						}else if(item.secret==1){
							//비밀글일때
							//잠금이미지 추가
							$('#qnaSubject_'+index).append($('<img>',{
								src:'../image/private_lock.gif'
							}));
							
							//내용
							$('.goods_userPage_board').append($('<tr/>',{
								id:'qna_'+index+'_content'
								
							}).append($('<td/>',{
								class:'userPage_content_'+index,
								colspan:'5',
								text:'비밀글입니다.'
							})));
							
							//비밀글일때 내용안보이게
							$('.userPage_content_'+index).addClass('userPage_private_lock');
							
						}
						
					}else if(item.admin==1){						
						//////////////////답변///////////////////
						
							$('.goods_userPage_board').append($('<tr/>',{
							
							height:'50',
							id:'qna_'+index
							
							}).append($('<td/>',{
								width:'80',
								text:item.qnaboardCode
								
							})).append($('<td/>',{
								width:'80'
								
							})).append($('<td/>',{	
								id:'qnaSubject_'+index,
								style:'text-align:left;'
								
								}).append($('<span/>',{
									style:'font-weight:700; color:#2AC1BC;',
									text: '답변 : '
								
								})).append($('<sapn/>',{
									text:item.qnaboardSubject
								
							}))).append($('<td/>',{
								width:'140',
								text:item.userId
								
							})).append($('<td/>',{
								width:'120',
								text:item.regDate
							})));
						
						
							//내용
							if(item.secret==0){
								
								$('.goods_userPage_board').append($('<tr/>',{
									class:'userPage_content_'+index,
									id:'qna_'+index+'_content'
									
								}).append($('<td/>',{
									colspan:'5',
									style:'text-align:left; padding:25px; white-space: pre-wrap;',
									height:'100%',
									text:item.qnaboardContent
								})));
							
							 
							}else if(item.secret==1){
								//비밀글일때
								//잠금이미지 추가
								$('#qnaSubject_'+index).append($('<img>',{
									src:'../image/private_lock.gif'
								}));
								
								//내용
								$('.goods_userPage_board').append($('<tr/>',{
									id:'qna_'+index+'_content'
									
								}).append($('<td/>',{
									class:'userPage_content_'+index,
									colspan:'5',
									text:'비밀글입니다.'
								})));
								
								//비밀글일때 내용안보이게
								$('.userPage_content_'+index).addClass('userPage_private_lock');
								
							}
						
						
					}//관리자답변if
					
					
					//답변내용숨기기
					$('#qna_'+index+'_content').hide();
					//답변내용클릭시 보이게
					$('#qna_'+index).on('click', function(){
						$('#qna_'+index+'_content').toggle();
					});
					
					//후기 문의 게시물 hover 이벤트
					$('#qna_'+index).hover(function(){
						$(this).css("background-color", "#f6f6f6");
					},function(){
						$(this).css("background-color", "#ffffff");
					});	
					$('#qna_'+index+'_content').hover(function(){
						$(this).css("background-color", "#f6f6f6");
					},function(){
						$(this).css("background-color", "#ffffff");
					});
				});//for문
			}//if - data문
			
		}//success
	});//ajax
	
	/*
	//검색버튼
	$('#goods_userPage_searchBtn').click(function(event,str){
		if(str!='trigger') $('input[name=pg]').val(1);
		//trigger이벤트일 땐 2~이상의 페이지/ 검색하지않을때는 1페이지보여주기
		
		if($('#searchContent').val()=='')
			alert("검색어를 입력하세요.");
		else{
			var pg = $('input[name=pg]').val();//1
			var searchOption = $('#searchOption').val();
			var searchContent = $('#searchContent').val();
			
			$.ajax({
				type:'POST',
				url:'../qna/qnaboardSearch.do',
				data:{'pg':pg,
					'searchOption':searchOption,
					'searchContent':searchContent},
				dataType:'json',
				success:function(data){
					$('#boardTable tr:gt(0)').remove();//0보다 큰 tr은 제거
					
					
					$.each(data.list, function(index, items){
						
					});
					
				}
			});
		}
		
	});
	*/
});
</script>
</html>