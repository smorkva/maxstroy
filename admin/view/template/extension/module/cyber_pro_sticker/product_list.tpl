<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
		<div class="pull-right">
			<a class="btn btn-primary" onclick="location='<?php echo $sticker_list; ?>'"><span><?php echo $button_sticker_list; ?></span></a>
			<a class="btn btn-success"  data-toggle="tooltip" title="<?php echo $button_insert;?>" onclick="location='<?php echo $insert; ?>'"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
			<a class="btn btn-default" href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"><i class="fa fa-reply"></i></a>
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
	 <?php if ($success) { ?>
		 <div class="alert alert-success"><?php echo $success; ?></div>
		 <script type="text/javascript">$('.alert.alert-success').fadeOut(7000);</script>
	<?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
	  
		<div id="filterSticker" class="panel-collapse collapse">
		<table class="table table-striped table-bordered table-hover">
			<thead>
			  <tr>
			   <td class="left"><?php echo $column_name; ?></td>
			   <td class="left"><?php echo $column_categories; ?></td>
			   <td class="left"><?php echo $column_name_sticker; ?></td>
			   <td class="left"><?php echo $column_date_start; ?></td>
			   <td class="left"><?php echo $column_date_end; ?></td>
			  </tr>
			</thead>
			<tbody>
			<tr class="filter">
				<td class="left"><input class="form-control" name="filter_product_name" type="text" value="<?php echo $filter_product_name; ?>" /></td>
				<td class="left">
					<form id="form_category_list">
					<div class="well well-sm" style="min-height: 150px;max-height: 300px;overflow: auto;">							
							<?php foreach ($categories as $category) { ?>
						  <div>
						   <?php if (in_array($category['category_id'], $filter_category_id)) { ?>
						   <input type="checkbox" name="category_id_filter[]" value="<?php echo $category['category_id']; ?>" checked="checked" /> <?php echo $category['name']; ?>
						   <?php } else { ?>
						   <input type="checkbox" name="category_id_filter[]" value="<?php echo $category['category_id']; ?>" /> <?php echo $category['name']; ?>
						   <?php } ?>
						  </div>
						  <?php } ?>  
					</div>
					</form>
				</td>
       <td class="left">
        <form id="form_sticker_list">
        <div class="well well-sm" style="min-height: 150px;max-height: 300px;overflow: auto;">
          <?php foreach ($prostickers as $prosticker) { ?>
          <div>
           <?php if (in_array ($prosticker['sticker_id'], $filter_sticker_id)) { ?>
           <label><input type="checkbox" name="sticker_id_filter[]" value="<?php echo $prosticker['sticker_id']; ?>" checked="checked" /> <?php echo $prosticker['name']; ?></label>
           <?php } else { ?>
           <label><input type="checkbox" name="sticker_id_filter[]" value="<?php echo $prosticker['sticker_id']; ?>" /> <?php echo $prosticker['name']; ?></label>
           <?php } ?>
          </div>
          <?php } ?>
         </div>
        </form>
       </td>
       <td class="left">
			<div class="input-group date">
                <input type="text" name="filter_date_start_sticker" value="<?php echo $filter_date_start_sticker; ?>"  data-date-format="YYYY-MM-DD" id="input-filter_date_start_sticker" class="form-control" />
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span>
			</div>
	   </td>
	   <td class="left">
			<div class="input-group date">
                <input type="text" name="filter_date_end_sticker" value="<?php echo $filter_date_end_sticker; ?>"  data-date-format="YYYY-MM-DD" id="input-filter_date_end_sticker" class="form-control" />
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span>
			</div>
	   </td>
       
      </tr>
     </tbody>
     <tfoot>
      <tr>
       <td class="text-center" colspan="5"><a class="btn btn-primary" onclick="filter();"><?php echo $button_filter; ?></a></td>
      </tr>
     </tfoot>
    </table>
	</div>
		<div class="text-center form-group">
		<a class="btn btn-info collapsed" data-toggle="collapse" href="#filterSticker">
			<span class="ns_ch_visible"><i class="fa fa-eye fa-fw"></i><?php echo $text_show_filter;?></span>
			<span class="ns_ch_hidden"><i class="fa fa-eye-slash fa-fw"></i><?php echo $text_hide_filter;?></span>
			<i class="fa fa-angle-up arr"></i>
		</a>
		<style type="text/css">
		.collapsed .ns_ch_visible {
		  display: inline;
		}
		.ns_ch_visible {
		  display: none;
		}
		.collapsed .ns_ch_hidden {
			display: none;
		}
		</style>
		</div>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
    <table class="table table-striped table-bordered table-hover" id="products">
	<thead>
			   <td class="left" colspan="3"></td>
			   <td class="left"><?php echo $column_name_sticker; ?></td>
			   <td class="left"><?php echo $column_date_start; ?></td>
			   <td class="left"><?php echo $column_date_end; ?></td>
			    <td class="left" colspan="3"></td>
			  </tr>
			</thead>
     <thead>
      <tr>
       <td class="left" colspan="3"></td>
       <td class="left">
        <select class="form-control" name="sticker_id">
         <option value="0"><?php echo $text_none; ?></option>
         <?php foreach ($prostickers as $prosticker) { ?>
         <option value="<?php echo $prosticker['sticker_id']; ?>"><?php echo $prosticker['name']; ?></option>
         <?php } ?>
        </select>
       </td>
       <td class="center">
            <div class="input-group date">
                <input type="text" name="date_start_sticker" value="<?php echo $date_start_sticker; ?>"  data-date-format="YYYY-MM-DD" id="input-date_start_sticker" class="form-control" />
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span>
			</div>
	   </td>
	   <td class="center">
            <div class="input-group date">
                <input type="text" name="date_end_sticker" value="<?php echo $date_end_sticker; ?>"  data-date-format="YYYY-MM-DD" id="input-date_end_sticker" class="form-control" />
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span>
			</div>
	   </td>
       <td class="center" colspan="3"><a class="btn btn-primary" onclick="$('#form').submit();"><?php echo $text_edit; ?></a></td>
      </tr>
     </thead>
     <thead>
      <tr>
       <td class="center" width="1"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
       <td class="center" width="1"><a href="<?php echo $sort_image; ?>" class="<?php echo ($sort == 'p.image') ? strtolower($order) : ''; ?>"><?php echo $column_image; ?></a></td>
       <td class="left"><a href="<?php echo $sort_product_name; ?>" class="<?php echo ($sort == 'pd.name') ? strtolower($order) : ''; ?>"><?php echo $column_name; ?></a></td>
       <td class="left"><a href="<?php echo $sort_name; ?>" class="<?php echo ($sort == 'ast.name') ? strtolower($order) : ''; ?>"><?php echo $column_name_sticker; ?></a></td>
       <td class="center" width="10%"><a href="<?php echo $sort_date_start; ?>" class="<?php echo ($sort == 'p.date_start_sticker') ? strtolower($order) : ''; ?>"><?php echo $column_date_start; ?></a></td>
       <td class="center" width="10%"><a href="<?php echo $sort_date_end; ?>" class="<?php echo ($sort == 'p.date_end_sticker') ? strtolower($order) : ''; ?>"><?php echo $column_date_end; ?></a></td>
       <td class="center" width="10%"><a href="<?php echo $sort_price; ?>" class="<?php echo ($sort == 'p.price') ? strtolower($order) : ''; ?>"><?php echo $column_price; ?></a></td>
       <td class="center" width="10%"><a href="<?php echo $sort_date_available; ?>" class="<?php echo ($sort == 'p.date_available') ? strtolower($order) : ''; ?>"><?php echo $column_date_available; ?></a></td>
       <td class="center" width="10%"><a href="<?php echo $sort_sort_order; ?>" class="<?php echo ($sort == 'p.sort_order') ? strtolower($order) : ''; ?>"><?php echo $column_sort_order; ?></a></td>
      </tr>
     </thead>
     <tbody>
      <?php foreach ($products as $product) { ?>
      <?php $class = ($product['selected']) ? 'selected' : ''; ?>
      <tr class="<?php echo $class; ?>">
       <td class="center">
        <?php if ($product['selected']) { ?>
        <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" checked="checked" />
        <?php } else { ?>
        <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" />
        <?php } ?>
       </td>
       <td class="center">
        <div class="image">
         <a href="<?php echo $product['href']; ?>" target="_blank"><img src="<?php echo $product['image']; ?>" alt="<?php echo $product['image']; ?>" /></a>
        </div>
       </td>
       <td class="left name"><?php echo $product['name']; ?></td>
       <td class="left name"><?php echo $product['sticker_name']; ?></td>
       <td class="center"><?php echo $product['date_start_sticker']; ?></td>
       <td class="center"><?php echo $product['date_end_sticker']; ?></td>
       <td class="center"><?php echo $product['price']; ?></td>
       <td class="center"><?php echo $product['date_available']; ?></td>
       <td class="center"><?php echo $product['sort_order']; ?></td>
      </tr>
      <?php } ?>
     </tbody>
    </table>
    
		<div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('input[name=\'filter_product_name\']').autocomplete({
	'source': function(request, response) {
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
	'select': function(item) {
		$('input[name=\'filter_product_name\']').val(item['label']);
	}
});

$('.date').datetimepicker({
	pickTime: false
});


$(function() {
	$('#products tbody input[type="checkbox"]').click(function() {
		if ($(this).attr('checked')) {
			$(this).parent('td').parent('tr').addClass('selected');
		} else {
			$(this).parent('td').parent('tr').removeClass('selected');
		}
	});
	
	$('#products thead input[type="checkbox"]').click(function() {
		if ($(this).attr('checked')) {
			$('#products tbody tr').addClass('selected');
		} else {
			$('#products tbody tr').removeClass('selected');
		}
	});
});
//--></script>

<script type="text/javascript"><!--
function filter() {
	var url = '';
	
	filter_product_name = $('input[name=\'filter_product_name\']').val();
	
	if (filter_product_name) {
		url += '&filter_product_name=' + filter_product_name;
	}
	
	category_id_filter = $('#form_category_list').serialize();
	
	if (category_id_filter) {
		url += '&' + category_id_filter;
	}
	
	sticker_id_filter = $('#form_sticker_list').serialize();
	
	if (sticker_id_filter) {
		url += '&' + sticker_id_filter;
	}
	
	filter_date_start_sticker = $('input[name=\'filter_date_start_sticker\']').val();
	
	if (filter_date_start_sticker) {
		url += '&filter_date_start_sticker=' + filter_date_start_sticker;
	}
	
	filter_date_end_sticker = $('input[name=\'filter_date_end_sticker\']').val();
	
	if (filter_date_end_sticker) {
		url += '&filter_date_end_sticker=' + filter_date_end_sticker;
	}
	
	location = 'index.php?route=extension/module/cyber_pro_sticker/getProductsList&token=<?php echo $token; ?>' + url;
}
//--></script>
<?php echo $footer; ?>