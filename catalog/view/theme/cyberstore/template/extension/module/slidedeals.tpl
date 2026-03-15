<?php if($verdeals == 1){?>
<style>
.block-slidedeals-v1 .dealsslider-countdown .num-time {
	background:<?php echo $bg_timer;?>;
}
</style>
<div class="block-slidedeals-v1 bg-sliderdeals">
<?php $gcdealsslider = rand(1, 1000);?>
	<div class="sm-dealsslider theme1 dealsslider<?php echo $gcdealsslider;?>">
		<div id="sync1" class="sync1<?php echo $gcdealsslider;?> col-xs-12 col-sm-9 col-md-10 ds-items-detail carousel_numb_dealsslider<?php echo $gcdealsslider;?>">
			<?php foreach ($products as $product) { ?>
				<div class="dealsslider-item">
					<div class="dealsslider-item-inner row">
						<div class="dealsslider-datetime col-xs-12 col-sm-12 col-md-3">
							<div class="box-title">
								<div class="dealsslider-title-text">
									<div class="ds-title"><?php echo $title?></div>
								</div>
								<div class="pre_text"><?php echo $description[$lang_id]['text']?></div>
							</div>
							<?php if($status_timer_special =='1' && $product['special']){ ?>
								<div class="dealsslider-countdown" data-timer="<?php echo $product['date_end'];?>"></div>
							<?php } ?>	
							
						</div>
						<div class="dealsslider-wrappper col-xs-12 col-sm-12 col-md-9">
							<div class="dealsslider-info product-thumb">
								<div class="dealsslider-image col-xs-12 col-sm-12 col-md-5">
									<div class="image">	
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
										<?php if($on_off_slider_additional_image =='1') { ?>		
											<div class="image-carousel">			
												<a href="<?php echo $product['href']; ?>"><img <?php if ($product['product_quantity'] <= 0 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>"<?php } ?> src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>		
											<?php foreach ($product['additional_img'] as $img) { ?>			
												<a class="additional-image hidden" href="<?php echo $product['href']; ?>"><img src="<?php echo $img;?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>			
											<?php } ?>
											</div>
										<?php } elseif($on_off_slider_additional_image =='2') { ?>
											<a href="<?php echo $product['href']; ?>"><img <?php if ($product['product_quantity'] <= 0 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>"<?php } ?> <?php if($product['additional_image_hover']) { ?>data-additional-hover="<?php echo $product['additional_image_hover'];?>"<?php } ?> src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>		
										<?php } else { ?> 
											<a href="<?php echo $product['href']; ?>"><img <?php if ($product['product_quantity'] <= 0 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>"<?php } ?> src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>	
										<?php } ?> 	
									</div>
								</div>
								<div class="dealsslider-content col-xs-12 col-sm-12 col-md-7">
									<div class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
									<div style="text-align: center;">Модель: <?php echo $product['product_id']?></div>
									<?php if($on_off_rating !='0') { ?>
										<div class="rating">
											<span class="rating-box">
												<?php for ($i = 1; $i <= 5; $i++) { ?>
													<?php if ($product['rating'] < $i) { ?>
														<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
													<?php } else { ?>
														<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
													<?php } ?>
												<?php } ?>
											<?php if($on_off_quantity_reviews !='0') { ?> 
												<span class="quantity-reviews"><a data-placement="right"  data-toggle="tooltip" title="<?php echo $text_reviews_title;?>" href="<?php echo $product['href']; ?>/#tab-review"><?php echo $product['reviews']; ?></a></span>
											<?php } ?>
											</span>
										</div>
									<?php } ?>	
									<?php if($on_off_description !='0') { ?>
										<div class="product-description"><?php echo $product['description']; ?></div>
									<?php } ?>
							
								<?php if ($show_options) { ?>
									<div id="option_dealsslider<?php echo $gcdealsslider;?>_<?php echo $product['product_id']; ?>" class="option dealsslider-opt">
										<?php foreach ($product['options'] as $key => $option) { ?>
											<?php if ($option['type'] == 'select'){ ?>
												<div class="form-group">
													<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
														<?php if ($option['required']) { ?><i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i><?php } ?>
														<?php echo $option['name']; ?>
													</label>
													<div id="input-option-dealsslider<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>">
														<select onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');" name="option[<?php echo $option['product_option_id']; ?>]" id="input-value-<?php echo $option['product_option_id']; ?>_dealsslider" class="form-control">
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
													<div id="input-option-dealsslider<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>">
													<?php foreach ($option['product_option_value'] as $option_value) { ?>
														<?php if ($option_value['image'] || $option_value['color']) { ?>
															<?php if ($option['status_color_type'] =='1') { ?>
																<div class="image-radio">
																  <label>
																	<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_dealsslider" />
																	<span for="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productany" class="color-option" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" style="background-color:<?php echo $option_value['color']?>"></span>						
																  </label>
																</div>
															<?php } else { ?>
																<div class="image-radio">
																  <label>
																	<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_dealsslider" />
																	<img for="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productany" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /> 						
																  </label>
																</div>
															<?php } ?>
														<?php } else { ?>
															<div class="radio-checbox-options">
																<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_dealsslider" />
																<label for="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_dealsslider">
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
												  <div id="input-option-dealsslider<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>">
													<?php foreach ($option['product_option_value'] as $option_value) { ?>
														<?php if ($option_value['image'] || $option_value['color']) { ?>
															<?php if ($option['status_color_type'] =='1') { ?>
																<div class="image-radio">
																  <label>
																	<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_dealsslider" />
																	<span for="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productany" class="color-option" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" style="background-color:<?php echo $option_value['color']?>"></span>						
																  </label>
																</div>
															<?php } else { ?>
																<div class="image-radio">
																  <label>
																	<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_dealsslider" />
																	<img for="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productany" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /> 						
																  </label>
																</div>
															<?php } ?>
														<?php } else { ?>
															<div class="radio-checbox-options">
															  <input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_dealsslider" />
																<label for="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_dealsslider">
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
										<input type="text" class="quantity-num form-control input-number-quantity<?php echo $product['product_id'];?>" name="quantity" <?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1') && $product['minimum'] > 1){?>disabled<?php } ?> id="input_quantity_mod_dealsslider<?php echo $gcdealsslider;?>_<?php echo $product['product_id'];?>" onkeyup="validate_quantity(this,'<?php echo $product['minimum']; ?>')" oninput="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>, <?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');" value="<?php echo $product['minimum']; ?>">
										<span class="quantity-btn">
											<span class="add-up add-action fa fa-angle-up" onclick="btnplus_cat_price_dealsslider<?php echo $gcdealsslider;?>_<?php echo $product['product_id'];?>('<?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1')){?><?php echo $product['minimum']; ?><?php } else { ?>1<?php } ?>');"></span>
											<span class="add-down add-action fa fa-angle-down" onclick="btnminus_cat_price_dealsslider<?php echo $gcdealsslider;?>_<?php echo $product['product_id'];?>('<?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1')){?><?php echo $product['minimum']; ?><?php } else { ?>1<?php } ?>');"></span>
										</span>
									</div>
								<script>
								<?php if(isset($config_additional_settings_newstore['price_recalc']) && ($config_additional_settings_newstore['price_recalc'] == '1') && $product['minimum'] > 1){?>
									$(window).load(function() {
									recalc_quantity('<?php echo $product['product_id'];?>','<?php echo $product['minimum']; ?>','<?php echo $product['price_no_format'];?>','<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');						
									});
								<?php } ?>
									function btnminus_cat_price_dealsslider<?php echo $gcdealsslider;?>_<?php echo $product['product_id'];?>(minimum){
										var $input = $('#input_quantity_mod_dealsslider<?php echo $gcdealsslider;?>_<?php echo $product['product_id'];?>');
										var count = parseInt($input.val()) - parseInt(minimum);
										count = count < parseInt(<?php echo $product['minimum']; ?>) ? parseInt(<?php echo $product['minimum']; ?>) : count;
										$input.val(count);
										$input.change();										
										recalc_quantity(<?php echo $product['product_id'];?>,count,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');						
									}
									function btnplus_cat_price_dealsslider<?php echo $gcdealsslider;?>_<?php echo $product['product_id'];?>(minimum){
										var $input = $('#input_quantity_mod_dealsslider<?php echo $gcdealsslider;?>_<?php echo $product['product_id'];?>');
										var count = parseInt($input.val()) + parseInt(minimum);
										$input.val(count);
										$input.change();
										recalc_quantity(<?php echo $product['product_id'];?>,count,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');					
									};																				
							</script>		
								<?php } ?>
								<?php } ?>
								</div>
								<div class="actions">						
									<?php if (($product['product_quantity'] <= 0) and $disable_cart_button){ ?>
										<div class="cart"><button class="btn btn-general" type="button" disabled><?php if($change_text_cart_button_out_of_stock ==1) { ?><i class="fa fa-lock" aria-hidden="true"></i> <span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button></div>
									<?php } else { ?>
										<div class="cart"><button class="btn btn-general" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>','dealsslider<?php echo $gcdealsslider;?>', get_cart_quantity('<?php echo $product['product_id']; ?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>'));"><?php if($change_text_cart_button_out_of_stock ==1 && $product['product_quantity'] <= 0) { ?><i class="fa fa-lock" aria-hidden="true"></i> <span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button></div>
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
						</div>
					</div>
						</div>
					</div>
				</div>
			<?php } ?>
		</div>
		<div id="sync2" class="sync2<?php echo $gcdealsslider;?> ds-items col-sm-3 col-md-2 hidden-xs">
			<?php foreach ($products as $product) { ?>
				<div class="ds-image-thumb cf"><img src="<?php echo $product['image_thumb']?>" /></div>
			<?php } ?>
		</div>
	</div>
<script>
$(".sync1<?php echo $gcdealsslider;?> .dealsslider-countdown").each(function () {
	var timer = $(this).data('timer');
	var parts_date = timer.split('-');
	var ts = new Date(parts_date[0], parts_date[1] - 1, parts_date[2]); 
	if((new Date()) > ts){
		ts = (new Date()).getTime() + 10*24*60*60*1000;
	}
	$(this).countdown({
		timestamp : ts,
	});
});

	$(".sync1<?php echo $gcdealsslider;?>").slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		infinite: true,
		arrows: true,
		prevArrow: "<button class=\"slick-prev slick-arrow\"><i class=\"fa fa-arrow-right\"></i></button>",
		nextArrow: "<button class=\"slick-next slick-arrow\"><i class=\"fa fa-arrow-left\"></i></button>",
		initialSlide: 0,
		fade: true,
		cssEase: 'linear',
		adaptiveHeight: true,
		asNavFor: '.sync2<?php echo $gcdealsslider;?>'
	});
	$(".sync2<?php echo $gcdealsslider;?>").slick({
		vertical:true,
		arrows: false,
		autoplay: false,
		slidesToShow: 3,
		slidesToScroll: 1,
		infinite: true,
		initialSlide: 0,
		speed: 800,
		autoplaySpeed: 7000,
		asNavFor: '.sync1<?php echo $gcdealsslider;?>',
		pauseOnHover: true,
		dots: false,
		centerMode: true,
		focusOnSelect: true,
		responsive: [
			{
				breakpoint: 1199,
				settings: {
					slidesToShow: 1,
					slidesToScroll: 1								}
			},
			{
				breakpoint: 991,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 1								}
			},
			{
				breakpoint: 767,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 1								}
			},
			{
				breakpoint: 479,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 1								}
			},
			{
				breakpoint: 320,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 1								}
			}
		]
	});




</script>
</div>
<?php } ?>



<?php if($verdeals == 0){?>
<?php if(isset($bg_timer) && ($bg_timer !='')){?>
<style>
.block-slidedeals-v4 .dealsslider-countdown {
	background-color:<?php echo $bg_timer;?> !important;
}
</style>
<?php } ?>
<div class="block-slidedeals-v4">
<?php $gcdealsslider = rand(10000, 50000);?>
<div class="sm-dealsslider theme3 dealsslider<?php echo $gcdealsslider;?>">
	<div id="sync2" class="sync2<?php echo $gcdealsslider;?> col-sm-2 col-md-2 col-lg-2 ds-items hidden-xs">
	  <?php foreach ($products as $product) { ?>
		<div class="ds-image-thumb"><img src="<?php echo $product['image_thumb']?>" /></div>
	  <?php } ?>
	</div>
	<div id="sync1" class="sync1<?php echo $gcdealsslider;?> col-xs-12 col-sm-10 col-md-10 col-lg-10 ds-items-detail carousel_numb_dealsslider<?php echo $gcdealsslider;?>">
		<?php foreach ($products as $product) { ?>
			<div class="dealsslider-item">
				<div class="dealsslider-item-inner">
					<div class="dealsslider-info product-thumb">
						<div class="dealsslider-image col-xs-12 col-sm-12 col-md-6">
							<div class="image">	
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
								<?php if($on_off_slider_additional_image =='2') { ?>
									<a href="<?php echo $product['href']; ?>"><img <?php if ($product['product_quantity'] <= 0 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>"<?php } ?> <?php if($product['additional_image_hover']) { ?>data-additional-hover="<?php echo $product['additional_image_hover'];?>"<?php } ?> src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>		
								<?php } else { ?> 
									<a href="<?php echo $product['href']; ?>"><img <?php if ($product['product_quantity'] <= 0 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>"<?php } ?> src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>	
								<?php } ?> 	
							</div>
						</div>
						<div class="dealsslider-content col-xs-12 col-sm-12 col-md-6">
							<div class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
							<!-- <div style="text-align: center;">Модель: <?php echo $product['product_id']?></div> -->
							<?php if($on_off_model_product !='0') { ?>
								<div class="product-model"><?php echo $product['model']?></div>
							<?php } ?>
							<?php if($on_off_rating !='0') { ?>
								<div class="rating">
									<span class="rating-box">
										<?php for ($i = 1; $i <= 5; $i++) { ?>
											<?php if ($product['rating'] < $i) { ?>
												<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
											<?php } else { ?>
												<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
											<?php } ?>
										<?php } ?>
									<?php if($on_off_quantity_reviews !='0') { ?> 
										<span class="quantity-reviews"><a data-placement="right"  data-toggle="tooltip" title="<?php echo $text_reviews_title;?>" href="<?php echo $product['href']; ?>/#tab-review"><?php echo $product['reviews']; ?></a></span>
									<?php } ?>
									</span>
								</div>
							<?php } ?>	
							<?php if($on_off_description !='0') { ?>
								<div class="product-description"><?php echo $product['description']; ?></div>
							<?php } ?>
							
							<?php if ($show_options) { ?>
								<div id="option_dealsslider<?php echo $gcdealsslider;?>_<?php echo $product['product_id']; ?>" class="option dealsslider-opt">
									<?php foreach ($product['options'] as $key => $option) { ?>
										<?php if ($option['type'] == 'select'){ ?>
											<div class="form-group">
												<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
													<?php if ($option['required']) { ?><i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i><?php } ?>
													<?php echo $option['name']; ?>
												</label>
												<div id="input-option-dealsslider<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>">
													<select onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');" name="option[<?php echo $option['product_option_id']; ?>]" id="input-value-<?php echo $option['product_option_id']; ?>_dealsslider" class="form-control">
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
												<div id="input-option-dealsslider<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>">
												<?php foreach ($option['product_option_value'] as $option_value) { ?>
													<?php if ($option_value['image'] || $option_value['color']) { ?>
														<?php if ($option['status_color_type'] =='1') { ?>
															<div class="image-radio">
															  <label>
																<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_dealsslider" />
																<span for="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productany" class="color-option" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" style="background-color:<?php echo $option_value['color']?>"></span>						
															  </label>
															</div>
														<?php } else { ?>
															<div class="image-radio">
															  <label>
																<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_dealsslider" />
																<img for="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productany" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /> 						
															  </label>
															</div>
														<?php } ?>
													<?php } else { ?>
														<div class="radio-checbox-options">
															<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_dealsslider" />
															<label for="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_dealsslider">
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
											  <div id="input-option-dealsslider<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>">
												<?php foreach ($option['product_option_value'] as $option_value) { ?>
													<?php if ($option_value['image'] || $option_value['color']) { ?>
														<?php if ($option['status_color_type'] =='1') { ?>
															<div class="image-radio">
															  <label>
																<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_dealsslider" />
																<span for="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productany" class="color-option" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" style="background-color:<?php echo $option_value['color']?>"></span>						
															  </label>
															</div>
														<?php } else { ?>
															<div class="image-radio">
															  <label>
																<input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_dealsslider" />
																<img for="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productany" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /> 						
															  </label>
															</div>
														<?php } ?>
													<?php } else { ?>
														<div class="radio-checbox-options">
														  <input data-option-prefix="<?php echo $option_value['price_prefix']; ?>" data-option-price="<?php echo $option_value['price_value']; ?>" onchange="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_dealsslider" />
															<label for="input-value-<?php echo $gcdealsslider;?><?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_dealsslider">
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
										<input type="text" class="quantity-num form-control input-number-quantity<?php echo $product['product_id'];?>" name="quantity" <?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1') && $product['minimum'] > 1){?>disabled<?php } ?> id="input_quantity_mod_dealsslider<?php echo $gcdealsslider;?>_<?php echo $product['product_id'];?>" onkeyup="validate_quantity(this,'<?php echo $product['minimum']; ?>')" oninput="recalc_quantity(<?php echo $product['product_id'];?>,<?php echo $product['minimum']; ?>, <?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');" value="<?php echo $product['minimum']; ?>">
										<span class="quantity-btn">
											<span class="add-up add-action fa fa-angle-up" onclick="btnplus_cat_price_dealsslider<?php echo $gcdealsslider;?>_<?php echo $product['product_id'];?>('<?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1')){?><?php echo $product['minimum']; ?><?php } else { ?>1<?php } ?>');"></span>
											<span class="add-down add-action fa fa-angle-down" onclick="btnminus_cat_price_dealsslider<?php echo $gcdealsslider;?>_<?php echo $product['product_id'];?>('<?php if(isset($config_additional_settings_newstore['quantity_multiple']) && ($config_additional_settings_newstore['quantity_multiple'] == '1')){?><?php echo $product['minimum']; ?><?php } else { ?>1<?php } ?>');"></span>
										</span>
									</div>
								<script>
								<?php if(isset($config_additional_settings_newstore['price_recalc']) && ($config_additional_settings_newstore['price_recalc'] == '1') && $product['minimum'] > 1){?>
									$(window).load(function() {
									recalc_quantity('<?php echo $product['product_id'];?>','<?php echo $product['minimum']; ?>','<?php echo $product['price_no_format'];?>','<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');						
									});
								<?php } ?>
									function btnminus_cat_price_dealsslider<?php echo $gcdealsslider;?>_<?php echo $product['product_id'];?>(minimum){
										var $input = $('#input_quantity_mod_dealsslider<?php echo $gcdealsslider;?>_<?php echo $product['product_id'];?>');
										var count = parseInt($input.val()) - parseInt(minimum);
										count = count < parseInt(<?php echo $product['minimum']; ?>) ? parseInt(<?php echo $product['minimum']; ?>) : count;
										$input.val(count);
										$input.change();										
										recalc_quantity(<?php echo $product['product_id'];?>,count,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');						
									}
									function btnplus_cat_price_dealsslider<?php echo $gcdealsslider;?>_<?php echo $product['product_id'];?>(minimum){
										var $input = $('#input_quantity_mod_dealsslider<?php echo $gcdealsslider;?>_<?php echo $product['product_id'];?>');
										var count = parseInt($input.val()) + parseInt(minimum);
										$input.val(count);
										$input.change();
										recalc_quantity(<?php echo $product['product_id'];?>,count,<?php echo $product['price_no_format'];?>,'<?php echo $product['special_no_format'];?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>','dealsslider<?php echo $gcdealsslider;?>');					
									};																				
							</script>		
								<?php } ?>
								<?php } ?>
								</div>
								<div class="actions">						
									<?php if (($product['product_quantity'] <= 0) and $disable_cart_button){ ?>
										<div class="cart"><button class="btn btn-general" type="button" disabled><?php if($change_text_cart_button_out_of_stock ==1) { ?><i class="fa fa-lock" aria-hidden="true"></i> <span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button></div>
									<?php } else { ?>
										<div class="cart"><button class="btn btn-general" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>','dealsslider<?php echo $gcdealsslider;?>', get_cart_quantity('<?php echo $product['product_id']; ?>','.carousel_numb_dealsslider<?php echo $gcdealsslider;?>'));"><?php if($change_text_cart_button_out_of_stock ==1 && $product['product_quantity'] <= 0) { ?><i class="fa fa-lock" aria-hidden="true"></i> <span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button></div>
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
								
								
						</div>
						
						<?php if($status_timer_special =='1' && $product['special']){ ?>
						<div class="dealsslider-countdown" data-timer="<?php echo $product['date_end'];?>"></div>
						<?php } ?>	
						
					</div>
				</div>
			</div>
		<?php } ?>
	</div>
<script>
	$(".sync1<?php echo $gcdealsslider;?> .dealsslider-countdown").each(function () {
		var timer = $(this).data('timer');
		var parts_date = timer.split('-');
		var ts = new Date(parts_date[0], parts_date[1] - 1, parts_date[2]); 
		if((new Date()) > ts){
			ts = (new Date()).getTime() + 10*24*60*60*1000;
		}
		$(this).countdown({
			timestamp	: ts,
		});
	});


	$(".sync1<?php echo $gcdealsslider;?>").slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		infinite: true,
		arrows: true,
		prevArrow: "<button class=\"slick-prev slick-arrow\"><i class=\"fa fa-arrow-right\"></i></button>",
		nextArrow: "<button class=\"slick-next slick-arrow\"><i class=\"fa fa-arrow-left\"></i></button>",
		initialSlide: 0,
		fade: true,
		cssEase: 'linear',
		adaptiveHeight: true,
		asNavFor: '.sync2<?php echo $gcdealsslider;?>'
		
	});
	$(".sync2<?php echo $gcdealsslider;?>").slick({
		adaptiveHeight: true,
		vertical:true,
		arrows: false,
		autoplay: false,
		slidesToShow: 3,
		slidesToScroll: 1,
		infinite: true,
		initialSlide: 0,
		speed: 800,
		autoplaySpeed: 7000,
		asNavFor: '.sync1<?php echo $gcdealsslider;?>',
		pauseOnHover: true,
		dots: false,
		centerMode: true,
		focusOnSelect: true,
		responsive: [
			{
				breakpoint: 1199,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 1								}
			},
			{
				breakpoint: 991,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 1								}
			},
			{
				breakpoint: 767,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 1								}
			},
			{
				breakpoint: 479,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 1								}
			},
			{
				breakpoint: 320,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 1								}
			}
		]
	});
</script>
</div>
</div>
<?php } ?>