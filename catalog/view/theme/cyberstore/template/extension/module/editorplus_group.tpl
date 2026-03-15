<?php if($user_logged) { ?>
<script>
var loading_masked_img = '<img src="catalog/view/theme/cyberstore/image/ring-alt-1.svg" />';
	function loading_img_svg(action) {
		if (action) {
			$('#loading_img_svg').html(loading_masked_img);
			$('#loading_img_svg').show();
		} else {
			$('#loading_img_svg').html('');
			$('#loading_img_svg').hide();
		}
	}
	function show_editor(link) {
		$('body').prepend('<div id="loading_img_svg"></div>');
		loading_img_svg(true); 
		$('body').append('<div class="popup_banner"></div>');
		$('.popup_banner').popup({
			transition: 'all 0.3s',
			closetransitionend: function () {$(this).remove();}
		});
		$('.popup_banner').load(link, function() {
			$('.popup_banner').append('<i class="fa fa-times closepopup" onclick="$(\'.popup_banner\').popup(\'hide\');"></i>');
			loading_img_svg(false); 
			$('.popup_banner').popup('show');
		});
	}
	$('#group-editor').find('select').selectpicker('refresh');
</script>
<?php if($group_editor == 'Y') { ?>	
<div id="group-editor">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="input-group">
					<span class="input-group-addon input-group-edit"><i class="fa fa-pencil fa-fw"></i><?php echo $pge_text_batch_edit;?></span>
					<select disabled="disabled" title="<?php echo $pge_text_none_editor;?>" class="form-control selectpicker bs-select-hidden" id="top-quick-edit-data">
						<option class="bs-title-option" value=""> <?php echo $pge_text_none_editor;?> </option>
						<optgroup label="<?php echo $pge_text_opt_general_data;?>">
							<option value="nameGroup"><?php echo $pge_text_opt_name_product;?></option>
							<option value="metaTitleGroup"><?php echo $pge_text_opt_meta_title;?></option>
							<option value="metaH1Group"><?php echo $pge_text_opt_meta_h1;?></option>		
							<option value="metaDescriptionGroup"><?php echo $pge_text_opt_meta_descripton;?></option>						
							<option value="metaKeywordGroup"><?php echo $pge_text_opt_meta_keyword;?></option>
							<option value="metaTagGroup"><?php echo $pge_text_opt_tag;?></option>
							<option value="urlGroup"><?php echo $pge_text_opt_url;?></option>
						</optgroup>
						<optgroup label="<?php echo $pge_text_opt_data;?>">
							<option value="priceGroup"><?php echo $pge_text_opt_price;?></option>
							<option value="quantityGroup"><?php echo $pge_text_opt_quantity;?></option>
							<option value="minquantityGroup"><?php echo $pge_text_opt_minquantity;?></option>
							<option value="modelGroup"><?php echo $pge_text_opt_mlt;?></option>
							<option value="сodesGroup"><?php echo $pge_text_opt_code;?></option>
							<option value="dateavailableGroup"><?php echo $pge_text_opt_date_status;?></option>
							<option value="stockShippingGroup"><?php echo $pge_text_opt_stockshipping;?></option>
							<option value="weightDimensionsGroup"><?php echo $pge_text_opt_weightdimensions;?></option>
						</optgroup>
						<optgroup label="<?php echo $pge_text_opt_links;?>">
							<option value="manufacturerGroup"><?php echo $pge_text_opt_manufacturer;?></option>
							<option value="categoryGroup"><?php echo $pge_text_opt_category;?></option>
							<option value="filterGroup"><?php echo $pge_text_opt_filter;?></option>
							<option value="relatedProductGroup"><?php echo $pge_text_opt_related;?></option>
						</optgroup>
						<optgroup label="<?php echo $pge_text_opt_special_discount;?>">
							<option value="specialGroup"><?php echo $pge_text_opt_special;?></option>
							<option value="discountGroup"><?php echo $pge_text_opt_discount;?></option>
						</optgroup>
						<optgroup label="<?php echo $pge_text_opt_attribute_options;?>">
							<option value="attributeGroup"><?php echo $pge_text_opt_attribute;?></option>
							<option value="optionsGroup"><?php echo $pge_text_opt_options;?></option>
						</optgroup>						
					</select>
				</div>
			</div>
			<div class="col-sm-6">
				<button class="btn-editor btn-selectall-editor" type="button" onclick="groupEditorSelectAll();"><?php echo $pge_text_select_all_product;?></button>
				<span id="checked_countpr" class="btn-editor btn-countpr">0</span>
				<span id="checked_countpr" class="btn-editor btn-cancel-editor" onclick="groupEditorRefresh();"><?php echo $pge_text_reset; ?></span>
			</div>
		</div>
	</div>
<script>
var loading_masked_img = '<img src="catalog/view/theme/cyberstore/image/ring-alt-1.svg" />';
	function loading_img_svg(action) {
		if (action) {
			$('#loading_img_svg').html(loading_masked_img);
			$('#loading_img_svg').show();
		} else {
			$('#loading_img_svg').html('');
			$('#loading_img_svg').hide();
		}
	}
	function show_editor_group(link) {
		$('body').prepend('<div id="loading_img_svg"></div>');
		loading_img_svg(true); 
		$('body').append('<div class="popup_banner"></div>');
		$('.popup_banner').popup({
			transition: 'all 0.3s',
			closetransitionend: function () {$(this).remove();}
		});
		$('.popup_banner').load(link, function() {
			$('.popup_banner').append('<i class="fa fa-times closepopup" onclick="$(\'.popup_banner\').popup(\'hide\'); groupEditorRefresh(); "></i>');
			loading_img_svg(false); 
			$('.popup_banner').popup('show');
		});
	}
</script>
<script>
$(document).on('click', '.editor-group-checked-product input.group-editor-checkbox', function () {
	$(this).parent().toggleClass('active');
});
$(document).on('change', '.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']', function () {
	var checked_countpr = $(".editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked").length;
	$('#checked_countpr').html(checked_countpr);		
		if ($('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked').val()) {
			$('#group-editor').find('select').prop('disabled', false);
			$('#group-editor').find('select').selectpicker('refresh');	
			$('#group-editor .input-group-addon').removeClass('input-group-edit');
			$('#group-editor .input-group-addon').addClass('input-group-edit-active');			
		} else {
			$('#group-editor').find('select').prop('disabled', true);
			$('#group-editor').find('select').selectpicker('refresh');
			$('#group-editor').find('select').selectpicker('val', '0');			
			$('#group-editor .input-group-addon').removeClass('input-group-edit-active');
			$('#group-editor .input-group-addon').addClass('input-group-edit');			
		}
	});
$(document).on('change', '#top-quick-edit-data', function () {
	if ($('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked').val()) {	
		var count_checked = $(".editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked").length;
		var val_checked = $(".editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked").val();
		if (count_checked == 1) {
			show_editor_group('index.php?route=module/editproduct/editgroup/quickedit_' + $(this).val() + '&seo_category_id='+ <?php echo $seo_category_id;?> +'&token=<?php echo $token; ?>&product_id='+val_checked);			
		} else {				
			show_editor_group('index.php?route=module/editproduct/editgroup/quickedit_' + $(this).val() + '&seo_category_id='+ <?php echo $seo_category_id;?> +'&token=<?php echo $token; ?>');
		}	
	} else {
		show_editor_group('index.php?route=module/editproduct/editgroup/quickedit_select_product');
	}
});

function groupEditorRefresh(){
	$('.editor-group-checked-product').removeClass('active');
	$('#top-quick-edit-data').selectpicker('val', '0');
	$('.editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']').prop('checked', false);
	$('#group-editor').find('select').prop('disabled', true);
	$('#group-editor').find('select').selectpicker('refresh');
	$('#group-editor .input-group-addon').removeClass('input-group-edit-active');
	$('#group-editor .input-group-addon').addClass('input-group-edit');
	var checked_countpr = $(".editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked").length;
	$('#checked_countpr').html(checked_countpr);	
}
function groupEditorSelectAll(){
	$('.editor-group-checked-product').addClass('active');
	$('#top-quick-edit-data').selectpicker('val', '0');
	$('.editor-group-checked-product input.group-editor-checkbox[name*=\'selected_productgroupeditor\']').prop('checked', true);
	$('input[name*=\'selected_productgroupeditor\']').prop('checked', this.checked);
	$('#group-editor').find('select').prop('disabled', false);
	$('#group-editor').find('select').selectpicker('refresh');	
	$('#group-editor .input-group-addon').removeClass('input-group-edit');
	$('#group-editor .input-group-addon').addClass('input-group-edit-active');	
	var checked_countpr = $(".editor-group-checked-product input.group-editor-checkbox[type=\'checkbox\']:checked").length;
	$('#checked_countpr').html(checked_countpr);
	}
</script>
</div>
<?php } ?>
<?php } ?>