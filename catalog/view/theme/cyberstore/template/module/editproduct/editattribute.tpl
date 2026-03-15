<div id="popup-editor-product">
	<div class="title-editor"><?php echo $text_attribute;?></div>
	<form id="attribute-form" action="POST" method="post" enctype="multipart/form-data" class="form-horizontal">
		<input type="hidden" name="user_change" value="<?php echo $user_change;?>">
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
                      <td class="text-left" style="width: 40%;"><input type="text" name="product_attribute[<?php echo $attribute_row; ?>][name]" value="<?php echo $product_attribute['name']; ?>" placeholder="<?php echo $entry_attribute; ?>" class="form-control" />
                        <input type="hidden" name="product_attribute[<?php echo $attribute_row; ?>][attribute_id]" value="<?php echo $product_attribute['attribute_id']; ?>" /></td>
                      <td class="text-left"><?php foreach ($languages as $language) { ?>
                        <div class="input-group"><span class="input-group-addon"><?php if($VERSION < 2.2){?><img src="admin/view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><?php } else { ?><img src="admin/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /><?php } ?></span>
                          <textarea name="product_attribute[<?php echo $attribute_row; ?>][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"><?php echo isset($product_attribute['product_attribute_description'][$language['language_id']]) ? $product_attribute['product_attribute_description'][$language['language_id']]['text'] : ''; ?></textarea>
                        </div>
                        <?php } ?></td>
                      <td class="text-left"><button type="button" onclick="$('#attribute-row<?php echo $attribute_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
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
	<div class="row mtb10">
		<div class="col-xs-12 text-center">
			<button class="btn-editor btn-primary-editor" type="button" data-toggle="collapse" data-target="#change_edit_category" aria-expanded="false" aria-controls="collapseExample">
			<?php echo $button_last_change;?>
			</button>
		</div>
		</div>
		<div class="row collapse" id="change_edit_category">
		<div class="col-xs-12">
		<table class="table table-bordered table-hover">
		<thead>
		  <tr>
			<th class="text-center"><?php echo $ch_user; ?></th>
			<th class="text-center"><?php echo $ch_attribute; ?></th>
			<th class="text-center"><?php echo $ch_date; ?></th>
		  </tr>
		</thead>
		<tbody>
		<?php $i=0;?>
			<?php foreach ($change_edit_attributes as $results) { ?>
				<?php if($i >= 10) break;?>
				<tr>
					<td class="text-center"><div class="ch-user-name"><?php echo $results['user_name'];?></div></label></td>
					<td class="text-center"><?php if($results['attributes'] =='AP') { ?>
						<i class="fa fa-check-square-o ch-green" aria-hidden="true"></i>
					<?php } else { ?>
						<i class="fa fa-minus-square ch-red" aria-hidden="true"></i>
					<?php } ?>
					</td>
					<td class="text-center"><?php echo $results['date_modified'];?></td>
				</tr>
			<?php $i++;?>
		<?php } ?>
		</tbody>
	  </table>
		</div>
	</div>
	<div class="text-right">
		<button onclick="$('.popup_banner').popup('hide');" class="btn-editor btn-cancel-editor" type="button"><?php echo $button_cancel;?></button>
		<button onclick="saveEditorAttribute();" class="btn-editor btn-save-editor" type="button"><?php echo $button_save;?></button>
	</div>
<script>
function saveEditorAttribute() {
	$.ajax({
			url: 'index.php?route=module/editproduct/editattribute/saveEditorAttribute&product_id=<?php echo $product_id;?>',
			type: 'post',
			dataType: 'json',
			data: $('#attribute-form').serialize(),
			beforeSend: function() {
				$('.popup-alert').remove();
				$('#attribute-form').prepend('<div id="loading_img_svg"></div>');
				$('#attribute-form').css('opacity',0.5);
				loading_img_svg(true);
			},
			complete: function() {
				loading_img_svg(false);
				$('#attribute-form').css('opacity',1);
			},
			success: function(json) {				
				$('.popup-alert').remove();
				if (json['error']) {
					$('#attribute-form').before('<div class="popup-alert alert alert-danger"><i class="fa fa-info-circle"></i> '+ json['error'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				if (json['success']) {
					$('#attribute-form').before('<div class="popup-alert alert alert-success"><i class="fa fa-info-circle"></i> '+ json['success'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				//location.reload();
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});	
};
</script>
<script><!--
var attribute_row = <?php echo $attribute_row; ?>;

function addAttribute() {
    html  = '<tr id="attribute-row' + attribute_row + '">';
	html += '  <td class="text-left" style="width: 20%; position:relative;"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" placeholder="<?php echo $entry_attribute; ?>" class="form-control" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
	html += '  <td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><?php if($VERSION < 2.2){?><img src="admin/view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><?php } else { ?><img src="admin/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /><?php } ?></span><textarea name="product_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"></textarea></div>';
    <?php } ?>
	html += '  </td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#attribute-row' + attribute_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
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
