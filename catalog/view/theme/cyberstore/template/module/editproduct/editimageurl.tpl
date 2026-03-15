<div id="popup-editor-product">
	<div class="title-editor"><?php echo $text_images_product_google;?></div>
	<form class="form-horizontal" id="form-image-url" enctype="multipart/form-data" method="post">
		<input type="hidden" name="user_change" value="<?php echo $user_change;?>">
		<div class="form-group">
			<?php if ($product_id) { ?>
				<input name="selected[]" value="<?php echo $product_id; ?>" type="hidden" />
			<?php } ?>
			<label class="col-sm-3 desc_edit_label"><?php echo $text_folder; ?></label>
			<div class="col-sm-3">
				<select class="form-control" id="category_default" name="image_url[directory][main]">
					<option data-name-folder="" value="data">catalog</option>
					<?php if (isset($category_default)) { ?>
						<option data-name-folder="<?php echo $category_default;?>" selected="selected" value="catalog/<?php echo $category_default;?>">catalog/<?php echo $category_default;?></option>
					<?php } else { ?>
						<option data-name-folder="" value="data">catalog</option>  
					<?php } ?>
						
					<?php foreach ($directories as $directory) { ?>
						<option data-name-folder="<?php echo $directory['dir_name']; ?>" value="<?php echo $directory['path']; ?>"><?php echo $directory['path']; ?></option>
					<?php } ?>
				</select>
			</div>
			<div class="col-sm-3">
				<button type="button" data-toggle="tooltip" title="<?php echo $button_folder; ?>" id="button-folder" class="btn-editor btn-save-editor"><i class="fa fa-folder"></i></button>
			</div>		
		</div>
		<div class="form-group">
			<label class="col-sm-3 desc_edit_label"><?php echo $entry_url_image;?></label>
			<div class="col-sm-9">
				<input class="form-control" type="text" name="add_image_url" value=""/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 desc_edit_label"><?php echo $entry_general_addit_image;?></label>
			<div class="col-sm-4">		
				<input class="general" type="checkbox" name="general_image_url" value="general" /> <?php echo $text_main; ?>
				<input class="additional" type="checkbox" name="additional_image_url" value="additional" /> <?php echo $text_additional; ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 desc_edit_label"><?php echo $entry_name_image;?></label>
			<div class="col-sm-9">
				<input class="form-control" type="text" name="image_name" value="<?php echo $product_name;?>"/>
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
        <th class="text-center"><?php echo $ch_image_general; ?></th>
        <th class="text-center"><?php echo $ch_image_additional; ?></th>
        <th class="text-center"><?php echo $ch_date; ?></th>
      </tr>
    </thead>
    <tbody>
	<?php $i=0;?>
		<?php foreach ($change_edit_image_url as $result ) { ?>
			<?php if($i >= 10) break;?>
			<tr>
				<td class="text-center"><div class="ch-user-name"><?php echo $result['user_name'];?></div></label></td>
				<td class="text-center"><?php if($result['general_image'] !='') { ?>
					<i class="fa fa-check-square-o ch-green" aria-hidden="true"></i>
				<?php } else { ?>
					<i class="fa fa-minus-square ch-red" aria-hidden="true"></i>
				<?php } ?>
				</td>
				<td class="text-center"><?php if($result['additional_image'] !='') { ?>
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
	<button onclick="saveEditorImageUrl();" class="btn-editor btn-save-editor" type="button"><?php echo $button_save;?></button>
</div>
<script>
function saveEditorImageUrl() {
	$.ajax({
			url: 'index.php?route=module/editproduct/editimageurl/saveImageUrl&product_id=<?php echo $product_id;?>',
			type: 'post',
			dataType: 'json',
			data: $('#form-image-url').serialize(),
			beforeSend: function() {
				$('.popup-alert').remove();
				$('#form-image-url').prepend('<div id="loading_img_svg"></div>');
				$('#form-image-url').css('opacity',0.5);
				loading_img_svg(true);
			},
			complete: function() {
				loading_img_svg(false);
				$('#form-image-url').css('opacity',1);
			},
			success: function(json) {
				$('.popup-alert').remove();
				if (json['error']) {
					$('#form-image-url').before('<div class="popup-alert alert alert-danger"><i class="fa fa-info-circle"></i> '+ json['error'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				if (json['success']) {
					$('#form-image-url').before('<div class="popup-alert alert alert-success"><i class="fa fa-info-circle"></i> '+ json['success'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
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
		function checks() {
           $('#popup-editor-product .general').on('change', function(){
				if ($('#popup-editor-product .general:checkbox:checked').length > 0) {
					$('#popup-editor-product .additional').attr('disabled', 'disabled');
					$('#popup-editor-product .additional').toggleClass('disabled');
				} else {
					$('#popup-editor-product .additional').removeAttr('disabled', 'disabled');	
					$('#popup-editor-product .additional').removeClass('disabled');
				}
				
           });
		   $('#popup-editor-product .additional').on('change', function(){
                if ($('#popup-editor-product .additional:checkbox:checked').length > 0) {
					$('#popup-editor-product .general').attr('disabled', 'disabled');	                 
                 } else {
					$('#popup-editor-product .general').removeAttr("disabled","disabled");
				 }
           });
          } checks();
$('#button-folder').popover({
	html: true,
	placement: 'bottom',
	trigger: 'click',
	title: '<?php echo $entry_folder; ?>',
	content: function() {
		html  = '<div class="input-group">';
		html += '  <input type="text" name="folder" value="" placeholder="<?php echo $entry_folder; ?>" class="form-control">';
		html += '  <span class="input-group-btn"><button type="button" title="<?php echo $button_folder; ?>" id="button-create" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></span>';
		html += '</div>';

		return html;
	}
});

$('#button-folder').on('shown.bs.popover', function() {
	$('#button-create').on('click', function() {
	var category_default = encodeURIComponent($('#category_default option:selected').attr('data-name-folder'));
	
		$.ajax({
			url: 'index.php?route=common/filemanagernew/folder&token=<?php echo $token; ?>&directory='+ category_default+'',
			type: 'post',
			dataType: 'json',
			data: 'folder=' + encodeURIComponent($('input[name=\'folder\']').val()),
			beforeSend: function() {
				$('.popup-alert').remove();
				$('#button-create').prop('disabled', true);
				$('#form-image-url').prepend('<div id="loading_img_svg"></div>');
				$('#form-image-url').css('opacity',0.5);
				loading_img_svg(true);
			},
			complete: function() {
				loading_img_svg(false);
				$('#form-image-url').css('opacity',1);
				$('#button-create').prop('disabled', false);
			},
			success: function(json) {
				if (json['error']) {
					$('#form-image-url').before('<div class="popup-alert alert alert-danger"><i class="fa fa-info-circle"></i> '+ json['error'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				if (json['success']) {
					$('#form-image-url').before('<div class="popup-alert alert alert-success"><i class="fa fa-info-circle"></i> '+ json['success'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					$('#popup-editor-product .popover').popover('hide');
					$('#category_default').load('index.php?route=module/editproduct/editimageurl/loadFolder&token=<?php echo $token;?>&product_id=<?php echo $product_id;?>');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
});		  
</script> 
<script>
$('#form-image_url<?php echo $product_id; ?> input[type=\'checkbox\']').on('click', function() {
		if ($(this).attr('name') == 'image_url[data][main]') {
			$('#form-image_url<?php echo $product_id; ?> input[name=\'image_url[data][main]\']').not(this).removeAttr('checked');
			$(this).parents('div:first').children('input[name=\'image_url[data_dop][]\']').removeAttr('checked');
		} else {
			$(this).parents('div:first').children('input[name=\'image_url[data][main]\']').removeAttr('checked');
		}
		
		$('#form-image_url<?php echo $product_id; ?> .image_google_count_main').html($('#form-image_url<?php echo $product_id; ?> input[name=\'image_url[data][main]\']:checked').length);
		$('#form-image_url<?php echo $product_id; ?> .image_google_count_additional').html($('#form-image_url<?php echo $product_id; ?> input[name=\'image_url[data_dop][]\']:checked').length);
	});
</script>  
</div>