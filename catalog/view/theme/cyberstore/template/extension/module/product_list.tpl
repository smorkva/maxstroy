<div class="container-module">
<div class="product-slider">
<div class="container-modules pct_gv pct_grid<?php echo $module;?>_<?php echo $idCategory;?>">
  <?php foreach ($products as $product) { ?>
   <div class="no-slider <?php echo $class_mob_row;?> col-sm-6 col-md-4 col-lg-1-5">
    <div class="product-thumb transition">
      <div class="image" style="height:127px !important">
		<?php if($config_on_off_latest_quickview =='1'){?>
			<div class="quickview"><button class="btn btn-quickview" data-toggle="tooltip" title="<?php echo $config_quickview_btn_name[$lang_id]['config_quickview_btn_name']; ?>" onclick="quickview_open(<?php echo $product['product_id']?>,'<?php echo isset($all_prod) ? $all_prod : 0;?>');"><i class="fa fa-eye" aria-hidden="true"></i></button></div>
		<?php } ?>	
		<div class="stickers-ns">
			<?php if (($on_off_percent_discount == '1') && $product['special']) { ?>
				<div class="sticker-ns procent-skidka"><?php echo round ($product['skidka']);?> %</div>
			<?php } ?>
			<?php if (($on_off_sticker_special == '1') && $product['special']) { ?>
				<div class="sticker-ns special">
					<?php if(!empty($config_change_icon_sticker_special)){?><i class="fa <?php echo $config_change_icon_sticker_special;?> "></i><?php } ?>
					<span><?php echo $text_sticker_special[$lang_id]['config_change_text_sticker_special']; ?></span>	
				</div>
			<?php } ?>
			<?php if(($on_off_sticker_topbestseller == '1') && ($product['top_bestsellers'] >= $config_limit_order_product_topbestseller)) { ?>
				<div class="sticker-ns bestseller">
					<?php if(!empty($config_change_icon_sticker_topbestseller)){?><i class="fa <?php echo $config_change_icon_sticker_topbestseller;?> "></i><?php } ?>
					<span><?php echo $text_sticker_topbestseller[$lang_id]['config_change_text_sticker_topbestseller'] ?></span>	
				</div>
			<?php } ?>
			<?php if(($on_off_sticker_popular == '1') && ($product['viewed']>=$config_min_quantity_popular)) { ?>
				<div class="sticker-ns popular">
					<?php if(!empty($config_change_icon_sticker_popular)){?><i class="fa <?php echo $config_change_icon_sticker_popular;?> "></i><?php } ?>
					<span><?php echo $text_sticker_popular[$lang_id]['config_change_text_sticker_popular']; ?></span>								
				</div>
			<?php } ?>
			<?php if(($on_off_sticker_newproduct == '1') && (isset($product['date_available'])&&(round((strtotime(date("Y-m-d"))-strtotime($product['date_available']))/86400))<=$config_limit_day_newproduct)) { ?>
				<div class="sticker-ns newproduct">
					<?php if(!empty($config_change_icon_sticker_newproduct)){?><i class="fa <?php echo $config_change_icon_sticker_newproduct;?>"></i><?php } ?>
					<?php echo $text_sticker_newproduct[$lang_id]['config_change_text_sticker_newproduct']; ?>	
				</div>
			<?php } ?>
		</div>	
		<?php if(isset($setting_module['status_additional_image_hover']) && ($setting_module['status_additional_image_hover'] =='1')) { ?>
			<a href="<?php echo $product['href']; ?>"><img <?php if ($product['product_quantity'] <= 0 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>"<?php } ?> <?php if($product['additional_image_hover']) { ?>data-additional-hover="<?php echo $product['additional_image_hover'];?>"<?php } ?> <?php if($lazyload_module){?>data-src="<?php echo $product['thumb']; ?>" src="<?php echo $lazy_image;?>" <?php } else { ?>src="<?php if($product['thumb']){echo $product['thumb'];}else{echo '/image/catalog/Стикера/20200309_152659.png';}?>"<?php } ?> alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive <?php if($lazyload_module){?>lazyload<?php } ?>" /></a>	
		<?php } else { ?>
			<a href="<?php echo $product['href']; ?>"><img <?php if ($product['product_quantity'] <= 0 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>"<?php } ?> <?php if($lazyload_module){?>data-src="<?php echo $product['thumb']; ?>" src="<?php echo $lazy_image;?>" <?php } else { ?>src="<?php echo $product['thumb'];?>"<?php } ?> alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive <?php if($lazyload_module){?>lazyload<?php } ?>" /></a>	
		<?php } ?>
		<?php if($show_special_timer_module =='1' && $product['special']){ ?>
			<div class="action-timer">
				<div id="countdown-latest-<?php echo $module;?>-<?php echo $product['product_id'];?>"></div>		
			</div>
<script>
$(function(){
	var note = $('#note');
	var parts_date ='<?php echo $product['date_end'];?>'.split('-');
	var ts = new Date(parts_date[0], parts_date[1] - 1, parts_date[2]); 
	if((new Date()) > ts){
		ts = (new Date()).getTime() + 10*24*60*60*1000;
	}
	$('#countdown-latest-<?php echo $module;?>-<?php echo $product['product_id'];?>').countdown({
		timestamp	: ts,
		callback	: function(days, hours, minutes, seconds){
		var message = "";
		message += days;
		message += hours;
		message += minutes;
		message += seconds;
		note.html(message);
		}
	});
});

</script>
		<?php } ?>
	  </div>
     
	  <div class="caption">
        <div class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <div style="text-align: center;">Модель: <?php echo $product['product_id']?></div>
		<?php if(isset($setting_module['status_model']) && ($setting_module['status_model'] =='1')) { ?>
			<div class="product-model"><?php echo $product['model']?></div>
		<?php } ?>
		<?php if(isset($setting_module['status_description']) && ($setting_module['status_description'] =='1')) { ?>
        <!--div class="product-description"><?php echo $product['description']; ?></div-->
		<?php } ?>
		<?php if ($show_options) { ?>
				<div id="option_pct_gv_<?php echo $product['product_id']; ?>" class="option latest-gv-opt">
				<?php foreach ($product['options'] as $key => $option) { ?>
					<?php if ($option['type'] == 'select'){ ?>
						<div class="form-group">
							<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
								<?php if ($option['required']) { ?><i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i><?php } ?>
								<?php echo $option['name']; ?>
							</label>
							<div id="input-option-latest<?php echo $option['product_option_id']; ?>">
								<select onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.pct_grid<?php echo $module;?>_<?php echo $idCategory;?>','pct_gv');" name="option[<?php echo $option['product_option_id']; ?>]" id="input-value-<?php echo $option['product_option_id']; ?>_pct_gv" class="form-control">
									<option value=""><?php echo $text_select; ?></option>
									<?php foreach ($option['product_option_value'] as $option_value) { ?>
									<option data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
									<?php if ($option_value['price']) { ?>
									(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
									<?php } ?>
									</option>
									<?php } ?>
								</select>
						  </div>
						</div>
					<?php } ?>
				<?php if ($option['type'] == 'radio') { ?>
				<div class="form-group">
					<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
						<?php if ($option['required']) { ?><i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i><?php } ?>
						<?php echo $option['name']; ?>
					</label>
				  <div id="input-option-latest<?php echo $option['product_option_id']; ?>">
					<?php foreach ($option['product_option_value'] as $option_value) { ?>
						<?php if ($option_value['image'] || $option_value['color']) { ?>
							<?php if ($option['status_color_type'] =='1') { ?>
								<div class="image-radio">
								  <label>
									<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.pct_grid<?php echo $module;?>_<?php echo $idCategory;?>','pct_gv');" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_pct_gv" />
										<span for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_pct_gv" class="color-option" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" style="background-color:<?php echo $option_value['color']?>"></span>					
								  </label>
								</div>
							<?php } else { ?>
								<div class="image-radio">
								  <label>
									<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.pct_grid<?php echo $module;?>_<?php echo $idCategory;?>','pct_gv');" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_pct_gv" />						
									<img for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_pct_gv" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /> 
								  </label>
								</div>
							<?php } ?>
						<?php } else { ?>
							<div class="radio-checbox-options">
								<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.pct_grid<?php echo $module;?>_<?php echo $idCategory;?>','pct_gv');" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_pct_gv" />
								<label for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_pct_gv">
									<span class="option-name"><?php echo $option_value['name']; ?></span>
									<?php if ($option_value['price']) { ?>
									<span class="option-price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
									<?php } ?>
								</label>
							</div>
						<?php } ?>
					
					<?php } ?>
				  </div>
				</div>
				<?php } ?>
				
				<?php if ($option['type'] == 'checkbox') { ?>
				<div class="form-group">
				  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
						<?php if ($option['required']) { ?><i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i><?php } ?>
						<?php echo $option['name']; ?>
					</label>
				  <div id="input-option-latest<?php echo $option['product_option_id']; ?>">
					<?php foreach ($option['product_option_value'] as $option_value) { ?>
						<?php if ($option_value['image'] || $option_value['color']) { ?>
							<?php if ($option['status_color_type'] =='1') { ?>
								<div class="image-radio">
								  <label>
									<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.pct_grid<?php echo $module;?>_<?php echo $idCategory;?>','pct_gv');" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_pct_gv" />
										<span for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_pct_gv" class="color-option" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" style="background-color:<?php echo $option_value['color']?>"></span>					
								  </label>
								</div>
							<?php } else { ?>
								<div class="image-radio">
								  <label>
									<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.pct_grid<?php echo $module;?>_<?php echo $idCategory;?>','pct_gv');" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_pct_gv" />						
									<img for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_pct_gv" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /> 
								  </label>
								</div>
							<?php } ?>
						<?php } else { ?>
							<div class="radio-checbox-options">
							  <input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.pct_grid<?php echo $module;?>_<?php echo $idCategory;?>','pct_gv');" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_pct_gv" />
								<label for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_pct_gv">
								<span class="option-name"><?php echo $option_value['name']; ?></span>
									<?php if ($option_value['price']) { ?>
									<span class="option-price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
									<?php } ?>
							  </label>
							</div>
						<?php } ?>
					<?php } ?>
				  </div>
				</div>
				<?php } ?>
			<?php } ?>
			</div>
			<?php } ?>
		<?php if(isset($setting_module['status_rating']) && ($setting_module['status_rating'] =='1')) { ?>
		<div class="rating">
			<span class="rating-box">
				<?php for ($i = 1; $i <= 5; $i++) { ?>
					<?php if ($product['rating'] < $i) { ?>
					<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
					<?php } else { ?>
					<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
					<?php } ?>
				<?php } ?>
			
			<?php if(isset($setting_module['status_quantity_reviews']) && ($setting_module['status_quantity_reviews'] =='1')) { ?>
			  <span class="quantity-reviews"><a data-placement="right"  data-toggle="tooltip" title="<?php echo $text_reviews_title;?>" href="<?php echo $product['href']; ?>/#tab-review"><?php echo $product['reviews']; ?></a></span>
			<?php } ?>
			</span>
		</div>
		<?php } ?>
		<div class="pq-box">
        <?php if ($product['price']) { ?>
			<div class="price">
				<?php if (!$product['special']) { ?>
				  <span class="price_no_format_<?php echo $product['product_id'];?>"><?php echo str_ireplace('грн.', ' ₴/'.$product['dimm'], $product['price']); ?></span>
				  <?php } else { ?>
				  <span class="price-old"><span class="price_no_format_<?php echo $product['product_id'];?>"><?php echo $product['price']; ?></span></span> <span class="price-new"><span class="special_no_format_<?php echo $product['product_id'];?>"><?php echo $product['special']; ?></span></span>
				<?php } ?>
			  <?php if ($product['tax']) { ?>
			  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
			  <?php } ?>
			</div>
			<?php if(!isset($setting_module['status_actions'])) { ?>
		<?php if(isset($config_additional_settings_newstore['quantity_btn_module']) && ($config_additional_settings_newstore['quantity_btn_module'] =='1')){?>
			<div class="quantity_plus_minus">
				<input type="text" class="quantity-num form-control input-number-quantity<?php echo $product['product_id'];?>" name="quantity" <?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1') && $product['minimum'] > 1){?>disabled<?php } ?> id="input_quantity_mod_pct_grid<?php echo $module;?>_<?php echo $idCategory;?><?php echo $product['product_id'];?>" onkeyup="validate_quantity(this,'<?php echo $product['minimum']; ?>')" oninput="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>, <?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.pct_grid<?php echo $module;?>_<?php echo $idCategory;?>','pct_gv');" value="<?php echo $product['minimum']; ?>">
				<span class="quantity-btn">
					<span class="add-up add-action fa fa-angle-up" onclick="btnplus_cat_price_pct_gv<?php echo $module;?>_<?php echo $idCategory;?><?php echo $product['product_id'];?>('<?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1')){?><?php echo $product['minimum']; ?><?php } else { ?>1<?php } ?>');"></span>
					<span class="add-down add-action fa fa-angle-down" onclick="btnminus_cat_price_pct_gv<?php echo $module;?>_<?php echo $idCategory;?><?php echo $product['product_id'];?>('<?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1')){?><?php echo $product['minimum']; ?><?php } else { ?>1<?php } ?>');"></span>
				</span>
			</div>
			<script>
			<?php if(isset($config_additional_settings_newstore['price_recalc']) && ($config_additional_settings_newstore['price_recalc'] == '1') && $product['minimum'] > 1){?>
				$(window).load(function() {
					recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.pct_grid<?php echo $module;?>_<?php echo $idCategory;?>','pct_gv');					
				});
			<?php } ?>
				function btnminus_cat_price_pct_gv<?php echo $module;?>_<?php echo $idCategory;?><?php echo $product['product_id'];?>(minimum){
					var $input = $('#input_quantity_mod_pct_grid<?php echo $module;?>_<?php echo $idCategory;?><?php echo $product['product_id'];?>');
					var count = parseInt($input.val()) - parseInt(minimum);
					count = count < parseInt(<?php echo $product['minimum']; ?>) ? parseInt(<?php echo $product['minimum']; ?>) : count;
					$input.val(count);
					$input.change();										
					recalc_quantity(<?php echo $product['product_id'];?>,count,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.pct_grid<?php echo $module;?>_<?php echo $idCategory;?>','pct_gv');						
				}
				function btnplus_cat_price_pct_gv<?php echo $module;?>_<?php echo $idCategory;?><?php echo $product['product_id'];?>(minimum){
					var $input = $('#input_quantity_mod_pct_grid<?php echo $module;?>_<?php echo $idCategory;?><?php echo $product['product_id'];?>');
					var count = parseInt($input.val()) + parseInt(minimum);
					$input.val(count);
					$input.change();
					recalc_quantity(<?php echo $product['product_id'];?>,count,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.pct_grid<?php echo $module;?>_<?php echo $idCategory;?>','pct_gv');					
				};																				
			</script>
			<?php } ?>
			<?php } ?>
			<?php } ?>
			</div>
			<?php if(!isset($setting_module['status_actions'])) { ?>
		<div class="actions">
			<?php if (($product['product_quantity'] <= 0) and $disable_cart_button){ ?>
				<div class="cart"><button class="btn btn-general" type="button" disabled><?php if($change_text_cart_button_out_of_stock ==1) { ?><i class="fa fa-lock" aria-hidden="true"></i> <span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button></div>
			<?php } else { ?>
				<div class="cart"><button class="btn btn-general" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>','pct_gv', get_cart_quantity('<?php echo $product['product_id']; ?>','.pct_grid<?php echo $module;?>_<?php echo $idCategory;?>'));"><?php if($change_text_cart_button_out_of_stock ==1 && $product['product_quantity'] <= 0) { ?><i class="fa fa-lock" aria-hidden="true"></i> <span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button></div>
			<?php } ?>
			<div class="addit-action">
			<?php if(isset($setting_module['status_fastorder']) && ($setting_module['status_fastorder'] =='1')) { ?>
				<div class="quick-order">
					<button class="btn btn-fastorder <?php if (($product['product_quantity'] <= 0) and $disable_fastorder_button){ ?>hidden-quick-order<?php } ?>" type="button" data-toggle="tooltip" onclick="fastorder_open(<?php echo $product['product_id']?>);" title="<?php echo $config_text_open_form_send_order[$lang_id]['config_text_open_form_send_order']; ?>" <?php if (($product['product_quantity'] <= 0) and $disable_fastorder_button){ ?>disabled<?php } ?>>
						<?php if($icon_open_form_send_order !=''){ ?>
							<i class="<?php echo $icon_open_form_send_order;?> fa-fw"></i>
						<?php } else { ?>
							<i class="fa fa-paper-plane-o fa-fw" aria-hidden="true"></i>
						<?php } ?>
					</button>			
				</div>
			<?php } ?>
			<?php if(isset($setting_module['status_wishlist']) && ($setting_module['status_wishlist'] =='1')) { ?>
				<div class="wishlist"><button class="btn btn-wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button></div>
			<?php } ?>
			<?php if(isset($setting_module['status_compare']) && ($setting_module['status_compare'] =='1')) { ?>
				<div class="compare"><button class="btn btn-compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-retweet" aria-hidden="true"></i></button></div>
			<?php } ?>
			</div>
		</div>
		<?php } ?>
      </div>    
    </div>
  </div>
  <?php } ?>
  </div>
  <?php if(isset($status_showmore) && $status_showmore !=0){?>
	<?php if($nextPage){?>
		<div class="showmore-pct<?php echo $module;?>-<?php echo $idCategory;?> box-showmore"><span class="box-ajax-load"><span data-nextpage="<?php echo $nextPage;?>" class="pct-ajax-load<?php echo $module;?>-<?php echo $idCategory;?>"><i class="fa fa-repeat" aria-hidden="true"></i> <?php echo $text_showmore;?></span></span></div>
	<?php } ?>
	<?php } ?>
  </div>
<?php if(isset($status_showmore) && $status_showmore !=0){?>
<script>
$(document).on('click', '.pct-ajax-load<?php echo $module;?>-<?php echo $idCategory;?>', function () {
	$.ajax({
		url: 'index.php?route=extension/module/cyber_product_categorytabs/ajaxLoadProduct',
		type: 'post',
		data: 'page=' + $(this).attr('data-nextpage') + '&module=<?php echo $module;?>&setting=<?php echo $setting;?>&category_id=<?php echo $idCategory;?>',
		dataType: 'html',
		beforeSend: function() {
			$('.showmore-pct<?php echo $module;?>-<?php echo $idCategory;?> i.fa-repeat').addClass('fa-spin');
		},
		complete: function() {
			$('.showmore-pct<?php echo $module;?>-<?php echo $idCategory;?> i.fa-repeat').removeClass('fa-spin');
			
		},
		success:function(data){
			$data = $(data);
			var $products = $data.find('.pct_grid<?php echo $module;?>_<?php echo $idCategory;?> > div.no-slider');
			console.log($products);
			var $product_img = $products.find('a > img');
				
			$product_img.each(function () {
				if ($(this).attr('data-additional-hover')) {
					var img_src = $(this).attr('data-additional-hover');
					$(this).addClass('main-img');
					$(this).after('<img src="'+img_src+'" class="additional-img-hover img-responsive" title="'+$(this).attr('alt')+'" />');
				}		
			});
			$('.pct_grid<?php echo $module;?>_<?php echo $idCategory;?>').append($products);
			$('.showmore-pct<?php echo $module;?>-<?php echo $idCategory;?>').replaceWith($data.find('.showmore-pct<?php echo $module;?>-<?php echo $idCategory;?>'));
			setTimeout(function () {
			$('a > img').each(function () {
				if ($(this).attr('data-status')) {
					var status = $(this).attr('data-status');
					$(this).after('<div class="product_status">'+status+'</div>');
				}
				if ($( document ).width()>767) {
					if ($(this).attr('data-additional-hover')) {
						var img_src = $(this).attr('data-additional-hover');
						$(this).addClass('main-img');
						$(this).after('<img src="'+img_src+'" class="additional-img-hover img-responsive" title="'+$(this).attr('alt')+'" />');
					}		
				}		
			});
			},2000);
		}
	});
})
</script>  
<?php } ?> 
<script>
$('.pct_grid<?php echo $module;?>_<?php echo $idCategory;?>').each(function() {
	if ($(".pct_grid<?php echo $module;?>_<?php echo $idCategory;?>").parents("#column-left, #column-right, .position-no-owl").length) {
		var items = $(this).children('div.no-slider');
		items.removeClass('col-xs-12 col-sm-6 col-md-4 col-lg-3');
		items.addClass('col-xs-12 col-sm-12 col-md-12 col-lg-12');
	}	
});
</script>
</div>