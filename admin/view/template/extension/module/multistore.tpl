<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
				<button type="submit" form="form-latest" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_module_edit; ?></h3>
      </div>
      <div class="panel-body" id="panel">
				<?php foreach($error as $error_message) { ?>
					<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_message; ?>
						<button type="button" class="close" data-dismiss="alert">&times;</button>
					</div>
					<?php } ?>
					<?php if (!empty($success)) { ?>
					<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
						<button type="button" class="close" data-dismiss="alert">&times;</button>
					</div>
					<?php } ?>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-module" class="form-horizontal">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
						<li><a href="#tab-template" data-toggle="tab"><?php echo $tab_template; ?></a></li>
						<li><a href="#tab-status" data-toggle="tab"><?php echo $tab_status; ?></a></li>
						<li><a href="#tab-matrix" data-toggle="tab"><?php echo $tab_matrix; ?></a></li>
						<li><a href="#tab-import" data-toggle="tab"><?php echo $tab_import; ?></a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab-general">
				  		<div class="form-group">
				        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
								<div class="col-sm-10">
									<select name="multistore_status" id="input-status" class="form-control">
										<?php if (isset($multistore_status) && $multistore_status) { ?>
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
				        <label class="col-sm-2 control-label" for="input-product-status"><?php echo $entry_product_status; ?></label>
								<div class="col-sm-10">
									<select name="multistore_product_status" id="input-product-status" class="form-control">
										<?php if (isset($multistore_product_status) && $multistore_product_status) { ?>
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
				        <label class="col-sm-2 control-label" for="input-category-status"><?php echo $entry_category_status; ?></label>
								<div class="col-sm-10">
									<select name="multistore_category_status" id="input-category-status" class="form-control">
										<?php if (isset($multistore_category_status) && $multistore_category_status) { ?>
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
				        <label class="col-sm-2 control-label" for="input-option-quantity"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_option_with_quantity; ?>"><?php echo $entry_option_with_quantity; ?></span></label>
								<div class="col-sm-10">
									<select name="multistore_option_with_quantity_status" id="input-option-quantity" class="form-control">
										<?php if (isset($multistore_option_with_quantity_status) && $multistore_option_with_quantity_status) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
				      </div>
						</div>
						<div class="tab-pane" id="tab-template">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-display-title"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_display_title; ?>"><?php echo $entry_display_title; ?></span></label>
								<div class="col-sm-10">
									<select name="multistore_display_title" id="input-display-title" class="form-control">
										<?php if (isset($multistore_display_title) && $multistore_display_title) { ?>
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
								<label class="col-sm-2 control-label" for="input-modificator"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_display_empty; ?>"><?php echo $entry_display_empty; ?></span></label>
								<div class="col-sm-10">
									<select name="multistore_empty" id="input-empty" class="form-control">
										<?php if (isset($multistore_empty) && $multistore_empty) { ?>
										<option value="1" selected="selected"><?php echo $entry_yes; ?></option>
										<option value="0"><?php echo $entry_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $entry_yes; ?></option>
										<option value="0" selected="selected"><?php echo $entry_no; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-display-stock"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_display_stock; ?>"><?php echo $entry_display_stock; ?></span></label>
								<div class="col-sm-10">
									<select name="multistore_display_stock" id="input-display-stock" class="form-control">
										<?php if (isset($multistore_display_stock) && $multistore_display_stock) { ?>
										<option value="1" selected="selected"><?php echo $entry_yes; ?></option>
										<option value="0"><?php echo $entry_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $entry_yes; ?></option>
										<option value="0" selected="selected"><?php echo $entry_no; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-display-trade"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_display_trade; ?>"><?php echo $entry_display_trade; ?></span></label>
								<div class="col-sm-10">
									<select name="multistore_display_trade" id="input-display-trade" class="form-control">
										<?php if (isset($multistore_display_trade) && $multistore_display_trade) { ?>
										<option value="1" selected="selected"><?php echo $entry_yes; ?></option>
										<option value="0"><?php echo $entry_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $entry_yes; ?></option>
										<option value="0" selected="selected"><?php echo $entry_no; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-display-before"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_display_before; ?>"><?php echo $entry_display_before; ?></span></label>
								<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="multistore_display_before[<?php echo $language_id; ?>]" id="input-display-before-<?php echo $language_id; ?>" class="form-control summernote"><?php if (isset($multistore_display_before[$language_id])) echo $multistore_display_before[$language_id]; ?></textarea>
										</div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-display-after"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_display_after; ?>"><?php echo $entry_display_after; ?></span></label>
								<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="multistore_display_after[<?php echo $language_id; ?>]" id="input-display-after-<?php echo $language_id; ?>" class="form-control summernote"><?php if (isset($multistore_display_after[$language_id])) echo $multistore_display_after[$language_id]; ?></textarea>
										</div>
									<?php } ?>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-matrix">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-matrix-status"><?php echo $entry_status; ?></label>
								<div class="col-sm-10">
									<select name="multistore_matrix_status" id="input-matrix-status" class="form-control">
										<?php if (isset($multistore_matrix_status) && $multistore_matrix_status) { ?>
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
								<label class="col-sm-2 control-label"><?php echo $entry_matrix_zero; ?></label>
								<div class="col-sm-10"><div class="alert alert-info" style="margin-bottom: 0;"><?php echo $text_matrix_zero; ?></div></div>
							</div>
							<div id="matrix" style="border-top: 1px solid #ededed; border-bottom: 1px solid #ededed;">
								<?php $max_matrix_id = 0; ?>
								<?php foreach($multistore_matrix as $matrix_id => $row) { ?>
									<?php $max_matrix_id = $matrix_id; ?>
									<?php if ($matrix_id == count($multistore_matrix)) {
										$isLast = true;
									} else {
										$isLast = false;
									} ?>
									<div class="form-group" id="matrix-row-<?php echo $matrix_id; ?>">
										<label class="col-sm-2 control-label"><?php echo $isLast ? $entry_matrix_after : $entry_matrix_before; ?></label>
										<div class="col-sm-2">
											<input type="text" value="<?php echo $row['value']; ?>" name="multistore_matrix[<?php echo $matrix_id; ?>][value]; ?>" class="form-control" />
										</div>
										<label class="col-sm-1 control-label" ><?php echo $entry_matrix_title; ?></label>
										<div class="col-sm-3">
											<?php foreach ($languages as $language) { ?>
												<?php $language_id = $language['language_id']; ?>
												<div class="input-group">
													<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
													<input type="text" name="multistore_matrix[<?php echo $matrix_id; ?>][title][<?php echo $language_id; ?>]" placeholder="<?php echo $entry_matrix_title; ?>" value="<?php echo $row['title'][$language_id]; ?>" class="form-control" />
												</div>
											<?php } ?>
										</div>
										<label class="col-sm-1 control-label"><?php echo $entry_color; ?></label>
										<div class="col-sm-2">
											<div class="input-group">
												<input type="color" name="multistore_matrix[<?php echo $matrix_id; ?>][color]" value="<?php echo $row['color']; ?>" placeholder="<?php echo $entry_color; ?>" class="form-control" />
												<span class="input-group-addon">
													<input type="checkbox" onchange="changeColorType('multistore_matrix[<?php echo $matrix_id; ?>][color]');">
												</span>
											</div>
										</div>
										<div class="col-sm-1">
											<button class="btn btn-danger" type="button" onclick="removeMatrixRow('<?php echo $matrix_id; ?>');" title="<?php echo $button_matrix_row_remove; ?>"><i class="fa fa-trash"></i></button>
										</div>
									</div>
								<?php } ?>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_matrix_big; ?></label>
								<div class="col-sm-10"><div class="alert alert-info" style="margin-bottom: 0;"><?php echo $text_matrix_big; ?></div></div>
							</div>
							<div class="form-group">
								<div class="col-sm-10 col-sm-offset-2">
									<button type="button" id="button-matrix-add" class="btn btn-success"><?php echo $button_matrix_row_add; ?></button>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-status">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-stock-status-instore"><?php echo $entry_stock_status_instore; ?></label>
								<div class="col-sm-2">
									<select name="multistore_stock_status_instore" class="form-control" id="input-stock-status-instock">
										<?php foreach($stock_statuses as $stock_status) { ?>
											<?php if ($stock_status['stock_status_id'] == $multistore_stock_status_instore){ ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>" selected><?php echo $stock_status['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
									<?php if (!empty($error_stock_status_instore)) { ?>
										<div class="text-danger"><?php echo $error_stock_status_instore; ?></div>
									<?php } ?>
								</div>
								<label class="col-sm-1 control-label" for="input-color-instore"><?php echo $entry_color; ?></label>
								<div class="col-sm-2">
									<div class="input-group">
										<input type="color" name="multistore_color_instore" value="<?php echo $multistore_color_instore; ?>" placeholder="<?php echo $entry_color; ?>" id="input-color-instore" class="form-control" />
										<span class="input-group-addon">
											<input type="checkbox" onchange="changeColorType('multistore_color_instore');">
										</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-stock-status-instore"><?php echo $entry_stock_status_instock; ?></label>
								<div class="col-sm-2">
									<select name="multistore_stock_status_instock" class="form-control" id="input-stock-status-instock">
										<?php foreach($stock_statuses as $stock_status) { ?>
											<?php if ($stock_status['stock_status_id'] == $multistore_stock_status_instock){ ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>" selected><?php echo $stock_status['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
									<?php if (!empty($error_stock_status_instock)) { ?>
										<div class="text-danger"><?php echo $error_stock_status_instock; ?></div>
									<?php } ?>
								</div>
								<label class="col-sm-1 control-label" for="input-color-instock"><?php echo $entry_color; ?></label>
								<div class="col-sm-2">
									<div class="input-group">
										<input type="color" name="multistore_color_instock" value="<?php echo $multistore_color_instock; ?>" placeholder="<?php echo $entry_color; ?>" id="input-color-instock" class="form-control" />
										<span class="input-group-addon">
											<input type="checkbox" onchange="changeColorType('multistore_color_instock');">
										</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-stock-status-instore"><?php echo $entry_stock_status_intrade; ?></label>
								<div class="col-sm-2">
									<select name="multistore_stock_status_intrade" class="form-control" id="input-stock-status-instock">
										<?php foreach($stock_statuses as $stock_status) { ?>
											<?php if ($stock_status['stock_status_id'] == $multistore_stock_status_intrade){ ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>" selected><?php echo $stock_status['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
									<?php if (!empty($error_stock_status_intrade)) { ?>
										<div class="text-danger"><?php echo $error_stock_status_intrade; ?></div>
									<?php } ?>
								</div>
								<label class="col-sm-1 control-label" for="input-color-intrade"><?php echo $entry_color; ?></label>
								<div class="col-sm-2">
									<div class="input-group">
										<input type="color" name="multistore_color_intrade" value="<?php echo $multistore_color_intrade; ?>" placeholder="<?php echo $entry_color; ?>" id="input-color-intrade" class="form-control" />
										<span class="input-group-addon">
											<input type="checkbox" onchange="changeColorType('multistore_color_intrade');">
										</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-stock-status-out-of-stock"><?php echo $entry_stock_status_out_of_stock; ?></label>
								<div class="col-sm-2">
									<select name="multistore_stock_status_out_of_stock" class="form-control" id="input-stock-status-out-of-stock">
										<?php foreach($stock_statuses as $stock_status) { ?>
											<?php if ($stock_status['stock_status_id'] == $multistore_stock_status_out_of_stock){ ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>" selected><?php echo $stock_status['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
									<?php if (!empty($error_stock_status_empty)) { ?>
										<div class="text-danger"><?php echo $error_stock_status_empty; ?></div>
									<?php } ?>
								</div>
								<label class="col-sm-1 control-label" for="input-color-out-of-stock"><?php echo $entry_color; ?></label>
								<div class="col-sm-2">
									<div class="input-group">
										<input type="color" name="multistore_color_out_of_stock" value="<?php echo $multistore_color_out_of_stock; ?>" placeholder="<?php echo $entry_color; ?>" id="input-color-out-of-stock" class="form-control" />
										<span class="input-group-addon">
											<input type="checkbox" onchange="changeColorType('multistore_color_out_of_stock');">
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-import">
							<div class="alert alert-warning" role="alert"><?php echo $text_experement; ?></div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="button-template-download"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_import_template; ?>"><?php echo $entry_import_template; ?></span></label>
								<div class="col-sm-10">
									<button type="button" id="button-template-download" class="btn btn-primary"><?php echo $button_download; ?></button>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="button-upload"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_xlsx; ?>"><?php echo $entry_import_download; ?></span></label>
								<div class="col-sm-10">
									<button type="button" id="button-upload" class="btn btn-primary"><?php echo $button_upload; ?></button>
								</div>
							</div>
							<div id="import-result"></div>
						</div>
					</div>
        </form>
			</div>
		</div>
  </div>
</div>
<?php echo $footer; ?>
<script>

	const spinner = document.createElement("i");
	spinner.classList.add('fa', 'fa-spinner', 'fa-spin');
	spinner.style.marginRight = "3px";

	$('#button-template-download').on('click', function(event){
		event.preventDefault();

		const btn = event.target;

		$.ajax({
			url: '<?php echo $template; ?>',
			type: 'get',
			dataType: 'json',
			beforeSend: function() {
				$(btn).prepend(spinner);
			},
			complete: function() {
				$(btn).find('.fa').remove();
			},
			success: function(json) {
				$('#tab-import').find('.alert').remove();
				if (json['error']) {
					$('#tab-import').prepend(`<div class="alert alert-danger" role="alert">${json['error']}</div>`);
				} else {
					window.open(json['route'])
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
</script>
<script>
	$('#button-upload').on('click', function(event) {

		event.preventDefault();

		const btn = event.target;

		$('#form-upload').remove();
		$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
		$('#form-upload input[name=\'file\']').trigger('click');

		if (typeof timer != 'undefined') clearInterval(timer);

		timer = setInterval(function() {
			if ($('#form-upload input[name=\'file\']').val() != '') {
				clearInterval(timer);

				$.ajax({
					url: '<?php echo $upload; ?>',
					type: 'post',
					dataType: 'json',
					data: new FormData($('#form-upload')[0]),
					cache: false,
					contentType: false,
					processData: false,
					beforeSend: function() {
						$(btn).prepend(spinner);
						$('#import-result').html('');
					},
					success: function(json) {
						if (json['code']) {
							$.ajax({
								url: '<?php echo $import; ?>',
								type: 'post',
								dataType: 'json',
								data: {code: json['code']},
								complete: function() {
									$(btn).find('.fa').remove();
								},
								success: function(json) {
									if (json['success']) {
										$('#import-result').append(`<div class="alert alert-success" role="alert"><?php echo $text_import_success; ?> ${json['success']}</div>`);
									}

									if (json['failed']) {
										$('#import-result').append(`<div class="alert alert-warning" role="alert"><?php echo $text_import_failed; ?> ${json['failed']}</div>`);
									}

									if (json['error']) {
										$('#import-result').append(`<div class="alert alert-danger" role="alert">${json['error']}</div>`);
									}
								},
								error: function(xhr, ajaxOptions, thrownError) {
									console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
								}
							});

						} else if (json['error']) {
							if (json['error']) {
								$('#import-result').append(`<div class="alert alert-warning" role="alert">${json['error']}</div>`);
							}
						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						$(btn).find('.fa').remove();
						console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			}
		}, 500);
	});
</script>
<script>
	let matrix_id = <?php echo $max_matrix_id; ?> + 1;
	$('#button-matrix-add').on('click', function(){

		$('[data-variable]').text('<?php echo $entry_matrix_before; ?>');

		let html = '';
		html += '<div class="form-group" id="matrix-row-' + matrix_id + '">';
		html += 	'<label class="col-sm-2 control-label"><?php echo $entry_matrix_before; ?></label>';
		html += 	'<div class="col-sm-2">';
		html += 		'<input type="text" value="0" name="multistore_matrix[' + matrix_id + '][value]; ?>" class="form-control" />';
		html += 	'</div>';
		html += 	'<label class="col-sm-1 control-label" ><?php echo $entry_matrix_title; ?></label>';
		html += 		'<div class="col-sm-3">';
									<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
		html += 			'<div class="input-group">';
		html += 				'<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
		html += 				'<input type="text" name="multistore_matrix[' + matrix_id + '][title][<?php echo $language_id; ?>]" placeholder="<?php echo $entry_matrix_title; ?>" class="form-control" />';
		html += 			'</div>';
									<?php } ?>
		html +=			'</div>';
		html +=			'<label class="col-sm-1 control-label"><?php echo $entry_color; ?></label>';
		html +=			'<div class="col-sm-2">';
		html +=				'<div class="input-group">';
		html +=					'<input type="color" name="multistore_matrix[' + matrix_id + '][color]" value="#FFFFFF" placeholder="<?php echo $entry_color; ?>" class="form-control" />';
		html +=					'<span class="input-group-addon">';
		html +=						'<input type="checkbox" onchange="changeColorType(\'multistore_matrix[' + matrix_id + '][color]\');">';
		html +=					'</span>';
		html +=				'</div>';
		html +=			'</div>';
		html += 		'<div class="col-sm-1">';
		html += 			'<button class="btn btn-danger" type="button" onclick="removeMatrixRow(' + matrix_id + ');" title="<?php echo $button_matrix_row_remove; ?>"><i class="fa fa-trash"></i></button>';
		html += 		'</div>';
		html += 	'</div>';

		matrix_id++;

		$('#matrix').append(html);
	});

	function removeMatrixRow(matrix_id){
		$('#matrix-row-' + matrix_id).remove();
	}
</script>
<script>
	function changeColorType(name){
		const input = $(`input[name="${name}"]`);
		if ($(`input[name="${name}"]`).attr('type') == 'color'){
			input.attr('type', 'text');
		} else {
			input.attr('type', 'color');
		}
	}
</script>
<style>
	.input-group .input-group-addon {
		background-color: #fbfbfb;
	}

	.input-group:not(:first-child) .input-group-addon,
	.input-group:not(:first-child) .form-control {
			border-top: 0;
	}

	.input-group:first-child .input-group-addon {
			border-bottom-left-radius: 0;
	}

	.input-group:first-child .form-control {
			border-bottom-right-radius: 0;
	}

	.input-group:not(:first-child) .input-group-addon {
			border-top-left-radius: 0;
	}

	.input-group:not(:first-child) .form-control {
			border-top-right-radius: 0;
	}

	input[type=color] {
		padding: 0;
	}
</style>
<?php if (isset($ckeditor) && $ckeditor) { ?>
	<?php foreach ($languages as $language) { ?>
		<script>
			ckeditorInit('input-display-before-<?php echo $language['language_id']; ?>', getURLVar('token'));
			ckeditorInit('input-display-after-<?php echo $language['language_id']; ?>', getURLVar('token'));
		</script>
	<?php } ?>
<?php } ?>