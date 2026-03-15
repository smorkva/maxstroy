<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
		<div class="pull-right">
			<a onclick="$('#form').submit();" class="btn btn-primary"><span><?php echo $button_save; ?></span></a>
			<a onclick="location = '<?php echo $cancel; ?>';" class="btn btn-primary"><span><?php echo $button_cancel; ?></span></a>
		</div>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
       <form class="form-horizontal" id="form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
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
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_image; ?></label>
				<ul class="nav nav-tabs" id="language">
					<?php foreach ($languages as $language) { ?>
						<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab">
						<?php if(VERSION < 2.2) { ?>
						<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
						<?php } else { ?>
						<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
						<?php } ?>
						<?php echo $language['name']; ?></a></li>
					<?php } ?>
				</ul>
				<div class="tab-content">
					<?php foreach ($languages as $language) { ?>
						<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
							<div class="col-sm-4">
								<table class="table table-striped table-bordered table-hover" style="width:auto;">
									<tr>
									<?php $i = 0; ?>
									<?php foreach ($positions as $position=>$value) { ?>
										<td class="center">
										<input type="hidden" name="images[<?php echo $language['language_id']; ?>][<?php echo $position; ?>]" value="<?php echo $images[$language['language_id']][$position]; ?>" id="image_<?php echo $language['language_id']; ?><?php echo $position; ?>" />							
										<a href="" id="thumb_<?php echo $language['language_id']; ?><?php echo $position; ?>" data-toggle="image" class="img-thumbnail">
										<img src="<?php echo $images[$language['language_id']]['thumb_' . $position]; ?>" alt="" title="" data-placeholder="<?php echo $no_image; ?>" />
										</a>
										</td>
									<?php $i++; ?>
										<?php if ($i % 3 == 0) { ?>
											</tr><tr>
										<?php } ?>
									<?php } ?>
									</tr>
								</table>
							</div>
							<div class="col-sm-8">
								<table id="items<?php echo $language['language_id']; ?>" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<td class="text-left"><?php echo $column_position;?></td>
											<td class="text-left"><?php echo $column_text;?></td>
											<td class="text-left"><?php echo $column_text_color;?></td>
											<td class="text-left"><?php echo $column_text_bg;?></td>
											<td class="text-left"><?php echo $column_action;?></td>
										</tr>
									</thead>
									<tbody>
										<?php $item_row = 0; ?>
										<?php if(isset($text_label[$language['language_id']])){?>
										<?php foreach ($text_label[$language['language_id']] as $result) { ?>
										<tr id="item-row<?php echo $language['language_id']; ?><?php echo $item_row; ?>">
											<td class="text-left">
												<select name="text_label[<?php echo $language['language_id']; ?>][<?php echo $item_row; ?>][position]" class="form-control">
													<?php foreach ($positions_labels as $position_label=>$value) { ?>
														<?php if($position_label == $result['position']){ ?>
															<option selected="selected" value="<?php echo $position_label;?>"><?php echo ${'text_' . $position_label}; ?></option>
														<?php } else { ?>
															<option value="<?php echo $position_label;?>"><?php echo ${'text_' . $position_label}; ?></option>
														<?php } ?>
													<?php } ?>
												</select>
											</td>
											<td class="text-center"><input class="form-control" type="text" name="text_label[<?php echo $language['language_id']; ?>][<?php echo $item_row; ?>][text]" value="<?php echo isset($result['text']) ? $result['text']: ''; ?>" /></td>
											<td class="text-center"><input class="form-control color" type="text" name="text_label[<?php echo $language['language_id']; ?>][<?php echo $item_row; ?>][text_color]" value="<?php echo isset($result['text_color']) ? $result['text_color'] : ''; ?>" /></td>
											<td class="text-center"><input class="form-control color" type="text" name="text_label[<?php echo $language['language_id']; ?>][<?php echo $item_row; ?>][bg_color]" value="<?php echo isset($result['bg_color']) ? $result['bg_color'] : ''; ?>" /></td>
											<td class="text-right">
												<a class="btn btn-danger" onclick="$('#item-row<?php echo $language['language_id']; ?><?php echo $item_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_delete; ?>"><i class="fa fa-trash-o"></i></a>
											</td>
											
										</tr>
										<?php $item_row++; ?>
										<?php } ?>
										<?php } ?>
										<input type="hidden" id="item-row-number-<?php echo $language['language_id']; ?>" value="<?php echo $item_row;?>">	
									</tbody>
									<tfoot>
										<tr>
											<td colspan="4"></td>
											<td class="text-right"><a class="btn btn-primary" onclick="addItem(<?php echo $language['language_id']; ?>);" data-toggle="tooltip" title="<?php echo $button_add; ?>"><i class="fa fa-plus-circle"></i></a></td>
										</tr>
									</tfoot>
								</table>
								<script type="text/javascript">
									function addItem(language_id) {
										var item_row = $('#item-row-number-'+ language_id).val();
										$('#item-row-number-'+ language_id).val(parseInt(item_row) + 1);
										html  = '<tr id="item-row'+ language_id + item_row + '">';
										html += '<td class="text-left">';
										html += '	<select name="text_label['+ language_id +']['+ item_row +'][position]" class="form-control">';
										html += '		<?php foreach ($positions_labels as $position_label=>$value) { ?>';
										html += '			<option value="<?php echo $position_label;?>"><?php echo ${'text_' . $position_label}; ?></option>';
										html += '		<?php } ?>';
										html += '	</select>';
										html += '</td>';
										html += '<td class="text-left"><input class="form-control" type="text" name="text_label['+ language_id +'][' + item_row + '][text]" value="" /></td>';
										html += '<td class="text-left"><input class="form-control color" type="text" name="text_label['+ language_id +'][' + item_row + '][text_color]" value="" /></td>';
										html += '<td class="text-left"><input class="form-control color" type="text" name="text_label['+ language_id +'][' + item_row + '][bg_color]" value="" /></td>';
										html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#item-row'+ language_id + item_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_delete; ?>"><i class="fa fa-trash-o"></i></a></td>';
										html += '</tr>'; 
										
										$('#items'+ language_id +' tbody').append(html);;
										jscolor.installByClassName("color");
										item_row++;
									}
								</script>
							</div> 
						</div>
					<?php } ?>
				</div>
			</div> 
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
				<div class="col-sm-10">
					<input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
				</div>
			</div> 
        </form>
      </div>
    </div>
  </div>
  </div>
    <script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script>
<?php echo $footer; ?>