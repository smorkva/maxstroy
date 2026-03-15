<div id="popup-editor-product">
	<div class="title-editor"><?php echo $entry_date_available_status;?></div>
	  <form class="form-horizontal" id="form-product-dateavailable" enctype="multipart/form-data" method="post">
		<div class="form-group">
			<div class="col-sm-12">
				<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_codes_info;?></div>
			</div>
		</div>
		<div class="form-group">
			<label for="input-isbn" class="col-sm-2 desc_edit_label"><?php echo $entry_status; ?></label>
			<div class="col-sm-4">
				<div class="input-group">
				  <span class="input-group-addon"><input type="checkbox" value="1" name="product_status"></span>
				  <select name="status" id="input-status" class="form-control">
					<?php if(isset($status)){?>
						<?php if ($status == '1') { ?>
						<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
						<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						<?php } ?>
					<?php } else { ?>
						<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
					<?php } ?>
                  </select>
				</div>
			</div>
			<label class="col-sm-2 desc_edit_label" for="input-date-available"><?php echo $entry_date_available; ?></label>
                <div class="col-sm-4">
                  <div class="input-group date">
                    <input type="text" name="date_available" value="<?php echo isset($product['date_available']) ? $product['date_available'] : ''; ?>" placeholder="<?php echo $entry_date_available; ?>" data-date-format="YYYY-MM-DD" id="input-date-available" class="form-control" />
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                    </span></div>
                </div>
		</div>
	  </form>
<div class="text-right">
	<button onclick="$('.popup_banner').popup('hide'); groupEditorRefresh();" class="btn-editor btn-cancel-editor" type="button"><?php echo $button_cancel;?></button>
	<button onclick="saveGroupEditor();" data-loading-text="<?php echo $text_loading_editor; ?>" class="btn-editor btn-save-editor" type="button"><?php echo $button_save;?></button>
</div>
<script src="catalog/view/javascript/jquery/datetimepicker/moment.js"></script>
<script src="catalog/view/javascript/jquery/datetimepicker/locale/<?php echo $langpicker;?>.js"></script>
<script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<link href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
<script><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
//--></script>
<script>
function saveGroupEditor() {		
	$.ajax({
		url: 'index.php?route=module/editproduct/editgroup/changeProductDateavailableGroup&token=<?php echo $token;?>',
		type: 'post',
		dataType: 'json',
		data: $('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked, #form-product-dateavailable input[type=\'text\'], #form-product-dateavailable input[type=\'checkbox\']:checked, #form-product-dateavailable select'),
		beforeSend: function() {
			$('#popup-editor-product .btn-save-editor').button('loading');
			$('#form-product-dateavailable').prepend('<div id="loading_img_svg"></div>');
			$('#form-product-dateavailable').css('opacity',0.5);
			loading_img_svg(true);
		},
		complete: function() {
			loading_img_svg(false);
			$('#popup-editor-product .btn-save-editor').button('reset');
			$('#form-product-dateavailable').css('opacity',1);
		},
		success: function(json) {
		$('#popup-editor-product .alert.alert-danger, #popup-editor-product .alert.alert-success').remove();
			if (json['warning']) {
				$('#form-product-dateavailable').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-product-dateavailable').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');				
				setTimeout(function(){									
					location.reload(true);
				}, 500)
			}
		}
	});
}

</script>