<div id="popup-editor-product">
	<div class="title-editor"><?php echo $entry_discount;?></div>
	  <form class="form-horizontal" id="form-product-discount" enctype="multipart/form-data" method="post">
		<div class="form-group">
			<div class="col-sm-12">
				<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_discount_info;?></div>
			</div>
		</div>
		<div class="table-responsive">
                <table id="discount" class="table table-striped table-bordered table-hover" style="background:#fff;">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_customer_group; ?></td>
                      <td class="text-right"><?php echo $entry_quantity; ?></td>
                      <td class="text-right"><?php echo $entry_priority; ?></td>
					  <td class="text-left"><?php echo $entry_method; ?></td>
					  <td class="text-left"><?php echo $entry_type_price; ?></td>
                      <td class="text-right"><?php echo $entry_value; ?></td>
                      <td class="text-left"><?php echo $entry_date_start; ?></td>
                      <td class="text-left"><?php echo $entry_date_end; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $discount_row = 0; ?>
                    <?php foreach ($product_discounts as $product_discount) { ?>
                    <tr id="discount-row<?php echo $discount_row; ?>">
                      <td class="text-left"><select name="product_discount[<?php echo $discount_row; ?>][customer_group_id]" class="form-control">
                          <?php foreach ($customer_groups as $customer_group) { ?>
                          <?php if ($customer_group['customer_group_id'] == $product_discount['customer_group_id']) { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                      <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][quantity]" value="<?php echo $product_discount['quantity']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>
                      <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][priority]" value="<?php echo $product_discount['priority']; ?>" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>
						<td class="text-left">
							<select class="form-control" id="input-quantity-method" name="product_discount[<?php echo $special_row; ?>][price_method]">
								<option value="equality"><?php echo $text_method_equality;?></option>
								<option value="plus"><?php echo $text_method_plus;?></option>
								<option value="minus"><?php echo $text_method_minus;?></option>
								<option value="multiply"><?php echo $text_method_multiply;?></option>
								<option value="divide"><?php echo $text_method_divide;?></option>					 
							</select>
						</td>
						<td class="text-left">
							<select class="form-control" id="input-price-type" name="product_discount[<?php echo $special_row; ?>][price_type]">
								<option value="fix"><?php echo $text_price_type_fix;?></option>
								<option value="percent"><?php echo $text_price_type_percent;?></option>
							</select>
						</td>
					  <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][price]" value="<?php echo $product_discount['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                      <td class="text-left" style="width: 20%;"><div class="input-group date">
                          <input type="text" name="product_discount[<?php echo $discount_row; ?>][date_start]" value="<?php echo $product_discount['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                      <td class="text-left" style="width: 20%;"><div class="input-group date">
                          <input type="text" name="product_discount[<?php echo $discount_row; ?>][date_end]" value="<?php echo $product_discount['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                      <td class="text-left"><button type="button" onclick="$('#discount-row<?php echo $discount_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-delete-editor"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $discount_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="8"></td>
                      <td class="text-left"><button type="button" onclick="addDiscount();" data-toggle="tooltip" title="<?php echo $button_discount_add; ?>" class="btn btn-add-editor"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
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
		url: 'index.php?route=module/editproduct/editgroup/productGroupDiscountChange&token=<?php echo $token;?>',
		type: 'post',
		dataType: 'json',
		data: $('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked, #form-product-discount').serialize(),
		beforeSend: function() {
			$('#popup-editor-product .btn-save-editor').button('loading');
			$('#form-product-discount').prepend('<div id="loading_img_svg"></div>');
			$('#form-product-discount').css('opacity',0.5);
			loading_img_svg(true);
		},
		complete: function() {
			loading_img_svg(false);
			$('#popup-editor-product .btn-save-editor').button('reset');
			$('#form-product-discount').css('opacity',1);
		},
		success: function(json) {
		$('#popup-editor-product .alert.alert-danger, #popup-editor-product .alert.alert-success').remove();
			if (json['warning']) {
				$('#form-product-discount').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-product-discount').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
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
$('.date').datetimepicker({
		pickTime: false
	});
var discount_row = <?php echo $discount_row; ?>;
function addDiscount() {
	html  = '<tr id="discount-row' + discount_row + '">';
    html += '  <td class="text-left"><select name="product_discount[' + discount_row + '][customer_group_id]" class="form-control">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
    <?php } ?>
    html += '  </select></td>';
    html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
    html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
	html += '    <td class="text-left">';
	html += '    	<select class="form-control" id="input-quantity-method" name="product_discount[' + discount_row + '][price_method]">';
	html += '			<option value="equality"><?php echo $text_method_equality;?></option>';
	html += '			<option value="plus"><?php echo $text_method_plus;?></option>';
	html += '			<option value="minus"><?php echo $text_method_minus;?></option>';
	html += '			<option value="multiply"><?php echo $text_method_multiply;?></option>';
	html += '			<option value="divide"><?php echo $text_method_divide;?></option>';					 
	html += '		</select>';
	html += '    </td>';
	html += '    <td class="text-left">';
	html += '		<select class="form-control" id="input-price-type" name="product_discount[' + discount_row + '][price_type]">';
	html += '			<option value="fix"><?php echo $text_price_type_fix;?></option>';
	html += '			<option value="percent"><?php echo $text_price_type_percent;?></option>';
	html += '		</select>';
	html += '    </td>';
	html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][price]" value="" placeholder="<?php echo $entry_value; ?>" class="form-control" /></td>';
    html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#discount-row' + discount_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-delete-editor"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#discount tbody').append(html);

	$('.date').datetimepicker({
		pickTime: false
	});

	discount_row++;
}
//--></script>   	
</div>