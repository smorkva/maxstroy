<div id="popup-editor-product">
	<div class="title-editor"><?php echo $entry_codes_articles;?></div>
	  <form class="form-horizontal" id="form-product-codes" enctype="multipart/form-data" method="post">
		<div class="form-group">
			<div class="col-sm-12">
				<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_codes_info;?></div>
			</div>
		</div>
		<div class="form-group">
			<label for="input-sku" class="col-sm-2 desc_edit_label"><span data-toggle="tooltip" title="<?php echo $help_sku; ?>"><?php echo $entry_sku; ?></span></label>
			<div class="col-sm-4">
				<div class="input-group">
				  <span class="input-group-addon"><input type="checkbox" value="1" name="status_sku"></span>
				  <input type="text" class="form-control" id="input-sku" placeholder="<?php echo $entry_sku; ?>" value="<?php echo isset($product['sku']) ? $product['sku'] : ''; ?>" name="sku">
				</div>
			</div>
			<label for="input-upc" class="col-sm-2 desc_edit_label"><span data-toggle="tooltip" title="<?php echo $help_upc; ?>"><?php echo $entry_upc; ?></span></label>
			<div class="col-sm-4">
				<div class="input-group">
				  <span class="input-group-addon"><input type="checkbox" value="1" name="status_upc"></span>
				  <input type="text" class="form-control" id="input-upc" placeholder="<?php echo $entry_upc; ?>" value="<?php echo isset($product['upc']) ? $product['upc'] : ''; ?>" name="upc">
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="input-ean" class="col-sm-2 desc_edit_label"><span data-toggle="tooltip" title="<?php echo $help_ean; ?>"><?php echo $entry_ean; ?></span></label>
			<div class="col-sm-4">
				<div class="input-group">
				  <span class="input-group-addon"><input type="checkbox" value="1" name="status_ean"></span>
				  <input type="text" class="form-control" id="input-ean" placeholder="<?php echo $entry_ean; ?>" value="<?php echo isset($product['ean']) ? $product['ean'] : ''; ?>" name="ean">
				</div>
			</div>
			<label for="input-jan" class="col-sm-2 desc_edit_label"><span data-toggle="tooltip" title="<?php echo $help_jan; ?>"><?php echo $entry_jan; ?></span></label>
			<div class="col-sm-4">
				<div class="input-group">
				  <span class="input-group-addon"><input type="checkbox" value="1" name="status_jan"></span>
				  <input type="text" class="form-control" id="input-jan" placeholder="<?php echo $entry_upc; ?>" value="<?php echo isset($product['jan']) ? $product['jan'] : ''; ?>" name="jan">
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="input-isbn" class="col-sm-2 desc_edit_label"><span data-toggle="tooltip" title="<?php echo $help_isbn; ?>"><?php echo $entry_isbn; ?></span></label>
			<div class="col-sm-4">
				<div class="input-group">
				  <span class="input-group-addon"><input type="checkbox" value="1" name="status_isbn"></span>
				  <input type="text" class="form-control" id="input-isbn" placeholder="<?php echo $entry_isbn; ?>" value="<?php echo isset($product['isbn']) ? $product['isbn'] : ''; ?>" name="isbn">
				</div>
			</div>
			<label for="input-mpn" class="col-sm-2 desc_edit_label"><span data-toggle="tooltip" title="<?php echo $help_mpn; ?>"><?php echo $entry_mpn; ?></span></label>
			<div class="col-sm-4">
				<div class="input-group">
				  <span class="input-group-addon"><input type="checkbox" value="1" name="status_mpn"></span>
				  <input type="text" class="form-control" id="input-mpn" placeholder="<?php echo $entry_mpn; ?>" value="<?php echo isset($product['mpn']) ? $product['mpn'] : ''; ?>" name="mpn">
				</div>
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
		url: 'index.php?route=module/editproduct/editgroup/productGroupCodesChange&token=<?php echo $token;?>',
		type: 'post',
		dataType: 'json',
		data: $('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked, #form-product-codes input[type=\'text\'], #form-product-codes input[type=\'checkbox\']:checked'),
		beforeSend: function() {
			$('#popup-editor-product .btn-save-editor').button('loading');
			$('#form-product-codes').prepend('<div id="loading_img_svg"></div>');
			$('#form-product-codes').css('opacity',0.5);
			loading_img_svg(true);
		},
		complete: function() {
			loading_img_svg(false);
			$('#popup-editor-product .btn-save-editor').button('reset');
			$('#form-product-codes').css('opacity',1);
		},
		success: function(json) {
		$('#popup-editor-product .alert.alert-danger, #popup-editor-product .alert.alert-success').remove();
			if (json['warning']) {
				$('#form-product-codes').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-product-codes').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				setTimeout(function(){	
					location.reload(true);
				}, 500)
			}
		}
	});
}
</script>
</div>