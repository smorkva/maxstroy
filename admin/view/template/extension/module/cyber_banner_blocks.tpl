<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-banner-blocks" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-cyber-bblock" class="form-horizontal">
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
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-column"><?php echo $entry_banner_column; ?></label>
            <div class="col-sm-10">
              <select name="banner_column" id="input-banner-column" class="form-control">
                <?php if ($banner_column == 4) { ?>
                <option value="4" selected="selected">3</option>
                <option value="3">4</option>
                <?php } else { ?>
                <option value="4">3</option>
                <option value="3" selected="selected">4</option>
                <?php } ?>
              </select>
            </div>
          </div>
					
					<table id="items" class="table table-bordered table-hover">
						<thead>
							<tr>
								<td><?php echo $entry_image; ?></td>
								<td><?php echo $entry_title; ?></td>
								<td><?php echo $entry_description; ?></td>
								<td><?php echo $entry_link; ?></td>
								<td><?php echo $text_open_banner_popup; ?></td>
								<td><?php echo $entry_sort_order; ?></td>
								<td></td>
							</tr>
						</thead>
						<tbody>
						<?php $item_row = 0; ?>
						<?php foreach ($banner_items as $banner_item) { ?>
							<tr id="item-row<?php echo $item_row; ?>">
								<td class="text-left">
									<a href="" id="thumb-image<?php echo $item_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $banner_item['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="banner_item[<?php echo $item_row; ?>][image]" value="<?php echo $banner_item['image']; ?>" id="input-image<?php echo $item_row; ?>" />
								</td>
								<td class="text-left">
									<?php foreach ($languages as $language) { ?>
									<div class="input-group pull-left">
										<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
										<input class="form-control" type="text" name="banner_item[<?php echo $item_row; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo $banner_item['title'][$language['language_id']]; ?>" />
									</div>
									<?php } ?>
								</td>
								<td class="text-left">
									<?php foreach ($languages as $language) { ?>
									<div class="input-group pull-left">
										<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
										<input class="form-control" type="text" name="banner_item[<?php echo $item_row; ?>][description][<?php echo $language['language_id']; ?>]" value="<?php echo $banner_item['description'][$language['language_id']]; ?>" />
									</div>
									<?php } ?>
								</td>
								<td class="text-left">
									<?php foreach ($languages as $language) { ?>
									<div class="input-group pull-left">
										<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input class="form-control" type="text" name="banner_item[<?php echo $item_row; ?>][link][<?php echo $language['language_id']; ?>]" value="<?php echo $banner_item['link'][$language['language_id']]; ?>" />
									</div>
									<?php } ?>
								</td>
								<td>
								<div class="form-group">
										<div class="col-sm-12 text-center">
											<div class="radio-group-infinity">	
												<?php if ($banner_item['popup']) { ?>
													<input id="config_banner_item_popup_yes_<?php echo $item_row; ?>" class="hide-radio" type="radio" name="banner_item[<?php echo $item_row; ?>][popup]" value="1" checked="checked" />
													<label for="config_banner_item_popup_yes_<?php echo $item_row; ?>"><?php echo $text_yes; ?></label>
												<?php } else { ?>
													<input id="config_banner_item_popup_yes_<?php echo $item_row; ?>" class="hide-radio" type="radio" name="banner_item[<?php echo $item_row; ?>][popup]" value="1" />
													<label for="config_banner_item_popup_yes_<?php echo $item_row; ?>"><?php echo $text_yes; ?></label>
												<?php } ?>
												<?php if (!$banner_item['popup']) { ?>
													<input id="config_banner_item_popup_no_<?php echo $item_row; ?>" class="hide-radio" type="radio" name="banner_item[<?php echo $item_row; ?>][popup]" value="0" checked="checked" />							
													<label for="config_banner_item_popup_no_<?php echo $item_row; ?>"><?php echo $text_no; ?></label>
												<?php } else { ?>
													<input id="config_banner_item_popup_no_<?php echo $item_row; ?>" class="hide-radio" type="radio" name="banner_item[<?php echo $item_row; ?>][popup]" value="0" />							
													<label for="config_banner_item_popup_no_<?php echo $item_row; ?>"><?php echo $text_no; ?></label>
												<?php } ?>						  
											</div>
										</div>
									</div>
								</td>
								<td class="text-left">
									<input  class="form-control" type="text" name="banner_item[<?php echo $item_row; ?>][sort]" value="<?php echo $banner_item['sort']; ?>" />
								</td>
								<td class="text-right">
									<a class="btn btn-danger" onclick="$('#item-row<?php echo $item_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_delete; ?>"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
						<?php $item_row++; ?>
						<?php } ?>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5"></td>
								<td class="text-right"><a class="btn btn-primary" onclick="addItem();" data-toggle="tooltip" title="<?php echo $button_add; ?>"><i class="fa fa-plus-circle"></i></a></td>
							</tr>
						</tfoot>
					</table>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
var item_row = <?php echo $item_row; ?>;

function addItem() {
  html  = '<tr id="item-row' + item_row + '">';
	html += '<td class="text-left"><a href="" id="thumb-image' + item_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="banner_item[' + item_row + '][image]" value="" id="input-image' + item_row + '" /></td>';
  html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="banner_item[' + item_row + '][title][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="banner_item[' + item_row + '][description][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control"  type="text" name="banner_item[' + item_row + '][link][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td>';
	html += '<div class="form-group">';
	html += '	<div class="col-sm-12 text-center">';
	html += '	<div class="radio-group-infinity">';
	html += '		<input id="config_banner_item_popup_yes_' + item_row + '" class="hide-radio" type="radio" name="banner_item[' + item_row + '][popup]" value="1"/>';
	html += '		<label for="config_banner_item_popup_yes_' + item_row + '"><?php echo $text_yes; ?></label>';
	html += '		<input id="config_banner_item_popup_no_' + item_row + '" class="hide-radio" type="radio" name="banner_item[' + item_row + '][popup]" value="0" checked="checked" />';						
	html += '		<label for="config_banner_item_popup_no_' + item_row + '"><?php echo $text_no; ?></label>';									  
	html += '	</div>';
	html += '	</div>';
	html += '</div>';
	html += '</td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="banner_item[' + item_row + '][sort]" size="1" value="" /></td>';
	html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#item-row' + item_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_delete; ?>"><i class="fa fa-trash-o"></i></a></td>';
	html += '</tr>'; 
	
	$('#items tbody').append(html);;
	
	item_row++;
}
</script>
<style>
.hide-radio {
	display:none;
}
.radio-group-infinity {
	display: inline-block;
	margin-top: 9px;
	border-radius:15px;
	background-color: white;
	background-image: linear-gradient(to bottom, #eeeeee, white 25px);
	padding:3px;
	box-shadow: 0 -1px white inset, 0 1px 1px rgba(0, 0, 0, 0.05) inset;
}
.hide-radio + label {
	background: #eceeef none repeat scroll 0 0;
	color: #fff;
	display: block;
	float: left;
	font-family: "Oswald",sans-serif;
	padding: 5px 0;
	text-align: center;
	-webkit-transition: background-image 0.15s ease-in-out;
	-moz-transition: background-image 0.15s ease-in-out;
	-o-transition: background-color 0.15s ease-in-out;
	transition: background-image 0.15s ease-in-out;
	width: 45px;
	margin-bottom:0px;	
	position:relative;
	color:#969696;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.15) inset, 0 0 3px rgba(0, 0, 0, 0.2) inset;
	text-shadow:0 1px rgba(255, 255, 255, 0.8);
}
.hide-radio + label:hover {
	box-shadow:2px 3px 3px rgba(0, 0, 0, 0.25) inset;
}
.hide-radio:first-child + label{
	border-radius:15px 0px 0px 15px;
}
.radio-group-infinity > label:last-child{
	border-radius:0px 15px 15px 0px;	
	margin-left:-1px;
}
 
.hide-radio:checked + label {
	background-image: linear-gradient(#47a8d8, #47a8d8);
	display: inline-block;
	margin-bottom:0px;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.15) inset, 0 0 3px rgba(0, 0, 0, 0.2) inset;
	color:#fff;
	text-shadow:0 1px rgba(0, 0, 0, 0.2);
}

</style>
<?php echo $footer; ?>