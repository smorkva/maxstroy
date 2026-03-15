<div class="modal-dialog modal-lg">
  <div class="modal-content">
	<div class="modal-header">
		<button id="button-close" class="pull-right btn btn-danger btn-sm" type="button">×</button>
		<h4 class="modal-title"><?php echo $entry_description_poduct_tab;?></h4>
	</div>
	<div id="body-edit-product-name" class="modal-body">
	  <form class="form-horizontal" id="form-product-tab-group-add" enctype="multipart/form-data" method="post">
		<input type="hidden" name="tabs_ns_id" value="<?php echo $tabs_ns_id;?>" />
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-product"><?php echo $entry_product; ?></label>
            <div class="col-sm-10">
              <input type="text" name="product" value="" placeholder="<?php echo $entry_product; ?>" id="input-product" class="form-control" />
              <div id="product-tabs-group" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($products as $product) { ?>
                <div id="product-tabs-group<?php echo $product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
                  <input type="hidden" name="product[]" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
		<div class="form-group">
		    <div class="col-sm-12">
				<ul class="nav nav-tabs" id="language">
					<?php foreach ($languages as $language) { ?>
					<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
					<?php } ?>
				</ul>
				<div class="tab-content">
					<?php foreach ($languages as $language) { ?>
						<div class="tab-pane active" id="language<?php echo $language['language_id']; ?>">
							<div class="form-group">
								<div class="col-sm-12">
								  <textarea name="product_extra_tab[<?php echo $language['language_id']; ?>][product_extra_tab_description]" placeholder="<?php echo $entry_description_poduct_tab; ?>" id="input-description<?php echo $language['language_id']; ?>"></textarea>
								</div>
							</div>
						</div>
					<?php } ?>
				</div>
            </div>
		</div>
	  </form>
	</div>
	<div class="modal-footer">
	  <div class="text-center"><a onclick="saveEditor();" class="button-save btn btn-info btn-lg" data-form="form-product-tab-group-add"><i class="fa fa-save fa-fw"></i><?php echo $button_save;?></a></div>
	</div>
  </div>
  <script src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script src="view/javascript/summernote/opencart.js"></script>

<script>
$('#language a:first').tab('show');
<?php foreach ($languages as $language) { ?>
$('#input-description<?php echo $language['language_id']; ?>').summernote({height: 150});
<?php } ?>

function saveEditor() {	
	$.ajax({
		url: 'index.php?route=catalog/product_tabs/changeProductTabsDescriptionGroup&token=<?php echo $token;?>&',
		type: 'post',
		dataType: 'json',
		data: $('#form-product-tab-group-add').serialize(),
		success: function(json) {
		$('.alert.alert-danger').remove()
			if (json['warning']) {
				$('#form-product-tab-group-add').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-product-tab-group-add').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				
				setTimeout(function(){
					$('#name-modal-<?php echo $tabs_ns_id;?>').modal('hide');
					$('#name-content-<?php echo $tabs_ns_id;?>').empty();		
				}, 1000)
			}
		}
	});
}
  
$('#button-close').on('click', function() {
	$('#name-modal-<?php echo $tabs_ns_id;?>').modal('hide');
	$('#name-content-<?php echo $tabs_ns_id;?>').empty();			
});
</script>
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
		
		$('#product-tabs-group' + item['value']).remove();
		
		$('#product-tabs-group').append('<div id="product-tabs-group' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product[]" value="' + item['value'] + '" /></div>');	
	}
});
	
$('#product-tabs-group').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>
	</div>
</div>