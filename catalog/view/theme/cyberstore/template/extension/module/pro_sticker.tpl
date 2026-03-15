<style>
div.pro_sticker {
	display:none;
	position:absolute;
	z-index:<?php echo $settings["z_index"]; ?>;
}
div.box-sticker  {
	display:none;
	position:absolute;
	z-index:<?php echo $settings["z_index"]; ?>;
}
.bsl.box-sticker{font-size: 14px;}
.box-sticker .sticker_label {
	font-size: 12px;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.15);
	font-weight: 500;
	border-radius: 2px;
	line-height: 1;
	padding: 3px;
}
.box-sticker {position: absolute;}
.box-sticker.bottomcenter {
	bottom:5px;
	left:5px;
	right:5px;
} 
.box-sticker.bottomcenter ~ .box-sticker.bottomcenter{
	bottom:29px;
}
.box-sticker.bottomcenter ~ .box-sticker.bottomcenter ~ .box-sticker.bottomcenter{
	bottom:53px;
}
.bsl.box-sticker.bottomcenter ~ .box-sticker.bottomcenter ~ .box-sticker.bottomcenter{
	bottom:53px;
}
.box-sticker.bottomcenter ~ .box-sticker.bottomcenter ~ .box-sticker.bottomcenter ~ .box-sticker.bottomcenter{
	bottom:76px;
}
.box-sticker.bottomcenter ~ .box-sticker.bottomcenter ~ .box-sticker.bottomcenter ~ .box-sticker.bottomcenter ~ .box-sticker.bottomcenter{
	bottom:100px;
}

.box-sticker.topcenter {
	top:5px;
	left:5px;
	right:5px;
} 
.box-sticker.topcenter ~ .box-sticker.topcenter{
	top:29px;
}
.bsl.box-sticker.topcenter ~ .box-sticker.topcenter ~ .box-sticker.topcenter{
	top:52px;
}
.box-sticker.topcenter ~ .box-sticker.topcenter ~ .box-sticker.topcenter{
	top:52px;
}
.box-sticker.topcenter ~ .box-sticker.topcenter ~ .box-sticker.topcenter ~ .box-sticker.topcenter{
	top:75px;
}
.box-sticker.topcenter ~ .box-sticker.topcenter ~ .box-sticker.topcenter ~ .box-sticker.topcenter ~ .box-sticker.topcenter{
	top:99px;
}
.box-sticker.centercenter {
	left:5px;
	right:5px;
	top:50%;
} 
.box-sticker.centercenter ~ .box-sticker.centercenter{
	margin-top:-22px;
}
.bsl.box-sticker.centercenter ~ .box-sticker.centercenter ~ .box-sticker.centercenter{
	margin-top:22px;
}
.box-sticker.centercenter ~ .box-sticker.centercenter ~ .box-sticker.centercenter ~ .box-sticker.centercenter{
	margin-top:44px;
}

.box-sticker.topleft {
	top:5px;
	left:5px;
}
.box-sticker.topleft ~ .box-sticker.topleft{
	top:29px;
}
.bsl.box-sticker.topleft ~ .box-sticker.topleft{
	top:29px;
}
.box-sticker.topleft ~ .box-sticker.topleft ~ .box-sticker.topleft{
	top:53px;
}
.bsl.box-sticker.topleft ~ .box-sticker.topleft ~ .box-sticker.topleft{
	top:53px;
}
.box-sticker.topleft ~ .box-sticker.topleft ~ .box-sticker.topleft ~ .box-sticker.topleft{
	top:77px;
}
.bsl.box-sticker.topleft ~ .box-sticker.topleft ~ .box-sticker.topleft ~ .box-sticker.topleft{
	top:77px;
}
.box-sticker.topleft ~ .box-sticker.topleft ~ .box-sticker.topleft ~ .box-sticker.topleft ~ .box-sticker.topleft{
	top:102px;
}
.bsl.box-sticker.topleft ~ .box-sticker.topleft ~ .box-sticker.topleft ~ .box-sticker.topleft ~ .box-sticker.topleft{
	top:102px;
}

.box-sticker.bottomright {
	bottom:5px;
	right:5px;
}
.box-sticker.bottomright ~ .box-sticker.bottomright{
	bottom:29px;
}
.bsl.box-sticker.bottomright ~ .box-sticker.bottomright{
	bottom:29px;
}
.box-sticker.bottomright ~ .box-sticker.bottomright ~ .box-sticker.bottomright{
	bottom:53px;
}
.bsl.box-sticker.bottomright ~ .box-sticker.bottomright ~ .box-sticker.bottomright{
	bottom:53px;
}
.box-sticker.bottomright ~ .box-sticker.bottomright ~ .box-sticker.bottomright ~ .box-sticker.bottomright{
	bottom:77px;
}
.bsl.box-sticker.bottomright ~ .box-sticker.bottomright ~ .box-sticker.bottomright ~ .box-sticker.bottomright{
	bottom:77px;
}
.box-sticker.bottomright ~ .box-sticker.bottomright ~ .box-sticker.bottomright ~ .box-sticker.bottomright ~ .box-sticker.bottomright{
	bottom:101px;
}
.bsl.box-sticker.bottomright ~ .box-sticker.bottomright ~ .box-sticker.bottomright ~ .box-sticker.bottomright ~ .box-sticker.bottomright{
	bottom:101px;
}

.box-sticker.bottomleft {
	bottom:5px;
	left:5px;
}
.box-sticker.bottomleft ~ .box-sticker.bottomleft{
	bottom:29px;
}
.bsl.box-sticker.bottomleft ~ .box-sticker.bottomleft{
	bottom:29px;
}
.box-sticker.bottomleft ~ .box-sticker.bottomleft ~ .box-sticker.bottomleft{
	bottom:53px;
}
.bsl.box-sticker.bottomleft ~ .box-sticker.bottomleft ~ .box-sticker.bottomleft{
	bottom:53px;
}
.box-sticker.bottomleft ~ .box-sticker.bottomleft ~ .box-sticker.bottomleft ~ .box-sticker.bottomleft{
	bottom:77px;
}
.bsl.box-sticker.bottomleft ~ .box-sticker.bottomleft ~ .box-sticker.bottomleft ~ .box-sticker.bottomleft{
	bottom:77px;
}
.box-sticker.bottomleft ~ .box-sticker.bottomleft ~ .box-sticker.bottomleft ~ .box-sticker.bottomleft ~ .box-sticker.bottomleft{
	bottom:101px;
}
.bsl.box-sticker.bottomleft ~ .box-sticker.bottomleft ~ .box-sticker.bottomleft ~ .box-sticker.bottomleft ~ .box-sticker.bottomleft{
	bottom:101px;
}
.box-sticker.topright {
	top:5px;
	right:5px;
}
.box-sticker.topright ~ .box-sticker.topright{
	top:29px;
}
.bsl.box-sticker.topright ~ .box-sticker.topright{
	top:29px;
}
.box-sticker.topright ~ .box-sticker.topright ~ .box-sticker.topright{
	top:53px;
}
.bsl.box-sticker.topright ~ .box-sticker.topright ~ .box-sticker.topright{
	top:53px;
}
.box-sticker.topright ~ .box-sticker.topright ~ .box-sticker.topright ~ .box-sticker.topright{
	top:75px;
}
.bsl.box-sticker.topright ~ .box-sticker.topright ~ .box-sticker.topright ~ .box-sticker.topright{
	top:77px;
}
.box-sticker.topright ~ .box-sticker.topright ~ .box-sticker.topright ~ .box-sticker.topright ~ .box-sticker.topright{
	top:82px;
}
.bsl.box-sticker.topright ~ .box-sticker.topright ~ .box-sticker.topright ~ .box-sticker.topright ~ .box-sticker.topright{
	top:102px;
}

.box-sticker.centerleft {
	top:50%;
	left:5px;
}
.box-sticker.centerleft ~ .box-sticker.centerleft{
	top:calc(50% + 23px);
}
.bsl.box-sticker.centerleft ~ .box-sticker.centerleft{
	top:calc(50% + 23px);
}
.box-sticker.centerleft ~ .box-sticker.centerleft ~ .box-sticker.centerleft{
	top:calc(50% + 47px);
}
.bsl.box-sticker.centerleft ~ .box-sticker.centerleft ~ .box-sticker.centerleft{
	top:calc(50% + 47px);
}
.box-sticker.centerleft ~ .box-sticker.centerleft ~ .box-sticker.centerleft ~ .box-sticker.centerleft{
	top:calc(50% + 71px);
}
.bsl.box-sticker.centerleft ~ .box-sticker.centerleft ~ .box-sticker.centerleft ~ .box-sticker.centerleft{
	top:calc(50% + 71px);
}
.box-sticker.centerleft ~ .box-sticker.centerleft ~ .box-sticker.centerleft ~ .box-sticker.centerleft ~ .box-sticker.centerleft{
	top:calc(50% + 95px);
}
.bsl.box-sticker.centerleft ~ .box-sticker.centerleft ~ .box-sticker.centerleft ~ .box-sticker.centerleft ~ .box-sticker.centerleft{
	top:calc(50% + 95px);
}
.box-sticker.centerright {
	top:50%;
	right:5px;
}
.box-sticker.centerright ~ .box-sticker.centerright{
	top:calc(50% + 23px);
}
.bsl.box-sticker.centerright ~ .box-sticker.centerright{
	top:calc(50% + 23px);
}
.box-sticker.centerright ~ .box-sticker.centerright ~ .box-sticker.centerright{
	top:calc(50% + 42px);
}
.bsl.box-sticker.centerright ~ .box-sticker.centerright ~ .box-sticker.centerright{
	top:calc(50% + 47px);
}
.box-sticker.centerright ~ .box-sticker.centerright ~ .box-sticker.centerright ~ .box-sticker.centerright{
	top:calc(50% + 71px);
}
.bsl.box-sticker.centerright ~ .box-sticker.centerright ~ .box-sticker.centerright ~ .box-sticker.centerright{
	top:calc(50% + 71px);
}
.box-sticker.centerright ~ .box-sticker.centerright ~ .box-sticker.centerright ~ .box-sticker.centerright ~ .box-sticker.centerright{
	top:calc(50% + 95px);
}
.bsl.box-sticker.centerright ~ .box-sticker.centerright ~ .box-sticker.centerright ~ .box-sticker.centerright ~ .box-sticker.centerright{
	top:calc(50% + 95px);
}
</style>
<script type="text/javascript"><!--
function ProStickerLoad() {
	var products_id = products_url_alias = '';
	var product_id = '<?php echo $product_id; ?>';	
	var stickers_mod_pages = $('<?php echo $settings["class"]; ?> a div[class*="pro_sticker"]');
	
	if (stickers_mod_pages.length) {
		stickers_mod_pages.each(function(index, element) {
			$(element).children('div.pro_sticker').remove();
			$(element).children('div.box-sticker').remove();
			$(element).children('img').unwrap();
		});
	}
	
	$('<?php echo $settings["class"]; ?> a img:first-child').each(function(index, element) {
		var a = $(element).parent('a');
			var href = a.attr('href');
			
			if (href != null && href != 'undefined') {
				if (/product_id=[0-9]*/.test(href)) {
					var matches = href.match(/product_id=([0-9]*)/);
					
					if (matches != null && matches != 'undefined') {
						products_id += '&prod_id_ajax[' + index + ']=' + matches[1];
						
						$(element).wrap('<div class="pro_sticker' + index + '" style="position:relative;"></div>');
					}
				} else if (/\/[a-zA-Zа-яА-ЯёЁ0-9\-\_\%]*[\.]{0,1}[a-zA-Z]{0,}\?|$/.test(href)) {
					var matches = href.match(/\/([a-zA-Zа-яА-ЯёЁ0-9\-\_\%]*)[^]{0}[a-zA-Z]{0,}(?:\?|$)/);
					
					if (matches != null && matches != 'undefined') {
						products_url_alias += '&url_product[' + index + ']=' + encodeURIComponent (matches[1]);
						
						$(element).wrap('<div class="pro_sticker' + index + '" style="position:relative;"></div>');
					}
				}
			}
		
	});
	
	
	var a_main = $('<?php echo $settings["class_main_image"]; ?> div.pro_stickermain');
	if (a_main.length) {
		$('.pro_stickermain').children('div.pro_sticker').remove();
		$('.pro_stickermain').children('div.box-sticker').remove();
	} 
	if (product_id) {
		products_id += '&prod_id_ajax[main]=' + product_id;	
		if (!a_main.length) {
		$('<?php echo $settings["class_main_image"]; ?> img').wrap('<div class="pro_stickermain" style="position:relative;text-align:center;"></div>');
		} 
	} 
	
	
	
	$.ajax({
		url: '<?php echo $url_module; ?>',
		type: 'POST',
		data: products_id + products_url_alias,
		dataType: 'json',
		cache: false,
		success: function(json) {
			$.each(json, function(numb, data) {
				var mp_image = $('<?php echo $settings["class"]; ?> a div.pro_sticker' + numb + ' img:first-child');
				var block_product = $('<?php echo $settings["class"]; ?> ');
				var image_w_mp_image = parseInt(mp_image.css('width'));
				var image_w_mp = parseInt(block_product.css('width'))-20;
				var image_h_mp = parseInt(mp_image.css('height'));
				
				var width_mp = image_w_mp + parseInt(mp_image.css('padding-left')) + parseInt(mp_image.css('padding-right'));
				var height_mp = image_h_mp + parseInt(mp_image.css('padding-top'))  + parseInt(mp_image.css('padding-bottom'));
				
				var margin_top_mp = parseInt(mp_image.css('margin-top')) + parseInt(mp_image.css('border-top-width'));
				
				if (mp_image.css('text-align') != 'center') {
					var margin_left_mp = parseInt(mp_image.css('margin-left')) + parseInt(mp_image.css('border-left-width'));
					var left_mp = 0;	
				} else {
					var margin_left_mp = -(image_w_mp / 2);
					var left_mp = '50%';
				}
				if (data && image_w_mp_image > '<?php echo $settings["min_width"]; ?>' && image_h_mp > '<?php echo $settings["min_height"]; ?>') {
					mp_image.before(data);
					
					var stickers_mod_pages = $('<?php echo $settings["class"]; ?> a div.pro_sticker' + numb + ' div.pro_sticker');
					var stickers_label = $('<?php echo $settings["class"]; ?> a div.pro_sticker' + numb + ' div.box-sticker');
					stickers_mod_pages.css({'width':width_mp, 'height':height_mp, 'margin-top':margin_top_mp, 'margin-left':margin_left_mp, 'left':left_mp});
					stickers_mod_pages.fadeIn(300);
					stickers_label.css({'display':'block'})
					stickers_label.fadeIn(300);
					<?php if($settings['hide_hover'] ==1){?>
					$('<?php echo $settings["class"]; ?> a div.pro_sticker' + numb).hover(
						function() {
							stickers_mod_pages.hide();
							stickers_label.hide();
						},
						function() {
							stickers_mod_pages.show();
							stickers_label.show();
						}
					);
					<?php } ?>
					
				} else {
					mp_image.unwrap();
				}
				
					if (product_id && (numb == 'main')) {
					var image_main = $('<?php echo $settings["class_main_image"]; ?> div.pro_sticker' + numb + ' img:first-child');
					var block_product_main = $('<?php echo $settings["class_main_image"]; ?>');
					var image_width = parseInt(block_product_main.css('width'))-20;
					var image_height = parseInt(image_main.css('height'));
					
					var width = image_width + parseInt(image_main.css('padding-left')) + parseInt (image_main.css('padding-right'));
					var height = image_height + parseInt(image_main.css('padding-top'))  + parseInt (image_main.css('padding-bottom'));
					
					var margin_top = parseInt(image_main.css('margin-top')) + parseInt (image_main.css('border-top-width'));
					
					if (image_main.css('text-align') != 'center') {
						var margin_left_main = parseInt(image_main.css('margin-left')) + parseInt(image_main.css('border-left-width'));
						var left_main = 0;
					} else {
						var margin_left_main = -(image_width / 2);
						var left_main = '50%';
					}
				
					if (data && image_width > '<?php echo $settings["min_width"]; ?>' && image_height > '<?php echo $settings["min_height"]; ?>') {
						image_main.before(data);
						
						var pro_stickermain = $('<?php echo $settings["class_main_image"]; ?> div.pro_sticker' + numb + ' div.pro_sticker');
						var pro_stickermain_label = $('<?php echo $settings["class_main_image"]; ?> div.pro_sticker' + numb + ' div.box-sticker');
						pro_stickermain.css({'width':width, 'height':height, 'margin-top':margin_top, 'margin-left':margin_left_main, 'left':left_main});
						pro_stickermain_label.css({'display':'block'})
						pro_stickermain_label.fadeIn(500);						
						pro_stickermain.fadeIn(500);						
						<?php if($settings['hide_hover'] ==1){?>
						$('<?php echo $settings["class_main_image"]; ?> div.pro_sticker' + numb).hover(
							function() {
								pro_stickermain.hide();
								pro_stickermain_label.hide();
							},
							function() {
								pro_stickermain.show();
								pro_stickermain_label.show();
							}
						);
						<?php } ?>
					} else {
						image_main.unwrap();
					}
				
				}
			});
			
			
		}
	});
};

$(document).ready(function(e) {
	if (typeof doFilter != 'function') {
		setTimeout ('ProStickerLoad()', 1000);
	}
});
$(window).on('resize', function(){
	if (typeof doFilter != 'function') {
		setTimeout ('ProStickerLoad()', 1500);
	}
});
$(document).on('click', '[data-toggle="tab"],.box-showmore, #showmore', function () {
	setTimeout ('ProStickerLoad()', 1500);
});
$(document).on('click', '#list-view,#grid-view,#grid-view4,#price-view', function () {
	setTimeout ('ProStickerLoad()', 1500);
});
//--></script>