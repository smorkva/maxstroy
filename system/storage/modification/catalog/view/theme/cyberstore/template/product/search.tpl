<?php echo $header; ?>
<div class="container">
<div class="col-sm-12 content-box-cs <?php if (isset($menu_open_search) && (($menu_open_search =='1') && ($main_menu =='1') && ($column_left))) { ?>mtopm10<?php } ?>">
  <ul class="breadcrumb <?php if (isset($menu_open_search) && (($menu_open_search =='1') && ($main_menu =='1') && ($column_left))) { ?>col-md-offset-3 col-lg-offset-3<?php } ?>">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
		<?php if($i+1<count($breadcrumbs)) { ?> <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li> <?php } else { ?><li><?php echo $breadcrumb['text']; ?></li><?php } ?>
	<?php } ?>
  </ul>
  <div class="row">
   <?php if (isset($menu_open_search) && (($menu_open_search =='1') && ($main_menu =='1') && ($column_left))) { ?>
		<script>
		if(window.matchMedia("(min-width: 992px)").matches){
			$('header #menu-list').addClass("nsmenu-block");
			$(function(){$('#column-left').css({'margin-top': $('header #menu-list').outerHeight() - 10});});
		}
		$(window).resize(function() {
			if ($(window).width() > 992) {
				$('header #menu-list').addClass("nsmenu-block");
				$(function(){$('#column-left').css({'margin-top': $('header #menu-list').outerHeight() - 10});});
			} else {
				$('header #menu-list').removeClass("nsmenu-block");
			}
		});
		</script>
	<?php } ?>
  <?php echo $column_left; ?>
   <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-4 col-md-6'; ?>
    <?php $cols_class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-8 col-md-9'; ?>
	<?php $cols_class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
	<?php $cols_class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> ns-smv">
  <?php echo $content_top; ?>

				<?php echo $editorplus;?>
			
      <h1><?php echo $heading_title; ?></h1>
      <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
      <div class="row">
        <div class="col-sm-4">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <div class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-3">
          <label class="checkbox-inline">
            <?php if ($sub_category) { ?>
            <input type="checkbox" name="sub_category" value="1" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="sub_category" value="1" />
            <?php } ?>
            <?php echo $text_sub_category; ?></label>
        </div>
      </div>
      <p>
        <label class="checkbox-inline">
          <?php if ($description) { ?>
          <input type="checkbox" name="description" value="1" id="description" checked="checked" />
          <?php } else { ?>
          <input type="checkbox" name="description" value="1" id="description" />
          <?php } ?>
          <?php echo $entry_description; ?></label>
      </p>
      <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
      <h2><?php echo $text_search; ?></h2>
      <?php if ($products) { ?>
		 <div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-left localstorage" style="margin:10px 0px;">
			<div class="btn-group">
				 <div class="btn-group">
					 <button type="button" class="btn btn-sort-limit dropdown-toggle" data-toggle="dropdown">
					 <i class="fa fa-sort-amount-asc fa-rw" aria-hidden="true"></i>&nbsp;
					<?php foreach ($sorts as $sort_active) { ?>
						<?php if ($sort_active['value'] == $sort . '-' . $order) { ?><?php echo $sort_active['text']; ?><?php } ?>
					<?php } ?>
					<span class="caret"></span>
				  </button>
				  <ul class="dropdown-menu text-left sort-menu">
					<?php foreach ($sorts as $sorts) { ?>
					<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
					<li class="active"><button class="btn-sort-link" onclick="location.href='<?php echo $sorts['href']; ?>'"><?php echo $sorts['text']; ?></button></li>
					<?php } else { ?>
					<li><button class="btn-sort-link" onclick="location.href='<?php echo $sorts['href']; ?>'"><?php echo $sorts['text']; ?></button></li>
					<?php } ?>
					<?php } ?>
				  </ul>
				</div>
				<div class="btn-group hidden-xs localstorage">
					<button type="button" id="list-view" class="btn" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
					<button type="button" id="grid-view" class="btn" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th-large"></i></button>
					<button type="button" id="grid-view4" class="btn" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
					<?php if($config_price_list_view_on_off_search_page) { ?>
						<button type="button" id="price-view" class="btn" data-toggle="tooltip" title="<?php echo $button_price; ?>"><i class="fa fa-align-justify"></i></button>
					<?php } ?>
				</div>
				<div class="btn-group">
                  <ul class="dropdown-menu text-left">
                    <?php foreach ($limits as $limits) { ?>
                    <?php if ($limits['value'] == $limit) { ?>
                    <li class="active"><a href="<?php echo $limits['href']; ?>" rel="nofollow"><?php echo $limits['text']; ?></a></li>
                    <?php $mmr_limit_active = $limits['text']; ?>
                    <?php } else { ?>
                    <li><a href="<?php echo $limits['href']; ?>" rel="nofollow"><?php echo $limits['text']; ?></a></li>
                    <?php } ?>
                    <?php } ?>
                  </ul>
                  <button type="button" class="btn btn-sort-limit dropdown-toggle" data-toggle="dropdown" title="<?php echo $text_limit;?>">
                    <i class="fa fa-arrows-v hidden-md hidden-lg"></i> <span class="hidden-xs hidden-sm"><?php echo $text_limit; ?> </span><?php echo isset($mmr_limit_active) ? $mmr_limit_active : $limits['text']; ?>
                    <span class="caret"></span>
                  </button>
                </div>
			</div>
		</div>
		 </div> 
     <div class="row row-price">
        <?php foreach ($products as $product) { ?>
         <div class="product-layout product-grid <?php echo $cols_class;?>">
          <div class="product-thumb">	
				<div class="image">	
						<?php if($config_on_off_search_page_quickview =='1'){?>
							<div class="quickview"><a class="btn btn-quickview" data-toggle="tooltip" title="<?php echo $config_quickview_btn_name[$lang_id]['config_quickview_btn_name']; ?>" onclick="quickview_open(<?php echo $product['product_id']?>,'<?php echo isset($all_prod) ? $all_prod : 0;?>');"><i class="fa fa-eye" aria-hidden="true"></i></a></div>
						<?php } ?>
							<div class="stickers-ns">
								<?php if (($on_off_percent_discount == '1') && $product['special']) { ?>
									<div class="sticker-ns procent-skidka"><?php echo round ($product['skidka']);?> %</div>
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
				<?php if($status_additional_image_hover_sep =='1') { ?>
					<a itemprop="url" href="<?php echo $product['href']; ?>"><img <?php if ($product['product_quantity'] <= 0 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>"<?php } ?> itemprop="image" <?php if($product['additional_image_hover']) { ?>data-additional-hover="<?php echo $product['additional_image_hover'];?>"<?php } ?> <?php if($lazyload_page){?>data-src="<?php echo $product['thumb']; ?>" src="<?php echo $lazy_image;?>" <?php } else { ?>src="<?php echo $product['thumb'];?>"<?php } ?> alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive <?php if($lazyload_page){?>lazyload<?php } ?>" /></a>	
				<?php } else { ?>
					<a itemprop="url" href="<?php echo $product['href']; ?>"><img <?php if ($product['product_quantity'] <= 0 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>"<?php } ?> itemprop="image" <?php if($lazyload_page){?>data-src="<?php echo $product['thumb']; ?>" src="<?php echo $lazy_image;?>" <?php } else { ?>src="<?php echo $product['thumb'];?>"<?php } ?> alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive <?php if($lazyload_page){?>lazyload<?php } ?>" /></a>
				<?php } ?>
				<?php if($show_special_timer_page =='1' && $product['special']){ ?>
					<div class="action-timer">
						<div id="countdown-category-<?php echo $product['product_id'];?>"></div>		
					</div>
					<script>
						$(function(){
							var note = $('#note');
							var parts_date ='<?php echo $product['date_end'];?>'.split('-');
							var ts = new Date(parts_date[0], parts_date[1] - 1, parts_date[2]); 
							if((new Date()) > ts){
								ts = (new Date()).getTime() + 10*24*60*60*1000;
							}
							$('#countdown-category-<?php echo $product['product_id'];?>').countdown({
								timestamp: ts,
								callback: function(days, hours, minutes, seconds){						
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
				<?php if($ns_on_off_search_page_model_product !='0') { ?>
						<div class="product-model"><?php echo $product['model']?></div>
				<?php } ?>
				<?php if($ns_on_off_search_page_description !='0') { ?>
						<div class="product-description"><?php echo $product['description']; ?></div>
				<?php } ?>
				 <?php if ($show_options) { ?>
						<div id="option_productpage_<?php echo $product['product_id']; ?>" class="option productpage-opt">
							<?php foreach ($product['options'] as $key => $option) { ?>	
								<?php if ($option['type'] == 'select'){ ?>
									<div class="form-group">
										<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
											<?php if ($option['required']) { ?><i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i><?php } ?>
											<?php echo $option['name']; ?>
										</label>
										<div id="input-option-productpage<?php echo $option['product_option_id']; ?>">
											<select onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.row-price','productpage');" name="option[<?php echo $option['product_option_id']; ?>]" id="input-value-<?php echo $option['product_option_id']; ?>_productpage" class="form-control">
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
									  <div id="input-option-productpage<?php echo $option['product_option_id']; ?>">
										<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<?php if ($option_value['image'] || $option_value['color']) { ?>
												<?php if ($option['status_color_type'] =='1') { ?>
													<div class="image-radio">
													  <label>
														<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.row-price','productpage');" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" />
														<span for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" class="color-option" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" style="background-color:<?php echo $option_value['color']?>"></span>
													  </label>
													</div>
												<?php } else { ?>
													<div class="image-radio">
													  <label>
														<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.row-price','productpage');" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" />
														<img for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /> 
													  </label>
													</div>
												<?php } ?>
											<?php } else { ?>
												<div class="radio-checbox-options">
													<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.row-price','productpage');" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" />
													<label for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage">
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
									  <div id="input-option-productpage<?php echo $option['product_option_id']; ?>">
										<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<?php if ($option_value['image'] || $option_value['color']) { ?>
												<?php if ($option['status_color_type'] =='1') { ?>
													<div class="image-radio">
													  <label>
														<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.row-price','productpage');" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" />
														<span for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" class="color-option" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" style="background-color:<?php echo $option_value['color']?>"></span>
													  </label>
													</div>
												<?php } else { ?>
													<div class="image-radio">
													  <label>
														<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.row-price','productpage');" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" />
														<img for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /> 
													  </label>
													</div>
												<?php } ?>
											<?php } else { ?>
												<div class="radio-checbox-options">
													<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.row-price','productpage');" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" />
													<label for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage">
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
				 <?php if ($ns_on_off_search_page_rating !='0') { ?>
				 <div class="rating">
				 <span class="rating-box">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
				  <?php if ($ns_on_off_search_page_quantity_reviews !='0') { ?>
				  <span class="quantity-reviews"><a data-placement="right"  data-toggle="tooltip" title="<?php echo $text_reviews_title;?>" href="<?php echo $product['href']; ?>/#tab-review"><?php echo $product['reviews']; ?></a></span>
					<?php } ?>
				</div>
				</span>
				 <?php } ?>
				 <div class="pq-box">
				   <?php if ($product['price']) { ?>
					<p class="price">
						<!-- here price <?php print_r($product['dimm'])?> -->
					  <?php if (!$product['special']) { ?>
						  <span class="price_no_format_<?php echo $product['product_id'];?>"><?php echo str_ireplace('грн.', ' ₴/'.$product['dimm'], $product['price']); ?></span>
						  <?php } else { ?>
						  <span class="price-old">
							<span class="price_no_format_<?php echo $product['product_id'];?>"><?php echo $product['price']; ?></span>
						  </span>
						  <span class="price-new">
							<span class="special_no_format_<?php echo $product['product_id'];?>"><?php echo $product['special']; ?> ₴/<?php echo $product['dimm']; ?></span>
						  </span>
						<?php } ?>
					  <?php if ($product['tax']) { ?>
					  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
					  <?php } ?>
					</p>
					<?php if(!isset($status_actions)) { ?>
				<?php if(isset($config_additional_settings_newstore['quantity_btn_page']) && ($config_additional_settings_newstore['quantity_btn_page'] =='1')){?>
					<div class="quantity_plus_minus">
						<input type="text" class="quantity-num form-control input-number-quantity<?php echo $product['product_id'];?>" name="quantity" onkeyup="validate_quantity(this,'<?php echo $product['minimum']; ?>')" oninput="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>, <?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.row-price','productpage');" <?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1') && $product['minimum'] > 1){?>disabled<?php } ?> id="input_quantity_page<?php echo $product['product_id'];?>"  size="1" value="<?php echo $product['minimum']; ?>">
						<span class="quantity-btn">
							<span class="add-up add-action fa fa-angle-up" onclick="btnplus_cat_price_page<?php echo $product['product_id'];?>('<?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1')){?><?php echo $product['minimum']; ?><?php } else { ?>1<?php } ?>');"></span>
							<span class="add-down add-action fa fa-angle-down" onclick="btnminus_cat_price_page<?php echo $product['product_id'];?>('<?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1')){?><?php echo $product['minimum']; ?><?php } else { ?>1<?php } ?>');"></span>
						</span>
					</div>
					<script>
					<?php if(isset($config_additional_settings_newstore['price_recalc']) && ($config_additional_settings_newstore['price_recalc'] == '1') && $product['minimum'] > 1){?>
					$(window).load(function() {
						recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.row-price','productpage');					
					});
					<?php } ?>
					function btnminus_cat_price_page<?php echo $product['product_id'];?>(minimum){
						var $input = $('#input_quantity_page<?php echo $product['product_id'];?>');
						var count = parseInt($input.val()) - parseInt(minimum);
						count = count < parseInt(<?php echo $product['minimum']; ?>) ? parseInt(<?php echo $product['minimum']; ?>) : count;
						$input.val(count);
						$input.change();										
						recalc_quantity(<?php echo $product['product_id'];?>,count,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.row-price','productpage');						
					}
					function btnplus_cat_price_page<?php echo $product['product_id'];?>(minimum){
						var $input = $('#input_quantity_page<?php echo $product['product_id'];?>');
						var count = parseInt($input.val()) + parseInt(minimum);
						$input.val(count);
						$input.change();
						recalc_quantity(<?php echo $product['product_id'];?>,count,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.row-price','productpage');					
					};																				
				</script>
				<?php } ?>
				<?php } ?>
				<?php } ?>
				</div>
				<?php if(!isset($status_actions)) { ?>
				<div class="actions">
					<?php if (($product['product_quantity'] <= 0) and $disable_cart_button){ ?>
						<div class="cart"><button class="btn btn-general" type="button" disabled><?php if($change_text_cart_button_out_of_stock ==1) { ?><i class="fa fa-lock" aria-hidden="true"></i> <span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button></div>
					<?php } else { ?>
						<div class="cart"><button class="btn btn-general" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>','productpage', get_cart_quantity('<?php echo $product['product_id']; ?>','.row-price'));"><?php if($change_text_cart_button_out_of_stock ==1 && $product['product_quantity'] <= 0) { ?><i class="fa fa-lock" aria-hidden="true"></i> <span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button></div>
					<?php } ?>
					<div class="addit-action">
						<?php if($ns_on_off_search_page_fastorder !='0'){ ?>
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
						<?php if($ns_on_off_search_page_wishlist !='0') { ?>
							<div class="wishlist"><button class="btn btn-wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button></div>
						<?php } ?>
						<?php if($ns_on_off_search_page_compare !='0') { ?>
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
      <div class="row">
        <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
        <div class="col-sm-12 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
</div>
<script><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	var search = $('#content input[name=\'search\']').prop('value');
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}
	var category_id = $('#content select[name=\'category_id\']').prop('value');
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');
	if (sub_category) {
		url += '&sub_category=true';
	}
	var filter_description = $('#content input[name=\'description\']:checked').prop('value');
	if (filter_description) {
		url += '&description=true';
	}
	location = url;
});
$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});
$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});
$('select[name=\'category_id\']').trigger('change');
--></script> 
<?php echo $footer; ?>