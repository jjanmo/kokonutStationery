<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>장바구니</title>

<!-- 부트스트랩 -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/goods_cart_edit.css" rel="stylesheet">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
						<td style="text-align: center;"><a
							href="/shop/goods/goods_view.php?&amp;goodsno=166"><img
								src="http://store.baemin.com/shop/data/goods/1476870027237s0.jpg"
								width="80" id="objImg"
								onerror="this.src='/shop/data/skin/mdelight_C/img/common/noimg_100.gif'"></a>
						</td>
					</tr>
					<tr>
						<td style="font-size: 15px; font-weight: 700; text-align: center;">
							볼펜세트. 어머 펜이에요~</td>
					</tr>
				</tbody>
			</table>

			<div
				style="width: 100%; height: 1px; background: #F6F6F6; margin: 15px 0;"></div>


			<!-- 추가 옵션 입력형 -->


			<!-- 필수 옵션 일체형 -->


			<!-- 필수 옵션 분리형 -->



			<!-- 추가 옵션 -->


			<!--<div style="margin:15px 0 5px 0;overflow:hidden;height:1px;background:url(/shop/data/skin/mdelight_C/img/common/line.gif) repeat-x top left;"></div>-->

			<!-- 수량 -->

			<div style="padding: 0; height: 0px; border: 0">
				<div
					style="float: left; font-weight: bold; color: #565656; padding-top: 12px;">수량&nbsp;&nbsp;&nbsp;</div>
				<div style="float: right; padding-left: 3px;">
					<div style="padding: 1px 0 3px 0;">
						<img
							id="up"
							src="http://store.baemin.com/shop/data/exskin/btn_multioption_ea_up.png"
							onclick="chg_cart_ea(frmCartOption.ea,'up')"
							style="cursor: pointer; width: 14px;">
					</div>
					<div>
						<img
							id="down"
							src="http://store.baemin.com/shop/data/exskin/btn_multioption_ea_down.png"
							onclick="chg_cart_ea(frmCartOption.ea,'dn')"
							style="cursor: pointer; width: 14px;">
					</div>
				</div>
				<div style="float: right;">
					<input type="text" name="productQty" id="productQty" step="1"
						min="1" max="0" size="2" value="1"
						onblur="chg_cart_ea(this, 'set');" class="line"
						style="border: 1px solid #DDD; width: 80px; text-align: right; height: 38px; padding-right: 5px; font-weight: 500;">
				</div>
			</div>
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
								<input type="submit" class="main-button"
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
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
//수량 변경

	var qty = $('#productQty').val();
	$('#up').click(function() {
		qty++;
		$('#productQty').val(qty);
	});

	$('#down').click(function() {
		if (qty > 1) {
			qty--;
			$('#productQty').val(qty);
		}
	});
</script>
</html>