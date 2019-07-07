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
      1
    </div>
    
  </div>
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//alert("페이지왔따!");
	//${memName}
	var userId=$('#userId').val();
	//alert("userId="+userId);
	
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
					
					//tr만들기
					$('.mypage_table').append($('<tr/>',{
						id:'mypage_table_content_'+index,
						class:'mypage_table_content review_content'	
						
						}).append($('<td/>',{
							text:index+1
							
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
								text:item.qnaboardContent
							
								}).append($('<img/>',{
									id:'disk_icon',
									class:'hide',
									src:'../image/disk_icon.gif'
						})))).append($('<td/>',{
							text: item.regDate
						})).append($('<td/>',{
								
							}).append($('<li/>',{
								class:'white_btn product_view_btn',
								text:"제품보기"
					}))));
					
				});//each
				
			}//if(data!=null)
			
		}//success:function
	});//ajax
	
});//document.ready


</script>
</html>
