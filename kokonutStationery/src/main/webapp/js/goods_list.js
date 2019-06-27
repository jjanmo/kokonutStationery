//$(function(){
//	var category = $('.selected').text();
//	
//	if(category=='문구') category = 'stationery';
//	else if(category=='리빙') category = 'living';
//	else if(category=='여행') category = 'travel';
//	else if(category=='콜라보레이션') category = 'collabo';
//		
//	/*alert(category);*/
//	  
//	$.ajax({
//		type: 'POST',
//		url: '/kokonutStationery/goods/get_goods_list.do',
//		data: {'category': category},
//		dataType: 'json',
//		success: function(data) {
//			$('.product_list').empty();
//			$.each(data.list, function(index, items) {
//				$('<div/>',{class: 'product', text: 'asdf'}).appendTo($('.product_list'));
//			}); //each
//		} //success
//	}); //ajax
//});

/*$('<div/>',{class: 'product'}).append(
		$('<div/>',{
			class: 'product_img',
			backgroundSize: '100%',
			backgroundImage: 'url('+items.thumbImg+')'							
		})).append(
		$('<div/>',{class: 'product_contents'})
			.append($('<div/>',{class: 'product_name_div'})
					.append($('<span/>',{
							class: 'product_name',
							text: items.productName
					}))
			).append($('<div/>',{class: 'product_price_div'})
				.append($('<div/>',{class: 'product_status'}))
				.append($('<span/>',{class: 'original_price', text: items.originalPrice}))
				.append($('<span/>',{class: 'product_price', text: items.discountPrice}))
			)							
		).appendTo($('.product_list'));*/
