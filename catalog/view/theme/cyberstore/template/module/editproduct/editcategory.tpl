<div id="popup-editor-product">
	<div class="title-editor"><?php echo $text_categories;?></div>
	<form action="POST" method="post" enctype="multipart/form-data" id="category-form" class="form-horizontal">
		<input type="hidden" name="user_change" value="<?php echo $user_change;?>">
		<div class="form-group">
			  <label class="col-sm-2 desc_edit_label"><?php echo $entry_manufacturer; ?></label>
			  <div class="col-sm-10">
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
		<div class="form-group">
			<label class="col-sm-2 desc_edit_label"><?php echo $entry_category; ?></label>
			<div class="col-sm-10">
				<input id="category-editprod" type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
				<div id="product-category-editprod" class="well well-sm" style="height: 150px; overflow: auto;">
					<?php foreach ($categories as $category) { ?>
						<?php if (in_array($category['category_id'], $product_category)) { ?>
							<div id="product-category<?php echo $category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $category['name']; ?>
								<input type="hidden" name="product_category[]" value="<?php echo $category['category_id']; ?>" />
							</div>
						<?php } ?>
					<?php } ?>
				</div>
			</div>
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
        <th class="text-center"><?php echo $ch_manufacturer; ?></th>
        <th class="text-center"><?php echo $ch_category; ?></th>
        <th class="text-center"><?php echo $ch_date; ?></th>
      </tr>
    </thead>
    <tbody>
	<?php $i=0;?>
		<?php foreach ($change_edit_category as $change_edit_cat ) { ?>
			<?php if($i >= 10) break;?>
			<tr>
				<td class="text-center"><div class="ch-user-name"><?php echo $change_edit_cat['user_name'];?></div></label></td>
				<td class="text-center"><?php if($change_edit_cat['manufacture'] !='') { ?>
					<i class="fa fa-check-square-o ch-green" aria-hidden="true"></i>
				<?php } else { ?>
					<i class="fa fa-minus-square ch-red" aria-hidden="true"></i>
				<?php } ?>
				</td>
				<td class="text-center"><?php if($change_edit_cat['subcategory'] !='') { ?>
					<i class="fa fa-check-square-o ch-green" aria-hidden="true"></i>
				<?php } else { ?>
					<i class="fa fa-minus-square ch-red" aria-hidden="true"></i>
				<?php } ?>
				</td>
				<td class="text-center"><?php echo $change_edit_cat['date_modified'];?></td>
			</tr>
		<?php $i++;?>
	<?php } ?>
    </tbody>
  </table>
	</div>
</div>
<div class="text-right">
	<button onclick="$('.popup_banner').popup('hide');" class="btn-editor btn-cancel-editor" type="button"><?php echo $button_cancel;?></button>
	<button onclick="saveEditorCategory();" class="btn-editor btn-save-editor" type="button"><?php echo $button_save;?></button>
</div>
<script>
function saveEditorCategory() {
	$.ajax({
			url: 'index.php?route=module/editproduct/editcategory/saveCategory&product_id=<?php echo $product_id;?>',
			type: 'post',
			dataType: 'json',
			data: $('#category-form').serialize(),
			beforeSend: function() {
				$('.popup-alert').remove();
				$('#category-form').prepend('<div id="loading_img_svg"></div>');
				$('#category-form').css('opacity',0.5);
				loading_img_svg(true);
			},
			complete: function() {
				loading_img_svg(false);
				$('#category-form').css('opacity',1);
			},
			success: function(json) {				
				$('.popup-alert').remove();
				if (json['error']) {
					$('#category-form').before('<div class="popup-alert alert alert-danger"><i class="fa fa-info-circle"></i> '+ json['error'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				if (json['success']) {
					$('#category-form').before('<div class="popup-alert alert alert-success"><i class="fa fa-info-circle"></i> '+ json['success'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				location.reload();
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});	
};
</script>
</div>
<script>
$('input#category-editprod[name=\'category\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=module/editproduct/editcategory/autocomplete_category&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input#category-editprod[name=\'category\']').val('');
		
		$('#product-category' + item['value']).remove();
		
		$('#product-category-editprod').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');	
	}
});

$('#product-category-editprod').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
</script>