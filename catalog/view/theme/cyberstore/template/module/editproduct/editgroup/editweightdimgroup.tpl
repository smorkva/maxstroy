<div id="popup-editor-product">
	<div class="title-editor"><?php echo $entry_weight_dimensions;?></div>	
	  <form class="form-horizontal" id="form-product-weight-dimensions" enctype="multipart/form-data" method="post">
		<div class="form-group">
			<div class="col-sm-12">
				<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_codes_info;?></div>
			</div>
		</div>
		<div class="form-group">
            <label class="col-sm-3 desc_edit_label" for="input-length"><?php echo $entry_dimension; ?></label>
            <div class="col-sm-9">
                <div class="row">
                    <div class="col-sm-4">
						<div class="input-group">
							<span class="input-group-addon"><input type="checkbox" value="1" name="length_status"></span>
							<input type="text" name="length" value="<?php echo isset($product['length']) ? $product['length'] : ''; ?>" placeholder="<?php echo $entry_length; ?>" id="input-length" class="form-control" />
						</div>
                    </div>
                    <div class="col-sm-4">
						<div class="input-group">
							<span class="input-group-addon"><input type="checkbox" value="1" name="width_status"></span>
							<input type="text" name="width" value="<?php echo isset($product['width']) ? $product['width'] : ''; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
						</div>
                    </div>
                    <div class="col-sm-4">
						<div class="input-group">
							<span class="input-group-addon"><input type="checkbox" value="1" name="height_status"></span>
							<input type="text" name="height" value="<?php echo isset($product['height']) ? $product['height'] : ''; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
						</div>
                    </div>
                </div>
            </div>
        </div>
		<div class="form-group">
            <label class="col-sm-3 desc_edit_label" for="input-weight"><?php echo $entry_weight; ?></label>
            <div class="col-sm-9">
				<div class="input-group">
					<span class="input-group-addon"><input type="checkbox" value="1" name="weight_status"></span>
					<input type="text" name="weight" value="<?php echo isset($product['weight']) ? $product['weight'] : ''; ?>" placeholder="<?php echo $entry_weight; ?>" id="input-weight" class="form-control" />
				</div>
            </div>
        </div>	
	  </form>
<div class="text-right">
	<button onclick="$('.popup_banner').popup('hide'); groupEditorRefresh();" class="btn-editor btn-cancel-editor" type="button"><?php echo $button_cancel;?></button>
	<button onclick="saveGroupEditor();" data-loading-text="<?php echo $text_loading_editor; ?>" class="btn-editor btn-save-editor" type="button"><?php echo $button_save;?></button>
</div>
<script>
function saveGroupEditor() {	
	$.ajax({
		url: 'index.php?route=module/editproduct/editgroup/changeProductWeightDimensionsGroup&token=<?php echo $token;?>',
		type: 'post',
		dataType: 'json',
		data: $('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked, #form-product-weight-dimensions input[type=\'text\'], #form-product-weight-dimensions input[type=\'checkbox\']:checked, #form-product-weight-dimensions select'),
		beforeSend: function() {
			$('#popup-editor-product .btn-save-editor').button('loading');
			$('#form-product-weight-dimensions').prepend('<div id="loading_img_svg"></div>');
			$('#form-product-weight-dimensions').css('opacity',0.5);
			loading_img_svg(true);
		},
		complete: function() {
			loading_img_svg(false);
			$('#popup-editor-product .btn-save-editor').button('reset');
			$('#form-product-weight-dimensions').css('opacity',1);
		},
		success: function(json) {
		$('#popup-editor-product .alert.alert-danger, #popup-editor-product .alert.alert-success').remove();
			if (json['warning']) {
				$('#form-product-weight-dimensions').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-product-weight-dimensions').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				setTimeout(function(){					
						location.reload(true);
				}, 500)
			}
		}
	});
}
</script>