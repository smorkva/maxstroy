<div id="popup-editor-product">
	<div class="title-editor"><?php echo $entry_manufacturer;?></div>
	  <form class="form-horizontal" id="form-product-manufacturer" enctype="multipart/form-data" method="post">
			<div class="form-group">
				<label class="col-sm-3 desc_edit_label"><?php echo $entry_manufacturer; ?></label>
				<div class="col-sm-9">
					<select class="form-control" name="manufacturer_id">
					  <option value="0" selected="selected" ><?php echo $text_none; ?></option>
					  <?php foreach ($manufacturers as $manufacturer) { ?>
						<?php if ($manufacturer['manufacturer_id'] == $manufacturer_id) { ?>
						  <option value="<?php echo $manufacturer['manufacturer_id']; ?>" selected="selected"><?php echo $manufacturer['name']; ?></option>
						<?php } else { ?>
						  <option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>
						<?php } ?>
					  <?php } ?>
					</select>
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
		url: 'index.php?route=module/editproduct/editgroup/changeProductManufacturerGroup&token=<?php echo $token;?>',
		type: 'post',
		dataType: 'json',
		data: $('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked, #form-product-manufacturer select'),
		beforeSend: function() {
			$('#popup-editor-product .btn-save-editor').button('loading');
			$('#form-product-manufacturer').prepend('<div id="loading_img_svg"></div>');
			$('#form-product-manufacturer').css('opacity',0.5);
			loading_img_svg(true);
		},
		complete: function() {
			loading_img_svg(false);
			$('#popup-editor-product .btn-save-editor').button('reset');
			$('#form-product-manufacturer').css('opacity',1);
		},
		success: function(json) {
		$('#popup-editor-product .alert.alert-danger, #popup-editor-product .alert.alert-success').remove();
			if (json['warning']) {
				$('#form-product-manufacturer').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-product-manufacturer').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				setTimeout(function(){	
					location.reload(true);
				}, 500)
			}
		}
	});
}
</script>
</div>