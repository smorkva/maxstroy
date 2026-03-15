<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-banner" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-banner" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
		  <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $entry_title_name; ?></label>
				<div class="col-sm-5">
				<tr>
					<td class="text-left"><?php foreach ($languages as $language) { ?>
                       <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                          <input name="title_name[<?php echo $language['language_id']; ?>][title_name]" class="form-control" value="<?php echo isset($title_name[$language['language_id']]) ? $title_name[$language['language_id']]['title_name'] : ''; ?>">
                        </div>
                        <?php } ?></td>
				</tr>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-status-slider"><?php echo $entry_slider; ?></label>
				<div class="col-sm-10">
				  <select name="status_slider" id="input-status-slider" class="form-control">
					<?php if ($status_slider) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
				  </select>
				</div>
			  </div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
				  <?php if ($error_width) { ?>
				  <div class="text-danger"><?php echo $error_width; ?></div>
				  <?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
				  <?php if ($error_height) { ?>
				  <div class="text-danger"><?php echo $error_height; ?></div>
				  <?php } ?>
				</div>
			</div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner"><?php echo $setting_sub_cat_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="limit" value="<?php echo $limit; ?>" />
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner"><?php echo $setting_limit_3lv; ?></label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="limit3lv" value="<?php echo $limit3lv; ?>" />
            </div>
          </div>
		  <div class="form-group">
			<label class="col-sm-2 control-label" for="input-sub-image"><?php echo $entry_image_sub_category; ?></label>
			<div class="col-sm-10">
			  <select name="status_sub_image" id="input-sub-image" class="form-control">
				<?php if ($status_sub_image) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<?php } ?>
			  </select>
			</div>
		  </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
		   <div class="panel panel-default">
			   <div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_category; ?></h3>
				</div>
			</div>
		   <table id="categories" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-left"><?php echo $entry_category; ?></td>
                <td class="text-left"><?php echo $entry_image; ?></td>
                <td class="text-left"><?php echo $entry_sort_order; ?></td>
                
                <td></td>
              </tr>
            </thead>
			<?php $image_row = 0; ?>
			<?php if($wall_categorys) { ?>
            <tbody>
              <?php foreach ($wall_categorys as $wall_category) { ?>
				<tr id="image-row<?php echo $image_row; ?>">
					<td class="left">
						<select class="form-control" name="wall_category[<?php echo $image_row; ?>][category]">
							<?php foreach ($categories as $category) { ?>
									 <?php if ($category['category_id'] == $wall_category['category']) { ?>
										<option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name'] ?></option>
									<?php } else { ?>
										<option value="<?php echo $category['category_id']; ?>"><?php echo $category['name'] ?></option>
									<?php } ?>
							<?php } ?>
						</select>
					</td>
					<td class="text-left"><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $wall_category['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
						<input type="hidden" name="wall_category[<?php echo $image_row; ?>][image]" value="<?php echo $wall_category['image']; ?>" id="input-image<?php echo $image_row; ?>" />
					</td>
					<td class="text-left">
						<input type="text" name="wall_category[<?php echo $image_row; ?>][sort_order]" value="<?php echo $wall_category['sort_order']; ?>" />
					</td>
					<td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>, .tooltip').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
				</tr>
              <?php $image_row++; ?>
              <?php } ?>
            </tbody>
			<?php } ?>
            <tfoot>
              <tr>
                <td colspan="3"></td>
                <td class="text-left"><button type="button" onclick="addCategories();" data-toggle="tooltip" title="<?php echo $button_banner_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
              </tr>
            </tfoot>
          </table>
        </form>
      </div>
    </div>
  </div>
  <script><!--
  <?php if($image_row) {?>
var image_row = <?php echo $image_row; ?>;
<?php } else { ?>
var image_row = 0;
<?php } ?>
function addCategories() {
	html  = '<tr id="image-row' + image_row + '">';	
	html += '<td>';
	html += '<select class="form-control" name="wall_category[' + image_row + '][category]">';
	html += '<?php foreach ($categories as $category) { ?>';
	html += '<option value="<?php echo $category['category_id']; ?>"><?php echo addslashes($category['name']) ?></option>';
	html += '<?php } ?>';
	html += '</select>';
	html += '</td>';
	html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="wall_category[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
	html += '	<td class="text-left">';
	html += '		<input type="text" name="wall_category['+ image_row +'][sort_order]" value="0" />';
	html += '	</td>';
	
	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
	
	$('#categories').append(html);
	
	image_row++;
}
//--></script>
</div>
<?php echo $footer; ?>