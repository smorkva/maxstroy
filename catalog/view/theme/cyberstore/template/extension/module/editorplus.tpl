<?php if($product_id){?>
<div id="edit_prod" style="display: none;"></div>
<?php } ?>
<link rel="stylesheet" href="catalog/view/theme/cyberstore/stylesheet/edit_product.css" />
<link rel="stylesheet" href="catalog/view/editproduct/css/bootstrap-select.css" />				
<script src="catalog/view/editproduct/js/bootstrap-select.js"></script>
<script>
function loadEditorplus() {
var products_id = products_url_alias = '';
var product_id = '<?php echo $product_id; ?>';

	if(product_id) {
		$.ajax({
			url: 'index.php?route=extension/module/cyber_editorplus/getSettingEditorplus',
			type: 'POST',
			data: '&route_mod=<?php echo $route; ?>&product_id='+product_id,
			dataType: 'json',
			cache: false,
			success: function(json) {	 	
				if(json['edit_prod']){
					var ajax_edit_btn = $('#edit_prod');
					$(ajax_edit_btn).replaceWith(json['edit_prod']);
				}
				
			}
		});
	} else {
		var edit_mod_pages = $('div[class*="editorbtncat"]');
		if (edit_mod_pages.length) {
			edit_mod_pages.remove();
		}
		$('.product-layout .product-name a').each(function(index, element) {
		var a = $(element);
			var href = a.attr('href');
			
			if (href != null && href != 'undefined') {
				if (/product_id=[0-9]*/.test(href)) {
					var matches = href.match(/product_id=([0-9]*)/);
					
					if (matches != null && matches != 'undefined') {
						products_id += '&prod_id_edit[' + index + ']=' + matches[1];
						if(!$('.editorbtncat' + index).length){
							$(element).parent().parent().parent().find('.image').parent().before('<div class="editorbtncat' + index + '"></div>');
						}
					}
				} else if (/\/[a-zA-Zа-яА-ЯёЁ0-9\-\_\%]*[\.]{0,1}[a-zA-Z]{0,}\?|$/.test(href)) {
					var matches = href.match(/\/([a-zA-Zа-яА-ЯёЁ0-9\-\_\%]*)[^]{0}[a-zA-Z]{0,}(?:\?|$)/);
					
					if (matches != null && matches != 'undefined') {
						products_url_alias += '&url_product_edit[' + index + ']=' + encodeURIComponent (matches[1]);
						
						$(element).parent().parent().parent().find('.image').parent().before('<div class="editorbtncat' + index + '"></div>');
					}
				}
			}
	});
	
		$.ajax({
			url: 'index.php?route=extension/module/cyber_editorplus/getSettingEditorplus',
			type: 'POST',
			data: '&seo_category_id=<?php echo $seo_category_id;?>&route_mod=<?php echo $route; ?>'+products_id + products_url_alias,
			dataType: 'json',
			cache: false,
			success: function(json) {
				$.each(json['btn_product'], function(numb, data) {
					var cont_edit_btn = $('.editorbtncat' + numb + '');
					$(cont_edit_btn).append(data);
				});	
				var groupbtn = $('div[id="group-editor"]');
				if (!groupbtn.length) {
					if(json['group_btn']){
						$('footer').before(json['group_btn']);
					}
				}
				
			}
		});
	}
	
};

$(document).ready(function(e) {
	if (typeof doFilter != 'function') {
		setTimeout ('loadEditorplus()', 500);
	}
});
</script>
