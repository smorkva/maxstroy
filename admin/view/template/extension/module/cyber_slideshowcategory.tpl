<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-stc" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-stc" class="form-horizontal">
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
				<label class="col-sm-2 control-label"><?php echo $entry_category; ?></label>
				<div class="col-sm-10">
				<select class="form-control" name="slideshow_category_id">
					<?php foreach ($categories as $category) { ?>
						<?php if ($category['category_id'] == $slideshow_category_id) { ?>
							<option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name'] ?></option>
								<?php } else { ?>
							<option value="<?php echo $category['category_id']; ?>"><?php echo $category['name'] ?></option>
								<?php } ?>
						<?php } ?>
				</select>
				</div>
			</div>
			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-show_slider_sub_category"><?php echo $entry_sub_category; ?></label>
            <div class="col-sm-10">
              <select name="show_slider_sub_category" id="input-show_slider_sub_category" class="form-control">
                <?php if ($show_slider_sub_category) { ?>
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
					<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo "Баннеры"; ?></h3>
				</div>
			</div>
		   <table id="categories" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-left"><?php echo $entry_image; ?></td>
                <td class="text-left"><?php echo $entry_text; ?></td>
                <td class="text-left"><?php echo $entry_link; ?></td>
                <td class="text-left"><?php echo $entry_sort_order; ?></td>
                
                <td></td>
              </tr>
            </thead>
			<?php $category_banner_row = 0; ?>
			<?php if($category_banners) { ?>
            <tbody>
              <?php foreach ($category_banners as $category_banner) { ?>
				<tr id="image-row<?php echo $category_banner_row; ?>">					
					<td class="text-left">
						<?php foreach ($languages as $language) { ?>
							<div class="input-group pull-left">
								<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>	
								<a href="" id="thumb-image-category-banner<?php echo $category_banner_row; ?>-<?php echo $language['language_id']; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $category_banner['thumb'][$language['language_id']]?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
								<input type="hidden" name="category_banner[<?php echo $category_banner_row; ?>][image][<?php echo $language['language_id']; ?>]" value="<?php echo $category_banner['image'][$language['language_id']]; ?>" id="input-image-category-banner-<?php echo $category_banner_row; ?>-<?php echo $language['language_id']; ?>" />
							</div>
						<?php } ?>
					</td>
					<td class="text-left">
						<?php foreach ($languages as $language) { ?>
							<div class="input-group pull-left">
								<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
								<input class="form-control" type="text" name="category_banner[<?php echo $category_banner_row; ?>][description][<?php echo $language['language_id']; ?>]" value="<?php echo $category_banner['description'][$language['language_id']]; ?>" />
							</div>
						<?php } ?>
					</td>
					<td class="text-left">
						<div class="input-group pull-left">
							<input class="form-control" type="text" name="category_banner[<?php echo $category_banner_row; ?>][link]" value="<?php echo $category_banner['link']; ?>" />
						</div>
					</td>
					<td class="text-left">
						<input type="text" name="category_banner[<?php echo $category_banner_row; ?>][sort_order]" value="<?php echo $category_banner['sort_order']; ?>" />
					</td>
					<td class="text-left"><button type="button" onclick="$('#image-row<?php echo $category_banner_row; ?>, .tooltip').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
				</tr>
              <?php $category_banner_row++; ?>
              <?php } ?>
            </tbody>
			<?php } ?>
            <tfoot>
              <tr>
                <td colspan="4"></td>
                <td class="text-left"><button type="button" onclick="addCategories();" data-toggle="tooltip" title="<?php echo $button_banner_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
              </tr>
            </tfoot>
          </table>
        </form>
      </div>
    </div>
  </div>
  <script><!--
  <?php if($category_banner_row) {?>
var category_banner_row = <?php echo $category_banner_row; ?>;
<?php } else { ?>
var category_banner_row = 0;
<?php } ?>
function addCategories() {
	html  = '<tr id="image-row' + category_banner_row + '">';	
	
	html += '<td class="text-left">';	
	html += '	<?php foreach ($languages as $language) { ?>';	
	html += '		<div class="input-group pull-left">';	
	html += '			<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';		
	html += '			<a href="" id="thumb-image-category-banner-' + category_banner_row + '-<?php echo $language['language_id']; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>';	
	html += '			<input type="hidden" name="category_banner[' + category_banner_row + '][image][<?php echo $language['language_id']; ?>]" value="" id="input-image-category-banner-' + category_banner_row + '-<?php echo $language['language_id']; ?>" />';	
	html += '		</div>';	
	html += '	<?php } ?>';	
	html += '</td>';	
	
	html += '<td class="text-left">';	
	html += '	<?php foreach ($languages as $language) { ?>';	
	html += '		<div class="input-group pull-left">';	
	html += '			<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';	
	html += '			<input class="form-control" type="text" name="category_banner['+ category_banner_row +'][description][<?php echo $language['language_id']; ?>]" value="" />';	
	html += '		</div>';	
	html += '	<?php } ?>';	
	html += '</td>';	
	html += '<td class="text-left">';	
	html += '	<div class="input-group pull-left">';	
	html += '		<input class="form-control" type="text" name="category_banner['+ category_banner_row +'][link]" value="" />';	
	html += '	</div>';	
	html += '</td>';	
	html += '	<td class="text-left">';
	html += '		<input type="text" name="category_banner['+ category_banner_row +'][sort_order]" value="0" />';
	html += '	</td>';
	
	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + category_banner_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
	
	$('#categories').append(html);
	
	category_banner_row++;
}
//--></script>
</div>
<?php echo $footer; ?>