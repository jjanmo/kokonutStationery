<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/service_noticeboard.css">
		<div style="width:1000px; margin:auto;">
			<div style="font-size:22px; font-weight:700;">공지사항</div>
			<form id="noticeboard_searchForm">
					<div class="noticeboard_search">
						<select class="noticeboard_searchOption" name="searchOption">
							<option name="searchOptionContent">통합검색</option>
							<option name="searchOptionContent">제목</option>
							<option name="searchOptionContent">내용</option>
						</select>
						<input type="text" class="noticeboard_searchValue" name="searchKeyword" placeholder="검색어를 입력하세요">
						<input type="submit" class="noticeboard_searchBtn" value="검색">
					</div>
			</form><!-- noticeboard_searchForm -->
		</div>
		
		<div class="notice_wrap"><!-- 공지 -->
			<div class="notice_list">
				<table id="notice_table" >
					<tr class="list_menu">
						<td>번호</td>
						<td style="width: 704px;">제목</td>
						<td style="width: 128px;">날짜</td>
					</tr>
				</table><!-- notice_table_end -->			
			</div>
		</div><!-- notice_wrap_END -->
		
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

//전체 뿌려주기
$.ajax({
	type : 'post',
	url : '/kokonutStationery/service/getNoticeboardList.do',
	dataType : 'json',
	success : function(data){
		//alert(JSON.stringify(data));
		
		$.each(data.list,function(index, items){
			$('<tr/>',{
				class : 'subjectTr'
			}).append($('<td/>',{ // 번호
				align : 'center',
				text : items.noticeboardCode
			})).append($('<td/>',{ // 제목
				align:'center',
			}).append($('<a/>',{
				text : items.noticeboardSubject,
				href : 'javascript:void(0)',
				name : items.noticeboardCode,
				class : 'subjectA',
				style : 'font-weight:bold;'
				
			}))).append($('<td/>',{ // 날짜
				align : 'center',
				text : items.regDate
			})).appendTo($('#notice_table'));
			
			//내용들어갈 tr
			$('<tr/>').append($('<td/>',{
				style : "white-space:pre; padding:40px 0;",
				text : items.noticeboardContent,
				colspan : 3,
				class : 'contentA',
				id : items.noticeboardCode
			})).appendTo($('#notice_table'));
			
			$('.contentA').hide();
			//$('.subjectTr').css("border","1px solid #000000");
		});//each
		
		$('.subjectA').click(function(){
			var code = $(this).attr('name');
			$('[id^='+code+']').each(function(){
				$(this).toggle();
			});
		});
		
	}//success
});


</script>
