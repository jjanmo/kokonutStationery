<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="../css/mypage_onetoone.css" rel="stylesheet">

<div class="content">
	<div class="content_title">
		1:1 문의게시판
	</div>
	
	<table class="onetoone_table" id="onetoone_table" frame="hsides" rules="rows">
		<tr id="onetoone_top">
			<th id="onetoone_type">질문유형</th>
			<th id="onetoone_title">제목</th>
			<th id="onetoone_writer">작성자</th>
			<th id="onetoone_Date">작성일</th>
		</tr>
		

	</table>
</div>

<div class="pageDiv">

</div> 

<div class="question_btn" id="question_btn" style="cursor: pointer;">
	문의하기
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>
<script type="text/javascript">
$(function() {
	$.ajax({
		type: 'POST',
		url: '/kokonutStationery/onetoone/getOnetooneList.do',
		data: {'userId': '${memId}'},
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<tr/>',{
					class : 'title onetoone_content' ,
					id : index,
					style : 'cursor : pointer'
				}).append($('<td/>',{
						id : 'question_type',
						text : items.questionType,
						align : 'center'
					})).append($('<td/>',{
						id : 'question_subject',	
						text : items.subject,
						align : 'center'
					})).append($('<td/>',{
						id : 'user_id',
						text : items.userId,
						align : 'center'
					})).append($('<td/>',{
						id : 'logdate',
						text : items.logdate,
						align : 'center'
					})).appendTo($('#onetoone_table'));	 
				
				$('<tr>',{
					class : 'subject',
					id : 'subject' + index
					}).append($('<td>',{
						colspan : '5'
					}).append($('<div/>',{
							class : 'orderCodeDiv',
							text : '주문번호 ' + items.orderCode + ' 문의',
							style :'color:#333; font-size:13px; font-weight:700; line-height: 30px; padding: 10px 20px 0 37px;'
						})).append($('<div/>',{
							class : 'contentsDiv question_show',
							text : items.contents,
							style :'padding : 10px 20px 20px 37px;'
						})).append($('<div/>',{
							class : 'btnDiv',
						
							}).append($('<input/>',{
								type : 'button',
								class : 'question_btns white_btn btn_size_x onetoone_modify',
								id : items.onetooneCode,
								value : '수정'
								
							})).append($('<input/>',{
								type : 'button',
								class : 'question_btns white_btn btn_size_x onetoone_delete',
								id : items.onetooneCode,
								value : '삭제'
							})))).appendTo($('#onetoone_table'));		
				
				//contents내용 숨기기
				$('.subject').hide();			
			
				if(items.orderCode == null){
					$('.orderCodeDiv').css('display','none');
					$('.contentsDiv').css({marginTop :'10px'});
				}
			});//each
		}//success		
	});//ajax

	
}); 

//1:1문의 내용 보기
$(document).on('click','.title', function() {
	var index = $(this).attr('id'); 
	$('#subject'+index).toggle();
});


//1:1 문의 등록
$('.question_btn').click(function(){
	window.open('/kokonutStationery/onetoone/mypage_onetoone_register.do',
				'1:1 문의 작성',
				'width=600, height=600');
});

//1:1 문의 삭제
$(document).on('click','.onetoone_delete',function(){
	var clickObj = $(this);
	if(confirm("해당 글을 삭제하시겠습니까? 데이터 삭제시 복구가 불가능 합니다.")){
		$.ajax({
			type : 'post',
			url :'/kokonutStationery/onetoone/mypage_onetoone_delete.do',
			data : {'onetooneCode' : $(clickObj).attr('id')},
			dataType : 'text',	
			success : function(data){
				if(data == 'success') {
					alert("삭제되었습니다.");
					$(clickObj).parent().parent().parent().prev().remove();
					$(clickObj).parent().parent().parent().remove();
				}
				else alert("삭제가 실패하였습니다.");
			}	
		});

	}
});

//1:1 문의 수정
$(document).on('click','.onetoone_modify',function(){
	window.open('/kokonutStationery/onetoone/mypage_onetoone_modify.do?onetooneCode='+$(this).attr('id'),
	            '1:1 문의 수정',
	            'width=600, height=600');
});
</script>




    