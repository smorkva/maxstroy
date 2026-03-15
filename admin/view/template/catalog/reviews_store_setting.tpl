<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><button type="submit" form="form-banner-blocks" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button></div>
     
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_theme) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_theme; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
	<?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_edit_setting; ?></h3>
      </div>
      <div class="panel-body">
        <form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-reviews-store-setting">
			<div class="row">
				<div class="col-sm-6">
					<legend><?php echo $text_edit_setting; ?></legend>
					<div class="form-group">
						<label class="col-sm-4 control-label"><?php echo $entry_status;?></label>
						<div class="col-sm-8">
							<div class="checkbox-group-qa">
								<label><input type="checkbox" name="reviews_store_setting[status]" value="1" <?php echo (isset($reviews_store_setting['status']) ? 'checked="checked"' : '') ?> /><span></span></label>						 
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label"><?php echo $entry_automoderation_reviews;?></label>
						<div class="col-sm-8">
							<div class="checkbox-group-qa">
								<label><input type="checkbox" name="reviews_store_setting[automoderation]" value="1" <?php echo (isset($reviews_store_setting['automoderation']) ? 'checked="checked"' : '') ?> /><span></span></label>						 
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-4 control-label"><?php echo $entry_like_dislike;?></label>
						<div class="col-sm-8">
							<div class="checkbox-group-qa">
								<label><input type="checkbox" name="reviews_store_setting[show_like_dislike]" value="1" <?php echo (isset($reviews_store_setting['show_like_dislike']) ? 'checked="checked"' : '') ?> /><span></span></label>						 
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label"><?php echo $entry_captcha;?></label>
						<div class="col-sm-8">
							<div class="checkbox-group-qa">
								<label><input type="checkbox" name="reviews_store_setting[captcha]" value="1" <?php echo (isset($reviews_store_setting['captcha']) ? 'checked="checked"' : '') ?> /><span></span></label>						 
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label"><span data-toggle="tooltip" title="<?php echo $help_review_guest; ?>"><?php echo $entry_review_guest; ?></span></label>
						<div class="col-sm-8">
							<div class="checkbox-group-qa">
								<label><input type="checkbox" name="reviews_store_setting[review_guest]" value="1" <?php echo (isset($reviews_store_setting['review_guest']) ? 'checked="checked"' : '') ?> /><span></span></label>						 
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
				<legend><?php echo $text_theme_reviews;?></legend>
				<table id="items" class="table table-bordered table-hover">
						<thead>
							<tr>
								
								<td><?php echo $column_theme; ?></td>
								<td><?php echo $column_status; ?></td>
								<td><?php echo $column_sort; ?></td>
								<td></td>
							</tr>
						</thead>
						<tbody>
						<?php $item_row = 0; ?>
						<?php if($reviews_theme_items){ ?>
						<?php foreach ($reviews_theme_items as $reviews_theme_item) { ?>
							<tr id="item-row<?php echo $item_row; ?>">
								<input type="hidden" name="reviews_theme_item[<?php echo $item_row; ?>][reviews_store_theme_id]" value="<?php echo $reviews_theme_item['reviews_store_theme_id']; ?>" />
								<td class="text-left">
									<?php foreach ($languages as $language) { ?>
									<div class="input-group pull-left">
										<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
										<input class="form-control" type="text" name="reviews_theme_item[<?php echo $item_row; ?>][theme_text][<?php echo $language['language_id']; ?>]" value="<?php echo $reviews_theme_item['theme_text'][$language['language_id']]; ?>" />
									</div>
									<?php } ?>
								</td>
								<td class="text-left">
									<div class="form-group">
										<div class="col-sm-12 text-center">
											<select name="reviews_theme_item[<?php echo $item_row; ?>][status]" id="input-status" class="form-control">
											<?php if ($reviews_theme_item['status']) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										  </select>
										</div>
									</div>
								</td>
								<td class="text-left">
									<input class="form-control" type="text" name="reviews_theme_item[<?php echo $item_row; ?>][sort_order]" value="<?php echo $reviews_theme_item['sort_order']; ?>" />
								</td>
								<td class="text-right">
									<a class="btn btn-danger" onclick="$('#item-row<?php echo $item_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_delete; ?>"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
						<?php $item_row++; ?>
						<?php } ?>
						<?php } ?>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="3"></td>
								<td class="text-right"><a class="btn btn-primary" onclick="addItem();" data-toggle="tooltip" title="<?php echo $button_add; ?>"><i class="fa fa-plus-circle"></i></a></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			
			
        </form>
      </div>
    </div>
  </div>
</div>
<script>
var item_row = <?php echo $item_row; ?>;

function addItem() {
	html  = '<tr id="item-row' + item_row + '">';
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="reviews_theme_item_new[' + item_row + '][theme_text][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-center">';
	html += '<div class="form-group">';
	html += '	<div class="col-sm-12 text-center">';
	html += '		<select name="reviews_theme_item_new[' + item_row + '][status]" id="input-status" class="form-control">';
	html += '			<option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
	html += '			<option value="0"><?php echo $text_disabled; ?></option>';
	html += '		</select>';
	html += '	</div>';
	html += '</div>';
	html += '</td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="reviews_theme_item_new[' + item_row + '][sort_order]" size="1" value="0" /></td>';
	html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#item-row' + item_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_delete; ?>"><i class="fa fa-trash-o"></i></a></td>';
	html += '</tr>'; 
	
	$('#items tbody').append(html);;
	
	item_row++;
}
</script>
<?php echo $footer; ?>