<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="../css/mypage.css">
</head>
<body>
  <!-- mypage right contents -->
  <div class="content">
    <div class="content_title">
    	<input type="hidden" id="userId" value="${memId}">
      	나의 상품후기
    </div>
    <table class="mypage_table">
      <tr id="mypage_table_top">
        <th id="rownum">번호</th>
        <th id="thumbimg">이미지</th>
        <th id="pName_review">상품명 · 후기</th>
        <th id="review_date">작성일</th>
        <th id="productview"></th>
      </tr>
    </table>

    <div class="pageDiv">
    </div>
  </div>

</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var userId=$('#userId').val();
	
	$.ajax({
		type:'POST',
		url:'../review/goods_reviewMyList.do',
		data:{'userId':userId},
		dataType:'json',
		success:function(data){
			//alert(JSON.stringify(data));
			
			if(data!=null){		
				$.each(data.list, function(index, item) {
					
					//상품명,제목
					$('.mypage_table').append($('<tr/>',{
						id:'mypage_table_content_'+index,
						class:'mypage_table_content review_content'	
						
						}).append($('<td/>',{
							text:item.reviewboardCode
							
						})).append($('<td/>',{
							id:'product_thumb'+index
							
							}).append($('<img/>',{
								
								class:'product_thumb',
								src:'../image/thumb/'+item.thumbImg						
						}))).append($('<td/>',{
							id:'pName_td',
							align: 'left'
							
							}).append($('<span/>',{
								
								}).append($('<strong/>',{
									text:item.productName
									
							}))).append("<br>").append($('<span/>',{
								text:item.reviewboardSubject
							
						}))).append($('<td/>',{
							text: item.regDate
						})).append($('<td/>',{
								
							}).append($('<li/>',{
								class:'white_btn product_view_btn'
								,text:"제품보기"
								,onclick:"goodsView("+item.productCode+")"
						}))));
					
					//내용
					
					$('.mypage_table').append($('<tr/>',{
						id:'review_content_'+index
						}).append($('<td/>',{
							colspan:'4'
							}).append($('<div/>',{
									class:'review_show_img',
									style:'white-space: pre-wrap; padding:25px;',
									text:item.reviewboardContent
									
						}))).append($('<td/>',{
								style:'min-width:90px; padding:15px;'
							}).append($('<div/>',{
								style:'display:inline;'
								}).append($('<div/>',{
										class:'white_btn btn_size_xs',
										id:'review_deleteBtn_'+index,
										style:'display:inline;',
										onclick:'reviewDelete('+item.reviewboardCode+')',
										text:"삭제"
										
								})).append($('<div/>',{
										class:'white_btn btn_size_xs',
										id:'review_modifyBtn_'+index,
										style:'display:inline;',
										onclick:'reviewModify('+item.reviewboardCode+')',
										text:"수정"
								
						}))))); 
					
					
					//내용 숨기기
					$('#review_content_'+index).hide();
					//토글
					$('#mypage_table_content_'+index).on('click', function(){					
						$('#review_content_'+index).toggle(function(){
						});
					});
							
					//후기 문의 게시물 hover 이벤트
					$('#mypage_table_content_'+index).hover(function(){
						$(this).css("background-color", "#f6f6f6");
					},function(){
						$(this).css("background-color", "#ffffff");
					});	
					
				});//each
				
				//페이징
				$('.pageDiv').html(	data.reviewboardPaging.pagingHTML	);
			
			}//if(data!=null)			
		}//success:function
	});//ajax
	
});//document.ready


</script>
<script type="text/javascript">
//제품보기
function goodsView(productCode){
	location.href="../goods/goods_view.do?productCode="+productCode;
}

//수정
function reviewModify(reviewboardCode){
	window.open("../review/goods_review_modify.do?reviewboardCode="+reviewboardCode, "_blank", "width=890, height=750");
}

//삭제
function reviewDelete(reviewboardCode){
	if (confirm("후기를 삭제하시겠습니까??") == true){//확인
		$.ajax({
			type:'post',
			url:'../review/reviewboardDelete.do',
			data:{'reviewboardCode':reviewboardCode},
			success:function(){
				alert("삭제를 완료했습니다!");
				location.href="../mypage/mypage_review.do";
			}
		});
	 }else{   //취소
	     return false;
	 }
}

//기본페이징
function reviewboardPaging(pg){
	var userId=$('#userId').val();
	
	$.ajax({
		type:'POST',
		url:'../review/goods_reviewMyList.do',
		data:{'pg':pg,
			'userId':userId},
		dataType:'json',
		success:function(data){
			
			$('.mypage_table tr:gt(0)').remove();

			if(data!=null){		
				$.each(data.list, function(index, item) {
					
					//상품명,제목
					$('.mypage_table').append($('<tr/>',{
						id:'mypage_table_content_'+index,
						class:'mypage_table_content review_content'	
						
						}).append($('<td/>',{
							text:item.reviewboardCode
							
						})).append($('<td/>',{
							id:'product_thumb'+index
							
							}).append($('<img/>',{
								
								class:'product_thumb',
								src:'../image/thumb/'+item.thumbImg						
						}))).append($('<td/>',{
							id:'pName_td',
							align: 'left'
							
							}).append($('<span/>',{
								
								}).append($('<strong/>',{
									text:item.productName
									
							}))).append("<br>").append($('<span/>',{
								text:item.reviewboardSubject
							
						}))).append($('<td/>',{
							text: item.regDate
						})).append($('<td/>',{
								
							}).append($('<li/>',{
								class:'white_btn product_view_btn'
								,text:"제품보기"
								,onclick:"goodsView("+item.productCode+")"
						}))));
					
					//내용
					
					$('.mypage_table').append($('<tr/>',{
						id:'review_content_'+index
						}).append($('<td/>',{
							colspan:'4'
							}).append($('<div/>',{
									class:'review_show_img',
									style:'white-space: pre-wrap; padding:25px;',
									text:item.reviewboardContent
									
						}))).append($('<td/>',{
								style:'min-width:90px; padding:15px;'
							}).append($('<div/>',{
								style:'display:inline;'
								}).append($('<div/>',{
										class:'white_btn btn_size_xs',
										id:'review_deleteBtn_'+index,
										style:'display:inline;',
										onclick:'reviewDelete('+item.reviewboardCode+')',
										text:"삭제"
										
								})).append($('<div/>',{
										class:'white_btn btn_size_xs',
										id:'review_modifyBtn_'+index,
										style:'display:inline;',
										onclick:'reviewModify('+item.reviewboardCode+')',
										text:"수정"
								
						}))))); 
					
					
					//내용 숨기기
					$('#review_content_'+index).hide();
					//토글
					$('#mypage_table_content_'+index).on('click', function(){					
						$('#review_content_'+index).toggle(function(){
						});
					});
							
					//후기 문의 게시물 hover 이벤트
					$('#mypage_table_content_'+index).hover(function(){
						$(this).css("background-color", "#f6f6f6");
					},function(){
						$(this).css("background-color", "#ffffff");
					});	
					
				});//each
				
				//페이징
				$('.pageDiv').html(	data.reviewboardPaging.pagingHTML	);
			
			}//if(data!=null)
			
		}//success:function
	});//ajax
}

</script>

</html>
