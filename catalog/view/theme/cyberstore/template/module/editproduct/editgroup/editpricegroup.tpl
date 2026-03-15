<div id="popup-editor-product">
	<div class="title-editor"><?php echo $entry_price;?></div>
	  <form class="form-horizontal" id="form-product-price" enctype="multipart/form-data" method="post">
			<div class="form-group">
				<div class="col-sm-12">
					<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_price_info;?></div>
				</div>
			</div>
			<div class="form-group">  
                <label class="col-sm-3 desc_edit_label" for="input-quantity"><?php echo $entry_method; ?></label>
                <div class="col-sm-9">
					<select class="form-control" id="input-quantity-method" name="price_method">
						<option value="equality"><?php echo $text_method_equality;?></option>
						<option value="plus"><?php echo $text_method_plus;?></option>
						<option value="minus"><?php echo $text_method_minus;?></option>
						<option value="multiply"><?php echo $text_method_multiply;?></option>
						<option value="divide"><?php echo $text_method_divide;?></option>					 
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="input-price-type" class="col-sm-3 desc_edit_label"><?php echo $entry_type_price;?></label>
				<div class="col-sm-9">
					<select class="form-control" id="input-price-type" name="price_type">
					  <option value="fix"><?php echo $text_price_type_fix;?></option>
					  <option value="percent"><?php echo $text_price_type_percent;?></option>
					</select>
				</div>
			</div>
			<div class="form-group">  
                <label class="col-sm-3 desc_edit_label" for="input-quantity"><?php echo $entry_value; ?></label>
                <div class="col-sm-9">
                  <input type="text" name="price" value="" placeholder="<?php echo $entry_value; ?>" id="input-quantity" class="form-control" />
                </div>
			</div>
	  </form>
	<div class="text-right">
		<button onclick="$('.popup_banner').popup('hide');groupEditorRefresh();" class="btn-editor btn-cancel-editor" type="button"><?php echo $button_cancel;?></button>
		<button onclick="saveGroupEditor();" data-loading-text="<?php echo $text_loading_editor; ?>" class="btn-editor btn-save-editor" type="button"><?php echo $button_save;?></button>
	</div>
<script>
function saveGroupEditor() { 	
	$.ajax({
		url: 'index.php?route=module/editproduct/editgroup/productGroupPriceChange&token=<?php echo $token;?>',
		type: 'post',
		dataType: 'json',
		data: $('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked, #form-product-price input[name="price"], #form-product-price select'),
		beforeSend: function() {
			$('#popup-editor-product .btn-save-editor').button('loading');
			$('#form-product-price').prepend('<div id="loading_img_svg"></div>');
			$('#form-product-price').css('opacity',0.5);
			loading_img_svg(true);
		},
		complete: function() {
			loading_img_svg(false);
			$('#popup-editor-product .btn-save-editor').button('reset');
			$('#form-product-price').css('opacity',1);
		},
		success: function(json) {
		$('#popup-editor-product .alert.alert-danger, #popup-editor-product .alert.alert-success').remove();
			if (json['warning']) {
				$('#form-product-price').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-product-price').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				setTimeout(function(){
					location.reload(true);
				}, 500)
			}
		}
	});
}

</script>
</div>