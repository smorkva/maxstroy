<?php echo $header; ?>
<div class="container">
<div class="col-sm-12 content-box-cs">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="error"></div>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>	
			<div class="row">
				<div class="col-xs-12">
					<h2><?php echo $heading_title; ?></h2>
					<div class="panel panel-default">
						<div class="panel-heading">
							 <h3 class="panel-title"><?php echo $text_cart; ?></h3>
						</div>
						<div class="panel-body">
					<div id="cart_table" class="checkout-table-wrap">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td class="text-left"><?php echo $column_image; ?></td>
									<td class="text-left"><?php echo $column_name; ?></td>
									<td class="text-left"><?php echo $column_model; ?></td>
									<td class="text-right"><?php echo $column_quantity; ?></td>
									<td class="text-right"><?php echo $column_price; ?></td>
									<td class="text-right"><?php echo $column_total; ?></td>
									<td class="delete_td text-center"></td>
								</tr>
							</thead>
							<tbody>
								<?php foreach ($products as $product) { ?>
								<tr>
									<td class="image text-center"><img src="<?php echo $product['thumb']; ?>" class="img-thumbnail" title="<?php echo $product['name']; ?>" /></td>
									<td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
										<?php foreach ($product['option'] as $option) { ?>
										<br />
										&nbsp;<small> - <?php echo $option['name']; ?>: <?php if (isset($option['option_value']) && !empty($option['option_value'])) echo $option['option_value'];else if (isset($option['value'])) echo $option['value']; ?></small>
									<?php } ?></td>
									<td class="text-left"><?php echo $product['model']; ?></td>
									<td class="text-right nsupdatequantitycheckout">
										<div class="input-group">
											<span class="input-group-btn">
												<button class="btn btn-default" type="button" onclick="updateQuantityCheckout('<?php echo $product['key']; ?>','<?php echo $product['quantity']-1; ?>');" >-</button>
											</span>
												<input type="text" class="form-control" value="<?php echo $product['quantity']; ?>" onchange="updateQuantityCheckout('<?php echo $product['key']; ?>', $(this).val());">
											<span class="input-group-btn">
												<button class="btn btn-default" type="button" onclick="updateQuantityCheckout('<?php echo $product['key']; ?>','<?php echo $product['quantity']+1; ?>');">+</button>
											</span>
										</div>
									</td>
									<td class="text-right"><?php echo $product['price']; ?></td>
									<td class="text-right"><?php echo $product['total']; ?></td>
									<td class="delete_td text-center"><button type="button" onclick="cart.remove('<?php echo $product['key']; ?>', <?php echo $product['product_id']; ?>);" title="<?php echo $button_remove; ?>" class="btn btn-link-delete"><i class="fa fa-trash-o"></i></button></td>
								</tr>
								<?php } ?>
								<?php foreach ($vouchers as $voucher) { ?>
									<tr>
										<td class="text-left"><?php echo $voucher['description']; ?></td>
										<td class="text-left hidden-xs"></td>
										<td class="text-right hidden-xs">1</td>
										<td class="text-right hidden-xs"><?php echo $voucher['amount']; ?></td>
										<td class="text-right"><?php echo $voucher['amount']; ?></td>
									</tr>
								<?php } ?>
							</tbody>
						</table>
						</div>
						<table class="coupon_table">
						<?php if ($coupon) { ?>
						<tr>
							<td>
								<div class="coupon input-group">
									<input type="text" name="coupon" value="" placeholder="<?php echo $entry_coupon; ?>" id="input-coupon" class="form-control" />
									<span class="input-group-btn">
										<button data-loading-text="<?php echo $text_loading; ?>" id="button-coupon" class="btn btn-primary"><?php echo $button_apply; ?></button>
									</span>
								</div>
							</td>
						</tr>
						<?php } ?>
						<?php if ($reward) { ?>
						<tr>
							<td>
								<div class="coupon input-group">
									<input type="text" name="reward" value="" placeholder="<?php echo $entry_reward; ?>" id="input-reward" class="form-control" />
									<span class="input-group-btn">
										<button data-loading-text="<?php echo $text_loading; ?>" id="button-reward" class="btn btn-primary"><?php echo $button_apply; ?></button>
									</span>
								</div>
							</td>
						</tr>
						<?php } ?>
						<?php if ($voucher) { ?>
						<tr>
							<td>
								<div class="coupon input-group">
									<input type="text" name="voucher" value="" placeholder="<?php echo $entry_voucher; ?>" id="input-voucher" class="form-control" />
									<span class="input-group-btn">
										<button data-loading-text="<?php echo $text_loading; ?>" id="button-voucher" class="btn btn-primary"><?php echo $button_apply; ?></button>
									</span>
								</div>
							</td>
						</tr>
						<?php } ?>
						</table>
						<table class="table_total">
							<?php foreach ($totals as $total) { ?>
									<tr>
										<td colspan="5" class="text-right  hidden-xs"><?php echo $total['title']; ?>:</td>
										<td colspan="1" class="text-right  visible-xs"><?php echo $total['title']; ?>:</td>
										<td class="text-right"><?php echo $total['text']; ?></td>
									</tr>
								<?php } ?>
						</table>
					</div>
					</div>
					</div>
				</div>
			</div>
			<?php if (!isset($address)) {?>
			<div class="row">
			<div class="col-md-12">
			    <div class="well"><?php echo $text_returning_customer; ?> &nbsp;<a href="#" data-toggle="modal" data-target="#login-form"><?php echo $text_i_am_returning_customer; ?></a></div>			    
				<div id="login-form" class="modal fade" role="dialog">
					  <div class="modal-dialog modal-sm">
						<div class="modal-content">
						<form role="form">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title"><?php echo $button_login; ?></h4>
							</div>
							<div class="message"></div>
							<div class="modal-body">
								<div class="col-lg-12">
									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-envelope"></i></span> 
										  <input type="text" name="email" value="" placeholder="<?php echo str_replace(':','',$entry_email); ?>" id="input-email" class="form-control" />
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-lock"></i></span>	
										  <input type="password" name="password" value="" placeholder="<?php echo str_replace(':','',$entry_password); ?>" id="input-password" class="form-control" />
										</div>
									</div>
								</div>
								<div class="form-group text-center">
									<a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
								</div>
							</div>
							<div class="modal-footer">
								<input type="button" value="<?php echo $button_login; ?>" id="button-login" data-loading-text="<?php if (isset($text_loading)) echo $text_loading;else echo 'loading ...' ?>" class="btn btn-primary btn-block" />
								
							</div>
							</form>
						</div>

					  </div>
				</div>
		    </div>
		</div>
		<?php } ?>
		<div id="onepcheckout" class="row checkout_form">
		    <div class="col-md-6 register_block">
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							 <h3 class="panel-title"><?php echo $text_your_details; ?></h3>
						</div>
						<div class="panel-body">
							<div class="form-group col-xs-6 required">
							  <div class="col-sm-12">
								<input type="text" name="firstname" value="<?php if (isset($address['firstname'])) echo $address['firstname']; elseif (isset($firstname)) echo $firstname; ?>" placeholder="<?php echo str_replace(':','',$entry_firstname); ?>" id="input-payment-firstname" class="form-control" <?php if (isset($customer_id)) {?> readonly<?php }?>/>
							  </div>
							</div>
							
							<div class="form-group col-xs-6 <?php if($details_last_name=='required') { ?>required<?php } ?>" <?php if(!$details_last_name) { ?>style="display:none"<?php } ?>>
							  <div class="col-sm-12">
								<input type="text" name="lastname" value="<?php if (isset($lastname)) echo $lastname;?>" placeholder="<?php echo str_replace(':','',$entry_lastname); ?>" id="input-payment-lastname" class="form-control" <?php if (isset($customer_id)) {?> readonly<?php }?>/>
							  </div>
							</div>
														
							<div class="form-group col-xs-6 <?php if($details_telephone=='required') { ?>required<?php } ?>" <?php if(!$details_telephone) { ?>style="display:none"<?php } ?>>								
								<div class="col-sm-12">
									<input type="text" name="telephone" value="<?php if (isset($telephone)) echo $telephone;?>" placeholder="<?php echo str_replace(':','',$entry_telephone); ?>" id="input-payment-telephone" class="form-control" <?php if (isset($customer_id)) {?> readonly<?php }?>/>
								</div>
							</div>
							<div class="form-group col-xs-6 <?php if($details_payment_email=='required') { ?>required<?php } ?>"  <?php if(!$details_payment_email) { ?>style="display:none"<?php } ?>>
								<div class="col-sm-12">
									<input type="text" name="email" value="<?php if (isset($email)) echo $email;?>" placeholder="<?php echo str_replace(':','',$entry_email); ?>" id="input-payment-email" class="form-control" <?php if (isset($customer_id)) {?> readonly<?php }?>/>
								</div>
							</div>
							<div class="form-group col-xs-6" <?php if(!$details_payment_fax) { ?>style="display:none"<?php } ?>>
								<div class="col-sm-12">
									<input type="text" name="fax" value="<?php if (isset($fax)) echo $fax;?>" placeholder="<?php echo str_replace(':','',$entry_fax); ?>" id="input-payment-fax" class="form-control" <?php if (isset($customer_id)) {?> readonly<?php }?>/>
								</div>
							</div>
							 <?php if(($details_payment_email=='required') || ($details_payment_email=='no_required')) { ?>
							<?php if (!isset($customer_id)) {?>	
								<div class="form-group col-xs-12">
								<label>
									<input type="checkbox" name="register" onclick="jQuery('.register-form').toggle()">&nbsp;<?php echo $text_register; ?>
								</label>
								</div>    
							<?php } ?>
							<?php } ?>
							<div class="register-form" style="display:none">
								<div class="form-group col-xs-12">
									<label class="control-label"><?php echo $entry_customer_group; ?>:&nbsp;</label>
									<?php foreach ($customer_groups as $customer_group) { ?>
										<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
										<div class="radio">
											<label>
												<input type="radio"  name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
												<?php echo $customer_group['name']; ?>
											</label>
										</div>
										<?php } else { ?>
										<div class="radio">
											<label>
												<input type="radio" checked="checked" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
												<?php echo $customer_group['name']; ?>
											</label>
										</div>
										<?php } ?>
									<?php } ?>
								</div>
								<div class="form-group col-xs-6 required">									
									<div class="col-sm-12">
										<input type="password" name="password" value="" placeholder="<?php echo str_replace(':','',$entry_password); ?>" id="input-payment-password" class="form-control" />
									</div>
								</div>
								<div class="form-group col-xs-6 required">									
									<div class="col-sm-">
										<input type="password" name="confirm" value="" placeholder="<?php echo str_replace(':','',$entry_confirm); ?>" id="input-payment-confirm" class="form-control" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							 <h3 class="panel-title"><?php echo $text_your_address; ?></h3>
						</div>
						<div class="panel-body">
							<?php if ($addresses) { ?>
								<?php if (isset($customer_id)) {?>	  
								<div class="form-group col-xs-12">
								<div class="radio">
									<label>
										<input type="radio" name="payment_address" value="existing" checked="checked" onclick="jQuery('#payment-address-new').hide()" />
										<?php echo $text_address_existing; ?>
									</label>
								</div>
								</div>
								<div id="payment-existing">
								<div class="form-group col-xs-12">
									<select name="payment_address_id" class="form-control">
										<?php foreach ($addresses as $address) { ?>
											<?php if (isset($payment_address_id) && $address['address_id'] == $payment_address_id) { ?>
												<option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
								</div>
								</div>
								<?php } ?>
							  
								<?php if (isset($customer_id)) {?>	  
								<div class="form-group col-xs-12">
								<div class="radio">
									<label>
										<input type="radio" name="payment_address" value="new" onclick="jQuery('#payment-address-new').show();"/>
										<?php echo $text_address_new; ?>
									</label>
								</div>
								</div>
								<?php } ?>
							<?php } ?>
							
							<div id="payment-address-new" <?php if (isset($customer_id) && $addresses) {?>	style="display:none"<?php } ?>>	
								<div class="form-group col-xs-6 required">
									<div class="col-sm-12">
										<select name="country_id" id="input-payment-country" class="form-control">
										  <option value=""><?php echo $text_select; ?></option>
										  <?php foreach ($countries as $country) { ?>
										  <?php if ($country['country_id'] == $country_id) { ?>
										  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
										  <?php } else { ?>
										  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
										  <?php } ?>
										  <?php } ?>
										</select>
									</div>
								</div>	
								<div class="form-group col-xs-6 required">
									<div class="col-sm-12">
										<select name="zone_id" id="input-payment-zone" class="form-control">
										</select>
									</div>
								</div>
								<div class="form-group col-xs-6" <?php if(!$address_payment_company) { ?>style="display:none"<?php } ?>>
									<div class="col-sm-12">
										<input type="text" name="company" value="<?php if (isset($company)) echo $company;?>" placeholder="<?php echo str_replace(':','',$entry_company); ?>" id="input-payment-company" class="form-control" />
									</div>
								</div>
								<div class="form-group col-xs-6 <?php if($address_payment_city=='required') { ?>required<?php } ?>"  <?php if(!$address_payment_city) { ?>style="display:none"<?php } ?>>									
									<div class="col-sm-12">
										<input type="text" name="city" value="<?php if (isset($city)) echo $city;?>" placeholder="<?php echo str_replace(':','',$entry_city); ?>" id="input-payment-city" class="form-control" />
									</div>
								</div>
								<div class="form-group col-xs-6 <?php if($address_payment_address_1=='required') { ?>required<?php } ?>"  <?php if(!$address_payment_address_1) { ?>style="display:none"<?php } ?>>
									<div class="col-sm-12">
										<input type="text" name="address_1" value="<?php if (isset($address_1)) echo $address_1;?>" placeholder="<?php echo str_replace(':','',$entry_address_1); ?>" id="input-payment-address-1" class="form-control" />
									</div>
								</div>
								<div class="form-group col-xs-6" <?php if(!$address_payment_address_2) { ?>style="display:none"<?php } ?>>									
									<div class="col-sm-12">
										<input type="text" name="address_2" value="<?php if (isset($address_2)) echo $address_2;?>" placeholder="<?php echo str_replace(':','',$entry_address_2); ?>" id="input-payment-address-2" class="form-control" />
									</div>
								</div>
								<div class="form-group col-xs-6" <?php if(!$address_payment_postcode) { ?>style="display:none"<?php } ?>>									
									<div class="col-sm-12">
										<input type="text" name="postcode" value="<?php if (isset($postcode)) echo $postcode;?>" placeholder="<?php echo str_replace(':','',$entry_postcode); ?>" id="input-payment-postcode" class="form-control" />
									</div>
								</div>
								<?php foreach ($custom_fields as $custom_field) { ?>
								<?php if ($custom_field['location'] == 'address') { ?>
								<?php if ($custom_field['type'] == 'select') { ?>
								<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">								  
								  <div class="col-sm-12">
									<select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
									  <option value=""><?php echo $text_select; ?></option>
									  <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
									  <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
									  <?php } ?>
									</select>
								  </div>
								</div>
								<?php } ?>
								<?php if ($custom_field['type'] == 'radio') { ?>
								<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">								 
								  <div class="col-sm-12">
									<div id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>">
									  <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
									  <div class="radio">
										<label>
										  <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
										  <?php echo $custom_field_value['name']; ?></label>
									  </div>
									  <?php } ?>
									</div>
								  </div>
								</div>
								<?php } ?>
								<?php if ($custom_field['type'] == 'checkbox') { ?>
								<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
								  <div class="col-sm-12">
									<div id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>">
									  <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
									  <div class="checkbox">
										<label>
										  <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
										  <?php echo $custom_field_value['name']; ?></label>
									  </div>
									  <?php } ?>
									</div>
								  </div>
								</div>
								<?php } ?>
								<?php if ($custom_field['type'] == 'text') { ?>
								<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">								 
								  <div class="col-sm-12">
									<input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
								  </div>
								</div>
								<?php } ?>
								<?php if ($custom_field['type'] == 'textarea') { ?>
								<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
								  <div class="col-sm-12">
									<textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo $custom_field['value']; ?></textarea>
								  </div>
								</div>
								<?php } ?>
								<?php if ($custom_field['type'] == 'file') { ?>
								<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
								  <div class="col-sm-12">
									<button type="button" id="button-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
									<input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
								  </div>
								</div>
								<?php } ?>
								<?php if ($custom_field['type'] == 'date') { ?>
								<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
								  <div class="col-sm-12">
									<div class="input-group date">
									  <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
									  <span class="input-group-btn">
									  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									  </span></div>
								  </div>
								</div>
								<?php } ?>
								<?php if ($custom_field['type'] == 'time') { ?>
								<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">								 
								  <div class="col-sm-12">
									<div class="input-group time">
									  <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
									  <span class="input-group-btn">
									  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									  </span></div>
								  </div>
								</div>
								<?php } ?>
								<?php if ($custom_field['type'] == 'datetime') { ?>
								<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">								 
								  <div class="col-sm-12">
									<div class="input-group datetime">
									  <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
									  <span class="input-group-btn">
									  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									  </span></div>
								  </div>
								</div>
								<?php } ?>
								<?php } ?>
								<?php } ?>
								<div class="shiptobilling clearfix form-group col-xs-12" <?php if(!$address_shipping_address) { ?>style="display:none"<?php } ?>>					    
									<?php if (!isset($customer_id)) {?>
										<div class="checkbox">
											<label>
												<input type="checkbox" name="shipping_address" value="new" <?php if (isset($address_id)) echo 'checked="checked"';?> onclick="jQuery('.shipping-address').toggle()"><?php echo $text_address_new; ?>
											</label>
										</div>
									<?php } ?>
								</div>
							</div>
						</div>
					</div>
				</div>	
		      </div> <!--end ROW-->
			  <div class="row" <?php if(!$address_shipping_address) { ?>style="display:none"<?php } ?>>
				<div  class="shipping-address" <?php if (isset($shipping_address_id) || isset($customer_id)) echo 'style="display:block"'; else echo 'style="display:none"'; ?>>
					<div class="col-sm-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								 <h3 class="panel-title"><?php echo $text_checkout_shipping_address; ?></h3>
							</div>
							<div class="panel-body">
								 <?php if ($addresses) { ?>
									  <?php if (isset($customer_id)) {?>
									<div class="form-group col-xs-12">									  
										<div class="radio">
											<label>
											<input type="radio" name="shipping_address" id="jkl" value="existing" checked="checked" onclick="jQuery('#shipping-new').hide()" />
											<?php echo $text_address_existing; ?></label>
										</div>
									</div>
								<div id="shipping-existing">
								<div class="form-group col-xs-12">
									<select name="shipping_address_id" class="form-control">
									  <?php foreach ($addresses as $address) { ?>
									  <?php if (isset($shipping_address_id) && $address['address_id'] == $shipping_address_id) { ?>
									  <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
									  <?php } else { ?>
									  <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
									  <?php } ?>
									  <?php } ?>
									</select>
								</div>
								</div>
									  <?php } ?>
									<?php if (isset($customer_id)) {?>
									<div class="form-group col-xs-12">
									  <div class="radio">
									  <label>
									  <input type="radio" name="shipping_address" value="new" onclick="jQuery('#shipping-new').show();"/>
									  <?php echo $text_address_new; ?></label>
									  </div>
									</div>
									  <?php } ?>
									  <?php } ?>
									  <br />
									  
									 <div id="shipping-new" style="display: <?php echo (($addresses && isset($customer_id)) ? 'none' : 'block'); ?>;">
										<div class="form-group col-xs-6 required">
											<div class="col-sm-12">
												<input type="text" name="shipping_firstname" value="" placeholder="<?php echo str_replace(':','',$entry_firstname); ?>" id="input-shipping-firstname" class="form-control" />
											</div>
										</div>
										<div class="form-group col-xs-6 required">
											<div class="col-sm-12">
												<input type="text" name="shipping_lastname" value="" placeholder="<?php echo str_replace(':','',$entry_lastname); ?>" id="input-shipping-lastname" class="form-control" />
											</div>
										</div>
										<div class="form-group col-xs-6">
											<div class="col-sm-12">
												<input type="text" name="shipping_company" value="" placeholder="<?php echo str_replace(':','',$entry_company); ?>" id="input-shipping-company" class="form-control" />
											</div>
										</div>
										<div class="form-group col-xs-6 required">
											<div class="col-sm-12">
												<input type="text" name="shipping_address_1" value="" placeholder="<?php echo str_replace(':','',$entry_address_1); ?>" id="input-shipping-address-1" class="form-control" />
											</div>
										</div>
										<div class="form-group col-xs-6 required">
											<div class="col-sm-12">
												<input type="text" name="shipping_address_2" value="" placeholder="<?php echo str_replace(':','',$entry_address_2); ?>" id="input-shipping-address-2" class="form-control" />
											</div>
										</div>
										<div class="form-group col-xs-6 required">		
											<div class="col-sm-12">
												<input type="text" name="shipping_city" value="" placeholder="<?php echo str_replace(':','',$entry_city); ?>" id="input-shipping-city" class="form-control" />
											</div>
										</div>
										<div class="form-group col-xs-6 required">											
											<div class="col-sm-12">
												<input type="text" name="shipping_postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo str_replace(':','',$entry_postcode); ?>" id="input-shipping-postcode" class="form-control" />
											</div>
										</div>
										<div class="form-group col-xs-6 required">
											<div class="col-sm-12">
												<select name="shipping_country_id" id="input-shipping-country" class="form-control">
												  <option value=""><?php echo $text_select; ?></option>
												  <?php foreach ($countries as $country) { ?>
												  <?php if ($country['country_id'] == $country_id) { ?>
												  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
												  <?php } else { ?>
												  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
												  <?php } ?>
												  <?php } ?>
												</select>
											</div>
										</div>
										<div class="form-group col-xs-6 required">
											<div class="col-sm-12">
												<select name="shipping_zone_id" id="input-shipping-zone" class="form-control">
												</select>
											</div>
										</div>
										
										
										<?php if (isset($custom_fields)) foreach ($custom_fields as $custom_field) { ?>
										<?php if ($custom_field['type'] == 'select') { ?>
										<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
										  <div class="col-sm-12">
											<select name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
											  <option value=""><?php echo $text_select; ?></option>
											  <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
											  <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
											  <?php } ?>
											</select>
										  </div>
										</div>
										<?php } ?>
										<?php if ($custom_field['type'] == 'radio') { ?>
										<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
										  <div class="col-sm-12">
											<div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
											  <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
											  <div class="radio">
											<label>
											  <input type="radio" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
											  <?php echo $custom_field_value['name']; ?></label>
											  </div>
											  <?php } ?>
											</div>
										  </div>
										</div>
										<?php } ?>
										<?php if ($custom_field['type'] == 'checkbox') { ?>
										<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
										  <div class="col-sm-12">
											<div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
											  <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
											  <div class="checkbox">
											<label>
											  <input type="checkbox" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
											  <?php echo $custom_field_value['name']; ?></label>
											  </div>
											  <?php } ?>
											</div>
										  </div>
										</div>
										<?php } ?>
										<?php if ($custom_field['type'] == 'text') { ?>
										<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
										  <div class="col-sm-12">
											<input type="text" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
										  </div>
										</div>
										<?php } ?>
										<?php if ($custom_field['type'] == 'textarea') { ?>
										<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
										  <div class="col-sm-12">
											<textarea name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo $custom_field['value']; ?></textarea>
										  </div>
										</div>
										<?php } ?>
										<?php if ($custom_field['type'] == 'file') { ?>
										<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">										  
										  <div class="col-sm-12">
											<button type="button" id="button-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
											<input type="hidden" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
										  </div>
										</div>
										<?php } ?>
										<?php if ($custom_field['type'] == 'date') { ?>
										<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">										  
										  <div class="col-sm-12">
											<input type="date" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
										  </div>
										</div>
										<?php } ?>
										<?php if ($custom_field['type'] == 'datetime') { ?>
										<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">										  
										  <div class="col-sm-12">
											<input type="datetime-local" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
										  </div>
										</div>
										<?php } ?>
										<?php if ($custom_field['type'] == 'time') { ?>
										<div class="form-group col-xs-6 <?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">										 
										  <div class="col-sm-12">
											<input type="time" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
										  </div>
										</div>
										<?php } ?>
										<?php } ?>
										  </div>  
							</div>
						</div>
					</div>
				</div>
				</div>
		    </div>			      
		    <div class="col-md-6">
				<div class="row">				
					<div class="col-sm-12">
					<?php if ($error_warning) { ?>
						<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
					<?php } ?>
						<div class="panel panel-default">
							<div class="panel-heading">
								 <h3 class="panel-title"><i class="fa fa-truck fa-fw"></i><?php echo $title_shipping_method;?></h3>
							</div>
							<div class="panel-body">
							<div class="shipping-method col-xs-12">
							<p><?php echo $text_shipping_method; ?></p>
							<?php foreach ($shipping_methods as $shipping_method) { ?>
								<p><strong><?php echo $shipping_method['title']; ?></strong></p>
								<?php if (!$shipping_method['error']) { ?>
								<?php foreach ($shipping_method['quote'] as $quote) { ?>
								<div class="radio">
								  <label>
									<?php if ($quote['code'] == $code || !$code) { ?>
									<?php $code = $quote['code']; ?>
									<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>"  title="<?php echo $quote['title']; ?>" checked="checked" />
									<?php } else { ?>
									<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>"  title="<?php echo $quote['title']; ?>" />
									<?php } ?>
									<?php echo $quote['title']; ?> - <?php echo $quote['text']; ?></label>
								</div>
								<?php } ?>
								<?php } else { ?>
								<div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
								<?php } ?>
								<?php } ?>
							</div>
							</div>
						</div>
					</div>
					
					<div class="col-sm-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								 <h3 class="panel-title"><i class="fa fa-credit-card fa-fw"></i><?php echo $title_payment_method;?></h3>
							</div>
							<div class="panel-body">
								<div class="payment-method col-xs-12">						    
									<?php if ($error_warning) { ?>
									<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
									<?php } ?>
									<?php if ($payment_methods) { ?>
									<p><?php echo $text_payment_method; ?></p>
									<?php foreach ($payment_methods as $payment_method) { ?>
									<div class="radio">
									  <label>
										<?php if ($payment_method['code'] == $code || !$code) { ?>
										<?php $code = $payment_method['code']; ?>
										<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" title="<?php echo $payment_method['title']; ?>" checked="checked" />
										<?php } else { ?>
										<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" title="<?php echo $payment_method['title']; ?>" />
										<?php } ?>
										<?php echo $payment_method['title']; ?></label>
									</div>
									<?php } ?>
									<?php } ?>
									</div>
							</div>
						</div>
					</div>
					<div class="col-xs-12">
						<p><strong><?php echo $text_comments; ?></strong></p>
						<p><textarea name="comment" rows="3" class="form-control"><?php echo $comment; ?></textarea></p>
					</div>
				</div>
			</div>
			<div class="col-xs-12">
			<div class="all_total_checkout_footer col-md-12 text-right"><h3><span><?php echo $text_total_checkout; ?></span><span class="total_html"></span></h3></div>
			<?php if ($text_agree) { ?>
				<div class="buttons clearfix">
				   <div class="pull-right"><?php echo $text_agree; ?>
						<?php if ($agree) { ?>
							<input type="checkbox" name="agree" value="1" checked="checked" />
						<?php } else { ?>
							<input type="checkbox" name="agree" value="1" />
						<?php } ?>
						&nbsp;
					</div>
				</div>
			<?php } ?>
				<div class="pull-right payment clearfix">
					<?php if ($payment) echo $payment; else {?>
						<input type="button" class="btn btn-primary" data-loading-text="<?php if (isset($text_loading)) echo $text_loading;else echo 'loading ...' ?>" id="button-register" value="<?php echo $heading_title;?>">
					<?php }?>
				</div>
			</div>
		</div>
		
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script><!--
var error = true;
var color_schem = '<?php echo $color_schem?>';
var ajax_loader = '<img src="catalog/view/theme/cyberstore/image/ring-alt-'+ color_schem +'.svg" />';
function creatOverlayLoadPageCheckout(action) {
	if (action) {
		$('#messageLoadPage').html(ajax_loader);
		$('#messageLoadPage').show();
	} else {
		$('#messageLoadPage').html('');
		$('#messageLoadPage').hide();
	}
}
$('body').prepend('<div id="messageLoadPage"></div><div id="overlay"></div>');
// Login
$(document).delegate('#button-login', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/onepcheckout/login_validate',
        type: 'post',
        data: $('#login-form :input'),
        dataType: 'json',
        beforeSend: function() {
        	$('#button-login').button('loading');	
		},  
        complete: function() {
            $('#button-login').button('reset');		
        },              
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $('#login-form .message').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
           }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

// Register
$(document).delegate('#button-register', 'click', function() {
	var data = $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked, .checkout_form textarea, .checkout_form select').serialize();
	data += '&_shipping_method='+ jQuery('.checkout_form input[name=\'shipping_method\']:checked').prop('title') + '&_payment_method=' + jQuery('.checkout_form input[name=\'payment_method\']:checked').prop('title');
	
    $.ajax({
        url: 'index.php?route=checkout/onepcheckout/validate',
        type: 'post',
        data: data,
        dataType: 'json',
        beforeSend: function() {
			$('#button-register').button('loading');
			creatOverlayLoadPageCheckout(true);
		},  
        complete: function() {
            $('#button-register').button('reset');
			creatOverlayLoadPageCheckout(false);
        },          
       success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-control').removeClass('error_input_checkout');	            
            if (json['redirect']) {
                location = json['redirect'];                
            } else if (json['error']) {
				error = true;
                if (json['error']['warning']) {
                    $('.error').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					$('html, body').animate({ scrollTop: $('.alert-danger')}, 250);
				}
                
				for (i in json['error']) {
					$('[name="' + i + '"]').attr('placeholder',json['error'][i]);
					$('[name="' + i + '"]').addClass('error_input_checkout');	
				}
            } else {
				error = false;
				jQuery('[name=\'payment_method\']:checked').click();
            }    
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

$('select[name=\'country_id\']').on('change', function() {
	$.ajax({
        url: 'index.php?route=checkout/onepcheckout/country&country_id=' + this.value,
        dataType: 'json',     
        success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
			}
			            
            html = '<option value=""><?php echo $text_select; ?></option>';
            
            if (json['zone'] && json['zone'] != '') {
                for (i = 0; i < json['zone'].length; i++) {
                    html += '<option value="' + json['zone'][i]['zone_id'] + '"';
                    
                    if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                        html += ' selected="selected"';
                    }
    
                    html += '>' + json['zone'][i]['name'] + '</option>';
                }
            } else {
                html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
            }
            
            $('select[name=\'zone_id\']').html(html).val("");
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});


$('select[name=\'shipping_country_id\']').on('change', function() {
	$.ajax({
        url: 'index.php?route=checkout/onepcheckout/country&country_id=' + this.value,
        dataType: 'json',        
        success: function(json) {
            html = '<option value=""><?php echo $text_select; ?></option>';
            
            if (json['zone'] && json['zone'] != '') {
                for (i = 0; i < json['zone'].length; i++) {
                    html += '<option value="' + json['zone'][i]['zone_id'] + '"';
                    
                    if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                        html += ' selected="selected"';
                    }
    
                    html += '>' + json['zone'][i]['name'] + '</option>';
                }
            } else {
                html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
            }
            
            $('select[name=\'shipping_zone_id\']').html(html).val("");
			
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

$('select[name=\'country_id\'], select[name=\'zone_id\'], select[name=\'shipping_country_id\'], select[name=\'shipping_zone_id\'], input[type=\'radio\'][name=\'payment_address\'], input[type=\'radio\'][name=\'shipping_address\']').on('change', function() {
	if (this.name == 'contry_id') jQuery("select[name=\'zone_id\']").val("");
	if (this.name == 'shipping_country_id') jQuery("select[name=\'shipping_zone_id\']").val("");
    jQuery(".shipping-method").load('index.php?route=checkout/onepcheckout/shipping_method', $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked,input[name=\'shipping_method\']:first, .checkout_form textarea, .checkout_form select'), function() {
		if (jQuery("input[name=\'shipping_method\']:first").length) {
			jQuery("input[name=\'shipping_method\']:first").attr('checked', 'checked').prop('checked', true).click();
		} else {
			jQuery("#cart_table").load('index.php?route=checkout/onepcheckout/cart', $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked, .checkout_form textarea, .checkout_form select'));	
		}
    });
});

$(document).delegate('input[name=\'shipping_method\']', 'click', function() {
    jQuery("#cart_table").load('index.php?route=checkout/onepcheckout/cart', $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked, .checkout_form textarea, .checkout_form select'));
	payment_update();
	update_cart();
});  



$('select[name=\'country_id\']').trigger('change');
jQuery(window).load(function() {
	jQuery('[name=\'payment_method\']:first').attr('checked', true).prop('checked', true);
	jQuery("input[name=\'payment_method\']:first").attr('checked', 'checked').prop('checked', true).click();
});


function updateQuantityCheckout(key, quantity) {
	$.ajax({
		url: 'index.php?route=checkout/onepcheckout/cart_edit',
		type: 'post',
		data: 'quantity[' + key + ']='+quantity,
		dataType: 'html',
		beforeSend: function() {
			creatOverlayLoadPageCheckout(true);
		},
		complete: function() {
			creatOverlayLoadPageCheckout(false);
		},
		success: function(data) {
			setTimeout(function () {
				$('.shopping-cart #cart').load('index.php?route=common/cart/info .shopping-cart #cart');
			}, 100);
			update_checkout();
		},
	       error: function(xhr, ajaxOptions, thrownError) {
	           alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	       }
	});
}
function update_cart() {	
	var data = $('.checkout_form input[type=\'radio\']:checked, .checkout_form select')
	$('#cart_table').load('index.php?route=checkout/onepcheckout/cart', data, function() {
	$('.all_total_checkout_footer h3 span.total_html').html($('.table_total td:last').html())
	});	
	setTimeout(function () {
		$('.shopping-cart #cart').load('index.php?route=common/cart/info .shopping-cart #cart');
	}, 100);	
}
function update_checkout() {	
	shipping_update();
	payment_update();
	var data = $('.checkout_form input[type=\'radio\']:checked, .checkout_form select')
	$('#cart_table').load('index.php?route=checkout/onepcheckout/cart', data, function() {
	$('.all_total_checkout_footer h3 span.total_html').html($('.table_total td:last').html())
	});
}
function shipping_update() {
	var data = $('.checkout_form input[type=\'radio\']:checked, .checkout_form select').serialize();
	$.ajax({
		url: 'index.php?route=checkout/onepcheckout/shipping_method',
		type: 'post',
		data: data,
		dataType: 'html',
		success: function(html) {
			$('.shipping-method').html(html);
			if (jQuery("input[name=\'shipping_method\']:first").length) {
				jQuery("input[name=\'shipping_method\']:first").attr('checked', 'checked').prop('checked', true).click();
			}	
			update_cart();						
		}
	});
}
function payment_update() {
	var data = $('.checkout_form input[type=\'radio\']:checked, .checkout_form select').serialize();
	$.ajax({
		url: 'index.php?route=checkout/onepcheckout/payment_method',
		type: 'post',
		data: data,
		dataType: 'html',
		success: function(html) {
			$('.payment-method').html(html);
		}
	});
}

$('body').on('click', '#button-coupon', function() {
	$.ajax({
		url: 'index.php?route=extension/total/coupon/coupon',
		type: 'post',
		data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
		dataType: 'json',
		beforeSend: function() {
			$('#button-coupon').button('loading');
		},
		complete: function() {
			$('#button-coupon').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('.error').append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['redirect']) {
				update_checkout();
			}
		}
	});
});
$('body').on('click', '#button-reward', function() {
	$.ajax({
		url: 'index.php?route=extension/total/reward/reward',
		type: 'post',
		data: 'reward=' + encodeURIComponent($('input[name=\'reward\']').val()),
		dataType: 'json',
		beforeSend: function() {
			$('#button-reward').button('loading');
		},
		complete: function() {
			$('#button-reward').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('.error').append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['redirect']) {
				update_checkout();
			}
		}
	});
});
$('body').on('click', '#button-voucher', function() {
  $.ajax({
    url: 'index.php?route=extension/total/voucher/voucher',
    type: 'post',
    data: 'voucher=' + encodeURIComponent($('input[name=\'voucher\']').val()),
    dataType: 'json',
    beforeSend: function() {
      $('#button-voucher').button('loading');
    },
    complete: function() {
      $('#button-voucher').button('reset');
    },
    success: function(json) {
		$('.alert').remove();

		if (json['error']) {
			$('.error').append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
		}

		if (json['redirect']) {
			update_checkout();
		}
    }
  });
});


$('body').delegate('[name=\'payment_method\']','click', function() {
	var data = $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked, .checkout_form textarea, .checkout_form select').serialize();
	data += '&_shipping_method='+ jQuery('.checkout_form input[name=\'shipping_method\']:checked').prop('title') + '&_payment_method=' + jQuery('.checkout_form input[name=\'payment_method\']:checked').prop('title');

	if (!error)
    $.ajax({
        url: 'index.php?route=checkout/onepcheckout/confirm',
        type: 'post',
        data: data,
        success: function(html){
			$('.payment').html(html);
				if ($('.payment h2, .payment p, .payment form').size()) {
					$('.payment').css('display', 'block');
				} else {
					$('.payment').css('display', 'none');
					$("#button-confirm").click();
				}
			
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});
//--></script> 
</div>
<?php echo $footer; ?>