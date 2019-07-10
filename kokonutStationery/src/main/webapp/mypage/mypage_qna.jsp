<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="../css/mypage.css">
</head>
<body>
  <!-- mypage right contents -->
  <div class="content">
    <div class="content_title">
    	<input type="hidden" id="userId" value="${memId}">
      	나의 상품문의
    </div>
    <table class="mypage_table">
      <tr id="mypage_table_top">
        <th id="rownum">번호</th>
        <th id="thumbimg">이미지</th>
        <th id="pName_review">상품명 · 후기</th>
        <th id="review_date">작성일</th>
        <th id="productview"></th>
      </tr>
	<!-- 
      <tr class="mypage_table_content review_content">
        <td>1</td>
        <td>
          <img class="product_thumb" src="../image/living_thumb/towel_set.jpg">
        </td>
        <td id="pName_td">
          <span><strong>누가 나 좀 말려줘요. 수건세트</strong></span><br>
          <span>
            	재입고문의
            <img id="disk_icon" class="hide" src="../image/disk_icon.gif">
          </span>
         </td>
        <td>2019.06.25</td>
        <td>
          <li class="white_btn product_view_btn">제품보기</li>
        </td>
      </tr>

      <tr>
        <td colspan="5">
          <div class="review hide">
            <div class="review_show_img">
              <img src="">
              <br>재입고 예정있나요?
            </div>
            <div class="review_btns_div">
              <li class="white_btn btn_size_xs" id="qna_deleteBtn">삭제</li>
              <li class="white_btn btn_size_xs" id="qna_modifyBtn">수정</li>
              <li class="white_btn btn_size_xs" id="qna_replyBtn">답변</li>
            </div>
          </div>
        </td>
      </tr>
      -->
    </table>
	
    <div class="pageDiv">
      <!-- 1 -->
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
		url:'../qna/goods_qnaMyList.do',
		data:{'userId':userId},
		dataType:'json',
		success:function(data){
			//alert(JSON.stringify(data));
			
			if(data!=null){	
				
				$.each(data.list, function(index, item) {
					console.log(index+" ");
					
					//상품명,제목
					$('.mypage_table').append($('<tr/>',{
						id:'mypage_table_content_'+index,
						class:'mypage_table_content review_content'	
						
						}).append($('<td/>',{
							text:item.qnaboardCode
							
						})).append($('<td/>',{
							id:'product_thumb'+index,
							align:'center'
							//문의일땐 그림/ 답변일땐 답변마크
						})).append($('<td/>',{
							id:'pName_td'+index,
							style:"text-align: left;"
							//문의일땐 상품명,제목 / 답변일땐 제목만
						})).append($('<td/>',{
							text: item.regDate
						
						})).append($('<td/>',{
								id:'productViewBtn'+index
						
						})));
						
					//문의일때
					if(item.admin==0){
						
						$('#product_thumb'+index).append($('<img/>',{
							
							class:'product_thumb',
							src:'../image/thumb/'+item.thumbImg	
							
						}));
						
						$('#pName_td'+index).append($('<span/>',{
							
							}).append($('<strong/>',{
								text:item.productName
								
								})).append("<br>").append($('<span/>',{
									text:item.qnaboardSubject
				
						})));
						
						$('#productViewBtn'+index).append($('<li/>',{
								class:'white_btn product_view_btn'
								,text:"제품보기"
								,onclick:"goodsView("+item.productCode+")"
						}))
					}else if(item.admin==1){
					//답변일때
												
						$('#product_thumb'+index).append($('<span/>',{
							style:'font-weight:700; color:#2AC1BC; padding:10px;',
							text: '답변 : '
							
						}));
					
						$('#pName_td'+index).append($('<span/>',{
							
							}).append($('<strong/>',{
								text:item.qnaboardSubject
							
						})));
						
						$('#productViewBtn'+index).append($('<img/>',{
							src:'../image/admin.gif'
						}));
					}
					
					
					//내용
					
					$('.mypage_table').append($('<tr/>',{
						id:'review_content_'+index
						}).append($('<td/>',{
							colspan:'4'
							}).append($('<div/>',{
									class:'review_show_img',
									style:'white-space: pre-wrap; padding:25px;',
									text:item.qnaboardContent
									
						}))).append($('<td/>',{
								style:'min-width:90px; padding:15px;'
							}).append($('<div/>',{
								style:'display:inline;'
								}).append($('<div/>',{
										class:'white_btn btn_size_xs',
										id:'qna_deleteBtn_'+index,
										style:'display:none;',
										onclick:'qnaDelete('+item.qnaboardCode+')',
										visibility:'hidden',
										text:"삭제"
									
								})).append($('<div/>',{
										class:'white_btn btn_size_xs',
										id:'qna_modifyBtn_'+index,
										style:'display:none;',
										onclick:'qnaModify('+item.qnaboardCode+')',
										visibility:'hidden',
										text:"수정"			
						}))))); 
					
					/*
						$('.mypage_table').append($('<tr/>',{
							id:'review_content_'+index
							}).append($('<td/>',{
								colspan:'4'
								}).append($('<div/>',{
										class:'review_show_img',
										style:'white-space: pre-wrap; padding:25px;',
										text:item.qnaboardContent
										
							}))).append($('<td/>',{
								
								}).append($('<div/>',{
										class:'white_btn btn_size_xs',
										id:'qna_deleteBtn_'+index,
										//style:'display:inline;',
										onclick:'qnaDelete('+item.qnaboardCode+')',
										visibility:'hidden',
										text:"삭제"
										
							}))).append($('<td/>',{
										
								}).append($('<div/>',{
										class:'white_btn btn_size_xs',
										id:'qna_modifyBtn_'+index,
										//style:'display:inline;',
										onclick:'qnaModify('+item.qnaboardCode+')',
										visibility:'hidden',
										text:"수정"
								
							}))));
					*/
					//답변내용숨기기
					$('#review_content_'+index).hide();
					//답변내용클릭시 보이게
					$('#mypage_table_content_'+index).on('click', function(){					
						$('#review_content_'+index).toggle(function(){
							if(item.admin==0){
								$('#qna_deleteBtn_'+index).css('display','inline');
								$('#qna_modifyBtn_'+index).css('display','inline');
							}
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
				$('.pageDiv').html(	data.qnaboardPaging.pagingHTML	);
				
				
				
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
function qnaModify(qnaboardCode){
	window.open("../qna/goods_qna_modify.do?qnaboardCode="+qnaboardCode, "_blank", "width=890, height=750");
}

//삭제
function qnaDelete(qnaboardCode){
	if (confirm("문의를 삭제하시겠습니까??") == true){//확인
		//var qnaboardCode = item.qnaboardCode;
		$.ajax({
			type:'post',
			url:'../qna/qnaboardDelete.do',
			data:{'qnaboardCode':qnaboardCode},
			success:function(){
				alert("삭제를 완료했습니다!");
				location.href="../mypage/mypage_qna.do";
			}
		});
	 }else{   //취소
	     return false;
	 }
}

//기본페이징
function boardPaging(pg){
	var userId=$('#userId').val();
	
	$.ajax({
		type:'POST',
		url:'../qna/goods_qnaMyList.do',
		data:{'pg':pg,
			'userId':userId},
		dataType:'json',
		success:function(data){
			
			$('.mypage_table tr:gt(0)').remove();
			//$('.pageDiv').children().remove();
			if(data!=null){	
				
				$.each(data.list, function(index, item) {
					//console.log(index+" ");
					
					//상품명,제목
					$('.mypage_table').append($('<tr/>',{
						id:'mypage_table_content_'+index,
						class:'mypage_table_content review_content'	
						
						}).append($('<td/>',{
							text:item.qnaboardCode
							
						})).append($('<td/>',{
							id:'product_thumb'+index,
							align:'center'
							//문의일땐 그림/ 답변일땐 답변마크
						})).append($('<td/>',{
							id:'pName_td'+index,
							style:"text-align: left;"
							//문의일땐 상품명,제목 / 답변일땐 제목만
						})).append($('<td/>',{
							text: item.regDate
						
						})).append($('<td/>',{
								id:'productViewBtn'+index
						
						})));
						
					//문의일때
					if(item.admin==0){
						
						$('#product_thumb'+index).append($('<img/>',{
							
							class:'product_thumb',
							src:'../image/thumb/'+item.thumbImg	
							
						}));
						
						$('#pName_td'+index).append($('<span/>',{
							
							}).append($('<strong/>',{
								text:item.productName
								
								})).append("<br>").append($('<span/>',{
									text:item.qnaboardSubject
				
						})));
						
						$('#productViewBtn'+index).append($('<li/>',{
								class:'white_btn product_view_btn'
								,text:"제품보기"
								,onclick:"goodsView("+item.productCode+")"
						}))
					}else if(item.admin==1){
					//답변일때
												
						$('#product_thumb'+index).append($('<span/>',{
							style:'font-weight:700; color:#2AC1BC; padding:10px;',
							text: '답변 : '
							
						}));
					
						$('#pName_td'+index).append($('<span/>',{
							
							}).append($('<strong/>',{
								text:item.qnaboardSubject
							
						})));
						
						$('#productViewBtn'+index).append($('<img/>',{
							src:'../image/admin.gif'
						}));
					}
					
					//내용
					
					$('.mypage_table').append($('<tr/>',{
						id:'review_content_'+index
						}).append($('<td/>',{
							colspan:'4'
							}).append($('<div/>',{
									class:'review_show_img',
									style:'white-space: pre-wrap; padding:25px;',
									text:item.qnaboardContent
									
						}))).append($('<td/>',{
								style:'min-width:90px; padding:15px;'
							}).append($('<div/>',{
								style:'display:inline;'
								}).append($('<div/>',{
										class:'white_btn btn_size_xs',
										id:'qna_deleteBtn_'+index,
										style:'display:none;',
										onclick:'qnaDelete('+item.qnaboardCode+')',
										visibility:'hidden',
										text:"삭제"
										
								})).append($('<div/>',{
									class:'white_btn btn_size_xs',
									id:'qna_modifyBtn_'+index,
									style:'display:none;',
									onclick:'qnaModify('+item.qnaboardCode+')',
									visibility:'hidden',
									text:"수정"			
						}))))); 
					
					/*
						$('.mypage_table').append($('<tr/>',{
							id:'review_content_'+index
							}).append($('<td/>',{
								colspan:'4'
								}).append($('<div/>',{
										class:'review_show_img',
										style:'white-space: pre-wrap; padding:25px;',
										text:item.qnaboardContent
										
							}))).append($('<td/>',{
								
								}).append($('<div/>',{
										class:'white_btn btn_size_xs',
										id:'qna_deleteBtn_'+index,
										//style:'display:inline;',
										onclick:'qnaDelete('+item.qnaboardCode+')',
										visibility:'hidden',
										text:"삭제"
										
							}))).append($('<td/>',{
										
								}).append($('<div/>',{
										class:'white_btn btn_size_xs',
										id:'qna_modifyBtn_'+index,
										//style:'display:inline;',
										onclick:'qnaModify('+item.qnaboardCode+')',
										visibility:'hidden',
										text:"수정"
								
							}))));
					*/
					//답변내용숨기기
					$('#review_content_'+index).hide();
					//답변내용클릭시 보이게
					$('#mypage_table_content_'+index).on('click', function(){					
						$('#review_content_'+index).toggle(function(){
							if(item.admin==0){
								$('#qna_deleteBtn_'+index).css('display','inline');
								$('#qna_modifyBtn_'+index).css('display','inline');
							}
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
				$('.pageDiv').html(	data.qnaboardPaging.pagingHTML	);
				
				
				
			}//if(data!=null)
			
		}//success:function
	});//ajax
}

</script>
</html>
