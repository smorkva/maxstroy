<div id="popup-editor-product">
	<div class="title-editor"><?php echo $entry_attribute;?></div>
	  <form class="form-horizontal" id="form-product-attribute" enctype="multipart/form-data" method="post">
		<?php if($product_id == 0){?>
			<div class="form-group">  
                <label class="col-sm-3 desc_edit_label" for="input-product-attribute-method"><?php echo $entry_method; ?></label>
                <div class="col-sm-9">
					<select class="form-control" id="input-product-attribute-method" name="product_attribute_method">
						<option value="deleteAttribute"><?php echo "Удалить все атрибуты и создать новые";?></option>			 
						<option value="updateAttribute"><?php echo "Заменить описание если атрибут существует";?></option>			 
						<option value="skipAttribute"><?php echo "Пропустить атрибут если он существует";?></option>			 
					</select>
				</div>
			</div>
		<?php } ?>
			<div class="table-responsive">
				<table id="attribute" class="table table-striped table-bordered table-hover" style="background:#fff;">
					  <thead>
						<tr>
						  <td class="text-left"><?php echo $entry_attribute; ?></td>
						  <td class="text-left"><?php echo $entry_text; ?></td>
						  <td></td>
						</tr>
					  </thead>
					  <tbody>
						<?php $attribute_row = 0; ?>
						<?php foreach ($product_attributes as $product_attribute) { ?>
						<tr id="attribute-row<?php echo $attribute_row; ?>">
						  <td class="text-left" style="width: 40%;vertical-align:middle;"><input type="text" name="product_attribute[<?php echo $attribute_row; ?>][name]" value="<?php echo $product_attribute['name']; ?>" placeholder="<?php echo $entry_attribute; ?>" class="form-control" />
							<input type="hidden" name="product_attribute[<?php echo $attribute_row; ?>][attribute_id]" value="<?php echo $product_attribute['attribute_id']; ?>" /></td>
						  <td class="text-left"><?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><?php if($VERSION < 2.2){?><img src="admin/view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><?php } else { ?><img src="admin/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /><?php } ?></span>
							  <textarea name="product_attribute[<?php echo $attribute_row; ?>][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"><?php echo isset($product_attribute['product_attribute_description'][$language['language_id']]) ? $product_attribute['product_attribute_description'][$language['language_id']]['text'] : ''; ?></textarea>
							</div>
							<?php } ?></td>
						  <td class="text-left" style="vertical-align:middle;"><button type="button" onclick="$('#attribute-row<?php echo $attribute_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
						</tr>
						<?php $attribute_row++; ?>
						<?php } ?>
					  </tbody>
					  <tfoot>
						<tr>
						  <td colspan="2"></td>
						  <td class="text-left"><button type="button" onclick="addAttribute();" data-toggle="tooltip" title="<?php echo $button_add_attribute; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
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
		url: 'index.php?route=module/editproduct/editgroup/changeProductAttributeGroup&token=<?php echo $token;?>',
		type: 'post',
		dataType: 'json',
		data: $('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked, #form-product-attribute').serialize(),
		beforeSend: function() {
			$('#popup-editor-product .btn-save-editor').button('loading');
			$('#form-product-attribute').prepend('<div id="loading_img_svg"></div>');
			$('#form-product-attribute').css('opacity',0.5);
			loading_img_svg(true);
		},
		complete: function() {
			loading_img_svg(false);
			$('#popup-editor-product .btn-save-editor').button('reset');
			$('#form-product-attribute').css('opacity',1);
		},
		success: function(json) {
		$('#popup-editor-product .alert.alert-danger, #popup-editor-product .alert.alert-success').remove();
			if (json['warning']) {
				$('#form-product-attribute').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-product-attribute').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				setTimeout(function(){	
					location.reload(true);
				}, 500)
			}
		}
	});
}
</script>
<script><!--
var attribute_row = <?php echo $attribute_row; ?>;

function addAttribute() {
    html  = '<tr id="attribute-row' + attribute_row + '">';
	html += '  <td class="text-left" style="width: 20%; position:relative;vertical-align:middle;"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" placeholder="<?php echo $entry_attribute; ?>" class="form-control" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
	html += '  <td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><?php if($VERSION < 2.2){?><img src="admin/view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><?php } else { ?><img src="admin/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /><?php } ?></span><textarea name="product_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"></textarea></div>';
    <?php } ?>
	html += '  </td>';
	html += '  <td class="text-left" style="vertical-align:middle;"><button type="button" onclick="$(\'#attribute-row' + attribute_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
    html += '</tr>';
	
	$('#attribute tbody').append(html);
	
	attributeautocomplete(attribute_row);
	
	attribute_row++;
}

function attributeautocomplete(attribute_row) {
	$('input[name=\'product_attribute[' + attribute_row + '][name]\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=module/editproduct/editattribute/autocomplete_attr&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',			
				success: function(json) {
					response($.map(json, function(item) {
						return {
							category: item.attribute_group,
							label: item.name,
							value: item.attribute_id
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'product_attribute[' + attribute_row + '][name]\']').val(item['label']);
			$('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').val(item['value']);
		}
	});
}

$('#attribute tbody tr').each(function(index, element) {
	attributeautocomplete(index);
});

//--></script> 
</div>