<?php echo $header; ?>
<div itemscope itemtype="http://schema.org/Product" class="container">
<div class="col-sm-12 content-box-cs">
	<ul class="breadcrumb" itemscope itemtype="https://schema.org/BreadcrumbList">
		<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
			<?php if($i+1<count($breadcrumbs)){ ?>
				<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
					<a itemprop="item" href="<?php echo $breadcrumb['href']; ?>">
					  <?php if($i == 0){?>
						  <meta itemprop="name" content="<?php echo $text_home_ns; ?>" />
						  <span><?php echo $breadcrumb['text']; ?></span>
						<?php } else { ?>
						  <span itemprop="name"><?php echo $breadcrumb['text']; ?></span>
						<?php } ?>
					</a>
					<meta itemprop="position" content="<?php echo $i+1; ?>" />
				  </li>
			<?php } else { ?>
				<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
				<link itemprop="item" href="<?php echo $breadcrumb['href']; ?>">
				<?php if($i == 0){?>
				  <meta itemprop="name" content="<?php echo $text_home_ns; ?>" />
				  <span><?php echo $breadcrumb['text']; ?></span>
				<?php } else { ?>
				  <span itemprop="name"><?php echo $breadcrumb['text']; ?></span>
				<?php } ?>
				<meta itemprop="position" content="<?php echo $i+1; ?>" />
				</li>
			<?php } ?>
		<?php } ?>
	</ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-4 col-md-6'; ?>	
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-8 col-md-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
	<h1 class="h1-prod-name" itemprop="name"><?php echo $heading_title; ?></h1>
	<?php echo $content_top; ?>

				<?php echo $editorplus;?>
			
      <div class="row fix">
        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
          <?php if ($thumb || $images) { ?>
				<div id="fix_image">
				<div class="thumbnails">
					<?php if ($thumb) { ?>
						<div class="general-image">
							<div id="image-box">
								<div class="stickers-ns">
									<?php if ($special) { ?>
										<div class="sticker-ns procent-skidka"><i class="fa fa-tag"></i> <?php echo round ($skidka);?> %</div>
									<?php } ?>
									<?php if (($on_off_sticker_special == '1') && $special) { ?>
										<div class="sticker-ns special">
											<i class="fa <?php echo $config_change_icon_sticker_special;?> "></i>					
											<span><?php echo $text_sticker_special[$lang_id]['config_change_text_sticker_special']; ?></span>	
										</div>
									<?php } ?>
									<?php if(($on_off_sticker_topbestseller == '1') && ($top_bestsellers >= $config_limit_order_product_topbestseller)) { ?>
										<div class="sticker-ns bestseller">
											<i class="fa <?php echo $config_change_icon_sticker_topbestseller;?> "></i>
											<span><?php echo $text_sticker_topbestseller[$lang_id]['config_change_text_sticker_topbestseller'] ?></span>	
										</div>
									<?php } ?>
									<?php if(($on_off_sticker_popular == '1') && ($viewed>=$config_min_quantity_popular)) { ?>
										<div class="sticker-ns popular">
											<i class="fa <?php echo $config_change_icon_sticker_popular;?> "></i>
											<span><?php echo $text_sticker_popular[$lang_id]['config_change_text_sticker_popular']; ?></span>								
										</div>
									<?php } ?>
									<?php if(($on_off_sticker_newproduct == '1') && (isset($date_available)&&(round((strtotime(date("Y-m-d"))-strtotime($date_available))/86400))<=$config_limit_day_newproduct)) { ?>
										<div class="sticker-ns newproduct">
											<i class="fa <?php echo $config_change_icon_sticker_newproduct;?>"></i>
											<?php echo $text_sticker_newproduct[$lang_id]['config_change_text_sticker_newproduct']; ?>	
										</div>
									<?php } ?>
								</div>
								<a class="main-image thumbnail" id="zoom1" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>">
									<img itemprop="image" class="img-responsive" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
								</a>
							</div>
						</div>
					<?php } ?>
					<?php if ($images) { ?>
						<div class="image-additional">
							<div class="item">
								<a class="thumbnail" data-magnify-src="<?php echo $popup; ?>" rel="<?php echo $thumb; ?>" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>">
									<img data-num="0" src="<?php echo $thumb_min; ?>"  title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
								</a>
							</div>
							<?php $num_image = 1 ;?>
							<?php foreach ($images as $image) { ?>
							<div class="item">
								<a class="thumbnail" data-magnify-src="<?php echo $image['popup']; ?>" rel="<?php echo $image['thumb_hover'];?>" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>">
								<img data-num="<?php echo $num_image; ?>" src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
							</div>
							<?php $num_image++;?>
							<?php } ?>
						</div>
<script>
$(".thumbnails .image-additional").slick({
	vertical:true,
	adaptiveHeight: true,
	infinite: false,
	slidesToShow: 4,
	prevArrow: '<div class="btn-carousel-thumbnail prev-prod"><i class="fa fa-angle-up arrow"></i></div>',
	nextArrow: '<div class="btn-carousel-thumbnail next-prod"><i class="fa fa-angle-down arrow"></i></div>',
	responsive: [
	{
      breakpoint: 992,
      settings: {
		slidesToShow: 3,
		vertical:false,
		prevArrow: '<div class="btn-carousel-thumbnail-h prev-prod"><i class="fa fa-angle-left arrow"></i></div>',
		nextArrow: '<div class="btn-carousel-thumbnail-h next-prod"><i class="fa fa-angle-right arrow"></i></div>',
		}
    },
    {
      breakpoint: 300,
      settings: {slidesToShow: 3}
    }
	]
});
</script>
					<?php } ?>
				</div>
				</div>
          <?php } ?>
        </div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
		<div id="product">
			<?php if($ns_show_nextprev_prod){?>
			<div id="next-prev-box"><?php echo $nextprevproduct;?></div>
			<?php } ?>
			<div class="top-info-product">
				<div class="info-product"><span class="text-stock"><?php echo $text_stock; ?></span> 
				<?php if($stock_quantity_count > 0) { ?>
					<span class="stock_status_success"><?php echo $stock_status;?></span> 
					<?php if($stock_quantity != 'not_display') { ?><span class="stock-quantity_success"><?php echo $stock_quantity; ?></span><?php } ?>
				<?php } else { ?>
					<span class="qty-not-in-stock"><?php echo $stock_status;?></span> 
					<?php if($stock_quantity != 'not_display') { ?><span class="qty-not-in-stock-count"><?php echo $stock_quantity; ?></span><?php } ?>
				<?php } ?>
			</div>
				<?php if ($review_status) { ?>
				<div class="rating info-product">
					<?php if ($rating) { ?>
						<span itemscope itemprop="aggregateRating" itemtype="http://schema.org/AggregateRating">
							<meta itemprop="reviewCount" content="<?php echo $reviewCount; ?>">
							<meta itemprop="ratingValue" content="<?php echo $ratingValue; ?>">
							<meta itemprop="bestRating" content="5"><meta itemprop="worstRating" content="1">
						</span>
					<?php } ?>
				<?php for ($i = 1; $i <= 5; $i++) { ?>
					<?php if ($rating < $i) { ?>
						<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
					<?php } else { ?>
						<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
					<?php } ?>
				<?php } ?>
					<a href="" onclick="$('a[href=\'#tab-review\']').trigger('click');$('html, body').animate({ scrollTop: $('a[href=\'#tab-review\']').offset().top - 5}, 250); return false;"><?php echo $reviews; ?></a>
				</div>
			<?php } ?>
			</div>
			<div class="info-product"><b><?php echo $text_model; ?></b> <span itemprop="model"><?php echo substr($model, 3); ?></span></div>
			<?php if(!empty($sku)){?>
			<div class="info-product"><b><?php echo $text_sku; ?></b> <span itemprop="sku"><?php echo $sku; ?></span></div>
			<?php } ?>
			<?php if ($manufacturer) { ?>
				<div class="info-product"><b><?php echo $text_manufacturer; ?></b> <a href="<?php echo $manufacturers; ?>"><span itemprop="brand"><?php echo $manufacturer; ?></span></a></div>
				<?php if($brand_image) { ?>
					<div class="brand-img"><a href="<?php echo $manufacturers; ?>"><img src="<?php echo $brand_image; ?>" title="<?php echo $manufacturer ?>"/></a></div>
				<?php } ?>
			<?php } ?>
			<?php if (isset($fcpdata['status']) && $fcpdata['status']) { ?>
				<a class="btn-cheaper" href="javascript: void(0);" onclick="open_popup_fcp(<?php echo $product_id; ?>); return false"><i class="<?php echo $fcpdata['found_cheaper_botton_icon'];?>"></i> <?php echo isset($fcpdata['found_cheaper_botton_text'][$lang_id]) ? $fcpdata['found_cheaper_botton_text'][$lang_id]['text'] : ''; ?>   </a>
			<?php } ?>
				<?php if ($options) { ?>
				<hr>
				<p><strong><?php echo $text_option; ?></strong></p>
				<div class="options">
				<?php foreach ($options as $option) { ?>
				<?php if ($option['type'] == 'select') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
				  <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
					<option value=""><?php echo $text_select; ?></option>
					<?php foreach ($option['product_option_value'] as $option_value) { ?>
					<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
					<?php if ($option_value['price']) { ?>
					(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
					<?php } ?>
					</option>
					<?php } ?>
				  </select>
				</div>
				<?php } ?>
			   <?php if ($option['type'] == 'radio') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
								<div id="input-option<?php echo $option['product_option_id']; ?>">
									<?php foreach ($option['product_option_value'] as $option_value) { ?>
										<?php if ($option_value['image'] || $option_value['color']) { ?>
											<?php if ($option['status_color_type'] =='1') { ?>
												<div class="image-radio">
												  <label>
													<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
													<span class="color-option" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" style="background-color:<?php echo $option_value['color']?>"></span> 
												  </label>
												</div> 
											<?php } else { ?> 
												<div class="image-radio">
												  <label>
													<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
													<img onclick="optionimage('<?php echo $option_value['image_click']; ?>','<?php echo $option_value['image_zoom']; ?>','<?php echo $option_value['image_thumb']; ?>')" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /> 
												  </label>
												</div>
											<?php } ?>
										<?php } else { ?> 
											<div class="radio-checbox-options">
											  <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
												<label for="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
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
						<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
							<div id="input-option<?php echo $option['product_option_id']; ?>">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
									<?php if ($option_value['image'] || $option_value['color']) { ?>
											<?php if ($option['status_color_type'] =='1') { ?>
												<div class="image-radio">
												  <label>
													<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
													<span class="color-option" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" style="background-color:<?php echo $option_value['color']?>"></span> 
												  </label>
												</div> 
											<?php } else { ?> 
												<div class="image-radio">
												  <label>
													<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
													<img onclick="optionimage('<?php echo $option_value['image_click']; ?>','<?php echo $option_value['image_zoom']; ?>','<?php echo $option_value['image_thumb']; ?>')" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /> 
												  </label>
												</div>
											<?php } ?>
										<?php } else { ?> 
											<div class="radio-checbox-options">
											  <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
												<label for="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
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
				
				<?php if ($option['type'] == 'text') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
				  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
				</div>
				<?php } ?>
				<?php if ($option['type'] == 'textarea') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
				  <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
				</div>
				<?php } ?>
				<?php if ($option['type'] == 'file') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
					<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
				  <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
				  <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
				</div>
				<?php } ?>
				<?php if ($option['type'] == 'date') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
				  <div class="input-group date">
					<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
					<span class="input-group-btn">
					<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
					</span></div>
				</div>
				<?php } ?>
				<?php if ($option['type'] == 'datetime') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
					<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
				  <div class="input-group datetime">
					<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
					<span class="input-group-btn">
					<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
					</span></div>
				</div>
				<?php } ?>
				<?php if ($option['type'] == 'time') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
				  <div class="input-group time">
					<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
					<span class="input-group-btn">
					<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
					</span></div>
				</div>
				<?php } ?>
				<?php } ?>
				</div>
				<?php } ?>
				
				<hr>
				<?php if ($price) { ?>
					<span itemscope itemprop="offers" itemtype="http://schema.org/Offer">
						<meta itemprop="price" content="<?php echo rtrim(preg_replace("/[^0-9\.]/", "", ($special ? $special : $price)), '.'); ?>">
						<meta itemprop="priceCurrency" content="<?php echo $currency_microdata; ?>">
						<link itemprop="availability" href="http://schema.org/<?php echo (($availability) ? 'InStock' : 'OutOfStock') ?>" />
					</span>
					
					<div class="price">
						<!-- here price <?php print_r($dimm)?> -->
						<?php if (!$special) { ?>
							<?php echo $price; ?>
							<?php if($dimm ?? ''): ?>
							₴/<?php echo $dimm ?>
							<?php endif ?>
						<?php } else { ?>
							<span class="price-old"><?php echo $price; ?></span>
							<span class="price-new"><?php echo $special; ?><?php if($dimm ?? ''): ?>
							₴/<?php echo $dimm ?>
							<?php endif ?></span> 
						<?php } ?>
						<?php if ($tax) { ?>
							<span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
						<?php } ?>
					</div>	
				<?php } ?>
				<?php if ($points) { ?>
					<div class="points"><?php echo $text_points; ?> <?php echo $points; ?></div>
				<?php } ?>
				
				<ul class="list-unstyled availability">                      
					<?php if ($reward) { ?>
					<li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
					<?php } ?>  
					<?php if ($discounts) { ?>
					<?php foreach ($discounts as $discount) { ?>
						<li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
					<?php } ?>
					<?php } ?>
				</ul>
				<?php if ($recurrings) { ?>
				<h3><?php echo $text_payment_recurring ?></h3>
				<div class="form-group required">
				  <select name="recurring_id" class="form-control">
					<option value=""><?php echo $text_select; ?></option>
					<?php foreach ($recurrings as $recurring) { ?>
					<option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
					<?php } ?>
				  </select>
				  <div class="help-block" id="recurring-description"></div>
				</div>
				<?php } ?>
				<?php if ($minimum > 1) { ?>
					<div class="info-minimum"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
				<?php } ?>
				<hr>
				
				
				<div class="actions">
					<div class="quantity-adder pull-left clearfix">
						<div class="quantity-number pull-left">
							<input <?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1') && $minimum > 1){?>disabled<?php } ?> class="quantity-product" type="text" name="quantity" size="5" value="<?php echo $minimum; ?>" id="input-quantity" />
						</div>
						<div class="quantity-wrapper pull-left">
							<span onclick="btnplus_card_prod('<?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1')){?><?php echo $minimum; ?><?php } else { ?>1<?php } ?>');" class="add-up add-action fa fa-angle-up"></span>
							<span onclick="btnminus_card_prod('<?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1')){?><?php echo $minimum; ?><?php } else { ?>1<?php } ?>');" class="add-down add-action fa fa-angle-down"></span>
						</div>
						<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
					</div>
					<script>
						function btnminus_card_prod(minimum){
							var $input = $('#input-quantity');
							var count = parseInt($input.val()) - parseInt(minimum);
							count = count < parseInt(<?php echo $minimum; ?>) ? parseInt(<?php echo $minimum; ?>) : count;
							$input.val(count);
							$input.change();										
						}
						function btnplus_card_prod(minimum){
							var $input = $('#input-quantity');
							var count = parseInt($input.val()) + parseInt(minimum);
							$input.val(count);
							$input.change();
						};																				
					</script>	
					<div class="cart pull-left">
						<?php if (($product_quantity <= 0) and $disable_cart_button){ ?>
							<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-general" disabled><?php if($change_text_cart_button_out_of_stock ==1 && $product_quantity <= 0) { ?><span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button>					
						<?php } else { ?>
							<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-general"><?php if($change_text_cart_button_out_of_stock ==1 && $product_quantity <= 0) { ?><span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button>					
						<?php } ?>	
					</div>
					<?php if($show_nsproduct_btn_fastorder =='1') { ?>
						<button class="btn btn-fastorder <?php if (($product_quantity <= 0) and $disable_fastorder_button){ ?>hidden-quick-order<?php } ?>" type="button" onclick="fastorder_open(<?php echo $product_id?>);" data-toggle="tooltip" title="<?php echo $config_text_open_form_send_order[$lang_id]['config_text_open_form_send_order']; ?>" <?php if (($product_quantity <= 0) and $disable_fastorder_button){ ?>disabled<?php } ?>><?php if($icon_open_form_send_order !=''){ ?><i class="<?php echo $icon_open_form_send_order;?> fa-fw"></i><?php } else { ?><i class="fa fa-paper-plane-o fa-fw" aria-hidden="true"></i><?php } ?><span><?php echo $config_text_open_form_send_order[$lang_id]['config_text_open_form_send_order']; ?></span></button>
					<?php } ?>
					<?php if($show_nsproduct_btn_wishlist =='1') { ?>
						<button type="button" data-toggle="tooltip" class="btn btn-wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart fa-fw"></i></button>
					<?php } ?>
					<?php if($show_nsproduct_btn_compare =='1') { ?>
						<button type="button" data-toggle="tooltip" class="btn btn-compare" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange fa-fw"></i></button>				
					<?php } ?>
				</div>
				
				<?php if(isset($short_description_status) && ($short_description_status =='1') && (!empty($short_description))) { ?>
				<hr>
				<p><strong><?php echo $text_short_description;?></strong></p>	
				<p><?php echo utf8_substr(strip_tags(html_entity_decode($description, ENT_QUOTES, 'UTF-8')), 0, 220) . '... ' ?>
				<a href="javascript:void(0);" class="red-link" onclick="$('a[href=\'#tab-description\']').trigger('click'); $('html, body').animate({ scrollTop: $('a[href=\'#tab-description\']').offset().top - 6}, 250); return false;"><?php echo $text_readmore_desc; ?></a></p>
				<?php } ?>
				<?php if (isset($short_attribut_status) && ($short_attribut_status == '1')) { ?>
				<hr>		
				<?php if ($attribute_groups) { ?>				
				<p><strong><?php echo $text_short_attribute;?></strong></p>	
				<div class="short-attributes-groups">
					<?php foreach ($attribute_groups as $key => $attribute_group) { ?>
						<?php if ($key < $short_attribute_group_product) { ?>
							<?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
								<?php if ($key < $short_attribute_group_product_item) { ?>
									<div class="short-attribute">
										<?php if(isset($short_attribute_show_name) && ($short_attribute_show_name == '1')) { ?>
										<span class="attr-name"><span><?php echo $attribute['name']; ?> - </span></span>
										<?php } ?>
										<span class="attr-text"><span><?php echo strip_tags($attribute['text']); ?></span></span>
									</div>
								<?php } ?>
							<?php } ?>	
						<?php } ?>
					<?php } ?>
				</div>
				<a href="javascript:void(0);" class="red-link" onclick="$('a[href=\'#tab-specification\']').trigger('click'); $('html, body').animate({ scrollTop: $('a[href=\'#tab-specification\']').offset().top - 6}, 250); return false;"><?php echo $text_see_all_attribute; ?></a></p>
				<?php } ?>
				<?php } ?>
				<?php if(($ns_on_off_product_sharing_facebock == '1') || ($ns_on_off_product_sharing_twitter =='1') || ($ns_on_off_product_sharing_mailru =='1') || ($ns_on_off_product_sharing_vk =='1') || ($ns_on_off_product_sharing_ok =='1') ) { ?>
					<hr>
					<div class="social-likes">
						<?php if($ns_on_off_product_sharing_facebock !='0'){?><div class="facebook" title="Share link on Facebook"><?php echo $text_facebook;?></div><?php } ?>
						<?php if($ns_on_off_product_sharing_twitter !='0'){?><div class="twitter" title="Share link on Twitter"><?php echo $text_twitter;?></div><?php } ?>
						<?php if($ns_on_off_product_sharing_mailru !='0'){?><div class="mailru" title="Поделиться ссылкой в Моём мире"><?php echo $text_mailru;?></div><?php } ?>
						<?php if($ns_on_off_product_sharing_vk !='0'){?><div class="vkontakte" title="Поделиться ссылкой во Вконтакте"><?php echo $text_vk;?></div><?php } ?>
						<?php if($ns_on_off_product_sharing_ok !='0'){?><div class="odnoklassniki" title="Поделиться ссылкой в Одноклассниках"><?php echo $text_ok;?></div><?php } ?>
					</div>
				<?php } ?>
		</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<div class="row cbp">
		<?php if($config_status_delivery_options !='0') { ?>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="custom-block-products container-module">
					<?php if(isset($config_delivery_options_title[$lang_id]['config_delivery_options_title'])){?>
					<div class="title-module"><span><?php echo $config_delivery_options_title[$lang_id]['config_delivery_options_title'];?></span></div>
					<?php } ?>
					<div class="row">
						<?php foreach ($banner_delivery_block as $delivery_block) { ?>
							<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
							<div class="custom-block-product" <?php if(($delivery_block['popup']=='1') && ($delivery_block['link'][$lang_id] !='')){ ?> onclick="banner_link_open('<?php echo $delivery_block['link'][$lang_id]; ?>')" <?php } elseif(($delivery_block['popup']=='0') && ($delivery_block['link'][$lang_id] !='')) { ?>onclick="location='<?php echo $delivery_block['link'][$lang_id]; ?>'" <?php } ?>>
								<div class="image">
									<img src="<?php echo $delivery_block['image']; ?>" alt="<?php echo $delivery_block['title'][$lang_id]; ?>"/>
								</div>
								<div class="text">
									<h4><?php echo $delivery_block['title'][$lang_id]; ?></h4>
									<p><?php echo $delivery_block['description'][$lang_id]; ?></p>
								</div>
							</div>	
							</div>	
						<?php } ?>
					</div>
				</div>
			</div>
		<?php } ?>
	<div class="tabs-product col-sm-12">
		<ul class="nav nav-tabs my-tabs">
            <li class="active"><a href="#tab-description" data-toggle="tab"><i class="fa fa-file-text-o fa-fw"></i><?php echo $tab_description; ?></a></li>
            <?php if ($attribute_groups) { ?>
            <li><a href="#tab-specification" data-toggle="tab"><i class="fa fa-list-alt fa-fw"></i><?php echo $tab_attribute; ?></a></li>
            <?php } ?>
            <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab"><i class="fa fa-comments-o fa-fw"></i><?php echo $tab_review; ?></a></li>
            <?php } ?>
			<?php if(isset($qadata['status'])){?>
				<li><a href="#tab-question-answer" data-toggle="tab"><?php echo $tab_question_answer; ?></a></li>
			<?php } ?>
			<?php if (isset($product_additional_tabs)) { ?>
              <?php $additional_tab_i=0; foreach ($product_additional_tabs as $product_additional_tab) { ?>
                <li><a href="#product_additional_tabs<?php echo $additional_tab_i; ?>" data-toggle="tab"><i class="<?php echo $product_additional_tab['icon_tabs'];?>"></i> <?php echo $product_additional_tab['title']; ?></a></li>
              <?php $additional_tab_i++; } ?>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-description" itemprop="description"><?php echo $description; ?></div>
            <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
              <table class="table table-bordered">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                  <tr>
                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <tr itemprop="additionalProperty" itemscope itemtype="http://schema.org/PropertyValue">
                    <td itemprop="name"><?php echo $attribute['name']; ?></td>
                    <td itemprop="value"><?php echo strip_tags($attribute['text']); ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
			<?php if(isset($qadata['status'])){?>
			<div class="tab-pane" id="tab-question-answer">
				<div id="question-answer"></div>
				<script><!--
				$('#question-answer').load('index.php?route=extension/module/cyber_question_answer/getList&product_id=<?php echo $product_id; ?>');
				$('#question-answer').delegate('.pagination a', 'click', function(e) {
					e.preventDefault();

					$('#question-answer').fadeOut('slow');

					$('#question-answer').load(this.href);

					$('#question-answer').fadeIn('slow');
				});
				//--></script>
			</div>
			<?php } ?>
			<?php if (isset($product_additional_tabs)) { ?>
				<?php $additional_tab_i=0; foreach ($product_additional_tabs as $product_additional_tab) { ?>
				  <div class="tab-pane" id="product_additional_tabs<?php echo $additional_tab_i; ?>"><?php echo $product_additional_tab['text']; ?></div>
				<?php $additional_tab_i++; } ?>
			  <?php } ?>
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
				<div <?php if($show_review_plus =='0') { ?>style="display:none;"<?php } ?> class="form-group <?php if($show_review_plus_requared) { ?>required<?php } ?>">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review-plus"><?php echo $entry_plus; ?></label>
                    <textarea name="plus" rows="5" id="input-review-plus" class="form-control"></textarea>
                  </div>
                </div>				
				<div <?php if($show_review_minus =='0') { ?>style="display:none;"<?php } ?> class="form-group <?php if($show_review_minus_requared) { ?>required<?php } ?>">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review-minus"><?php echo $entry_minus; ?></label>
                    <textarea name="minus" rows="5" id="input-review-minus" class="form-control"></textarea>
                  </div>
                </div>
				
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                 <?php echo $captcha; ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $btn_add_new_review; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </div>
		</div>	
 </div>
<?php $gen_carousel_featured = rand(10000, 50000);?> 
	<?php if ($products) { ?> 
		<div class="row">
		<div class="col-sm-12">
		<div class="container-module">
			<div class="title-module"><span><?php echo $text_related; ?></span></div>
			<div class="product-slider">
			<div style="display: block; opacity: 1;" class="container-modules featured carousel_numb_featured<?php echo $gen_carousel_featured;?> owl-carousel">
			<?php foreach ($products as $product) { ?>
				<div class="item">
					<div class="product-thumb transition">
						<div class="image">
							<?php if($config_on_off_featured_quickview =='1'){?>
								<div class="quickview"><button class="btn btn-quickview" data-toggle="tooltip" title="<?php echo $config_quickview_btn_name[$lang_id]['config_quickview_btn_name']; ?>" onclick="quickview_open(<?php echo $product['product_id']?>,'<?php echo isset($all_prod) ? $all_prod : 0;?>');"><i class="fa fa-eye" aria-hidden="true"></i></button></div>
							<?php } ?>
							<div class="stickers-ns">
								<?php if ($product['special']) { ?>
									<div class="sticker-ns procent-skidka"><i class="fa fa-tag"></i> <?php echo round ($product['skidka']);?> %</div>
								<?php } ?>
								<?php if (($on_off_sticker_special == '1') && $product['special']) { ?>
									<div class="sticker-ns special">
										<i class="fa <?php echo $config_change_icon_sticker_special;?> "></i>					
										<span><?php echo $text_sticker_special[$lang_id]['config_change_text_sticker_special']; ?></span>	
									</div>
								<?php } ?>
								<?php if(($on_off_sticker_topbestseller == '1') && ($product['top_bestsellers'] >= $config_limit_order_product_topbestseller)) { ?>
									<div class="sticker-ns bestseller">
										<i class="fa <?php echo $config_change_icon_sticker_topbestseller;?> "></i>
										<span><?php echo $text_sticker_topbestseller[$lang_id]['config_change_text_sticker_topbestseller'] ?></span>	
									</div>
								<?php } ?>
								<?php if(($on_off_sticker_popular == '1') && ($product['viewed']>=$config_min_quantity_popular)) { ?>
									<div class="sticker-ns popular">
										<i class="fa <?php echo $config_change_icon_sticker_popular;?> "></i>
										<span><?php echo $text_sticker_popular[$lang_id]['config_change_text_sticker_popular']; ?></span>								
									</div>
								<?php } ?>
								<?php if(($on_off_sticker_newproduct == '1') && (isset($product['date_available'])&&(round((strtotime(date("Y-m-d"))-strtotime($product['date_available']))/86400))<=$config_limit_day_newproduct)) { ?>
									<div class="sticker-ns newproduct">
										<i class="fa <?php echo $config_change_icon_sticker_newproduct;?>"></i>
										<?php echo $text_sticker_newproduct[$lang_id]['config_change_text_sticker_newproduct']; ?>	
									</div>
								<?php } ?>
							</div>
							<?php if(isset($setting_module['status_additional_image_hover']) && ($setting_module['status_additional_image_hover'] =='1')) { ?>
								<a href="<?php echo $product['href']; ?>"><img <?php if ($product['product_quantity'] <= 0 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>"<?php } ?> <?php if($product['additional_image_hover']) { ?>data-additional-hover="<?php echo $product['additional_image_hover'];?>"<?php } ?> <?php if($lazyload_module){?>data-src="<?php echo $product['thumb']; ?>" src="<?php echo $lazy_image;?>" <?php } else { ?>src="<?php echo $product['thumb'];?>"<?php } ?> alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive <?php if($lazyload_module){?>lazyload<?php } ?>" /></a>	
							<?php } else { ?>
								<a href="<?php echo $product['href']; ?>"><img <?php if ($product['product_quantity'] <= 0 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>"<?php } ?> <?php if($lazyload_module){?>data-src="<?php echo $product['thumb']; ?>" src="<?php echo $lazy_image;?>" <?php } else { ?>src="<?php echo $product['thumb'];?>"<?php } ?> alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive <?php if($lazyload_module){?>lazyload<?php } ?>" /></a>	
							<?php } ?>
						<?php if($show_special_timer_module =='1' && $product['special']){ ?>
								<div class="action-timer">
									<div id="countdown-featured-product-<?php echo $product['product_id'];?>"></div>		
								</div>
								<script>
								$(function(){
									var note = $('#note');
									var parts_date ='<?php echo $product['date_end'];?>'.split('-');
									var ts = new Date(parts_date[0], parts_date[1] - 1, parts_date[2]); 
									if((new Date()) > ts){
										ts = (new Date()).getTime() + 10*24*60*60*1000;
									}
									$('#countdown-featured-product-<?php echo $product['product_id'];?>').countdown({
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
							<?php if(isset($setting_module['status_model']) && ($setting_module['status_model'] =='1')) { ?>
								<div class="product-model"><?php echo $product['model']?></div>
							<?php } ?>
							<?php if(isset($setting_module['status_description']) && ($setting_module['status_description'] =='1')) { ?>
								<div class="product-description"><?php echo $product['description']; ?></div>
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
									  <span class="price_no_format_<?php echo $product['product_id'];?>"><?php echo $product['price']; ?></span>
									  <?php } else { ?>
									  <span class="price-old"><span class="price_no_format_<?php echo $product['product_id'];?>"><?php echo $product['price']; ?></span></span> <span class="price-new"><span class="special_no_format_<?php echo $product['product_id'];?>"><?php echo $product['special']; ?></span></span>
									  <?php } ?>
									  <?php if ($product['tax']) { ?>
									  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
									  <?php } ?>
									</div>
								<?php if(isset($config_additional_settings_newstore['quantity_btn_module']) && ($config_additional_settings_newstore['quantity_btn_module'] =='1')){?>
									<div class="quantity_plus_minus">
										<input type="text" class="quantity-num form-control input-number-quantity<?php echo $product['product_id'];?>" name="quantity" <?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1') && $product['minimum'] > 1){?>disabled<?php } ?> id="input_quantity_mod_featured<?php echo $product['product_id'];?>" onkeyup="validate_quantity(this,'<?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1')){?><?php echo $product['minimum']; ?><?php } else { ?>1<?php } ?>')" oninput="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>, <?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_featured<?php echo $gen_carousel_featured;?>','featured');" value="<?php echo $product['minimum']; ?>">
										<span class="quantity-btn">
											<span class="add-up add-action fa fa-angle-up" onclick="btnplus_cat_price_featured<?php echo $product['product_id'];?>(<?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1')){?><?php echo $product['minimum']; ?><?php } else { ?>1<?php } ?>);"></span>
											<span class="add-down add-action fa fa-angle-down" onclick="btnminus_cat_price_featured<?php echo $product['product_id'];?>('<?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1')){?><?php echo $product['minimum']; ?><?php } else { ?>1<?php } ?>');"></span>
										</span>
									</div>
									<script>
									<?php if(isset($config_additional_settings_newstore['price_recalc']) && ($config_additional_settings_newstore['price_recalc'] == '1') && $product['minimum'] > 1){?>
										$(window).load(function() {
										recalc_quantity(<?php echo $product['product_id'];?>,'<?php echo $product['minimum']; ?>',<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_featured<?php echo $gen_carousel_featured;?>','featured');					
										});
									<?php } ?>
										function btnminus_cat_price_featured<?php echo $product['product_id'];?>(minimum){
											var $input = $('#input_quantity_mod_featured<?php echo $product['product_id'];?>');
											var count = parseInt($input.val()) - parseInt(minimum);
											count = count < parseInt(<?php echo $product['minimum']; ?>) ? parseInt(<?php echo $product['minimum']; ?>) : count;
											$input.val(count);
											$input.change();										
											recalc_quantity(<?php echo $product['product_id'];?>,count,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_featured<?php echo $gen_carousel_featured;?>','featured');						
										}
										function btnplus_cat_price_featured<?php echo $product['product_id'];?>(minimum){
											var $input = $('#input_quantity_mod_featured<?php echo $product['product_id'];?>');
											var count = parseInt($input.val()) + parseInt(minimum);
											$input.val(count);
											$input.change();
											recalc_quantity(<?php echo $product['product_id'];?>,count,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_featured<?php echo $gen_carousel_featured;?>','featured');					
										};																				
									</script>
								<?php } ?>
								<?php } ?>
								</div>
							<div class="actions">
								<?php if (($product['product_quantity'] <= 0) and $disable_cart_button){ ?>
									<div class="cart"><button class="btn btn-general" type="button" disabled><?php if($change_text_cart_button_out_of_stock ==1) { ?><span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button></div>
								<?php } else { ?>
									<div class="cart"><button class="btn btn-general" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>','featured', get_cart_quantity('<?php echo $product['product_id']; ?>','.carousel_numb_featured<?php echo $gen_carousel_featured;?>'));"><?php if($change_text_cart_button_out_of_stock ==1 && $product['product_quantity'] <= 0) { ?><span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button></div>
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
									<div class="wishlist"><button class="btn btn-wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart" aria-hidden="true"></i></button></div>
								<?php } ?>
								<?php if(isset($setting_module['status_compare']) && ($setting_module['status_compare'] =='1')) { ?>
									<div class="compare"><button class="btn btn-compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-retweet" aria-hidden="true"></i></button></div>
								<?php } ?>
								</div>	
							</div>
						</div>
					</div>
				</div>
			<?php } ?>
			</div>
			</div>
		</div>
		</div>
		</div>
	<?php } ?>	
<script>
$(document).ready(function() {
$('.carousel_numb_featured<?php echo $gen_carousel_featured;?>').owlCarousel({
	responsiveBaseWidth: ".carousel_numb_featured<?php echo $gen_carousel_featured;?>",
	itemsCustom: [[0, 1], [<?php if($setting_module['mobile_qrp'] == 1 && deviceType == 'phone'){?>'300'<?php } else { ?>'500'<?php } ?>, 2], [750, 3], [950,4], [1150,5]],
	slideSpeed: 200,
	paginationSpeed: 300,
	navigation: true,
	stopOnHover: true,		
	mouseDrag: false,
	pagination: false,
	autoPlay: false,
	navigationText: ['<div class="btn btn-carousel-module next-prod"><i class="fa fa-angle-left arrow"></i></div>', '<div class="btn btn-carousel-module prev-prod"><i class="fa fa-angle-right arrow"></i></div>'],
});
});
</script>      
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
		<?php if($qucikviewmodule) { ?>
			<div id="quickview-my"><?php echo $qucikviewmodule;?></div>
		<?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php if($config_status_zoom_image !='0') { ?>							
<script>
if ($(window).width() > 991) {
	$('.main-image').addClass('cloud-zoom');
}
$('.image-additional .item img').on('click', function(){	
	$('.main-image img').attr('src', $(this).parent().attr('rel'));
	$('.main-image').attr('href', $(this).parent().attr('href'));
	num_im = $(this).attr('data-num');
	$('.main-image').attr('data-num', num_im);
	$('.mousetrap').remove();
	$('.cloud-zoom').CloudZoom({position: 'inside'});
	return false;
});
var owladd = $('.thumbnails .image-additional');
function optionimage(image, image_zoom,image_thumb) {
	if($('.option-image-new').length > 0) {
		owladd.data('owlCarousel').removeItem($('.image-additional .owl-item:last-child img').attr('data-num'));
	}
	var num_im_last = Number($('.image-additional .owl-item:last-child img').attr('data-num')) + 1;
	$('.main-image img').attr('src',image);
	$('.main-image img').attr('data-magnify-src',image_zoom);
	$('.main-image').attr('href',image_zoom);
	$('.mousetrap').remove();
	$('.cloud-zoom').CloudZoom({position: 'inside'});	
	var content = '<div class="item"><a class="option-image-new thumbnail" data-magnify-src="'+ image_zoom +'" rel="'+ image +'" href="'+ image_zoom +'" title=""><img data-num="'+ num_im_last+'" src="'+ image_thumb +'" title="" alt="" /></a></div>';
    owladd.data('owlCarousel').addItem(content);
	$('.main-image').attr('data-num', num_im_last);
	$('.image-additional .item img').on('click', function(){	
		$('.main-image img').attr('src', $(this).parent().attr('rel'));
		$('.main-image').attr('href', $(this).parent().attr('href'));
		num_im = $(this).attr('data-num');
		$('.main-image').attr('data-num', num_im);
		$('.mousetrap').remove();
		$('.cloud-zoom').CloudZoom({position: 'inside'});
		return false;
	});	
	$('.thumbnails #image-box').on('click', function(e){
	e.preventDefault();
	if ($('.thumbnails .image-additional .item').length > 0) {
		var opennumimage = $('.cloud-zoom.main-image').attr('data-num');
		$('.thumbnails .image-additional').magnificPopup('open', opennumimage);
		return false;
	} else {
		$('.main-image').magnificPopup('open');
		return false;
	}
});
		
} 
</script>
<?php } else { ?>
<script>
$('.image-additional .item img').on('click', function(){	
	$('.main-image img').attr('src', $(this).parent().attr('rel'));
	$('.main-image').attr('href', $(this).parent().attr('href'));
	num_im = $(this).attr('data-num');
	$('.main-image').attr('data-num', num_im);
	return false;
});
var owladd = $('.thumbnails .image-additional');
function optionimage(image, image_zoom,image_thumb) {
	if($('.option-image-new').length > 0) {
		owladd.data('owlCarousel').removeItem($('.image-additional .owl-item:last-child img').attr('data-num'));
	}
	var num_im_last = Number($('.image-additional .owl-item:last-child img').attr('data-num')) + 1;
	$('.main-image img').attr('src',image);
	$('.main-image img').attr('data-magnify-src',image_zoom);
	$('.main-image').attr('href',image_zoom);
	
	var content = '<div class="item"><a class="option-image-new thumbnail" data-magnify-src="'+ image_zoom +'" rel="'+ image +'" href="'+ image_zoom +'" title=""><img data-num="'+ num_im_last+'" src="'+ image_thumb +'" title="" alt="" /></a></div>';
    owladd.data('owlCarousel').addItem(content);
	$('.main-image').attr('data-num', num_im_last);
	$('.image-additional .item img').on('click', function(){	
		$('.main-image img').attr('src', $(this).parent().attr('rel'));
		$('.main-image').attr('href', $(this).parent().attr('href'));
		num_im = $(this).attr('data-num');
		$('.main-image').attr('data-num', num_im);
		return false;
	});	
	$('.thumbnails #image-box').on('click', function(e){
	e.preventDefault();
	if ($('.thumbnails .image-additional .item').length > 0) {
		var opennumimage = $('.main-image').attr('data-num');
		$('.thumbnails .image-additional').magnificPopup('open', opennumimage);
		return false;
	} else {
		$('.main-image').magnificPopup('open');
		return false;
	}
});
		
}
 </script>
<?php } ?>
<script><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});

$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
				$('.options').removeClass('hidden-options');
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
						$('html, body').animate({ scrollTop: $('.options').offset().top - 10}, 250);
						setTimeout(function () {
							$('.option-danger, .alert, .text-danger').remove();
						}, 4000);
						$('#top').before('<div class="alert option-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['option'][i] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');					
						
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

				if (json['success']) {
					if(json['popup_design']=='1'){
						fastorder_open_cart();
					} else if(json['popup_design']=='0') {
						html  = '<div id="modal-addcart" class="modal">';
						html += '  <div class="modal-dialog" style="overflow:hidden">';
						html += '    <div class="modal-content">';
						if(json['show_onepcheckout']=='1'){
						html += '      	<div class="modal-body"><div class="text-center">' + json['success'] + '<br><img style="margin:10px 0px;" src="'+ json['image_cart'] +'"  /><br></div><div><a href=' + link_onepcheckout + ' class="btn-checkout">'+ button_checkout +'</a><button data-dismiss="modal" class="btn-shopping">'+ button_shopping +'</button></div></div>';	
						} else {
						html += '      	<div class="modal-body"><div class="text-center">' + json['success'] + '<br><img style="margin:10px 0px;" src="'+ json['image_cart'] +'"  /><br></div><div><a href=' + link_checkout + ' class="btn-checkout">'+ button_checkout +'</a><button data-dismiss="modal" class="btn-shopping">'+ button_shopping +'</button></div></div>';	
						}
						html += '    </div>';
						html += '  </div>';
						html += '</div>';
						$('body').append(html);
						$('#modal-addcart').modal('show');
					} else {
						$('#top').before('<div class="alert alert-info add_product_alert">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					}
					setTimeout(function () {
						$('.option-danger, .alert, .text-danger').remove();
					}, 4000);					
					setTimeout(function () {
						$('.cart-total').html(json['total']);
					}, 100);				

					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
				$('#modal-addcart').on('hide.bs.modal', function (e) {
					$('#modal-addcart').remove();
				});
		}
	});
});

$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});

$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('#form-review textarea[name=\'plus\']').val('');
				$('#form-review textarea[name=\'minus\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails .image-additional').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		},
		removalDelay: 500,
		callbacks: {
			beforeOpen: function() {
				this.st.mainClass = 'mfp-zoom-in';
			}
		},
	});
});
<?php if (!$images) { ?>
$(document).ready(function() {	
	$('.thumbnails .main-image').magnificPopup({
		type:'image',
		removalDelay: 500,
		callbacks: {
			beforeOpen: function() {
				this.st.mainClass = 'mfp-zoom-in';
			}
		},
	});
});
<?php } ?>
$('.thumbnails #image-box').on('click', function(e){
	e.preventDefault();
	if ($('.thumbnails .image-additional .item').length > 0) {
		var opennumimage = $('.main-image').attr('data-num');
		$('.thumbnails .image-additional').magnificPopup('open', opennumimage);
		return false;
	} else {
		$('.main-image').magnificPopup('open');
		return false;
	}
});

var url = document.location.toString();
if (url.match('#tab-review')) {
$('a[href=\'#tab-review\']').trigger('click');
}
</script>
<?php if(isset($fix_left_block) && ($fix_left_block =='1')){ ?>
<script><!--
$(window).load(function() {
(function(){
	var fix_lb = document.querySelector('#fix_image');
	var inner_fix_lb = document.querySelector('#fix_image');
	window.addEventListener('scroll', LeftBlockScroll);
	document.body.addEventListener('scroll', LeftBlockScroll);
	window.addEventListener('resize', LeftBlockScroll);
	document.body.addEventListener('resize', LeftBlockScroll);
	
function LeftBlockScroll() {
	if(document.getElementById('top-fixed')){
		if ($(window).width() > 992) {
			var top_lb = document.getElementById('top-fixed').getBoundingClientRect().height + 10;
		} else {
			var top_lb = 10;	
		}
	} else {
		var top_lb = 10;
	}
	if ($(window).width() > 992) {
		document.getElementById("fix_image").className = "fix_true";
	} else {
		document.getElementById("fix_image").className = "fix_false";
	}
	if (!!$('.fix_true').offset()) {
		fix_lb.style.width = inner_fix_lb.getBoundingClientRect().width + 'px';
		fix_lb.style.height = inner_fix_lb.getBoundingClientRect().height + 'px';
		var Ralb = fix_lb.getBoundingClientRect(),
		Rlb = Math.round(Ralb.top + inner_fix_lb.getBoundingClientRect().height - document.querySelector('.fix').getBoundingClientRect().bottom + 0);
	
	if ((Ralb.top - top_lb) <= 0) {
		if ((Ralb.top - top_lb) <= Rlb) {
		  inner_fix_lb.className = 'stop';
		  inner_fix_lb.style.top = - Rlb +'px';
		} else {
		  inner_fix_lb.className = 'sticky';
		  inner_fix_lb.style.top = top_lb + 'px';
		}
	  } else {
		inner_fix_lb.className = '';
		inner_fix_lb.style.top = '';
	}
}
	$(window).resize(function() {					
		if ($(this).width() < 992) {
			$('#fix_image').removeAttr('style');			
		}
	});
}
})()

});
//--></script>
<?php } ?>
</div>

        <?php if (isset($fcpdata['status']) && $fcpdata['status']) { ?>
		<style>
		<?php if ($fcpdata['color_found_cheaper_button']) { ?>
		.btn-cheaper {color:<?php echo $fcpdata['color_found_cheaper_button']; ?> !important; }
		<?php } ?>
		<?php if ($fcpdata['background_found_cheaper_button']) { ?>
		.btn-cheaper {background:<?php echo $fcpdata['background_found_cheaper_button']; ?> !important; }
		<?php } ?>
		<?php if ($fcpdata['background_found_cheaper_button_hover']) { ?>
		.btn-cheaper:hover {background:<?php echo $fcpdata['background_found_cheaper_button_hover']; ?> !important; }
		<?php } ?>
		<?php if ($fcpdata['border_found_cheaper_button']) { ?>
		.btn-cheaper {border-color:<?php echo $fcpdata['border_found_cheaper_button']; ?> !important; }
		<?php } ?>
		<?php if ($fcpdata['border_found_cheaper_button_hover']) { ?>
		.btn-cheaper:hover {border-color:<?php echo $fcpdata['border_found_cheaper_button_hover']; ?> !important; }
		<?php } ?>
		</style>
        <script>
        function open_popup_fcp(product_id) {  
          $.magnificPopup.open({
            tLoading: loading_masked_img,
            items: {
              src: 'index.php?route=extension/module/cyber_found_cheaper_product&product_id='+product_id,
              type: 'ajax'
            }
          });
        }
        </script>
      <?php } ?>
      
<?php echo $footer; ?>