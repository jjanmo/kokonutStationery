<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin 페이지</title>
<style type="text/css">
.user_search th{
	width: 154px;
	height: 35px;
	font-weight: 500;
	background-color: #f5f4f4;
	padding: 9px 9px 7px;
}

.user_search td{
	width: 700px;
	padding-left: 10px;
}

#searchBtn{
	min-width: 140px;
    padding: 0 30px;
    font-size: 16px;
    font-weight: bold;
    line-height: 40px;
    cursor: pointer;
	color: #fff;
    border: 1px solid transparent;
    background-color: #1b87d4;
}

#userSeach_list th{
	height: 53px;
	font-weight: 500;
}

.user_btn_group{
	min-width: 140px;
    padding: 0 30px;
    font-size: 20px;
    font-weight: nomal;
    line-height: 40px;
    cursor: pointer;
}

#user_searchBtn{
    color: #fff;
    border: 1px solid transparent;
    background-color: #1b87d4;
}

#user_resetBtn{
    color: #1b87d4;
    border: 1px solid #1b87d4;
    background-color: #fff;
}

#userSeach_list th{
	font-weight: 500;
    background-color: #f5f4f4;
}

#userTable{
	 width:100%;
	 border: 1px solid #d9dadc; 
	 border-spacing: 0; 
	 line-height: 1.5;
}
#userTable select{
	width: 80px;
	height: 27px;
}

.inputText{
	height: 23px;
	padding-left: 5px;
}

#check_userSearchDiv{position:relative; left:216px;}

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
<body>
<!-- 메인컨텐츠 시작 -->
<div id="mainContent_wrap">
	<div id="user_search_wrap" style="width: 1000px; margin: 0 auto;">
		<div id="user_search_title" style="margin-bottom: 20px;">
			<h1 style="font-weight:normal;">회원관리</h1>
			<div id="check_userSearchDiv"></div>
		</div>
		
		<input type="hidden" id="pg" name="pg" value="${pg }">
		<form id="userSearchForm">
			<div class="user_search" align="left">
				<table border="1" id="userTable">
					<tr>
						<th>이&emsp;&nbsp;
							름</th>
						<td>
							<input type="text" id="userName" class="inputText" style="width: 150px;">
						</td>
					</tr>
					
					<tr>
						<th>아 이 디</th>
						<td>
							<input type="text" id="userId" class="inputText" style="width: 150px;">
						</td>
					</tr>
					
					<tr>
						<th>휴 대 전 화</th>
						<td>
							<input type="text" id="userPhone1" class="inputText" style="width: 50px;"> - 
							<input type="text" id="userPhone2" class="inputText" style="width: 50px;"> - 
							<input type="text" id="userPhone3" class="inputText" style="width: 50px;">
						</td>
					</tr>
					
				</table>
				<div style="margin-top: 15px" align="center">
					<input type="button" id="user_searchBtn" class="user_btn_group" value="검 색">
					<input type="reset" id="user_resetBtn" class="user_btn_group" value="초기화">
				</div>
			</div>
		</form>
		
		<div id="userSeach_list" align="left" style="margin-top: 50px;">
			<table id="userSearchTable" border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 44px;">
						<input type="checkbox">
					</th>
					<th style="width: 150px;">이&emsp;&nbsp;름</th>
					<th style="width: 150px;">아 이 디</th>
					<th style="width: 280px;">휴 대 전 화</th>
					<th style="width: 360px;">이 메 일</th>
					<th style="width: 200px;">가 입 일</th>

				</tr>
			</table>
			<br><br>
			<!-- 페이징 처리 -->
			<div id="boardPagingDiv" style="width: 1000px; height:30px; float: left; text-align: center;"></div>
		</div>
	</div><!-- search_wrap -->
	
</div><!-- 메인컨텐츠 끝 -->

</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

//페이징
function boardPaging(pg){
	location.href="/kokonutStationery/admin/userList.do?pg="+pg;
} 

function boardSearchPaging(pg){
	$('input[name=pg]').val(pg); // input name 변수에 pg값 전달!
	//검색버튼을 누른 것과 같은 효과를 주어야 함.. 그래야 컨트롤러에서 키워드와 옵션을 얻어서 간다
	$('#user_searchBtn').trigger('click','trigger');
	//이렇게 하면 버튼을 누른 것과 같은 효과임!!!!
}


$().ready(function(){

	
	//전체 뿌려주기
	$.ajax({
		type : 'post',
		url : '/kokonutStationery/admin/getUserList.do',
		dataType : 'json',
		data : 'pg='+$('#pg').val(),
		success : function(data){
			//alert(JSON.stringify(data));
			
				$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					height : '31px',
					align : 'center'
				}).append($('<input/>',{ //체크박스
					type : 'checkbox',
					class : items.userId+""
					
				}))).append($('<td/>',{ // 이름
					align : 'center',
					text : items.userName
				})).append($('<td/>',{
					align : 'center'
				}).append($('<a/>',{ // 아이디
					text : items.userId,
					id : 'userId',
					href : 'javascript:void(0)',
					class : items.userId+""
					
				}))).append($('<td/>',{ // 폰번호
					align : 'center',
					text : items.userPhone1 + " - " 
						+ items.userPhone2 + " - " 
						+ items.userPhone3
				})).append($('<td/>',{ // 이메일
					align : 'center',
					text : items.userEmail
				})).append($('<td/>',{ // 가입일
					align : 'center',
					text : items.joinDate
				})).appendTo($('#userSearchTable'));
				
			});//each 
			
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
				
			// 회원 정보 수정 가능하도록 : 아이디 클릭 시
			($('#userSearchTable')).on("click",'#userId',function(){			
				window.open(
						"/kokonutStationery/admin/userModifyForm.do?userId="
						+$(this).attr('class')
						,'','width=1100, height=750, left=200, resizable=no, toolbar=no'
						,'true'
				);
			});
			
		}//success
	});//ajax
	
	//검색 시
	$('#user_searchBtn').click(function(event, str){
		if(str!='trigger') $('input[name=pg]').val(1);
		$('#check_userSearchDiv').empty();
		var count = 0;
		
		if($('#userName').val()!='')
			count++;
		if($('#userId').val()!='')
			count++;
		if($('#userPhone1').val()!='' && $('#userPhone2').val()!='' && $('#userPhone3').val()!='')
			count++;
		
		if(count==0){
			$('#check_userSearchDiv').text('한 항목 이상 입력하세요').css('color','red').css('font-size','15px');
		} else {
			$.ajax({
				type : 'post',
				url : '/kokonutStationery/admin/userSearch.do',
				data : {"pg" : $('input[name=pg]').val(), 
						"userId" : $('#userId').val()+"",
						"userName" : $('#userName').val()+"",
						"userPhone1" : $('#userPhone1').val()+"",
						"userPhone2" : $('#userPhone2').val()+"",
						"userPhone3" : $('#userPhone3').val()+""
						},
				dataType : 'json',
				success : function(data){
					//alert(JSON.stringify(data));
					
					$('#userSearchTable tr:gt(0)').remove();
					
 					$.each(data.list, function(index, items){
						$('<tr/>').append($('<td/>',{
							height : '31px',
							align : 'center'
						}).append($('<input/>',{ //체크박스
							type : 'checkbox',
							class : items.userId+""
							
						}))).append($('<td/>',{ // 이름
							align : 'center',
							text : items.userName
						})).append($('<td/>',{
							align : 'center'
						}).append($('<a/>',{ // 아이디
							text : items.userId,
							id : 'userId',
							href : 'javascript:void(0)',
							class : items.userId+""
							
						}))).append($('<td/>',{ // 폰번호
							align : 'center',
							text : items.userPhone1 + " - " 
								+ items.userPhone2 + " - " 
								+ items.userPhone3
						})).append($('<td/>',{ // 이메일
							align : 'center',
							text : items.userEmail
						})).append($('<td/>',{ // 가입일
							align : 'center',
							text : items.joinDate
						})).appendTo($('#userSearchTable'));
						
					});//each 
					
 					$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
					
				}//success
			});//ajax
		}
	});
	
});


</script>

</html>