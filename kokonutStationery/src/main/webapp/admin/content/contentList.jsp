<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<meta charset="UTF-8">
<title>Admin 페이지</title>
<style type="text/css">
#userSeach_list th{
	height: 53px;
	font-weight: 500;
	font-weight: 500;
    background-color: #f5f4f4;
}

.board_menuBar{
	float: left;
    font-size: 16px;
    margin: 10px 0 20px 20px;
}

.content_menuBar{
	color: gray;
}

#pagingDiv{
	width: 1000px;
	float: left;
	text-align: center;
}

#paging{
	color: black;
	text-decoration: none;
	cursor: pointer;
}

#currentPaging{
	color: red;
	text-decoration: underline;
	cursor: pointer;
}
</style>
</head>
<input type="hidden" id="pagingCheck" value="${pagingCheck }">
<input type="hidden" id="pg" value="${pg }">
<input type="hidden" id="boardOption" value="tbl_admin">
<input type="hidden" id="ajaxCheck" value=0><!-- 상품 후기 클릭 시 ajax 반복 막기 -->
<!-- 메인컨텐츠 시작 -->
<div id="mainContent_wrap" style="width:1100px; margin:auto; padding-bottom:100px;">
	<div id="user_search_wrap" style="width: 1000px; margin: 0 auto;">
		<div id="user_search_title" style="margin-bottom: 20px;">
			<h1 style="font-weight:normal;">게시글 관리</h1>
		</div>
		
	
		<div class="board_menuBar" style="margin: 10px 0 20px 0;">
			<a href="#" id="notice_board" class="content_menuBar">공 지 사 항</a>
		</div>
		<div class="board_menuBar">
			<a href="#" id="product_qna" class="content_menuBar">상 품 문 의</a>
		</div>
		<div class="board_menuBar">
			<a href="#" id="product_review" class="content_menuBar">상 품 후 기</a>
		</div>

		<div id="userSeach_list" align="left" style="margin-top: 50px;">
			<table id="contentTable" border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 20px;">
						<input type="checkbox">
					</th>
					<th style="width: 60px;">번&emsp;&nbsp;호</th>
					<th  id="reviewTh" style="width: 300px;">제&emsp;&nbsp;목</th>
					<th id="writerTh" style="width: 80px;">날&emsp;&nbsp;짜</th>
				</tr>
			</table>
			<br>
			<div id="pagingDiv"></div>
			<br><br><br><br>
		</div>
	</div><!-- search_wrap -->
</div><!-- 메인컨텐츠 끝 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	if($('#pagingCheck').val()=='review'){
		$('#product_review').get(0).click();
		$('#pagingCheck').val(0);
	}
});
//공지사항 전체 리스트
$('#notice_board').click(function(){ //공지사항 탭 누를 경우
	$('.content_menuBar').css('color','#808080');
	   $(this).css('color','#000000').css('font-weight','bold');
	$('#boardOption').val('tbl_admin');
	$('#reviewImg').remove();
	$('#writer').remove();
	$('#ajaxCheck').val(0);
	
	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/admin/noticeboardList.do',
		dataType : 'json',
		success : function(data){
			$('#contentTable tr:gt(0)').remove();
			//공지 전체 리스트
			$.each(data.list, function(index,items){
				$('<tr/>').append($('<td/>',{
					align: 'center'
				}).append($('<input/>',{
					type : 'checkbox'
				}))).append($('<td/>',{
					align : 'center',
					text : items.reviewboardCode
				})).append($('<td/>',{
						align : 'center',
					}).append($('<img/>',{
						src : '../image/thumb/'+items.reviewboardImg
					}).css('width','65px'))).append($('<td/>',{
						text : items.reviewboardSubject
					}).css('padding-left', '5px')).append($('<td/>',{
						align : 'center',
						text : items.userId
					})).append($('<td/>',{
						align : 'center',
						text : items.regDate
					})).appendTo($('#contentTable'));
			});
		}//success
	});//ajax
});

//상품 문의 전체 리스트
$('#product_qna').click(function(){ // 상품문의 탭 누를 경우
	$('.content_menuBar').css('color','#808080');
	   $(this).css('color','#000000').css('font-weight','bold');
	$('#boardOption').val('tbl_qnaboard');
	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/admin/reviewboardList.do',
		dataType : 'json',
		success : function(data){
			if($('#ajaxCheck').val()==0){
				//테이블 이미지th 추가
				$('#reviewTh').before($('<th/>',{text: '상품 이미지', id:'reviewImg'}).css('width', '70px'));	
				$('#writerTh').before($('<th/>',{text: '작성자', id:'writer'}).css('width', '70px'));
				$('#ajaxCheck').val(1);
				
				$('#contentTable tr:gt(0)').remove();
				//문의 전체 리스트
				$.each(data.list, function(index,items){
					$('<tr/>').append($('<td/>',{
						align: 'center'
					}).append($('<input/>',{
						type : 'checkbox'
					}))).append($('<td/>',{
						align : 'center',
						text : items.reviewboardCode
					})).append($('<td/>',{
							align : 'center',
						}).append($('<img/>',{
							src : '../image/thumb/'+items.reviewboardImg
						}).css('width','65px'))).append($('<td/>',{
							text : items.reviewboardSubject
						}).css('padding-left', '5px')).append($('<td/>',{
							align : 'center',
							text : items.userId
						})).append($('<td/>',{
							align : 'center',
							text : items.regDate
						})).appendTo($('#contentTable'));
				});
			}//if
		}//success
	});//ajax	
});


//상품 후기 전체 리스트
$('#product_review').click(function(){ // 상품 후기 탭 누를 경우
	$('.content_menuBar').css('color','#808080');
	   $(this).css('color','#000000').css('font-weight','bold');
	$('#boardOption').val('tbl_reviewboard');
	$('.contentA').hide();
	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/admin/reviewboardList.do',
		data : {'pg' : $('#pg').val()},
		dataType : 'json',
		success : function(data){
			if($('#ajaxCheck').val()==0){//상품 후기 탭 누를 시 중복 생성 방지
				//테이블 이미지th 추가
				$('#reviewTh').before($('<th/>',{text: '상품 이미지', id:'reviewImg'}).css('width', '70px'));	
				$('#writerTh').before($('<th/>',{text: '작성자', id:'writer'}).css('width', '70px'));
				$('#ajaxCheck').val(1);
				
				$('#contentTable tr:gt(0)').remove();
				//후기 전체 리스트
				$.each(data.list, function(index,items){
					$('<tr/>').append($('<td/>',{
						align: 'center'
					}).append($('<input/>',{
						type : 'checkbox'
					}))).append($('<td/>',{
						align : 'center',
						text : items.reviewboardCode
					})).append($('<td/>',{
							align : 'center',
						}).append($('<img/>',{
							src : '../image/thumb/'+ items.thumbImg
						}).css('width','65px'))).append($('<td/>').append($('<a/>',{
							href : 'javascript:void(0)',
							name : items.reviewboardCode,
							class : 'subjectA',
							text : items.reviewboardSubject
						})).css('padding-left', '5px')).append($('<td/>',{
							align : 'center',
							text : items.userId
						})).append($('<td/>',{
							align : 'center',
							text : items.regDate
						})).appendTo($('#contentTable'));
					
					
					//후기 선택 내용 생성
					if(items.reviewboardImg!=0){//후기 이미지 첨부 있을 시
						$('<tr/>').append($('<td/>',{
							colspan : 6,
							style : 'padding: 30px 0 10px 130px; border-bottom:none;',
							class : 'contentA',
							id : items.reviewboardCode
						}).append($('<img/>',{
								src:'../image/thumb/'+items.reviewboardImg,
								style : 'width: 300px; height: 300px;'
							}))).appendTo($('#contentTable'));
						
						$('<tr/>').append($('<td/>',{
							text : items.reviewboardContent,
							style : 'padding: 10px 0 100px 130px; border-top:none;',
							colspan : 6,
							class : 'contentA',
							id : items.reviewboardCode
						})).appendTo($('#contentTable'));
					}//if
					else{//후기 이미지 첨부 없을 시
						$('<tr/>').append($('<td/>',{
								text : items.reviewboardContent,
								style : 'padding: 35px 0 100px 130px; border-top:none;',
								colspan : 6,
								class : 'contentA',
								id : items.reviewboardCode
							})).appendTo($('#contentTable'));		
					}//else
					$('.contentA').hide();
				});//each
				
				$('.subjectA').click(function(){
		            var code = $(this).attr('name');
		            
		            $('.contentA').not('[id^='+code+']').each(function(){
		               $(this).hide();
		            });

		            $('[id^='+code+']').each(function(){
		               $(this).toggle();
		            });
		         });
				$('#pagingDiv').html(data.reviewboardPaging.pagingHTML);
			}//if
		}//success
	});//ajax
});

/* 페이징 함수 */
function reviewboardPaging(pg){
	location.href="/kokonutStationery/admin/contentList.do?pg="+pg+"&pagingCheck=review";
}
</script>