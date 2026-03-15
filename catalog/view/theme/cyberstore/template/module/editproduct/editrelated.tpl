<div id="popup-editor-product">
<div class="title-editor"><?php echo $text_related;?></div>
	<form id="related-form" action="POST" method="post" enctype="multipart/form-data" class="form-horizontal">
		<input type="hidden" name="user_change" value="<?php echo $user_change;?>">
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-related"><span data-toggle="tooltip"><?php echo $entry_relateds; ?></span></label>
            <div class="col-sm-9">
                  <input type="text" name="related" value="" placeholder="<?php echo $entry_relateds; ?>" id="input-related" class="form-control" />
                  <div id="product-related" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($product_relateds as $product_related) { ?>
                    <div id="product-related<?php echo $product_related['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_related['name']; ?>
                      <input type="hidden" name="product_related[]" value="<?php echo $product_related['product_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
            </div>
        </div>
	</form>
<div class="row mtb10">
		<div class="col-xs-12 text-center">
			<button class="btn-editor btn-primary-editor" type="button" data-toggle="collapse" data-target="#change_edit_related_product" aria-expanded="false" aria-controls="collapseExample">
			<?php echo $button_last_change;?>
			</button>
		</div>
	</div>
<div class="row collapse" id="change_edit_related_product">
	<div class="col-xs-12">
	<table class="table table-bordered table-hover">
    <thead>
      <tr>
        <th class="text-center"><?php echo $ch_user; ?></th>
        <th class="text-center"><?php echo $ch_related_pr; ?></th>
        <th class="text-center"><?php echo $ch_date; ?></th>
      </tr>
    </thead>
    <tbody>
	<?php $i=0;?>
		<?php foreach ($change_editRelatedProduct as $result ) { ?>
			<?php if($i >= 10) break;?>
			<tr>
				<td class="text-center"><div class="ch-user-name"><?php echo $result['user_name'];?></div></label></td>
				<td class="text-center">
				<?php if($result['related_changes'] =='RP') { ?>
					<i class="fa fa-check-square-o ch-green" aria-hidden="true"></i>
				<?php } else { ?>
					<i class="fa fa-minus-square ch-red" aria-hidden="true"></i>
				<?php } ?>
				</td>
				<td class="text-center"><?php echo $result['date_modified'];?></td>
			</tr>
		<?php $i++;?>
	<?php } ?>
    </tbody>
  </table>
	</div>
</div>	
<div class="text-right">
	<button onclick="$('.popup_banner').popup('hide');" class="btn-editor btn-cancel-editor" type="button"><?php echo $button_cancel;?></button>
	<button onclick="saveEditorRelatedProduct();" class="btn-editor btn-save-editor" type="button"><?php echo $button_save;?></button>
</div>
</div>
<script>
function saveEditorRelatedProduct() {
	$.ajax({
			url: 'index.php?route=module/editproduct/editrelated/saveRelatedProduct&product_id=<?php echo $product_id;?>',
			type: 'post',
			dataType: 'json',
			data: $('#related-form').serialize(),
			beforeSend: function() {
				$('.popup-alert').remove();
				$('#related-form').prepend('<div id="loading_img_svg"></div>');
				$('#related-form').css('opacity',0.5);
				loading_img_svg(true);
			},
			complete: function() {
				loading_img_svg(false);
				$('#related-form').css('opacity',1);
			},
			success: function(json) {
				$('.popup-alert').remove();
				if (json['error']) {
					$('#related-form').before('<div class="popup-alert alert alert-danger"><i class="fa fa-info-circle"></i> '+ json['error'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				if (json['success']) {
					$('#related-form').before('<div class="popup-alert alert alert-success"><i class="fa fa-info-circle"></i> '+ json['success'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				location.reload();
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});	
};
</script>
<script>
// Related
$('input[name=\'related\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=module/editproduct/editrelated/autocomplete_related&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'related\']').val('');
		
		$('#product-related' + item['value']).remove();
		
		$('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_related[]" value="' + item['value'] + '" /></div>');	
	}	
});

$('#product-related').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script> 
