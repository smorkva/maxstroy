<div id="popup-editor-product">
	<div class="title-editor"><?php echo $entry_special;?></div>
	  <form class="form-horizontal" id="form-product-special" enctype="multipart/form-data" method="post">
		<div class="form-group">
			<div class="col-sm-12">
				<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_special_info;?></div>
			</div>
		</div>
		<div class="table-responsive">
			<table id="special" class="table table-bordered" style="background:#fff;">
				<tr>
					<td class="text-left"><?php echo $entry_customer_group; ?></td>
					<td class="text-left"><?php echo $entry_priority; ?></td>
					<td class="text-left"><?php echo $entry_method; ?></td>
					<td class="text-left"><?php echo $entry_type_price; ?></td>
					<td class="text-left"><?php echo $entry_price; ?></td>
					<td class="text-left"><?php echo $entry_date_start; ?></td>
					<td class="text-left"><?php echo $entry_date_end; ?></td>
					<td></td>
				</tr>
			<?php $special_row = 0; ?>
			<?php foreach ($product_specials as $product_special) { ?>
				<tr id="special-row<?php echo $special_row; ?>">
					<td class="text-left">
						<select class="form-control" name="product_special[<?php echo $special_row; ?>][customer_group_id]">
						  <?php foreach ($customer_groups as $customer_group) { ?>
							<?php if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>
							  <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
							<?php } else { ?>
							  <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
							<?php } ?>
						  <?php } ?>
						</select>
					</td>
					<td class="text-left"><input class="form-control" type="text" name="product_special[<?php echo $special_row; ?>][priority]" value="<?php echo $product_special['priority']; ?>" size="2" /></td>
					<td class="text-left">
						<select class="form-control" id="input-quantity-method" name="product_special[<?php echo $special_row; ?>][price_method]">
							<option value="equality"><?php echo $text_method_equality;?></option>
							<option value="plus"><?php echo $text_method_plus;?></option>
							<option value="minus"><?php echo $text_method_minus;?></option>
							<option value="multiply"><?php echo $text_method_multiply;?></option>
							<option value="divide"><?php echo $text_method_divide;?></option>					 
						</select>
					</td>
					<td class="text-left">
						<select class="form-control" id="input-price-type" name="product_special[<?php echo $special_row; ?>][price_type]">
							<option value="fix"><?php echo $text_price_type_fix;?></option>
							<option value="percent"><?php echo $text_price_type_percent;?></option>
						</select>
					</td>
					<td class="text-left"><input class="form-control" type="text" name="product_special[<?php echo $special_row; ?>][price]" value="<?php echo $product_special['price']; ?>" /></td>
					<td class="text-left" style="width: 20%;">
						<div class="input-group date">
							<input type="text" name="product_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $product_special['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
							<span class="input-group-btn">
								<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
							</span>
						</div>
					</td>
					<td class="text-left" style="width: 20%;">
						<div class="input-group date">
							<input type="text" name="product_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $product_special['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
							<span class="input-group-btn">
								<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
							</span>
						</div>
					</td>
					
					<td class="text-left"><a onclick="$('#special-row<?php echo $special_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-delete-editor"><i class="fa fa-minus-circle"></i></a></td>
				</tr>
			  <?php $special_row++; ?>
			<?php } ?>
			  <tr id="specialf">
				<td colspan="7"></td>
				<td class="text-left"><a onclick="addSpecial();" data-toggle="tooltip" title="<?php echo $button_add_special; ?>" class="btn btn-add-editor"><i class="fa fa-plus-circle"></i></a></td>
			  </tr>  
			
		  </table>
		</div> 
	  </form>
	<div class="text-right">
		<button onclick="$('.popup_banner').popup('hide');groupEditorRefresh();" class="btn-editor btn-cancel-editor" type="button"><?php echo $button_cancel;?></button>
		<button onclick="saveGroupEditor();" data-loading-text="<?php echo $text_loading_editor; ?>" class="btn-editor btn-save-editor" type="button"><?php echo $button_save;?></button>
	</div>
<script>
function saveGroupEditor() { 	
	$.ajax({
		url: 'index.php?route=module/editproduct/editgroup/productGroupSpecialChange&token=<?php echo $token;?>',
		type: 'post',
		dataType: 'json',
		data: $('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked, #form-product-special').serialize(),
		beforeSend: function() {
			$('#popup-editor-product .btn-save-editor').button('loading');
			$('#form-product-special').prepend('<div id="loading_img_svg"></div>');
			$('#form-product-special').css('opacity',0.5);
			loading_img_svg(true);
		},
		complete: function() {
			loading_img_svg(false);
			$('#popup-editor-product .btn-save-editor').button('reset');
			$('#form-product-special').css('opacity',1);
		},
		success: function(json) {
		$('#popup-editor-product .alert.alert-danger, #popup-editor-product .alert.alert-success').remove();
			if (json['warning']) {
				$('#form-product-special').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-product-special').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				setTimeout(function(){
					location.reload(true);
				}, 500)
			}
		}
	});
}

</script>
<script src="catalog/view/editproduct/js/datetimepicker/moment.js"></script>
<script src="catalog/view/editproduct/js/datetimepicker/locale/<?php echo $langpicker;?>.js"></script>
<script src="catalog/view/editproduct/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<link href="catalog/view/editproduct/js/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
<script><!--
var special_row = <?php echo $special_row; ?>;
$('#special-form .date').datetimepicker({
	pickTime: false
});
function addSpecial() {
	html = '  <tr id="special-row' + special_row + '">'; 
    html += '    <td class="text-left"><select class="form-control" name="product_special[' + special_row + '][customer_group_id]">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
    <?php } ?>
    html += '    </select></td>';		
    html += '    <td class="text-left"><input class="form-control" type="text" name="product_special[' + special_row + '][priority]" value="" size="2" /></td>';
	html += '    <td class="text-left">';
	html += '    	<select class="form-control" id="input-quantity-method" name="product_special[' + special_row + '][price_method]">';
	html += '			<option value="equality"><?php echo $text_method_equality;?></option>';
	html += '			<option value="plus"><?php echo $text_method_plus;?></option>';
	html += '			<option value="minus"><?php echo $text_method_minus;?></option>';
	html += '			<option value="multiply"><?php echo $text_method_multiply;?></option>';
	html += '			<option value="divide"><?php echo $text_method_divide;?></option>';					 
	html += '		</select>';
	html += '    </td>';
	html += '    <td class="text-left">';
	html += '		<select class="form-control" id="input-price-type" name="product_special[' + special_row + '][price_type]">';
	html += '			<option value="fix"><?php echo $text_price_type_fix;?></option>';
	html += '			<option value="percent"><?php echo $text_price_type_percent;?></option>';
	html += '		</select>';
	html += '    </td>';
	html += '    <td class="text-left"><input class="form-control" type="text" name="product_special[' + special_row + '][price]" value="" /></td>';
    html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#special-row' + special_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '  </tr>';
	
	$('#specialf').before(html);
 
	$('#special-row' + special_row + ' .date').datetimepicker({
		pickTime: false
	});
	
	special_row++;
}
</script>  	
</div>