<div id="popup-editor-product">
	<div class="title-editor"><?php echo $entry_category;?></div>
	  <form class="form-horizontal" id="form-product-category" enctype="multipart/form-data" method="post">
			<div class="form-group">
				<div class="col-sm-12">
					<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_info_category;?></div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 desc_edit_label"><?php echo $entry_category; ?></label>
				<div class="col-sm-9">
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
<div class="text-right">
	<button onclick="$('.popup_banner').popup('hide');groupEditorRefresh();" class="btn-editor btn-cancel-editor" type="button"><?php echo $button_cancel;?></button>
	<button onclick="saveGroupEditor();" data-loading-text="<?php echo $text_loading_editor; ?>" class="btn-editor btn-save-editor" type="button"><?php echo $button_save;?></button>
</div>	
<script>
function saveGroupEditor() {	
	$.ajax({
		url: 'index.php?route=module/editproduct/editgroup/changeProductCategoryGroup&token=<?php echo $token;?>',
		type: 'post',
		dataType: 'json',
		data: $('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked, #form-product-category').serialize(),
		beforeSend: function() {
			$('#popup-editor-product .btn-save-editor').button('loading');
			$('#form-product-category').prepend('<div id="loading_img_svg"></div>');
			$('#form-product-category').css('opacity',0.5);
			loading_img_svg(true);
		},
		complete: function() {
			loading_img_svg(false);
			$('#popup-editor-product .btn-save-editor').button('reset');
			$('#form-product-category').css('opacity',1);
		},
		success: function(json) {
		$('#popup-editor-product .alert.alert-danger, #popup-editor-product .alert.alert-success').remove();
			if (json['warning']) {
				$('#form-product-category').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-product-category').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				setTimeout(function(){	
					location.reload(true);
				}, 500)
			}
		}
	});
}
</script>
<script>
$('#popup-editor-product input#category-editprod[name=\'category\']').autocomplete({
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
		
		$('#product-category-editprod' + item['value']).remove();
		
		$('#product-category-editprod').append('<div id="product-category-editprod' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');	
	}
});

$('#product-category-editprod').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
</script>
</div>