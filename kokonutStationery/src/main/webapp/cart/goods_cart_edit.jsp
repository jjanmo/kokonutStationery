<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>선택옵션수정</title>

<!-- 부트스트랩 -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/goods_cart_edit.css" rel="stylesheet">
<style type="text/css">
.sub-button:hover{
	background-color: rgb(246,246,246);
}
</style>
</head>
<body style="margin: 0px" cz-shortcut-listen="true">

	<div
		style="width: 100%; background: #777; height: 43px; line-height: 44px; font-size: 15px; font-weight: 700; padding-left: 15px; color: #fff;">선택옵션
		수정</div>


	<form name="frmCartOption" method="post" action="" onsubmit="">
		<input type="hidden" name="mode" value="editOption"> <input
			type="hidden" name="idx" value="0">

		<div
			style="width: 80%; height: 290px; margin: 20px auto; overflow-y: auto;">

			<table border="0" style="margin: 0 auto;">
				<tbody>
					<tr>
						<td style="text-align: center;">
							<a href="#" id="thumbImg">
								<img src="../image/thumb/${cartDTO.thumbImg }" width="80" id="cartEditImg">						
							</a>
						</td>
					</tr>
					<tr>
						<td style="font-size: 15px; font-weight: 700; text-align: center;">
							${cartDTO.productName }</td>
					</tr>
				</tbody>
			</table>

			<div
				style="width: 100%; height: 1px; background: #F6F6F6; margin: 15px 0;"></div>


			


			<!-- 추가 옵션 -->

			<div id="optionDiv" style="margin-top: 3px;">
				<div class="items" style="padding: 5px 0; " class="optionSelect">옵션명 (종류)</div>
				<select id="optionBox" style="height:37.4px;" class="item_contents_select" name="option">
					<option value="">옵션을 선택하세요</option>
				</select>
			</div>

			<!-- 옵션 div 추가-->
			<div class="option_wrap" ></div>

			<!-- 수량 -->

			<%-- <div style="padding: 0; height: 0px; border: 0">
				<div
					style="float: left; font-weight: bold; color: #565656; padding-top: 12px;">수량&nbsp;&nbsp;&nbsp;</div>
				<div style="float: right; padding-left: 3px;">
					<div style="padding: 1px 0 3px 0;">
						<img id="up"
							src="http://store.baemin.com/shop/data/exskin/btn_multioption_ea_up.png"
							onclick="chg_cart_ea(frmCartOption.ea,'up')"
							style="cursor: pointer; width: 14px;">
					</div>
					<div>
						<img id="down"
							src="http://store.baemin.com/shop/data/exskin/btn_multioption_ea_down.png"
							onclick="chg_cart_ea(frmCartOption.ea,'dn')"
							style="cursor: pointer; width: 14px;">
					</div>
				</div>
				<div style="float: right;">
					<input type="text" name="productQty" id="productQty" step="1"
						min="1" max="0" size="2" value="${cartDTO.productQty }"
						onblur="chg_cart_ea(this, 'set');" class="line"
						style="border: 1px solid #DDD; width: 80px; text-align: right; height: 38px; padding-right: 5px; font-weight: 500;">
				</div>
			</div> --%>
			<div
				style="width: 100%; height: 1px; background: #F6F6F6; margin: 68px 0 15px 0;"></div>

		</div>



		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tbody>
				<tr>
					<td id="avoidDbl" align="center" height="100">
						<div style="width: 100%" class="noline">
							<div style="width: 120px; display: inline-block;">
								<a href="javascript:void(0);" onclick="self.close();"><li
									class="sub-button"
									style="width: 120px; text-align: center; height: 55px; line-height: 55px; font-size: 13px; font-weight: 500;">취소</li></a>
							</div>
							<div
								style="width: 120px; display: inline-block; padding-left: 5px;">
								<input type="button" class="main-button"
									style="border: none; text-align: center; height: 55px; width: 120px; line-height: 55px; -webkit-appearance: none; border-radius: 0; font-size: 13px; font-weight: 500;"
									value="수정">
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div>
			<a href="javascript:this.close()" onfocus="blur()"><img
				src="http://store.baemin.com/shop/data/exskin/btn_multioption_del_2.png"
				style="width: 18px; position: absolute; right: 15px; top: 12px;"></a>
		</div>

	</form>

</body>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
//수량 변경
	var option = ${cartDTO.productOption};
	var productCode = ${cartDTO.productCode}

	/* var qty = $('#productQty').val();
	$('#up').click(function() {
		qty++;
		$('#productQty').val(qty);
	});

	$('#down').click(function() {
		if (qty > 1) {
			qty--;
			$('#productQty').val(qty);
		}
	}); */
			
	$(function(){
			//옵션 출력
		$.ajax({
			type : 'get',
			url : '/kokonutStationery/goods/getOption.do',
			data : {'productCode' : productCode},
			dataType : 'json',
			success : function(data) {
				$.each(data.list, function(index, item) {
					$('select').append($('<option>' + item.optionContent + '</option>'));
				});
			}
		});
	});	
	
	//수정버튼 클릭
	$('.main-button').click(function() {
		var optionContent = $('#optionBox option:selected').val();
		var cartCode = ${cartDTO.cartCode};
		//alert(optionContent);
		//alert(cartCode);
		
		if(optionContent=='') {
			alert('종류를 선택하세요.');
			return;
			
		} else if('${memId}'!='') {//회원
			alert("회원");
			$.ajax({
				type :'post',
				url :'/kokonutStationery/cart/option_content_modify.do',
				data : {'optionContent' : optionContent,
						'cartCode' : cartCode	}
			});
			
			modifyOptionClose(optionContent);
		} else if('${memId}'==''){//비회원
			$.ajax({
				type :'post',
				url :'/kokonutStationery/cart/kokonut_option_content_modify.do',
				data : {'optionContent' : optionContent,
						'cartCode' : cartCode	}
			});
			
			modifyOptionClose(optionContent);
		}
	});

	function modifyOptionClose(optionContent){
		//alert(optionContent);
		//opener.document.getElementById('${cartDTO.cartCode }').value = optionContent;
		opener.parent.location.reload();
		/* opener.parent.location = '/kokonutStationery/cart/goods_cart.do'; */
		window.close();
	}
	
	
</script>
</html>