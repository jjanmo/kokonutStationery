// 공통
$('#close_btn_img').click(function(){
	window.close();
});

$('.order_Number_Btn').click(function(){
	$('.order_Number_search').toggleClass('show');
});
    
$('#hide_btn_img').click(function(){
	$('.order_Number_search').toggleClass('show');
});



// mypage_onetooen.jsp
$('#onetoone_content').click(function(){
	$('.question').toggleClass('hide');
});

$('.question_btn').click(function(){
	window.open('/kokonutStationery/onetoone/mypage_onetoone_register.do',
				'1:1 문의 작성',
				'width=580, height=630');
});

$('#onetone_delete').click(function(){
	window.open('/kokonutStationery/onetoone/mypage_onetoone_delete.do',
	            '1:1 문의 삭제',
				'width=500, height=280');
});

$('#onetoone_modify').click(function(){
	window.open('/kokonutStationery/onetoone/mypage_onetoone_modify.do',
	            '1:1 문의 수정',
	            'width=580, height=630');
});
	
$('#onetone_answer').click(function(){
	window.open('/kokonutStationery/onetoone/mypage_onetoone_reply.do',
	            '1:1 문의 답변',
	            'width=580, height=630');
});



//mypage_review.jsp
$('.review_content').click(function(){
  $('.review').toggleClass('hide');
});
//class이름에 seq를 추가하거나 번호를 추가해야할 듯

$('#close_btn_img').click(function(){
  window.close();
});

$('#review_deleteBtn').click(function(){
  window.open('mypage_review_delete.html',
              '상품후기삭제',
              'width=500, height=280');
});

$('#review_modifyBtn').click(function(){
  window.open('mypage_review_modify.html',
              '상품후기수정',
              'width=560, height=630');
});


/* maypage_qna.jsp */
/*$('#qna_deleteBtn').click(function(){
  window.open('mypage_qna_delete.html',
              '상품문의삭제',
              'width=500, height=280');
});

$('#qna_modifyBtn').click(function(){
  window.open('mypage_qna_modify.html',
              '상품문의수정',
              'width=950, height=650');
});

$('#qna_replyBtn').click(function(){
  window.open('mypage_qna_reply.html',
              '상품문의답변',
              'width=950, height=650');
});*/
