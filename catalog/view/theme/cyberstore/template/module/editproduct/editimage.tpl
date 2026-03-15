<div id="popup-editor-product">
	<div class="title-editor"><?php echo $text_images_product;?></div>
	<form action="POST" method="post" enctype="multipart/form-data" id="images-form" class="form-horizontal">
		<input type="hidden" name="user_change" value="<?php echo $user_change;?>">
			<div class="form-group"> 
				<div class="col-sm-3">
					<a href="" id="thumb-general_image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $general_image; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
					<input type="hidden" name="config_general_image" value="<?php echo $config_general_image; ?>" id="input-general_image" />
				</div>
			<div class="col-sm-9">
				<h3><?php echo $product_name; ?></h3>
			</div>				
			</div> 
		<div class="clearfix"></div>
		 <table id="images" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $column_image; ?></td>
                      <td class="text-right"><?php echo $entry_sort_order; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $image_row = 0; ?>
                    <?php foreach ($product_images as $product_image) { ?>
					
                    <tr id="image-row<?php echo $image_row; ?>">
                      <td class="text-left"><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $product_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="input-image<?php echo $image_row; ?>" /></td>
                      <td class="text-right"><input type="text" name="product_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>
                      <td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $image_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" title="<?php echo $button_add_image; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>	
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
		<?php foreach ($change_edit_image as $result ) { ?>
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
	<button onclick="saveEditorImage();" class="btn-editor btn-save-editor" type="button"><?php echo $button_save;?></button>
</div>
<script>
function saveEditorImage() {
	$.ajax({
			url: 'index.php?route=module/editproduct/editimage/saveImage&product_id=<?php echo $product_id;?>',
			type: 'post',
			dataType: 'json',
			data: $('#images-form').serialize(),
			beforeSend: function() {
				$('.popup-alert').remove();
				$('#images-form').prepend('<div id="loading_img_svg"></div>');
				$('#images-form').css('opacity',0.5);
				loading_img_svg(true);
			},
			complete: function() {
				loading_img_svg(false);
				$('#images-form').css('opacity',1);
			},
			success: function(json) {				
				$('.popup-alert').remove();
				if (json['error']) {
					$('#images-form').before('<div class="popup-alert alert alert-danger"><i class="fa fa-info-circle"></i> '+ json['error'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				if (json['success']) {
					$('#images-form').before('<div class="popup-alert alert alert-success"><i class="fa fa-info-circle"></i> '+ json['success'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
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
<script><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
	html  = '<tr id="image-row' + image_row + '">';
	html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
	
	$('#images tbody').append(html);
	
	image_row++;
}
//--></script> 
<script>
	$('button[data-event=\'showImageDialog\']').attr('data-toggle', 'image').removeAttr('data-event');	
	$(document).delegate('button[data-toggle=\'image\']', 'click', function() {
		$('#modal-image').remove();
		
		$(this).parents('.note-editor').find('.note-editable').focus();
				
		$.ajax({
			url: 'index.php?route=common/filemanagernew&token=' + getURLVar('token'),
			dataType: 'html',
			beforeSend: function() {
				$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
				$('#button-image').prop('disabled', true);
			},
			complete: function() {
				$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
				$('#button-image').prop('disabled', false);
			},
			success: function(html) {
				$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
	
				$('#modal-image').modal('show');
			}
		});	
	});
	
	// Image Manager
	$(document).delegate('a[data-toggle=\'image\']', 'click', function(e) {
		e.preventDefault();
		$('.popover').remove();		
		var element = this;
		$(element).popover({
			html: true,
			placement: 'right',
			trigger: 'manual',
			content: function() {
				return '<button type="button" id="button-image" class="btn btn-primary"><i class="fa fa-pencil"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>';
			}
		});
		
		$(element).popover('show');

		$('#button-image').on('click', function() {
			$('#modal-image').remove();
		
			$.ajax({
				url: 'index.php?route=common/filemanagernew&token=' + getURLVar('token') + '&target=' + $(element).parent().find('input').attr('id') + '&thumb=' + $(element).attr('id'),
				dataType: 'html',
				beforeSend: function() {
					$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
					$('#button-image').prop('disabled', true);
				},
				complete: function() {
					$('#button-image i').replaceWith('<i class="fa fa-pencil"></i>');
					$('#button-image').prop('disabled', false);
				},
				success: function(html) {
					$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
		
					$('#modal-image').modal('show');
				}
			});
			
			$(element).popover('hide', function() {
				$('.popover').remove();
			});
		});		
		
		$('#button-clear').on('click', function() {
			$(element).find('img').attr('src', $(element).find('img').attr('data-placeholder'));
			
			$(element).parent().find('input').attr('value', '');
			
			$(element).popover('hide', function() {
				$('.popover').remove();
			});
		});
	});
  </script> 