<div id="quickview-container">
<div id="popup-quickview">
	<div class="popup-center">
	<ul class="nav nav-tabs my-tabs">
			<li class="active">	<a href="#tab-general" data-toggle="tab"><?php echo $tab_general_quickview; ?></a></li>
			<?php if($on_off_quickview_tab_description =='1') { ?>
				<li><a href="#tab-description" data-toggle="tab"><i class="fa fa-file-text-o fa-fw"></i><?php echo $tab_description; ?></a></li>
            <?php } ?>
			<?php if($on_off_quickview_tab_specification =='1') { ?>
				<?php if ($attribute_groups) { ?>
				<li><a href="#tab-specification" data-toggle="tab"><i class="fa fa-list-alt fa-fw"></i><?php echo $tab_attribute; ?></a></li>                     
				<?php } ?>
			<?php } ?>
			<?php if($on_off_quickview_tab_review_quickview =='1') { ?>
				<li><a href="#tab-review-quickview" data-toggle="tab"><i class="fa fa-comments-o fa-fw"></i><?php echo $tab_review; ?></a></li>
			<?php } ?>
    </ul>
	<div class="tab-content">
		<?php if(isset($config_quickview_show_nextprev_product) && ($config_quickview_show_nextprev_product == 1)) {?>
	<div class="pop-qv-next-prev">
		<?php if(isset($prev_product_id)){?>
			<a class="btn btn-prev-next pull-left prev-btn" href="javascript:void(0)" onclick="getNextPrevProduct('<?php echo $prev_product_id;?>','<?php echo $all_prod;?>');"><?php echo $prev_name;?></a>
		<div id="qv_prev_prod" class="hidden-xs">
		<a href="javascript:void(0)" onclick="getNextPrevProduct('<?php echo $prev_product_id;?>','<?php echo $all_prod;?>');">
		<span class="icon-prev">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 490.4 490.4"><path d="M245.2 490.4c135.2 0 245.2-110 245.2-245.2s-110-245.2-245.2-245.2-245.2 110-245.2 245.2 110 245.2 245.2 245.2zm0-465.9c121.7 0 220.7 99 220.7 220.7s-99 220.7-220.7 220.7-220.7-99-220.7-220.7 99-220.7 220.7-220.7zM198.9 322.8c2.4 2.4 5.5 3.6 8.7 3.6s6.3-1.2 8.7-3.6c4.8-4.8 4.8-12.5 0-17.3l-48-48h183.4c6.8 0 12.3-5.5 12.3-12.3s-5.5-12.3-12.3-12.3h-183.4l48-48c4.8-4.8 4.8-12.5 0-17.3s-12.5-4.8-17.3 0l-68.9 68.9c-4.8 4.8-4.8 12.5 0 17.3l68.8 69z"></path></svg>
		</span>
		<span class="qv-product-box-prev-next">
			<img class="img-responsive" src="<?php echo $prev_image;?>" alt="" title="" />
				<span class="qv-info-prev-next">
					<span class="qv-prev-next-product-name"><?php echo $prev_name;?></span>
					<span class="qv-prev-next-product-price price">
						<?php if ($prev_price) { ?>
						  <?php if (!$prev_special) { ?>
							<span><?php echo $prev_price; ?></span>
						  <?php } else { ?>
							<span class="price-old"><span><?php echo $prev_price; ?></span></span> <span class="price-new"><span><?php echo $prev_special; ?></span></span>
						  <?php } ?>
						<?php } ?>
					</span>
				</span>
			</span>
		</a>
		</div>
		<?php } ?>
		<?php if(isset($next_product_id)){?>
			<a class="btn btn-prev-next pull-right next-btn" href="javascript:void(0)" onclick="getNextPrevProduct('<?php echo $next_product_id;?>','<?php echo $all_prod;?>');"><?php echo $next_name;?></a>
		<div id="qv_next_prod" class="hidden-xs">
		<a href="javascript:void(0)" onclick="getNextPrevProduct('<?php echo $next_product_id;?>','<?php echo $all_prod;?>');">
			<span class="icon-next">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 490.4 490.4"><path d="M245.2 490.4c135.2 0 245.2-110 245.2-245.2s-110-245.2-245.2-245.2-245.2 110-245.2 245.2 110 245.2 245.2 245.2zm0-465.9c121.7 0 220.7 99 220.7 220.7s-99 220.7-220.7 220.7-220.7-99-220.7-220.7 99-220.7 220.7-220.7zM138.7 257.5h183.4l-48 48c-4.8 4.8-4.8 12.5 0 17.3 2.4 2.4 5.5 3.6 8.7 3.6s6.3-1.2 8.7-3.6l68.9-68.9c4.8-4.8 4.8-12.5 0-17.3l-68.9-68.9c-4.8-4.8-12.5-4.8-17.3 0s-4.8 12.5 0 17.3l48 48h-183.5c-6.8 0-12.3 5.5-12.3 12.3 0 6.8 5.5 12.2 12.3 12.2z"></path></svg>
			</span>
			<span class="qv-product-box-prev-next">
			<img class="img-responsive" src="<?php echo $next_image;?>" alt="" title="" />
				<span class="qv-info-prev-next">
					<span class="qv-prev-next-product-name"><?php echo $next_name;?></span>
					<span class="qv-prev-next-product-price price">
						<?php if ($next_price) { ?>
						  <?php if (!$next_special) { ?>
							<span><?php echo $next_price; ?></span>
						  <?php } else { ?>
							<span class="price-old"><span><?php echo $next_price; ?></span></span> <span class="price-new"><span><?php echo $next_special; ?></span></span>
						  <?php } ?>
						<?php } ?>
					</span>
				</span>
			</span>
		</a>
		</div>
		<?php } ?>
	</div>
	<div class="clearfix"></div>
	<?php } ?>
		<div class="tab-pane active" id="tab-general">
			<div class="col-md-6 col-sm-6">
			<div class="product-img-box thumbnails_view">
<?php if($on_off_quickview_additional_image =='1'){?>
<script>
$('.gallery-image .item img').on('click', function(){	
	$('.thumbnails-image img').attr('src', $(this).attr('rel'));
	return false;
});	
var owlpwq = $('#popup-quickview .gallery-image');
function optionimagetest(image,image_thumb) {
	if($('.option-image-new').length > 0) {
		owlpwq.data('owlCarousel').removeItem(0);
	}
	$('.thumbnails-image img').attr('src',image);
	var item_img_option = '<span class="item"><img style="cursor:pointer;" class="option-image-new" rel="'+ image +'" src="'+ image_thumb +'" /></span>';
    owlpwq.data('owlCarousel').addItem(item_img_option,0);
	$('.gallery-image .item img').on('click', function(){	
		$('.thumbnails-image img').attr('src', $(this).attr('rel'));
		return false;
	});	
} 
$('.gallery-image').owlCarousel({						
	items : 3,
	navigation: true,
	navigationText: ['<div class="btn-carousel featured-btn-next next-prod"><i class="fa fa-angle-left arrow"></i></div>', '<div class="btn-carousel featured-btn-prev prev-prod"><i class="fa fa-angle-right arrow"></i></div>'],
	pagination: false
}); 
</script>
<?php } ?>
			<div class="thumbnails-image">
					<img class="img img-responsive" src="<?php echo $popup;?>" alt="<?php echo $heading_title;?>" />
				</div>
			<?php if($on_off_quickview_additional_image =='1'){?>
				<div class="gallery-image owl-carousel text-center">
					<?php if ($images) { ?>
						<span class="item">
							<img style="cursor:pointer;" class="hover" src="<?php echo $thumb_min; ?>" rel="<?php echo $popup;?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
						</span>
						<?php foreach ($images as $image) { ?>
						<span class="item">
								<img style="cursor:pointer;" class="hover" src="<?php echo $image['thumb']; ?>" rel="<?php echo $image['popup'];?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
						</span>
						<?php } ?>				
					<?php } ?>
				</div>	
			<?php } ?>	
			</div>			
		</div>
			<div class="col-md-6 col-sm-6">
				<div class="product-name-quick"><?php echo $heading_title;?></div>
				<hr>
				<?php if($on_off_quickview_tab_review_quickview =='1') { ?>	
				<?php if ($review_status) { ?>
					  <div class="rating">
						<p>
						  <?php for ($i = 1; $i <= 5; $i++) { ?>
						  <?php if ($rating < $i) { ?>
						  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
						  <?php } else { ?>
						  <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
						  <?php } ?>
						  <?php } ?>
						  <a href="" onclick="$('a[href=\'#tab-review-quickview\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review-quickview\']').trigger('click'); return false;"><?php echo $text_write; ?></a></p>
					  </div>
					  <?php } ?>
				<hr>
				<?php } ?>
					<?php if ($price) { ?>
					  <ul class="list-unstyled">
						<?php if (!$special) { ?>
						<li>
						  <span class="price"><?php echo $price; ?></span>
						</li>
						<?php } else { ?>
						<li><li><span class="price-old" style="text-decoration: line-through;"><?php echo $price; ?></span>&nbsp;&nbsp;<span class="price-new"><?php echo $special; ?></span></li></li>
						<?php } ?>
						<?php if ($tax) { ?>
						<li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
						<?php } ?>
						<?php if ($points) { ?>
						<li><?php echo $text_points; ?> <?php echo $points; ?></li>
						<?php } ?>
						<?php if ($discounts) { ?>
						<li>
						  <hr>
						</li>
						<?php foreach ($discounts as $discount) { ?>
						<li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
						<?php } ?>
						<?php } ?>
					  </ul>
					  <?php } ?>
				<hr>
			<?php if($on_off_quickview_manufacturer =='1'){?>	
				<div class="quick-manufacturer"><span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></div>
			<?php } ?>
			<?php if($on_off_quickview_model =='1'){?>	
				<div class="quick-model"><span><?php echo $text_model; ?></span> <span><?php echo $model; ?></span> </div>
			<?php } ?>
			<?php if($on_off_quickview_quantity =='1'){?>	
				<?php if($quantity_prod <=0) { ?>				
					<div class="quick-stock"><span><?php echo $text_stock; ?></span> <span class="qty-not-in-stock"><?php echo $stock; ?></span></div>
				<?php } else { ?>
					<div class="quick-stock"><span><?php echo $text_stock; ?></span> <span class="qty-in-stock"><?php echo $stock; ?></span></div>
				<?php } ?>
			<?php } ?>
			<?php if( ($on_off_quickview_quantity =='1') || ($on_off_quickview_model =='1') || ($on_off_quickview_quantity =='1')) { ?>
				<hr>
			<?php } ?>
<?php if ($options) { ?>
      <div class="options">
        <br />
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
						<?php if ($option['required']) { ?>
							<i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i>
						<?php } ?>
					<?php echo $option['name']; ?>
				</label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                <?php
				  if ($option_value['price_prefix'] == '*') {
					if ($option_value['price_value'] != 1.0)
					  printf("(%+d%%)", round(($option_value['price_value'] * 100) - 100) );
				  } else {
					echo "(".$option_value['price_prefix'].$option_value['price'].")"; 
				  }
				?>
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
           <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group">
				<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
						<?php if ($option['required']) { ?>
							<i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i>
						<?php } ?>
					<?php echo $option['name']; ?>
				</label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
					<?php if ($option_value['image'] || $option_value['color']) { ?>
						<?php if ($option['status_color_type'] =='1') { ?>
							<div class="image-radio">
							  <label>
								<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" />
								<span class="color-option" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" style="background-color:<?php echo $option_value['color']?>"></span> 
							  </label>
							</div>
						<?php } else { ?>
							<div class="image-radio">
							  <label>
								<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" />
								<img onclick="optionimagetest('<?php echo $option_value['image_click']; ?>','<?php echo $option_value['image_thumb']; ?>')" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /> 
							  </label>
							</div>
						<?php } ?>
					<?php } else { ?>
						<div class="radio-checbox-options">
						  <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" id="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
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
            <div class="form-group">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
						<?php if ($option['required']) { ?>
							<i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i>
						<?php } ?>
					<?php echo $option['name']; ?>
				</label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
					<?php if ($option_value['image'] || $option_value['color']) { ?>
						<?php if ($option['status_color_type'] =='1') { ?>
							<div class="image-radio">
							  <label>
								<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" />
								<span class="color-option" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" style="background-color:<?php echo $option_value['color']?>"></span> 
							  </label>
							</div>
						<?php } else { ?>
							<div class="image-radio">
							  <label>
								<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" />
								<img onclick="optionimagetest('<?php echo $option_value['image_click']; ?>','<?php echo $option_value['image_thumb']; ?>')" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /> 
							  </label>
							</div>
						<?php } ?>
					<?php } else { ?>
						<div class="radio-checbox-options">
						  <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" id="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
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
            <div class="form-group">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
						<?php if ($option['required']) { ?>
							<i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i>
						<?php } ?>
					<?php echo $option['name']; ?>
				</label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
						<?php if ($option['required']) { ?>
							<i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i>
						<?php } ?>
					<?php echo $option['name']; ?>
				</label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
						<?php if ($option['required']) { ?>
							<i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i>
						<?php } ?>
					<?php echo $option['name']; ?>
				</label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
						<?php if ($option['required']) { ?>
							<i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i>
						<?php } ?>
					<?php echo $option['name']; ?>
				</label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group">
				<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
						<?php if ($option['required']) { ?>
							<i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i>
						<?php } ?>
					<?php echo $option['name']; ?>
				</label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
						<?php if ($option['required']) { ?>
							<i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i>
						<?php } ?>
					<?php echo $option['name']; ?>
				</label>
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
			<?php if ($minimum > 1) { ?>
			<hr>
            <div class="quantity-minimum"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>
			<?php if($options){?><hr><?php } ?>
			
			<?php if($on_off_quickview_addtocart=='1'){?>
			<div class="qty pull-left">
					<div class="quantity-adder clearfix">
						<div>
							<div class="quantity-number pull-left">
								<input <?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1') && $minimum > 1){?>disabled<?php } ?> class="quantity-product form-control" type="text" name="quantity" size="5" value="<?php echo $minimum; ?>" id="input-quantity" />
							</div>
							<div class="quantity-wrapper pull-left">
							<span onclick="btnplus_card_prod('<?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1')){?><?php echo $minimum; ?><?php } else { ?>1<?php } ?>');" class="add-up add-action fa fa-angle-up"></span>
							<span onclick="btnminus_card_prod('<?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1')){?><?php echo $minimum; ?><?php } else { ?>1<?php } ?>');" class="add-down add-action fa fa-angle-down"></span>
							</div>
						</div>
						<input type="hidden" name="product_id"  value="<?php echo $product_id; ?>" />
					</div>
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
			<?php } ?>
			<style>
				.btn-general {
					background:<?php echo $config_quickview_background_btnaddtocart;?>;
					color:<?php echo $config_quickview_textcolor_btnaddtocart;?>;
					border:1px solid <?php echo $config_quickview_background_btnaddtocart;?>;
				}
				.btn-general:hover {
					background:<?php echo $config_quickview_background_btnaddtocart_hover;?>;
					color:<?php echo $config_quickview_textcolor_btnaddtocart_hover;?>;
					border:1px solid <?php echo $config_quickview_background_btnaddtocart_hover;?>;
				}
				.btn-wishlist {
					background:<?php echo $config_quickview_background_btnwishlist;?>;
					color:<?php echo $config_quickview_textcolor_btnwishlist;?>;
					border:1px solid <?php echo $config_quickview_background_btnwishlist;?>;
				}
				.btn-wishlist:hover {
					background:<?php echo $config_quickview_background_btnwishlist_hover;?>;
					color:<?php echo $config_quickview_textcolor_btnwishlist_hover;?>;
					border:1px solid <?php echo $config_quickview_background_btnwishlist_hover;?>;
				}
				.btn-compare {
					background:<?php echo $config_quickview_background_btncompare;?>;
					color:<?php echo $config_quickview_textcolor_btncompare;?>;
					border:1px solid <?php echo $config_quickview_background_btncompare;?>;
				}
				.btn-compare:hover {
					background:<?php echo $config_quickview_background_btncompare_hover;?>;
					color:<?php echo $config_quickview_textcolor_btncompare_hover;?>;
					border:1px solid <?php echo $config_quickview_background_btncompare_hover;?>;
				}
			</style>
			<?php if($on_off_quickview_addtocart=='1'){?>
				<?php if (($product_quantity <= 0) and $disable_cart_button){ ?>
					<button type="button" id="button-cart-quickview" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-general" disabled><?php if($change_text_cart_button_out_of_stock ==1) { ?><span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button></button>		
				<?php } else {?>
					<button type="button" id="button-cart-quickview" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-general"><?php if($change_text_cart_button_out_of_stock ==1 && $product_quantity <= 0) { ?><span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button>
				<?php } ?>
			<?php } ?>
			<?php if($on_off_quickview_wishlist=='1'){?>
				<button type="button" data-toggle="tooltip" class="btn btn-wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
			<?php } ?>
			<?php if($on_off_quickview_compare=='1'){?>
				<button type="button" data-toggle="tooltip" class="btn btn-compare" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
			<?php } ?>
			
			</div>
		</div>
		<?php if($on_off_quickview_tab_description =='1') { ?>
			<div class="tab-pane" id="tab-description">
				<?php echo $description; ?>
			</div>
		<?php } ?>	
		<?php if($on_off_quickview_tab_specification =='1') { ?>
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
                  <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <td><?php echo $attribute['text']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
		<?php } ?>
		<?php if($on_off_quickview_tab_review_quickview =='1') { ?>	
		<?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review-quickview">
              <form class="form-horizontal" id="form-review-quickview">
                <div id="review-quickview"></div>
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
				<div <?php if($show_review_plus =='0') { ?>style="display:none;"<?php } ?>class="form-group <?php if($show_review_plus_requared) { ?>required<?php } ?>">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_plus; ?></label>
                    <textarea name="plus" rows="5" id="input-review" class="form-control"></textarea>
                  </div>
                </div>				
				<div <?php if($show_review_minus =='0') { ?>style="display:none;"<?php } ?>class="form-group <?php if($show_review_minus_requared) { ?>required<?php } ?>">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_minus; ?></label>
                    <textarea name="minus" rows="5" id="input-review" class="form-control"></textarea>
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
                    <button type="button" id="button-review-quickview" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_review; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
            <?php } ?>
	</div>
	</div>
<script><!--
$('#button-cart-quickview').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#popup-quickview input[type=\'text\'], #popup-quickview input[type=\'hidden\'], #popup-quickview input[type=\'radio\']:checked, #popup-quickview input[type=\'checkbox\']:checked, #popup-quickview select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart-quickview').button('loading');
		},
		complete: function() {
			$('#button-cart-quickview').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						$('.options').removeClass('hidden-options');
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
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
				} else {
					$.magnificPopup.close();
					html  = '<div id="modal-addcart" class="modal">';
					html += '  <div class="modal-dialog" style="overflow:hidden">';
					html += '    <div class="modal-content">';
					if(json['show_newstorecheckout']=='1'){
						html += '      	<div class="modal-body"><div class="text-center">' + json['success'] + '<br><img style="margin:10px 0px;" src="'+ json['image_cart'] +'"  /><br></div><div><a href=' + link_newstorecheckout + ' class="btn-checkout">'+ button_checkout +'</a><button data-dismiss="modal" class="btn-shopping">'+ button_shopping +'</button></div></div>';	
						} else {
						html += '      	<div class="modal-body"><div class="text-center">' + json['success'] + '<br><img style="margin:10px 0px;" src="'+ json['image_cart'] +'"  /><br></div><div><a href=' + link_checkout + ' class="btn-checkout">'+ button_checkout +'</a><button data-dismiss="modal" class="btn-shopping">'+ button_shopping +'</button></div></div>';	
						}
					html += '    </div>';
					html += '  </div>';
					html += '</div>';
					
					$('body').append(html);

					$('#modal-addcart').modal('show');
				}
					setTimeout(function () {
						$('.cart-total').html(json['total']);
					}, 100);	
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
				$('#modal-addcart').on('hide.bs.modal', function (e) {
					$('#modal-addcart').remove();
				});
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script><!--
$('#review-quickview').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review-quickview').fadeOut('slow');

    $('#review-quickview').load(this.href);

    $('#review-quickview').fadeIn('slow');
});

$('#review-quickview').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review-quickview').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review-quickview").serialize(),
		beforeSend: function() {
			$('#button-review-quickview').button('loading');
		},
		complete: function() {
			$('#button-review-quickview').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review-quickview').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review-quickview').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});
//--></script>
<script><!--
$('#popup-quickview .date').datetimepicker({
	pickTime: false
});

$('#popup-quickview .datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('#popup-quickview .time').datetimepicker({
	pickDate: false
});

$('#popup-quickview button[id^=\'button-upload\']').on('click', function() {
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
//--></script>

<script><!--
function price_format_autocalc(n)
{ 
    c = <?php echo (empty($currency_autocalc['decimals']) ? "0" : $currency_autocalc['decimals'] ); ?>;
    d = '<?php echo isset($currency_autocalc) ? $currency_autocalc["decimal_point"]: ""; ?>'; 
    t = '<?php echo isset($currency_autocalc) ? $currency_autocalc["thousand_point"] : ""; ?>'; 
    s_left = '<?php echo isset($currency_autocalc) ? $currency_autocalc["symbol_left"] : ""; ?>';
    s_right = '<?php echo isset($currency_autocalc) ? $currency_autocalc["symbol_right"] : ""; ?>';
     
    n = n * <?php echo isset($currency_autocalc) ? $currency_autocalc['value']: 1; ?>;
    i = parseInt(n = Math.abs(n).toFixed(c)) + ''; 

    j = ((j = i.length) > 3) ? j % 3 : 0; 
    return s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right; 
}

function calculate_tax_autocalc(price)
{
    <?php // Process Tax Rates
      if (isset($tax_rates) && $tax) {
         foreach ($tax_rates as $tax_rate) {
           if ($tax_rate['type'] == 'F') {
             echo 'price += '.$tax_rate['rate'].';';
           } elseif ($tax_rate['type'] == 'P') {
             echo 'price += (price * '.$tax_rate['rate'].') / 100.0;';
           }
         }
      }
    ?>
    return price;
}

function process_discounts_autocalc(price, quantity)
{
    <?php
      if(isset($dicounts_unf_autocalc)){
		  foreach ($dicounts_unf_autocalc as $discount) {
			echo 'if ((quantity >= '.$discount['quantity'].') && ('.$discount['price'].' < price)) price = '.$discount['price'].';'."\n";
		  }
	  }
    ?>
    return price;
}


animate_delay = 10;

main_price_autocalc_final = calculate_tax_autocalc(<?php echo (isset($price_value)) ? $price_value : 0; ?>);
main_price_autocalc_start = calculate_tax_autocalc(<?php echo (isset($price_value)) ? $price_value : 0; ?>);
main_step = 0;
main_timeout_id = 0;

function animateMainPrice_callback() {
    main_price_autocalc_start += main_step;
    
    if ((main_step > 0) && (main_price_autocalc_start > main_price_autocalc_final)){
        main_price_autocalc_start = main_price_autocalc_final;
    } else if ((main_step < 0) && (main_price_autocalc_start < main_price_autocalc_final)) {
        main_price_autocalc_start = main_price_autocalc_final;
    } else if (main_step == 0) {
        main_price_autocalc_start = main_price_autocalc_final;
    }
    
    $('.autocalc-product-price').html( price_format_autocalc(main_price_autocalc_start) );
    
    if (main_price_autocalc_start != main_price_autocalc_final) {
        main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
    }
}

function animateMainPriceAutocalc(price) {
    main_price_autocalc_start = main_price_autocalc_final;
    main_price_autocalc_final = price;
    main_step = (main_price_autocalc_final - main_price_autocalc_start) / 10;
    
    clearTimeout(main_timeout_id);
    main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
}


<?php if ($special) { ?>
special_autocalc_price_final = calculate_tax_autocalc(<?php echo $special_value; ?>);
special_autocalc_price_start = calculate_tax_autocalc(<?php echo $special_value; ?>);
special_autocalc_step = 0;
special_autocalc_timeout_id = 0;

function animateSpecialPrice_autocalc_callback_autocalc() {
    special_autocalc_price_start += special_autocalc_step;
    
    if ((special_autocalc_step > 0) && (special_autocalc_price_start > special_autocalc_price_final)){
        special_autocalc_price_start = special_autocalc_price_final;
    } else if ((special_autocalc_step < 0) && (special_autocalc_price_start < special_autocalc_price_final)) {
        special_autocalc_price_start = special_autocalc_price_final;
    } else if (special_autocalc_step == 0) {
        special_autocalc_price_start = special_autocalc_price_final;
    }
    
    $('.autocalc-product-special').html( price_format_autocalc(special_autocalc_price_start) );
    
    if (special_autocalc_price_start != special_autocalc_price_final) {
        special_autocalc_timeout_id = setTimeout(animateSpecialPrice_autocalc_callback_autocalc, animate_delay);
    }
}

function animateSpecialPrice_autocalc(price) {
    special_autocalc_price_start = special_autocalc_price_final;
    special_autocalc_price_final = price;
    special_autocalc_step = (special_autocalc_price_final - special_autocalc_price_start) / 10;
    
    clearTimeout(special_autocalc_timeout_id);
    special_autocalc_timeout_id = setTimeout(animateSpecialPrice_autocalc_callback_autocalc, animate_delay);
}
<?php } ?>


function recalculateprice_autocalc()
{
    var main_price_autocalc = <?php echo isset($price_value) ? (float)$price_value: 0; ?>;
    var input_quantity = Number($('input[name="quantity"]').val());
    var special_autocalc = <?php echo isset($special_value) ? (float)$special_value : 0; ?>;
    var tax = 0;
    
    if (isNaN(input_quantity)) input_quantity = 0;
    
    <?php if ($special) { ?>
        special_coefficient = <?php echo ((float)$price_value/(float)$special_value); ?>;
    <?php } ?>
    main_price_autocalc = process_discounts_autocalc(main_price_autocalc, input_quantity);
    tax = process_discounts_autocalc(tax, input_quantity);
    
    
    var option_price = 0;
    
    <?php if ($points) { ?>
      var points = <?php echo (float)$points_value; ?>;
      $('input:checked,option:selected').each(function() {
          if ($(this).data('points')) points += Number($(this).data('points'));
      });
      $('.autocalc-product-points').html(points);
    <?php } ?>
    
    $('input:checked,option:selected').each(function() {
      if ($(this).data('prefix') == '=') {
        option_price += Number($(this).data('price'));
        main_price_autocalc = 0;
        special_autocalc = 0;
      }
    });
    
    $('input:checked,option:selected').each(function() {
      if ($(this).data('prefix') == '+') {
        option_price += Number($(this).data('price'));
      }
      if ($(this).data('prefix') == '-') {
        option_price -= Number($(this).data('price'));
      }
      if ($(this).data('prefix') == 'u') {
        pcnt = 1.0 + (Number($(this).data('price')) / 100.0);
        option_price *= pcnt;
        main_price_autocalc *= pcnt;
        special_autocalc *= pcnt;
      }
      if ($(this).data('prefix') == 'd') {
        pcnt = 1.0 - (Number($(this).data('price')) / 100.0);
        option_price *= pcnt;
        main_price_autocalc *= pcnt;
        special_autocalc *= pcnt;
      }
      if ($(this).data('prefix') == '*') {
        option_price *= Number($(this).data('price'));
        main_price_autocalc *= Number($(this).data('price'));
        special_autocalc *= Number($(this).data('price'));
      }
    });
    
    special_autocalc += option_price;
    main_price_autocalc += option_price;

    <?php if ($special) { ?>
      main_price_autocalc = special_autocalc * special_coefficient;
      tax = special_autocalc;
    <?php } else { ?>
      tax = main_price_autocalc;
    <?php } ?>
    
    // Process TAX.
    main_price_autocalc = calculate_tax_autocalc(main_price_autocalc);
    special_autocalc = calculate_tax_autocalc(special_autocalc);
    
    // Раскомментировать, если нужен вывод цены с умножением на количество
    main_price_autocalc *= input_quantity;
    special_autocalc *= input_quantity;
    tax *= input_quantity;

    // Display Main Price
    animateMainPriceAutocalc(main_price_autocalc);
      
    <?php if ($special) { ?>
      animateSpecialPrice_autocalc(special_autocalc);
    <?php } ?>
}

$(document).ready(function() {
    $('#tab-general input[type="checkbox"]').bind('change', function() { recalculateprice_autocalc(); });
    $('#tab-general input[type="radio"]').bind('change', function() { recalculateprice_autocalc(); });
    $('#tab-general select').bind('change', function() { recalculateprice_autocalc(); });
    
    $quantity_autocalc = $('#tab-general input[name="quantity"]');
    $quantity_autocalc.data('val', $quantity_autocalc.val());
    (function() {
        if ($quantity_autocalc.val() != $quantity_autocalc.data('val')){
            $quantity_autocalc.data('val',$quantity_autocalc.val());
            recalculateprice_autocalc();
        }
        setTimeout(arguments.callee, 250);
    })();    
    
    recalculateprice_autocalc();
});

//--></script>
</div>
</div>	  
</div>	  
	 