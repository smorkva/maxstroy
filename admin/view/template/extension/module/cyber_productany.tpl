<?php echo $header; ?><?php echo $column_left; ?>
<?php if(empty($config_title_color_text_productany)) $config_title_color_text_productany           = "#FFFFFF";?>
<?php if(empty($config_title_background)) $config_title_background           = "#FFFFFF";?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-productany" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-productany" class="form-horizontal">
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
				<label class="col-sm-2 control-label"><?php echo $text_productany_title; ?></label>
				<div class="col-sm-5">
				<tr>
					<td class="text-left"><?php foreach ($languages as $language) { ?>
                       <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                          <textarea name="config_productany_title[<?php echo $language['language_id']; ?>][config_productany_title]" rows="5" placeholder="" class="form-control"><?php echo isset($config_productany_title[$language['language_id']]) ? $config_productany_title[$language['language_id']]['config_productany_title'] : ''; ?></textarea>
                        </div>
                        <?php } ?></td>
				</tr>
				</div>
			</div>
			 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-color-text"><?php echo $entry_title_color_text; ?></label>
            <div class="col-sm-10">
              <input type="text" name="config_title_color_text_productany" value="<?php echo $config_title_color_text_productany; ?>" placeholder="<?php echo $config_title_color_text_productany; ?>" id="input-color-text" class="form-control color" />
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-color-text"><?php echo $entry_title_background; ?></label>
            <div class="col-sm-10">
              <input type="text" name="config_title_background" value="<?php echo $config_title_background; ?>" placeholder="<?php echo $config_title_background; ?>" id="input-color-text" class="form-control color" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-product"><?php echo $entry_product; ?></label>
            <div class="col-sm-10">
              <input type="text" name="product" value="" placeholder="<?php echo $entry_product; ?>" id="input-product" class="form-control" />
              <div id="productany-product" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($products as $product) { ?>
                <div id="productany-product<?php echo $product['product_id']; ?>"><i class="fa fa-hand-o-up" aria-hidden="true"></i> <i class="fa fa-hand-o-down" aria-hidden="true"></i> <i class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
                  <input type="hidden" name="product[]" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
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
            <label class="col-sm-2 control-label" for="input-statu-stimer-special"><?php echo $entry_timer; ?></label>
            <div class="col-sm-10">
              <select name="status_timer_special" id="input-statu-stimer-special" class="form-control">
                <?php if ($status_timer_special) { ?>
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
        </form>
      </div>
    </div>
  </div>
  <script><!--
$('input[name=\'product\']').autocomplete({
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	select: function(item) {
		$('input[name=\'product\']').val('');
		
		$('#productany-product' + item['value']).remove();
		
		$('#productany-product').append('<div id="productany-product' + item['value'] + '"><i class="fa fa-hand-o-up" aria-hidden="true"></i> <i class="fa fa-hand-o-down" aria-hidden="true"></i> <i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product[]" value="' + item['value'] + '" /></div>');	
		changeIcon();
	}
});
	
$('#productany-product').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
$(document).on('click', '.fa-hand-o-up', function () {
	$(this).parent().prev().before($(this).parent().prop('outerHTML'))
	$(this).parent().remove();
	changeIcon();
});	
$(document).on('click', '.fa-hand-o-down', function () {
	$(this).parent().next().after($(this).parent().prop('outerHTML'))
	$(this).parent().remove();
	changeIcon();
});
function changeIcon(){
	$('#productany-product div .fa-hand-o-up').removeClass('hide');
	$('#productany-product div .fa-hand-o-down').removeClass('hide');
	$('#productany-product div:first-child .fa-hand-o-up').addClass('hide');
	$('#productany-product div:last-child .fa-hand-o-down').addClass('hide'); 
}
changeIcon();
//--></script></div>
<?php echo $footer; ?>