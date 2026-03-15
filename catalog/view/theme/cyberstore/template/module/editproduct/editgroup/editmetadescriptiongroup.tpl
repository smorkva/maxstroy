<div id="popup-editor-product">
	<div class="title-editor"><?php echo $entry_meta_description;?></div>
		<ul class="nav nav-tabs">
            <li class="active"><a href="#seo-general-tab" data-toggle="tab"><?php echo $text_seo_general_tab; ?></a></li>
            <li><a id="tab-list-load" href="#seo-template-tab" data-toggle="tab"><?php echo $text_seo_template_tab; ?></a></li>
        </ul>
		<div class="tab-content">
            <div class="tab-pane active" id="seo-general-tab">
				<form class="form-horizontal" id="form-product-meta-description" enctype="multipart/form-data" method="post">			
					<div class="form-group">
						<div class="col-sm-12 col-sm-push-3"> <button type="button" id="button-save-seo" class="btn btn-success-editor"><?php echo $button_seo_template_save;?></button></div>
					</div>
					<div class="form-group">  
						<label class="col-sm-3 desc_edit_label" for="input-quantity"><?php echo $entry_method; ?></label>
						<div class="col-sm-9">
							<select class="form-control" id="input-quantity-method" name="seo_desc_method">
								<option value="seo_desc_del"><?php echo $text_delete_seo_meta;?></option>
								<option value="seo_desc_skip"><?php echo $text_skip_seo_meta;?></option>											 
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12" id="desc_load_select">
							<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><?php if($VERSION < 2.2){?><img src="admin/view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><?php } else { ?><img src="admin/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /><?php } ?></span>
								 <input type="text" name="product_description[<?php echo $language['language_id']; ?>][meta_description]" value="<?php if(!empty($sel_seo_tempalte)){ ?><?php echo isset($sel_seo_tempalte[$language['language_id']]) ? $sel_seo_tempalte[$language['language_id']]['meta_description'] : ''; ?><?php } else { ?><?php echo isset($seo_prod[$language['language_id']]) ? $seo_prod[$language['language_id']]['seo_prod_meta_description'] : ''; ?><?php } ?>" class="form-control" />
							</div>
						 <?php } ?>
						</div>
					</div>
					<div class="form-group">  
						<label class="col-sm-3 desc_edit_label"><?php echo $text_seo_designations;; ?></label>
						<div class="col-sm-9" style="padding-top:9px;">
							<span><?php echo $text_seo_product_name;?></span>
							<span><?php echo $text_seo_price;?></span>
							<span><?php echo $text_seo_model;?></span>
							<span><?php echo $text_seo_sku;?></span>						
							<span><?php echo $text_seo_category;?></span>
							<span><?php echo $text_seo_manufacturer;?></span>									
							<span><?php echo $text_seo_random_text;?></span>				
						</div>
					</div>
				</form>
			</div>
				<div class="tab-pane" id="seo-template-tab">
				<form class="form-horizontal" id="form-product-list-seo" enctype="multipart/form-data" method="post">	
					<div id="list_seo"></div>
				</form>
				</div>	
		</div>
           	
		<div class="text-right">
			<button onclick="$('.popup_banner').popup('hide'); groupEditorRefresh();" class="btn-editor btn-cancel-editor" type="button"><?php echo $button_cancel;?></button>
			<button onclick="saveGroupEditor();" data-loading-text="<?php echo $text_loading_editor; ?>" class="btn-editor btn-save-editor" type="button"><?php echo $button_save;?></button>
		</div>
<script>
$('#list_seo').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();
  $('#list_seo').load(this.href);
});
$('#list_seo').load('index.php?route=module/editproduct/editgroup/seoDescriptionLoad&token=<?php echo $token;?>&seo_category_id=<?php echo $seo_category_id;?>');

function saveSeoDescriptionNew(seo_id) {
	$.ajax({
		url: 'index.php?route=module/editproduct/editgroup/saveSeoDescriptionNew&token=<?php echo $token;?>&seo_id='+ seo_id +'&seo_category_id=<?php echo $seo_category_id;?>',
		type: 'post',
		dataType: 'json',
		data: $('#form-product-list-seo #seo_template'+seo_id+' input'),
		success: function(json) {
		$('#popup-editor-product .alert').remove();
			if (json['warning']) {
				$('#form-product-list-seo').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-product-list-seo').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				$('#list_seo').load('index.php?route=module/editproduct/editgroup/seoDescriptionLoad&token=<?php echo $token;?>&seo_category_id=<?php echo $seo_category_id;?>');
				$('#desc_load_select').load('index.php?route=module/editproduct/editgroup/quickedit_metaDescriptionGroup&seo_category_id='+ <?php echo $seo_category_id;?> +'&token=<?php echo $token; ?> #desc_load_select > div');				
				setTimeout(function(){
					$('.tooltip').remove();	
					$('#popup-editor-product .alert').remove();									
				}, 1000)
			}
		}
	});
}
function applySeoDescription(seo_id) {
	$.ajax({
		url: 'index.php?route=module/editproduct/editgroup/applySeoDescription&token=<?php echo $token;?>&seo_id='+ seo_id +'&seo_category_id=<?php echo $seo_category_id;?>',
		type: 'post',
		dataType: 'json',
		data: $('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked, #form-product-meta-description').serialize(),
		success: function(json) {
		$('#popup-editor-product .alert').remove();
			if (json['warning']) {
				$('#form-product-list-seo').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-product-list-seo').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				$('#list_seo').load('index.php?route=module/editproduct/editgroup/seoDescriptionLoad&token=<?php echo $token;?>&seo_category_id=<?php echo $seo_category_id;?>');
				$('#desc_load_select').load('index.php?route=module/editproduct/editgroup/quickedit_metaDescriptionGroup&seo_category_id='+ <?php echo $seo_category_id;?> +'&token=<?php echo $token; ?> #desc_load_select > div');				
				setTimeout(function(){
					$('.tooltip').remove();		
					$('#popup-editor-product .alert').remove();									
				}, 1000)
			}
		}
	});
}
function deleteSeoDescription(seo_id) {
	$.ajax({
		url: 'index.php?route=module/editproduct/editgroup/deleteSeoDescription&token=<?php echo $token;?>&seo_id='+ seo_id +'&seo_category_id=<?php echo $seo_category_id;?>',
		type: 'post',
		dataType: 'json',
		data: $('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked, #form-product-meta-description').serialize(),
		success: function(json) {
		$('#popup-editor-product .alert').remove();
			if (json['warning']) {
				$('#form-product-list-seo').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-product-list-seo').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				$('#list_seo').load('index.php?route=module/editproduct/editgroup/seoDescriptionLoad&token=<?php echo $token;?>&seo_category_id=<?php echo $seo_category_id;?>');
				$('#desc_load_select').load('index.php?route=module/editproduct/editgroup/quickedit_metaDescriptionGroup&seo_category_id='+ <?php echo $seo_category_id;?> +'&token=<?php echo $token; ?> #desc_load_select > div');				
				setTimeout(function(){
					$('.tooltip').remove();	
					$('#popup-editor-product .alert').remove();									
				}, 1000)
			}
		}
	});
}

$('#button-save-seo').popover({
	html: true,
	placement: 'bottom',
	trigger: 'click',
	title: '<?php echo $entry_name_seo_template; ?>',
	content: function() {
		html  = '<div class="input-group">';
		html += '  <input type="text" name="name_seo_template" value="" placeholder="<?php echo $text_name_seo_template;?>" class="form-control">';
		html += '  <span class="input-group-btn"><button type="button" title="" id="button-create-seo" class="btn btn-primary-editor"><i class="fa fa-plus-circle"></i></button></span>';
		html += '</div>';

		return html;
	}
});

$('#button-save-seo').on('shown.bs.popover', function() {
	$('#button-create-seo').on('click', function() {	
		$.ajax({
		url: 'index.php?route=module/editproduct/editgroup/saveSeoTemplateDescription&token=<?php echo $token;?>&seo_category_id=<?php echo $seo_category_id;?>',
		type: 'post',
		dataType: 'json',
		data: $('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked, #form-product-meta-description').serialize(),
			beforeSend: function() {
				$('#popup-editor-product .btn-save-editor').button('loading');
				$('#form-product-meta-description').prepend('<div id="loading_img_svg"></div>');
				$('#form-product-meta-description').css('opacity',0.5);
				loading_img_svg(true);
			},
			complete: function() {
				loading_img_svg(false);
				$('#popup-editor-product .btn-save-editor').button('reset');
				$('#form-product-meta-description').css('opacity',1);
			},
			success: function(json) {
			$('#popup-editor-product .alert').remove();
				if (json['warning']) {
					$('#form-product-meta-description').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
				}
				if (json['success']) {
					$('#form-product-meta-description').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
					$('#list_seo').load('index.php?route=module/editproduct/editgroup/seoDescriptionLoad&token=<?php echo $token;?>&seo_category_id=<?php echo $seo_category_id;?>');
					$('.popover').remove();	
				}
			}
		});	
	});
});		 


function saveGroupEditor() {	
	$.ajax({
		url: 'index.php?route=module/editproduct/editgroup/productGroupMetaDescriptionChange&token=<?php echo $token;?>',
		type: 'post',
		dataType: 'json',
		data: $('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked, #form-product-meta-description').serialize(),
		beforeSend: function() {
			$('#popup-editor-product .btn-save-editor').button('loading');
			$('#form-product-meta-description').prepend('<div id="loading_img_svg"></div>');
			$('#form-product-meta-description').css('opacity',0.5);
			loading_img_svg(true);
		},
		complete: function() {
			loading_img_svg(false);
			$('#popup-editor-product .btn-save-editor').button('reset');
			$('#form-product-meta-description').css('opacity',1);
		},
		success: function(json) {
		$('#popup-editor-product .alert').remove();
			if (json['warning']) {
				$('#form-product-meta-description').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-product-meta-description').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				
				setTimeout(function(){
					location.reload(true);										
				}, 500)
			}
		}
	});
}
</script>
</div>