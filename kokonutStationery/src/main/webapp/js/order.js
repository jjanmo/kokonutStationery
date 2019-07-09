function chkOrder(id){
	var privateVal = $('input[name="private1"]:checked').val();
	var chkPhone = /^(?=.*[0-9]).{3,4}$/;//3자리수
	var chkPhone2 = /^(?=.*[0-9]).{4,5}$/;//4자리수
	var chkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	var receiverName = $('#receiverName').val();
	var paywayVal = $('input[name="payType"]:checked').val();
	var kId = 'Kokonut';
	//alert(privateVal);
	//alert(id.indexOf(kId));
	
	
	if(privateVal!='yes' && id.indexOf(kId) != -1){
		alert("[개인정보보호를 위한 이용자 동의사항]에 동의를 하셔야 주문이 가능합니다.");
		return false;
		
	}
	else if( !chkPhone.test($('#userPhone1').val())){
		alert("올바른 전화번호 형식이 아닙니다.");
		$('#userPhone1').focus();
		return false;
		
	}else if( !chkPhone2.test($('#userPhone2').val())){
		alert("올바른 전화번호 형식이 아닙니다.");
		$('#userPhone2').focus();
		return false;
		
	}else if( !chkPhone2.test($('#userPhone3').val())){
		alert("올바른 전화번호 형식이 아닙니다.");
		$('#userPhone3').focus();
		return false;
		
	}else if( !chkEmail.test($('#userEmail').val()) ){
		alert("올바른 이메일 형식이 아닙니다.");
		$('#userEmail').focus();
		return false;
		
	}else if(!/^(?=.*[가-힣]).{2,20}$/.test(receiverName)){
		alert("올바른 이름 형식이 아닙니다.");
		$('#receiverName').focus();
		return false;
		
	}else if( !chkPhone.test($('#receiverPhone1').val())){
		alert("올바른 전화번호 형식이 아닙니다.");
		$('#receiverPhone1').focus();
		return false;
		
	}else if( !chkPhone2.test($('#receiverPhone2').val())){
		alert("올바른 전화번호 형식이 아닙니다.");
		$('#receiverPhone2').focus();
		return false;
		
	}else if( !chkPhone2.test($('#receiverPhone3').val())){
		alert("올바른 전화번호 형식이 아닙니다.");
		$('#receiverPhone3').focus();
		return false;
		
	}
}


function checkPost(){
	window.open("/kokonutStationery/order/checkPost.do","","width=550 height=500 left=500 top=300 scrollbars=yes");
}

$('#postSearchBtn').click(function(){
	if($('#sido').val()=='시도선택'||$('#roadname').val()==''){
		alert("주소를 입력하세요.");
	}else 
		$.ajax({
			type : 'POST',
			url : '/kokonutStationery/order/postSearch.do',
			data : {'sido' : $('#sido').val(),
				    'sigungu' : $('#sigungu').val(),
				    'roadname' : $('#roadname').val()},
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				$('table tr:gt(1)').remove();
				var address;
				$('<tr/>').append($('<td/>',{colspan:'4'}).css('border','none').css('height','20px')).appendTo($('#postTable'));
				$('<tr/>').css('background-color', '#f5f4f4'
				).append($('<td/>',{
					text : '우편번호'
				}).css('height', '40px')
				.css('text-align', 'center')
				).append($('<td/>', {
					text : '주소', 
					colspan: '3',
					align: 'center'
				})).appendTo($('#postTable'));
				
				$.each(data.list, function(index, items){
					address = items.sido + " "
					           + items.sigungu + " "
					           + items.yubmyundong + " "
					           + items.ri + " "
					           + items.roadname + " "
					           + items.buildingname;
					
					address = address.replace(/null/g,'');//전체에서 null을 찾아서 ''내용으로 바꿔라
					
					$('<tr/>').append($('<td/>',{
						align : 'center',
						id : 'zipcode',
						text : items.zipcode
					}).css('height', '30px')
					).append($('<td/>',{
						colspan : '3',
						}).append($('<a/>',{
							href : 'javascript:void(0)',//주소를 타고 가는 것이 아니다! ==> #과 같음
							id : 'addressA',
							text : address
							
						}).css('padding-left', '5px'
						))
					).appendTo($('#postTable'));//tree구조로 잡혀있다.
				});//each
				
				$('a').click(function(){
					
					//alert($(this).prop('tagName'));
					var zipcode = $(this).parent().prev().text();
					address=$(this).text();
					checkPostClose(zipcode,address);
				});
			}
		});
});

function checkPostClose(zipcode,address){
	opener.document.getElementById("receiverZipcode").value = zipcode;
	opener.document.getElementById("receiverAddr1").value = address;
	window.close();
	opener.document.getElementById("receiverAddr2").focus();
}
