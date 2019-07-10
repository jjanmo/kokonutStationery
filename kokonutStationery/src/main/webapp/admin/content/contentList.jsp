<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta charset="UTF-8">
<title>Admin 페이지</title>
<style type="text/css">

/* 검색 창  */
#contentList_searchForm{
	width:1000px;
	margin:auto;
	
}

.contentList_search{
	width: 1000px;
	height: 71px;
	line-height: 71px;
	background-color: #EBEBEB;
	text-align: center;
	padding: 30px 0;
	margin: 20px 0 40px 0;
}

.contentList_searchOption{
	border: 1px solid white;
	width: 200px;
	height: 50px;
	padding: 0 0 0 15px;
	margin: 0 7px 0 0;
}
.contentList_searchValue{
	border: 1px solid white;
	width: 520px;
	height: 48px;
	padding: 0 0 0 15px;
	margin: 0 7px 0 0;
}
.contentList_searchBtn{
	border: 1px solid black;
	width: 130px;
	height: 50px;
	background-color: #444444;
	color: white;
	padding: 0;
	margin: 0;
	cursor: pointer;
}


#userSearch_list th{
	height: 53px;
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

#select_deleteBtn{
	width: 100px;
    height: 35px;
    padding: 0 20px;
    font-size: 14px;
    font-weight: normal;
    cursor: pointer;
    color: #1b87d4;
    border: 1px solid #1b87d4;
    background-color: #fff;
    float: right;
}

#select_deleteBtn:hover {
    background-color: #1b87d4;
    color: #ffffff;
}
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0,0,0); /* Fallback color */
	background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
    
	/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    max-width: 100%; /* Could be more or less, depending on screen size */     
     width: auto; display: table;                   
}

.modalDiv{
	width:185px;
	cursor:pointer;
	background-color:#DDDDDD;
	text-align: center;
	padding-bottom: 10px;
	padding-top: 10px;
	margin: 0 15px 0 15px;
}

#contentTable{
	border-collapse:collapse;
}

.subjectTr:hover{
	background:#f6f6f6;
}

.contentA{
	width:1000px; max-width:1000px;
}

#editA{
	margin-top:50px;
}

#editA:hover{
	background:#808080;
	color:#ffffff;
}

/* 공지사항 글쓰기 버튼 */
#noticeWriteBtn{
	width:60px; height:23px;
	padding-top:10px; margin-right:6px;
	display:none; border:1px solid #1b87d4;
	cursor:pointer; float:right;
	text-align:center;
	font-size:14px;
	color:#1b87d4;

}

#noticeWriteBtn:hover{
	background:#1b87d4;
	color:#ffffff;
}

/* 문의 관리 답변 버튼 */
#replyA{
	margin-top:50px;
}

#replyA:hover{
	background:#808080;
	color:#ffffff;
}



</style>
</head>
<form id="check_delete_form" method="post"
action="contentDelete.do">
<input type="hidden" id="pagingCheck" value="${pagingCheck }">
<input type="hidden" id="pg" value="${pg }">
<input type="hidden" id="boardOption" name="boardOption" value="tbl_noticeboard">
<input type="hidden" id="ajaxCheck" value=0><!-- 상품 후기 클릭 시 ajax 반복 막기 -->
<!-- 메인컨텐츠 시작 -->
<div id="mainContent_wrap" style="width:1100px; margin:auto; padding-bottom:100px;">
	<div id="user_search_wrap" style="width: 1000px; margin: 0 auto;">
		<div id="user_search_title" style="margin-bottom: 20px;">
			<h1 style="font-weight:normal;">게시글 관리</h1>
		</div>
		
		<div><!-- 검색 창 -->
			<form id="contentList_searchForm">
				<div class="contentList_search">
					<select class="contentList_searchOption" name="searchOption">
						<option id="search_all" name="searchOptionContent" value="noticeSearch">통합검색</option>
						<option id="search_subject" name="searchOptionContent" value="noticeboardSubject">제목</option>
						<option id="search_content" name="searchOptionContent" value="noticeboardContent">내용</option>
					</select>
					<input type="text" class="contentList_searchValue" name="searchKeyword" placeholder="검색어를 입력하세요">
					<input type="button" class="contentList_searchBtn" value="검색">
				</div>
			</form><!-- contentList_searchForm -->
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
		<div class="select_delete">
			<input type="button" id="select_deleteBtn" value="선택 삭제">
		</div>
		<div id="noticeWriteBtn"><!-- 공지사항 글쓰기 버튼 -->
		</div>

		<div id="userSearch_list" align="left" style="margin-top: 50px;">
			<table id="contentTable" border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 20px;">
						<input id="check_all" type="checkbox">
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
		
		
		 <!-- 선택 삭제 시 확인&취소 / Modal -->
		 <div id="open_confirmModal" class="modal">

			<!-- Modal content -->
			<div class="modal-content">
          		<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">상품삭제</span></b></span></p>
				<p style="text-align: center; line-height: 1.5;"><br>	<span style="color: red;">정말  삭제 하시겠습니까?</span></p>
    			<p><br /></p>

				<div class="modalDiv" id="confirmOK_Modal" style="display: inline-block;">
					<span class="pop_bt" style="font-size: 13pt; " >
       	  				확인
    				</span>

				</div>
				<div  class="modalDiv" id="confirmClose_Modal" style="float:right;">
					<span class="pop_bt" style="font-size: 13pt;" >
	               	 	 취소
	            	</span>
	       		</div>
 		 	</div>
		</div>
  		<!--End Modal-->
        	
		<!-- 체크박스 선택 X / Modal -->
		<div id="open_nonCheckModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">
         		<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">상품삭제</span></b></span></p>
				<p style="text-align: center; line-height: 1.5; color: red;"><br />항목을 선택해 주세요</p>
    			<p><br /></p>
    			
				<div class="close_Modal" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
					<span class="pop_bt" style="font-size: 13pt;" >
               	  		닫기
            		</span>
        		</div>
  			</div>

		</div>
 		<!--End Modal-->
	</div><!-- search_wrap -->
</div><!-- 메인컨텐츠 끝 -->
</form>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	if($('#boardOption').val()=='tbl_noticeboard'){
		$('#notice_board').get(0).click();
	}
	if($('#pagingCheck').val()=='qna'){
		$('#product_qna').get(0).click();
	}else if($('#pagingCheck').val()=='review'){
		$('#product_review').get(0).click();
	}
	
	$('#pagingCheck').val(0);
});

/* 체크박스 전체 선택/해제 */
$('#check_all').click(function(){
	if($('#check_all').is(":checked"))
		$('.check').prop('checked', true);
	else
		$('.check').prop('checked', false);
});

/* 모달 창 닫기 */
$('#confirmClose_Modal').click(function(){
	$('#open_confirmModal').hide();
});

$('.close_Modal').click(function(){
	$('#open_nonCheckModal').hide();
	$('#open_deleteSuccessModal').hide();
});


/* 상품 선택 삭제 */
$('#select_deleteBtn').click(function(){
	var count = $('.check:checked').length;
	if(count==0){
		$('#open_nonCheckModal').show();
	}else{
		$('#open_confirmModal').show();
		$("#confirmOK_Modal").off().on('click', function(){
			$('#check_delete_form').submit();
		});
	}

});

/* 페이징 함수 */

//상품문의 페이징
function qnaboardPaging(pg){
	location.href="/kokonutStationery/admin/contentList.do?pg="+pg+"&pagingCheck=qna";
}

//상품문의 검색 페이징
function qnaboardSearchPaging(pg){
	$('input[name=pg]').val(pg); // input name 변수에 pg값 전달!
	//검색버튼을 누른 것과 같은 효과를 주어야 함.. 그래야 컨트롤러에서 키워드와 옵션을 얻어서 간다
	$('#contentList_searchBtn').trigger('click','trigger');
	//이렇게 하면 버튼을 누른 것과 같은 효과임!!!!
}

//상품후기 페이징
function reviewboardPaging(pg){
	location.href="/kokonutStationery/admin/contentList.do?pg="+pg+"&pagingCheck=review";
}

//상품문의 검색 페이징
function reviewboardSearchPaging(pg){
	$('input[name=pg]').val(pg); // input name 변수에 pg값 전달!
	//검색버튼을 누른 것과 같은 효과를 주어야 함.. 그래야 컨트롤러에서 키워드와 옵션을 얻어서 간다
	$('#contentList_searchBtn').trigger('click','trigger');
	//이렇게 하면 버튼을 누른 것과 같은 효과임!!!!
}




//공지사항 글쓰기버튼 클릭 시 새 창으로 입력 화면 만들기
($('#noticeWriteBtn')).on("click",function(){			
	window.open(
			"/kokonutStationery/admin/noticeboardWriteForm.do"
			,'','width=900, height=750, left=200, resizable=no, toolbar=no'
			,'true'
	);
});//공지사항 글쓰기 창


//공지사항 전체 리스트
$('#notice_board').click(function(){ //공지사항 탭 누를 경우
	$('.content_menuBar').css('color','#808080');
	$(this).css('color','#000000');
	   	
	/*공지사항 글쓰기 버튼 활성화*/
	$('#noticeWriteBtn').text("글쓰기").css('display','block');
	
	/* 검색 value 변경해주기 */
	$('#search_all').val('noticeSearch');
	$('#search_subject').val('noticeboardSubject');
	$('#search_content').val('noticeboardContent');
	
	$('#boardOption').val('tbl_noticeboard');
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
				$('<tr/>',{
					class : 'subjectTr',
					style : 'height:50px;'
				}).append($('<td/>',{ // 체크박스
					align : 'center'
				}).append($('<input/>',{
					type : 'checkbox',
					name : 'check',
					class : 'check',
					value : items.noticeboardCode
				}))).append($('<td/>',{ // 번호
					align : 'center',
					text : items.noticeboardCode
					
				})).append($('<td/>',{ // 제목
					align:'center'
				}).append($('<a/>',{
					text : items.noticeboardSubject,
					href : 'javascript:void(0)',
					name : items.noticeboardCode,
					class : 'subjectA'
					
				}))).append($('<td/>',{ // 날짜
					align : 'center',
					text : items.regDate
				})).appendTo($('#contentTable'));
				
				//내용들어갈 tr
				$('<tr/>').append($('<td/>',{
					style : "white-space:pre; padding:80px 60px;",
					text : items.noticeboardContent,
					colspan : 4,
					class : 'contentA',
					id : items.noticeboardCode
					
				}).append($('<div/>',{ //수정 버튼
					style : 'width:50px; height:25px; float:right; border:2px solid #808080; text-align:center; cursor:pointer;',
					text : '수정',
					id : 'editA',
					class : items.noticeboardCode
					
				}))).appendTo($('#contentTable'));
				
				$('.contentA').hide();
	
			});//each
			
			//드롭다운
			$('.subjectA').click(function(){
				var code = $(this).attr('name');
				
				$('.contentA').not('[id^='+code+']').each(function(){
					$(this).hide();
				});

				$('[id^='+code+']').each(function(){
					$(this).toggle();
				});
			});
			
			//수정버튼 클릭 시
			($('#contentTable')).on("click",'#editA',function(){			
				window.open(
						"/kokonutStationery/admin/noticeboardModifyForm.do?noticeboardCode="
						+$(this).attr('class')
						,'','width=900, height=750, left=200, resizable=no, toolbar=no'
						,'true'
				);
			});
			
			
		}//success
	});//ajax
});

//상품 문의 전체 리스트
$('#product_qna').click(function(){ // 상품문의 탭 누를 경우
	$('.content_menuBar').css('color','#808080');
	   $(this).css('color','#000000');
	if($('#boardOption').val()!='tbl_qnaboard')$('#ajaxCheck').val(0);   
	$('#noticeWriteBtn').css('display','none');
	$('#boardOption').val('tbl_qnaboard');
	
	/* 검색 value 변경해주기 */
	$('#search_all').val('qnaSearch');
	$('#search_subject').val('qnaboardSubject');
	$('#search_content').val('qnaboardContent');
	
	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/admin/qnaboardList.do',
		data : {'pg' : $('#pg').val()},
		dataType : 'json',
		success : function(data){
			if($('#ajaxCheck').val()==0){
				//테이블 이미지th 추가
				$('#reviewImg').remove();
				$('#writer').remove();
				$('#reviewTh').before($('<th/>',{text: '상품 이미지', id:'reviewImg'}).css('width', '70px'));	
				$('#writerTh').before($('<th/>',{text: '작성자', id:'writer'}).css('width', '70px'));
				$('#ajaxCheck').val(1);
				$('#contentTable tr:gt(0)').remove();
				//문의 전체 리스트
				$.each(data.list, function(index,items){
					
					//////// admin이 아닐 경우 ////////
					if(items.admin==0) {
						$('<tr/>',{
							class : 'subjectTr',
							style : 'height:50px;'
						}).append($('<td/>',{
							align: 'center'
						}).append($('<input/>',{
							type : 'checkbox',
							name : 'check',
							class : 'check',
							value : items.qnaboardCode
							
						}))).append($('<td/>',{
							align : 'center',
							text : items.qnaboardCode
							
						})).append($('<td/>',{
								align : 'center',
							}).append($('<img/>',{
								src : '../image/thumb/'+ items.thumbImg
							}).css('width','65px').css('padding-top','5px')
							
							)).append($('<td/>').append($('<a/>',{
								href : 'javascript:void(0)',
								name : items.qnaboardCode,
								class : 'subjectA',
								text : items.qnaboardSubject
								
							})).css('padding-left', '5px')).append($('<td/>',{
								align : 'center',
								text : items.userId
								
							})).append($('<td/>',{
								align : 'center',
								text : items.regDate
							})).appendTo($('#contentTable'));
						
					}//if - admin==0
					
					//admin일 경우
					else if(items.admin==1) {
						$('<tr/>',{
							class : 'subjectTr',
							style : 'height:50px;'
						}).append($('<td/>',{
							align: 'center'
						}).append($('<input/>',{
							type : 'checkbox',
							name : 'check',
							class : 'check',
							value : items.qnaboardCode
							
						}))).append($('<td/>',{
							align : 'center',
							text : items.qnaboardCode
							
						})).append($('<td/>',{
								align : 'center'
								
						})).append($('<td/>').append($('<a/>',{
							href : 'javascript:void(0)',
							name : items.qnaboardCode,
							class : 'subjectA',
							text : items.qnaboardSubject
							
						})).css('padding-left', '5px')).append($('<td/>',{
							align : 'center'
						}).append($('<img/>',{ // 관리자 로고 띄우기
							src : '../image/admin.gif'
							
						}))).append($('<td/>',{
							align : 'center',
							text : items.regDate
						})).appendTo($('#contentTable'));
					}//if - admin==1
					
					
										
					//문의 선택 내용 생성 - admin==0일 때
					if(items.admin==0){
						$('<tr/>').append($('<td/>',{
								text : items.qnaboardContent,
								style : 'padding: 35px 60px 75px 130px; border-top:none;',
								colspan : 6,
								class : 'contentA',
								id : items.qnaboardCode
								
							}).append($('<div/>',{ //답변 버튼
								style : 'width:50px; height:25px; float:right; border:2px solid #808080; text-align:center; cursor:pointer;',
								text : '답변',
								id : 'replyA',
								class : items.qnaboardCode
								
							}))).appendTo($('#contentTable'));
					}//if admin==0
					
					if(items.admin==1){
						$('<tr/>').append($('<td/>',{
							text : items.qnaboardContent,
							style : 'padding: 35px 60px 75px 130px; border-top:none;',
							colspan : 6,
							class : 'contentA',
							id : items.qnaboardCode
							
						})).appendTo($('#contentTable'));
					}//if admin==1
					
					
					$('.contentA').hide();
				});//each
				
				//드롭다운
				$('.subjectA').click(function(){
		            var code = $(this).attr('name');
		            
		            $('.contentA').not('[id^='+code+']').each(function(){
		               $(this).hide();
		            });

		            $('[id^='+code+']').each(function(){
		               $(this).toggle();
		            });
		         });
				
				//답변버튼 클릭 시
				($('#contentTable')).on("click",'#replyA',function(){			
					window.open(
							"/kokonutStationery/admin/qnaboardReplyForm.do?qnaboardCode="
							+$(this).attr('class')
							,'','width=900, height=920, left=200, resizable=no, toolbar=no'
							,'true'
					);
				});
				
				$('#pagingDiv').html(data.qnaboardManagerPaging.pagingHTML);
			}//if
			$('#pg').val(1);
		}//success
	});//ajax				
});


//상품 후기 전체 리스트
$('#product_review').click(function(){ // 상품 후기 탭 누를 경우
	$('.content_menuBar').css('color','#808080');
	   $(this).css('color','#000000');
	if($('#boardOption').val()!='tbl_reviewboard') $('#ajaxCheck').val(0);   
	$('#noticeWriteBtn').css('display','none');
	$('#boardOption').val('tbl_reviewboard');
	$('.contentA').hide();
	
	/* 검색 value 변경해주기 */
	$('#search_all').val('reviewSearch');
	$('#search_subject').val('reviewboardSubject');
	$('#search_content').val('reviewboardContent');
	
	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/admin/reviewboardList.do',
		data : {'pg' : $('#pg').val()},
		dataType : 'json',
		success : function(data){
			if($('#ajaxCheck').val()==0){//상품 후기 탭 누를 시 중복 생성 방지
				//테이블 이미지th 추가
				$('#reviewImg').remove();
				$('#writer').remove();
				$('#reviewTh').before($('<th/>',{text: '상품 이미지', id:'reviewImg'}).css('width', '70px'));	
				$('#writerTh').before($('<th/>',{text: '작성자', id:'writer'}).css('width', '70px'));
				$('#ajaxCheck').val(1);
				
				$('#contentTable tr:gt(0)').remove();
				//후기 전체 리스트
				$.each(data.list, function(index,items){
					$('<tr/>',{
						class : 'subjectTr',
						style : 'height:50px;'
					}).append($('<td/>',{
						align: 'center'
					}).append($('<input/>',{
						type : 'checkbox',
						name : 'check',
						class : 'check',
						value : items.reviewboardCode
					}))).append($('<td/>',{
						align : 'center',
						text : items.reviewboardCode
					})).append($('<td/>',{
							align : 'center',
						}).append($('<img/>',{
							src : '../image/thumb/'+ items.thumbImg
						}).css('width','65px').css('padding-top','5px')
						)).append($('<td/>').append($('<a/>',{
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
					if(items.reviewboardImg!=null){//후기 이미지 첨부 있을 시
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
							style : 'padding: 10px 0 75px 130px; border-top:none;',
							colspan : 6,
							class : 'contentA',
							id : items.reviewboardCode
						})).appendTo($('#contentTable'));
					}//if
					else{//후기 이미지 첨부 없을 시
						$('<tr/>').append($('<td/>',{
								text : items.reviewboardContent,
								style : 'padding: 35px 0 75px 130px; border-top:none;',
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
				$('#pagingDiv').html(data.reviewboardManagerPaging.pagingHTML);
			}//if
			$('#pg').val(1);
		}//success
	});//ajax
});



//검색 버튼 클릭 시 뿌리기
$('.contentList_searchBtn').click(function(event, str){
	if(str!='trigger') $('input[name=pg]').val(1);
	
	if($('.contentList_searchValue').val()=='')
		location.href="/kokonutStationery/admin/contentList.do";
	
	else
		$.ajax({
			type : 'post',
			url : '/kokonutStationery/admin/contentListSearch.do',
			data : { "keyword" : $('.contentList_searchValue').val()+"",
					 "option" : $('.contentList_searchOption').val()+"",
					 "table" : $('#boardOption').val()+"",
					 'pg' : $('#pg').val()
					},
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				
				/*         공지사항일 때!!         */
				if($('#boardOption').val()=='tbl_noticeboard'){
				
					$('#contentTable tr:gt(0)').remove();
					
					$.each(data.list, function(index,items){
									
							$('<tr/>',{
								class : 'subjectTr',
								style : 'height:50px;'
							}).append($('<td/>',{ //체크박스
								align : 'center'
							}).append($('<input/>',{
								type : 'checkbox',
								name : 'check',
								class : 'check',
								value : items.noticeboardCode
								
							}))).append($('<td/>',{ // 번호
								align : 'center',
								text : items.noticeboardCode
								
							})).append($('<td/>',{ // 제목
								align:'center',
							}).append($('<a/>',{
								text : items.noticeboardSubject,
								href : 'javascript:void(0)',
								name : items.noticeboardCode,
								class : 'subjectA'
								
							}))).append($('<td/>',{ // 날짜
								align : 'center',
								text : items.regDate
							})).appendTo($('#contentTable'));
							
							//내용들어갈 tr
							$('<tr/>').append($('<td/>',{
								style : "white-space:pre; padding:40px 0; padding-left:68px;",
								text : items.noticeboardContent,
								colspan : 4,
								class : 'contentA',
								id : items.noticeboardCode
							})).appendTo($('#contentTable'));
							
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
				
				}//if 공지사항
				
				//qnaboard 검색 시
				if($('#boardOption').val()=='tbl_qnaboard'){
					if($('#ajaxCheck').val()==1){
						//테이블 이미지th 추가
						$('#reviewImg').remove();
						$('#writer').remove();
						$('#reviewTh').before($('<th/>',{text: '상품 이미지', id:'reviewImg'}).css('width', '70px'));	
						$('#writerTh').before($('<th/>',{text: '작성자', id:'writer'}).css('width', '70px'));
						$('#ajaxCheck').val(1);
						$('#contentTable tr:gt(0)').remove();
						//문의 전체 리스트
						$.each(data.list, function(index,items){
							
							//////// admin이 아닐 경우 ////////
							if(items.admin==0) {
								$('<tr/>',{
									class : 'subjectTr',
									style : 'height:50px;'
								}).append($('<td/>',{
									align: 'center'
								}).append($('<input/>',{
									type : 'checkbox',
									name : 'check',
									class : 'check',
									value : items.qnaboardCode
									
								}))).append($('<td/>',{
									align : 'center',
									text : items.qnaboardCode
									
								})).append($('<td/>',{
										align : 'center',
									}).append($('<img/>',{
										src : '../image/thumb/'+ items.thumbImg
									}).css('width','65px').css('padding-top','5px')
									
									)).append($('<td/>').append($('<a/>',{
										href : 'javascript:void(0)',
										name : items.qnaboardCode,
										class : 'subjectA',
										text : items.qnaboardSubject
										
									})).css('padding-left', '5px')).append($('<td/>',{
										align : 'center',
										text : items.userId
										
									})).append($('<td/>',{
										align : 'center',
										text : items.regDate
									})).appendTo($('#contentTable'));
							}//if - admin==0
							
							else if(items.admin==1) {
								$('<tr/>',{
									class : 'subjectTr',
									style : 'height:50px;'
								}).append($('<td/>',{
									align: 'center'
								}).append($('<input/>',{
									type : 'checkbox',
									name : 'check',
									class : 'check',
									value : items.qnaboardCode
									
								}))).append($('<td/>',{
									align : 'center',
									text : items.qnaboardCode
									
								})).append($('<td/>',{
										align : 'center'
										
								})).append($('<td/>').append($('<a/>',{
									href : 'javascript:void(0)',
									name : items.qnaboardCode,
									class : 'subjectA',
									text : items.qnaboardSubject
									
								})).css('padding-left', '5px')).append($('<td/>',{
									align : 'center'
								}).append($('<img/>',{ // 관리자 로고 띄우기
									src : '../image/admin.gif'
									
								}))).append($('<td/>',{
									align : 'center',
									text : items.regDate
								})).appendTo($('#contentTable'));
							}//if - admin==1
							
							
												
							//문의 선택 내용 생성
							$('<tr/>').append($('<td/>',{
									text : items.qnaboardContent,
									style : 'padding: 35px 60px 75px 130px; border-top:none;',
									colspan : 6,
									class : 'contentA',
									id : items.qnaboardCode
									
								}).append($('<div/>',{ //답변 버튼
									style : 'width:50px; height:25px; float:right; border:2px solid #808080; text-align:center; cursor:pointer;',
									text : '답변',
									id : 'replyA',
									class : items.qnaboardCode
									
								}))).appendTo($('#contentTable'));		
							
							$('.contentA').hide();
						});//each
						
						//드롭다운
						$('.subjectA').click(function(){
				            var code = $(this).attr('name');
				            
				            $('.contentA').not('[id^='+code+']').each(function(){
				               $(this).hide();
				            });

				            $('[id^='+code+']').each(function(){
				               $(this).toggle();
				            });
				         });
						
						//답변버튼 클릭 시
						($('#contentTable')).on("click",'#replyA',function(){			
							window.open(
									"/kokonutStationery/admin/qnaboardReplyForm.do?qnaboardCode="
									+$(this).attr('class')
									,'','width=900, height=920, left=200, resizable=no, toolbar=no'
									,'true'
							);
						});
						
						$('#pagingDiv').html(data.qnaboardManagerPaging.pagingHTML);
					}//if
					$('#pg').val(1);
				}//if 문의
				
				
				if($('#boardOption').val()=='tbl_reviewboard'){
					if($('#ajaxCheck').val()==1){//상품 후기 탭 누를 시 중복 생성 방지
						//테이블 이미지th 추가
						$('#reviewImg').remove();
						$('#writer').remove();
						$('#reviewTh').before($('<th/>',{text: '상품 이미지', id:'reviewImg'}).css('width', '70px'));	
						$('#writerTh').before($('<th/>',{text: '작성자', id:'writer'}).css('width', '70px'));
						$('#ajaxCheck').val(1);
						
						$('#contentTable tr:gt(0)').remove();
						//후기 전체 리스트
						$.each(data.list, function(index,items){
							$('<tr/>',{
								class : 'subjectTr',
								style : 'height:50px;'
							}).append($('<td/>',{
								align: 'center'
							}).append($('<input/>',{
								type : 'checkbox',
								name : 'check',
								class : 'check',
								value : items.reviewboardCode
							}))).append($('<td/>',{
								align : 'center',
								text : items.reviewboardCode
							})).append($('<td/>',{
									align : 'center',
								}).append($('<img/>',{
									src : '../image/thumb/'+ items.thumbImg
								}).css('width','65px').css('padding-top','5px')
								)).append($('<td/>').append($('<a/>',{
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
							if(items.reviewboardImg!=null){//후기 이미지 첨부 있을 시
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
									style : 'padding: 10px 0 75px 130px; border-top:none;',
									colspan : 6,
									class : 'contentA',
									id : items.reviewboardCode
								})).appendTo($('#contentTable'));
							}//if
							else{//후기 이미지 첨부 없을 시
								$('<tr/>').append($('<td/>',{
										text : items.reviewboardContent,
										style : 'padding: 35px 0 75px 130px; border-top:none;',
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
						$('#pagingDiv').html(data.reviewboardManagerPaging.pagingHTML);
					}//if
					$('#pg').val(1);
				}//if 
				
			}//success
		});//ajax
			
});//searchBtn_click_end




</script>