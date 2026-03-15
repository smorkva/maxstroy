<div id="popup-editor-product">
	<div class="title-editor"><?php echo $entry_subtract_stock_status_shipping;?></div>	
	  <form class="form-horizontal" id="form-product-stock-shiping" enctype="multipart/form-data" method="post">
		<div class="form-group">
			<div class="col-sm-12">
				<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_codes_info;?></div>
			</div>
		</div>
		<div class="form-group">
                <label class="col-sm-3 desc_edit_label" for="input-subtract"><?php echo $entry_subtract; ?></label>
                <div class="col-sm-6">
					<div class="input-group">
						<span class="input-group-addon"><input type="checkbox" value="1" name="subtract_status"></span>
						<select name="subtract" id="input-subtract" class="form-control">
							<?php if(isset($subtract)){?>
							<?php if($subtract =='1') { ?>
								<option value="1" selected="selected"><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
							<?php } else { ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0"  selected="selected"><?php echo $text_no; ?></option>
							<?php } ?>
							<?php } else { ?>
								<option value="1" selected="selected"><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
							<?php } ?>
						</select>
					</div>
                </div>
        </div>
		<div class="form-group">
			<label for="input-stock-status" class="col-sm-3 desc_edit_label"><span data-toggle="tooltip" title="<?php echo $help_stock_status; ?>"><?php echo $entry_stock_status; ?></span></label>
			<div class="col-sm-6">
				<div class="input-group">
				  <span class="input-group-addon"><input type="checkbox" value="1" name="stock_status"></span>
				 <select name="stock_status_id" id="input-stock-status" class="form-control">
                    <?php foreach ($stock_statuses as $stock_status) { ?>
					<?php if(isset($stock_status_id)) { ?>
						<?php if ($stock_status['stock_status_id'] == $stock_status_id) { ?>
						<option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
						<?php } ?>                            
                    <?php } else { ?>
						<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
					 <?php } ?>
					 <?php } ?>
                  </select>
				</div>
			</div>
		</div>
		<div class="form-group">
                <label class="col-sm-3 desc_edit_label" for="input-shipping"><?php echo $entry_shipping; ?></label>
                <div class="col-sm-6">
					<div class="input-group">
						<span class="input-group-addon"><input type="checkbox" value="1" name="shipping_status"></span>
						<select name="shipping" id="input-shipping" class="form-control">
						<?php if(isset($shipping)){?>
						<?php if($shipping =='1') { ?>
							<option value="1" selected="selected"><?php echo $text_yes; ?></option>
							<option value="0"><?php echo $text_no; ?></option>
						<?php } else { ?>
							<option value="1"><?php echo $text_yes; ?></option>
							<option value="0"  selected="selected"><?php echo $text_no; ?></option>
						<?php } ?>
						<?php } else { ?>
							<option value="1" selected="selected"><?php echo $text_yes; ?></option>
							<option value="0"><?php echo $text_no; ?></option>
						<?php } ?>
						</select>
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
		url: 'index.php?route=module/editproduct/editgroup/changeProductStockShippingGroup&token=<?php echo $token;?>',
		type: 'post',
		dataType: 'json',
		data: $('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked, #form-product-stock-shiping input[type=\'text\'], #form-product-stock-shiping input[type=\'checkbox\']:checked, #form-product-stock-shiping select'),
		beforeSend: function() {
			$('#popup-editor-product .btn-save-editor').button('loading');
			$('#form-product-stock-shiping').prepend('<div id="loading_img_svg"></div>');
			$('#form-product-stock-shiping').css('opacity',0.5);
			loading_img_svg(true);
		},
		complete: function() {
			loading_img_svg(false);
			$('#popup-editor-product .btn-save-editor').button('reset');
			$('#form-product-stock-shiping').css('opacity',1);
		},
		success: function(json) {
		$('#popup-editor-product .alert.alert-danger, #popup-editor-product .alert.alert-success').remove();
			if (json['warning']) {
				$('#form-product-stock-shiping').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-product-stock-shiping').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				setTimeout(function(){					
						location.reload(true);
				}, 500)
			}
		}
	});
}
</script>