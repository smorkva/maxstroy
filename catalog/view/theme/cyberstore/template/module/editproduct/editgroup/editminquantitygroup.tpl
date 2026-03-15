<div id="popup-editor-product">
	<div class="title-editor"><?php echo $entry_minimum;?></div>
	<div id="body-edit-product-minquantity" class="modal-body">
	  <form class="form-horizontal" id="form-product-minquantity" enctype="multipart/form-data" method="post">
			<div class="form-group">
                <label class="col-sm-2 desc_edit_label" for="input-minimum"><span data-toggle="tooltip" title="<?php echo $help_minimum; ?>"><?php echo $entry_minimum; ?></span></label>
                <div class="col-sm-10">
                  <input onkeyup="this.value = this.value.replace (/\D/, '')" type="text" name="minimum" value="<?php echo $minimum; ?>" placeholder="<?php echo $entry_minimum; ?>" id="input-minimum" class="form-control" />
                </div>
            </div>
	  </form>
	</div>
	<div class="text-right">
		<button onclick="$('.popup_banner').popup('hide');groupEditorRefresh();" class="btn-editor btn-cancel-editor" type="button"><?php echo $button_cancel;?></button>
		<button onclick="saveGroupEditor();" data-loading-text="<?php echo $text_loading_editor; ?>" class="btn-editor btn-save-editor" type="button"><?php echo $button_save;?></button>
	</div>

<script>
function saveGroupEditor() { 	
	$.ajax({
		url: 'index.php?route=module/editproduct/editgroup/productGroupMinQuantityChange&token=<?php echo $token;?>',
		type: 'post',
		dataType: 'json',
		data: $('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked, #form-product-minquantity input'),
		beforeSend: function() {
			$('#popup-editor-product .btn-save-editor').button('loading');
			$('#form-product-minquantity').prepend('<div id="loading_img_svg"></div>');
			$('#form-product-minquantity').css('opacity',0.5);
			loading_img_svg(true);
		},
		complete: function() {
			loading_img_svg(false);
			$('#popup-editor-product .btn-save-editor').button('reset');
			$('#form-product-minquantity').css('opacity',1);
		},
		success: function(json) {
		$('#popup-editor-product .alert.alert-danger, #popup-editor-product .alert.alert-success').remove();
			if (json['warning']) {
				$('#form-product-minquantity').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-product-minquantity').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				setTimeout(function(){
					location.reload(true);									
				}, 500)
			}
		}
	});
}
</script>
</div>