<div id="popup-editor-product">
	<div class="title-editor"><?php echo $text_special;?></div>
	<form id="special-form" action="POST" method="post" enctype="multipart/form-data" class="form-horizontal">
		<input type="hidden" name="user_change" value="<?php echo $user_change;?>">
		<div class="table-responsive">
			<table id="special" class="table table-bordered" style="background:#fff;">
				<tr>
					<td class="text-left"><?php echo $entry_customer_group; ?></td>
					<td class="text-left"><?php echo $entry_priority; ?></td>
					<td class="text-left"><?php echo $entry_price; ?></td>
					<td class="text-left"><?php echo $entry_date_start; ?></td>
					<td class="text-left"><?php echo $entry_date_end; ?></td>
					<td></td>
				</tr>
			<?php $special_row = 0; ?>
			<?php foreach ($product_specials as $product_special) { ?>
				<tr id="special-row<?php echo $special_row; ?>">
					<td class="text-left">
						<select class="form-control" name="product_special[<?php echo $special_row; ?>][customer_group_id]">
						  <?php foreach ($customer_groups as $customer_group) { ?>
							<?php if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>
							  <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
							<?php } else { ?>
							  <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
							<?php } ?>
						  <?php } ?>
						</select>
					</td>
					<td class="text-left"><input class="form-control" type="text" name="product_special[<?php echo $special_row; ?>][priority]" value="<?php echo $product_special['priority']; ?>" size="2" /></td>
					<td class="text-left"><input class="form-control" type="text" name="product_special[<?php echo $special_row; ?>][price]" value="<?php echo $product_special['price']; ?>" /></td>
					<td class="text-left" style="width: 20%;">
						<div class="input-group date">
							<input type="text" name="product_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $product_special['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
							<span class="input-group-btn">
								<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
							</span>
						</div>
					</td>
					<td class="text-left" style="width: 20%;">
						<div class="input-group date">
							<input type="text" name="product_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $product_special['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
							<span class="input-group-btn">
								<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
							</span>
						</div>
					</td>
					
					<td class="text-left"><a onclick="$('#special-row<?php echo $special_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-delete-editor"><i class="fa fa-minus-circle"></i></a></td>
				</tr>
			  <?php $special_row++; ?>
			<?php } ?>
			  <tr id="specialf">
				<td colspan="5"></td>
				<td class="text-left"><a onclick="addSpecial();" data-toggle="tooltip" title="<?php echo $button_add_special; ?>" class="btn btn-add-editor"><i class="fa fa-plus-circle"></i></a></td>
			  </tr>  
			
		  </table>
		</div> 
	</form>
		<div class="row mtb10">
		<div class="col-xs-12 text-center">
			<button class="btn-editor btn-primary-editor" type="button" data-toggle="collapse" data-target="#change_edit_special" aria-expanded="false" aria-controls="collapseExample">
			<?php echo $button_last_change;?>
			</button>
		</div>
		</div>
		<div class="row collapse" id="change_edit_special">
		<div class="col-xs-12">
		<table class="table table-bordered table-hover">
		<thead>
		  <tr>
			<th class="text-center"><?php echo $ch_user; ?></th>
			<th class="text-center"><?php echo $ch_special; ?></th>
			<th class="text-center"><?php echo $ch_date; ?></th>
		  </tr>
		</thead>
		<tbody>
		<?php $i=0;?>
			<?php foreach ($change_edit_special as $change_edit_special) { ?>
				<?php if($i >= 10) break;?>
				<tr>
					<td class="text-center"><div class="ch-user-name"><?php echo $change_edit_special['user_name'];?></div></label></td>
					<td class="text-center"><?php if($change_edit_special['special_changes'] !='') { ?>
						<i class="fa fa-check-square-o ch-green" aria-hidden="true"></i>
					<?php } else { ?>
						<i class="fa fa-minus-square ch-red" aria-hidden="true"></i>
					<?php } ?>
					</td>
					<td class="text-center"><?php echo $change_edit_special['date_modified'];?></td>
				</tr>
			<?php $i++;?>
		<?php } ?>
		</tbody>
	  </table>
		</div>
	</div>
<div class="text-right">
	<button onclick="$('.popup_banner').popup('hide');" class="btn-editor btn-cancel-editor" type="button"><?php echo $button_cancel;?></button>
	<button onclick="saveEditorSpecial();" class="btn-editor btn-save-editor" type="button"><?php echo $button_save;?></button>
</div>
<script>
function saveEditorSpecial() {
	$.ajax({
			url: 'index.php?route=module/editproduct/editspecial/saveEditorSpecial&product_id=<?php echo $product_id;?>',
			type: 'post',
			dataType: 'json',
			data: $('#special-form').serialize(),
			beforeSend: function() {
				$('.popup-alert').remove();
				$('#special-form').prepend('<div id="loading_img_svg"></div>');
				$('#special-form').css('opacity',0.5);
				loading_img_svg(true);
			},
			complete: function() {
				loading_img_svg(false);
				$('#special-form').css('opacity',1);
			},
			success: function(json) {				
				$('.popup-alert').remove();
				if (json['error']) {
					$('#special-form').before('<div class="popup-alert alert alert-danger"><i class="fa fa-info-circle"></i> '+ json['error'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				if (json['success']) {
					$('#special-form').before('<div class="popup-alert alert alert-success"><i class="fa fa-info-circle"></i> '+ json['success'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				location.reload();
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});	
};
</script>
<script src="catalog/view/editproduct/js/datetimepicker/moment.js"></script>
<script src="catalog/view/editproduct/js/datetimepicker/locale/<?php echo $langpicker;?>.js"></script>
<script src="catalog/view/editproduct/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<link href="catalog/view/editproduct/js/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
<script><!--
var special_row = <?php echo $special_row; ?>;
$('#special-form .date').datetimepicker({
	pickTime: false
});
function addSpecial() {
	html = '  <tr id="special-row' + special_row + '">'; 
    html += '    <td class="text-left"><select class="form-control" name="product_special[' + special_row + '][customer_group_id]">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
    <?php } ?>
    html += '    </select></td>';		
    html += '    <td class="text-left"><input class="form-control" type="text" name="product_special[' + special_row + '][priority]" value="" size="2" /></td>';
	html += '    <td class="text-left"><input class="form-control" type="text" name="product_special[' + special_row + '][price]" value="" /></td>';
    html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#special-row' + special_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '  </tr>';
	
	$('#specialf').before(html);
 
	$('#special-row' + special_row + ' .date').datetimepicker({
		pickTime: false
	});
	
	special_row++;
}
</script>  		
</div>  
