<div id="popup-editor-product">
<script src="catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js"></script>
<link href="catalog/view/javascript/jquery/magnific/magnific-popup.css" />	
<div class="title-editor"><?php echo $text_images_product_google;?></div>
	<form class="form-horizontal" enctype="multipart/form-data" method="post" id="form_image_google_data<?php echo $product_id; ?>">
		<input type="hidden" name="user_change" value="<?php echo $user_change;?>">
		<div class="form-group">
			<div class="col-sm-3">
				<select class="form-control" name="fileType">
					<option value="">---<?php echo "Тип файла"; ?>---</option>
					<option value="jpg">JPG</option>
					<option value="png">PNG</option>
					<option value="gif">GIF</option>
					<option value="bmp">BMP</option>
				</select>
			</div>
			<div class="col-sm-2">
				<select class="form-control" name="imgDominantColor">
					<option value="">---<?php echo "Цвет"; ?>---</option>
					<option style="background:yellow;" value="yellow">Yellow</option>
					<option style="background:green;" value="green">Green</option>
					<option style="background:teal;" value="teal">Teal</option>
					<option style="background:blue;" value="blue">Blue</option>
					<option style="background:purple;" value="purple">Purple</option>
					<option style="background:pink;" value="pink">Pink</option>
					<option style="background:white;" value="white">White</option>
					<option style="background:gray;" value="gray">Gray</option>
					<option style="background:black;" value="black">Black</option>
					<option style="background:brown;" value="brown">Brown</option>
				</select>
			</div>
			<div class="col-sm-2">
				<select class="form-control" name="imgColorType">
					<option value="">---<?php echo "Цвет"; ?>---</option>
					<option value="mono">Mono</option>
					<option value="gray">Gray</option>
					<option value="color">Color</option>
				</select>
			</div>
			<div class="col-sm-2">
				<select class="form-control" name="imgSize">
					<option value="">---<?php echo "Размер" ?>---</option>
					<option value="icon">Icon</option>
					<option value="small">Small</option>
					<option value="medium">Medium</option>
					<option value="large">Large</option>
					<option value="xlarge">Xlarge</option>
					<option value="xxlarge">Xxlarge</option>
					<option value="huge">Huge</option>
				</select>
			</div>
			<div class="col-sm-3">
				<select class="form-control" name="imgType">
					<option value="">---<?php echo "Тип картинки" ?>---</option>
					<option value="face">Face</option>
					<option value="photo">Photo</option>
					<option value="clipart">Clipart</option>
					<option value="lineart">Lineart</option>
				</select>
			</div>
		</div>
		<?php if ($product_id) { ?>
			<input name="selected[]" value="<?php echo $product_id; ?>" type="hidden" />
		<?php } ?>
		<div class="form-group">
			<?php if ($product_id) { ?>
				<input name="selected[]" value="<?php echo $product_id; ?>" type="hidden" />
			<?php } ?>
			<label class="col-sm-3 desc_edit_label"><?php echo $text_folder; ?></label>
			<div class="col-sm-6">
				<select class="form-control" id="category_default" name="image_google[directory][main]">
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
		<div class="col-sm-9"><input class="keyword form-control" name="image_google[keyword]" type="text" size="100" maxlength="128" value="<?php echo (isset ($keyword)) ? $keyword : ''; ?>" /></div>
		<div class="col-sm-3"><a class="btn btn-add-editor" onclick="searchImageGoogle(<?php echo $product_id; ?>);"><?php echo "Поиск"; ?></a></div>
	</div>
    
		<div class="form-group">
			<div class="col-sm-12"><div class="scrollbox"></div></div>
		</div>
		<div id="messageLoad"></div>
		<div id="overlay"></div>
		<div class="form-group">
			<div class="col-sm-6 text-right">
				<div class="btn btn-add-editor"><?php echo $text_main; ?> <span class="image_google_count_main">0</span></div>
			</div>
			<div class="col-sm-6 text-left"> 
				<div class="btn btn-add-editor"><?php echo $text_additional; ?> <span class="image_google_count_additional">0</span></div>
			</div>
		</div>
    </form>
	<div class="text-center">
		<a class="btn btn-delete-editor" onclick="resetImageGoogle(<?php echo $product_id; ?>);"><?php echo $text_reset; ?></a>
	</div>
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
	<button onclick="saveEditorGoogleImage();" class="btn-editor btn-save-editor" type="button"><?php echo $button_save;?></button>
</div>
<script>
function saveEditorGoogleImage() {
	$.ajax({
			url: 'index.php?route=module/editproduct/editimagegoogle/saveImageGoogle&product_id=<?php echo $product_id;?>',
			type: 'post',
			dataType: 'json',
			data: $('#form_image_google_data<?php echo $product_id;?>').serialize(),
			beforeSend: function() {
				$('.popup-alert').remove();
				$('#form_image_google_data<?php echo $product_id;?>').prepend('<div id="loading_img_svg"></div>');
				$('#form_image_google_data<?php echo $product_id;?>').css('opacity',0.5);
				loading_img_svg(true);
			},
			complete: function() {
				loading_img_svg(false);
				$('#form_image_google_data<?php echo $product_id;?>').css('opacity',1);
			},
			success: function(json) {
				$('.popup-alert').remove();
				if (json['error']) {
					$('#form_image_google_data<?php echo $product_id;?>').before('<div class="popup-alert alert alert-danger"><i class="fa fa-info-circle"></i> '+ json['error'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				if (json['success_additionalimg']) {
					$('#form_image_google_data<?php echo $product_id;?>').before('<div class="popup-alert alert alert-success"><i class="fa fa-info-circle"></i> '+ json['success_additionalimg'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				if (json['success_generalimg']) {
					$('#form_image_google_data<?php echo $product_id;?>').before('<div class="popup-alert alert alert-success"><i class="fa fa-info-circle"></i> '+ json['success_generalimg'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				if(json['success_additionalimg'] || json['success_generalimg']){
					location.reload();
				}
				
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});	
};
</script>
<script><!--
var timeoutID = 0;
var product_top = 1;
var loading30 = '<img src="catalog/view/editproduct/image/loading30.gif" />';
$(document).ready(function() {
	$('#popup-editor-product').prepend('<div id="loading-img-google"></div>');
});
function loadingImgGoogle(action) {
	if (action) {
		$('#loading-img-google').html(loading30);
		$('#loading-img-google').show();
	} else {
		$('#loading-img-google').html('');
		$('#loading-img-google').hide();
	}
}


if (typeof counter == 'undefined') {
	var counter = [];
}
counter[<?php echo $product_id; ?>] = 1;

$(document).ready(function() {
	$('#form_image_google_data<?php echo $product_id; ?> input[name=\'image_google[keyword]\']').keypress(function(e) {
		if (e.keyCode == 13) {
			searchImageGoogle(<?php echo $product_id; ?>);
			return false;
		}
	}).focus();
});
 $(document).on('click', '#form_image_google_data<?php echo $product_id; ?> input[type=\'checkbox\']', function() {
		if ($(this).attr('name') == 'image_google[data][main]') {
			$('#form_image_google_data<?php echo $product_id; ?> input[name=\'image_google[data][main]\']').not(this).removeAttr('checked');
			$(this).parents('div:first').children('input[name=\'image_google[data_dop][]\']').removeAttr('checked');
		} else {
			$(this).parents('div:first').children('input[name=\'image_google[data][main]\']').removeAttr('checked');
		}
		
		$('#form_image_google_data<?php echo $product_id; ?> .image_google_count_main').html($('#form_image_google_data<?php echo $product_id; ?> input[name=\'image_google[data][main]\']:checked').length);
		$('#form_image_google_data<?php echo $product_id; ?> .image_google_count_additional').html($('#form_image_google_data<?php echo $product_id; ?> input[name=\'image_google[data_dop][]\']:checked').length);
	});
if (typeof searchImageGoogle != 'function') {
	function searchImageGoogle(product_id) {
		counter[product_id] = 1;
		$('#form_image_google_data' + product_id + ' .scrollbox').html('');
		$('#form_image_google_data' + product_id + ' .image_google_count_main').html('0');
		$('#form_image_google_data' + product_id + ' .image_google_count_additional').html('0');
		getImageGoogle(product_id);
	}
}
if (typeof resetImageGoogle != 'function') {
	function resetImageGoogle(product_id) {
		$('#form_image_google_data' + product_id + ' input[type=\'checkbox\']').removeAttr('checked');
		$('#form_image_google_data' + product_id + ' .image_google_count_main').html('0');
		$('#form_image_google_data' + product_id + ' .image_google_count_additional').html('0');
	}
}

if (typeof getImageGoogle != 'function') {
	function getImageGoogle(product_id) {
		var html = '';
		var setting = $('#form_image_google_data'+ product_id + 'option:selected').serialize();		
		var keyword = encodeURIComponent($('#form_image_google_data' + product_id + ' input[name=\'image_google[keyword]\']').val());
		
		if (!keyword) { return false; }
		xhr = $.ajax({
		type:'GET',
		dataType:'json',
		data:'q=' + keyword + '&start=' + counter[product_id] + '&num=5&' + $('#form_image_google_data' + product_id).serialize(),
		url:'index.php?route=module/editproduct/editimagegoogleapi',
		beforeSend: function() { 
			loadingImgGoogle(true);
			$('.warning').hide('slow');
		},
		success: function(json){
				loadingImgGoogle(false);
				$('.alert.alert-danger').remove();
				if (json['error']) {
						$('.scrollbox').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error']['message'] + '</div>');
				} else {
				
					if (counter[product_id] == 1 && (json['items']).length > 0) {
						$('#form_image_google_data' + product_id + ' .scrollbox').html('<span><a class="button btn btn-add-editor" onclick="getImageGoogle(' + product_id + ');"><?php echo $text_more; ?></a></span>');
					}
					
					$.each(json['items'], function(index, value) {
						
						html =  '<div class="img-search-google">';
						html += '	<div class="checkbox-image-google"><input name="image_google[data][main]" type="checkbox" value="' + value['link'] + '"> <?php echo $text_main; ?></div>';
						html += '	<div class="checkbox-image-google"><input name="image_google[data_dop][]" type="checkbox" value="' + value['link'] + '"> <?php echo $text_additional; ?></div>';
						html += '	<b>' + value['image']['width'] + 'x' + value['image']['height'] + '</b>';
						html +=	'	<div class="img-search-google-thumb thumbmagnific' + product_id + '">';
						html += '		<a class="magnific' + product_id + '" href="' + value['link'] + '">';
						html += '			<img src="' + value['link'] + '" alt="" title="" width="' + value['image']['thumbnailWidth'] + '" height="' + value['image']['thumbnailHeight'] + '">';
						html += '		</a>';
						html += '	</div>';
						html += '</div>';
						
						$('#form_image_google_data' + product_id + ' .scrollbox span').before(html);
						$('#form_image_google_data' + product_id + ' .scrollbox').scrollTop(9999);
						$('#form_image_google_data' + product_id + ' .thumbmagnific' + product_id).magnificPopup({type:'image',delegate: 'a',gallery: {enabled:true}});
					});
					
					counter[product_id] += 5;
					if (counter[product_id] >= 64) {
						counter[product_id] = 0;
						$('#form_image_google_data' + product_id + ' .scrollbox span').remove();
					}
				}
								
				
			}
		});
	}
}


<?php if (isset ($keyword) && $keyword) { ?>
searchImageGoogle(<?php echo $product_id; ?>);
<?php } ?>

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
				$('#form_image_google_data<?php echo $product_id;?>').prepend('<div id="loading_img_svg"></div>');
				$('#form_image_google_data<?php echo $product_id;?>').css('opacity',0.5);
				loading_img_svg(true);
			},
			complete: function() {
				$('#button-create').prop('disabled', false);
				loading_img_svg(false);
				$('#form_image_google_data<?php echo $product_id;?>').css('opacity',1);
			},
			success: function(json) {
				if (json['error']) {
					$('#form_image_google_data<?php echo $product_id;?>').before('<div class="popup-alert alert alert-danger"><i class="fa fa-info-circle"></i> '+ json['error'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				if (json['success']) {
					$('#form_image_google_data<?php echo $product_id;?>').before('<div class="popup-alert alert alert-success"><i class="fa fa-info-circle"></i> '+ json['success'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
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
//--></script>
</div>