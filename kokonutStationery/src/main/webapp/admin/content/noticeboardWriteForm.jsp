<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<head>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{font-family:'Hanna', sans-serif;}

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
    width: 30%; /* Could be more or less, depending on screen size */                          
}

.modalDiv{
   width:130px;
   cursor:pointer;
   background-color:#DDDDDD;
   text-align: center;
   padding-bottom: 10px;
   padding-top: 10px;
}

#notice_info th{
	width: 90px;
    height: 50px;
    text-align: center;
    font-weight: 500;
    font-size:20px;
    background-color: #f5f4f4;
    padding: 9px 9px 7px;
}

#notice_info td{
	width:250px;
	padding-left:10px;
	font-size:18px;
}

#notice_info td>input{
	font-size:18px;
}

.regist_reset{
	min-width: 140px;
    padding: 0 30px;
    font-size: 16px;
    font-weight: bold;
    line-height: 40px;
    cursor: pointer;
}

#registBtn{
    color: #fff;
    border: 1px solid transparent;
    background-color: #1b87d4;
    font-weight:normal;
}

#registResetBtn{
    color: #1b87d4;
    border: 1px solid #1b87d4;
    background-color: #fff;
    font-weight:normal;
}

.inputText{
	height: 27px;
	padding-left: 5px;
}

#noticeboardSubject{
	width:450px; height:35px;
}

#noticeboardContent{
	width:800px; height:1000px;
	font-size:15px;
}

</style>
</head>

    
<!-- modal window div 부분 -->
<!-- The Modal -->
<div id="open_confirmModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
            <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">공지사항 등록</span></b></span></p>
            <p style="text-align: center; line-height: 1.5;"><br />공지사항을 등록하시겠습니까?</p>
            <p><br /></p>

        <div class="modalDiv" id="confirmOK_Modal" style="display: inline-block;">
            <span class="pop_bt" style="font-size: 13pt; " >
            	확인
            </span>

        </div>
        <div class="modalDiv" id="close_Modal" style="float:right;">
            <span class="pop_bt" style="font-size: 13pt;" >
			취소
            </span>
        </div>
  </div>
</div>
<!--End Modal-->

<div id="main_wrap" align="left" style="width:850px; margin:30px auto;">
	
	<div>
		<h1 style="font-weight:normal;">공지사항 등록</h1>
	</div>
	<div id="notice_info">
		<table id="notice_info_table" border="1" style="width:100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5; margin-top: 50px;">
			<tr>
				<th>제  목</th>
				<td>
					<input type="text" id="noticeboardSubject" />
					<span id="subjectDiv"></span>
				</td>
			</tr>
			<tr>
				<th>내  용</th>
				<td>
					<textarea id="noticeboardContent" cols="60" rows="30" ></textarea>
					<span id="contentDiv"></span>
				</td>
			</tr>
			
		</table>
	</div>
	<div align="center" style="margin-top:50px;">
		<input type="button" class="regist_reset" id="registBtn" value="등록">
		<input type="button" class="regist_reset" id="registResetBtn" value="취소">
	</div>

</div><!-- main_wrap div -->

<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$().ready(function(){
	
	$('#registBtn').click(function(){
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('#noticeboardSubject').val()=='')
			$('#subjectDiv').text("제목을 입력하세요").css('color', 'red').css('font-size','8pt');
		else if($('#noticeboardContent').val()=='')
			$('#contentDiv').text("내용을 입력하세요").css('color', 'red').css('font-size','8pt');	
		else {
			$('#open_confirmModal').show();
		}
	});
	
	$('#registResetBtn').click(function(){
		window.close();
	});
	
	/* 모달 창 닫기 */
	$('#close_Modal').click(function(){
	   $('#open_confirmModal').hide();
	});
	
	//모달 창에서 확인버튼 클릭 시 수정 진행
	$('#confirmOK_Modal').click(function(){
		$.ajax({
			type : 'post',
			url : '/kokonutStationery/admin/noticeboardWrite.do',
			data : {'noticeboardSubject' : $('#noticeboardSubject').val(),
					'noticeboardContent' : $('#noticeboardContent').val()
					}				
		});
		alert('등록 성공');
		window.close();
	});	
});

</script>




