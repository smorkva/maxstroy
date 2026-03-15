<script>
$(document).ready(function() {
  var category_id_page = $('#content select[name=\'category_id\']').find("option:selected").attr("value");
  var category_id_html = $('#content select[name=\'category_id\']').find("option:selected").html();
  
  $("#selected_category").val(category_id_page);
  $("#category_now").val(category_id_page);
  $(".category-name").html(category_id_html);
  $('.select-category').find('.filter-option').html(category_id_html)
  });
 </script>
<div id="searchtop">	
<div id="search" class="input-group <?php if(isset($search_word) && (!empty($search_word))){?>pt20<?php } ?>">	
<input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" class="form-control input-lg search-autocomplete" />
	<div class="input-group-btn categories">
    <button id="change_category" type="button" class="btn btn-search-select dropdown-toggle" data-toggle="dropdown">
		<?php foreach ($categories as $search_category) {if ($search_category['category_id'] == $filter_category_id) {$text_search_everywhere = $search_category['name'];}}?>
		<span class="category-name"><?php echo $text_search_everywhere; ?>&nbsp;</span>&nbsp;<span class="fa fa-angle-down fa-fw car-down"></span>
	</button>
    <ul class="dropdown-menu">
			<li><a href="#" onclick="return false;" data-idsearch="0"><?php echo $text_search_everywhere; ?></a></li>
			<?php foreach ($categories as $search_category) { ?>
			<li><a href="#" onclick="return false;" data-idsearch="<?php echo $search_category['category_id']; ?>"><?php echo $search_category['name']; ?></a></li>
				
			<?php } ?>
		</ul>
		<input id="selected_category" type="hidden" name="category_id" value="0" />
		
  </div>
  <span class="input-group-btn button_search">
    <button type="button" class="btn btn-search"><i class="fa fa-search"></i></button>
  </span>
</div>
<?php if(isset($search_word) && (!empty($search_word))){?>
<div id="search_word" class="hidden-xs hidden-sm"><?php echo $text_search_word;?><a><?php echo $search_word;?></a></div>
<?php } ?>
</div>
<script>
$('#search a').click(function(){
	$("#selected_category").val($(this).attr('data-idsearch'));
	$('.category-name').html($(this).html());
});
</script>
<?php if($ns_autosearch_data['status']=='1') { ?>
<script>
	$(document).ready(function(){
	var autoSearch = $('#searchtop input[name="search"]');

	var customAutocompleteSearchtop = null;
	autoSearch.autocompleteSerach({
		delay: 500,
	responsea : function (items){
		if (items.length) {
			for (i = 0; i < items.length; i++) {
				this.items[items[i]['value']] = items[i];
			}
		}
		var html='';
		if(items.length){
			$.each(items,function(key,item){
				if(item.product_id!=0){
					html += '<li><a href="'+ item.href +'" class="autosearch_link">';
					html += '<div class="ajaxadvance">';
					html += '<div class="image">';
					if(item.image){
					html += '<img title="'+item.name+'" src="'+item.image+'"/>';
					}
					html += '</div>';
					html += '<div class="content">';
					html += 	'<h3 class="name">'+item.label+'</h3>';
					if(item.model){
					html += 	'<div class="model">';
					html +=		'<?php echo $text_autosearch_model;?> '+ item.model;
					html +=		'</div>';
					}
					if(item.manufacturer){
					html += 	'<div class="manufacturer">';
					html +=		'<?php echo $text_autosearch_manufacturer;?> '+ item.manufacturer;			
					html +=		'</div>';		
					}
					if(item.stock_status){
					html += 	'<div class="stock_status">';
					html +=		'<?php echo $text_autosearch_stock_status;?> '+ item.stock_status;			
					html +=		'</div>';
					}	
					if(item.price){
					html += 	'<div class="price"> ';
					if (!item.special) { 
					html +=			 item.price;
					} else {	
					html +=			'<span class="price-old">'+ item.price +'</span> <span class="price-new">'+ item.special +'</span>';
					}	
					html +=		'</div>';
					}	
									
					if (item.rating) {
					html +=		'<div class="ratings"> ';
					for (var i = 1; i <= 5; i++) {
					if (item.rating < i) { 
					html +=		'<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>';
					} else {	
					html +=		'<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>';
					} 
					}
					html +=		'</div>';
					}
					html +='</div>';
					html += '</div></a></li>'
				}
			});
					html +=	'<li><a class="search-view-all-result" href="index.php?route=product/search&search=' + autoSearch.val() + '"><?php echo $text_autosearch_view_all;?></a></li>';
		}	
		if (html) {
			autoSearch.siblings('ul.dropdown-menu').show();
		} else {
			autoSearch.siblings('ul.dropdown-menu').hide();
		}

		$(autoSearch).siblings('ul.dropdown-menu').html(html);
	},
		source: function(request, response) {
		customAutocompleteSearchtop = this;
			$.ajax({
				url: 'index.php?route=extension/module/cyber_autosearch/ajaxLiveSearch&filter_name=' +  encodeURIComponent(request),
				dataType : 'json',
				success : function(json) {
				customAutocompleteSearchtop.responsea($.map(json, function(item) {
					return {
					label: item.name,
						name: item.name1,
						value: item.product_id,
						model: item.model,
						stock_status: item.stock_status,
						image: item.image,
						manufacturer: item.manufacturer,
						price: item.price,
						special: item.special,
						category: item.category,
						rating: item.rating,
						reviews: item.reviews,
						href:item.href,
						}
				}));
				}
			});
		},
		select : function (ui){	
			return false;
		},
		selecta: function(ui) {
		if(ui.href){
			location = ui.href;
		}
			return false;
		},
		focus: function(event, ui) {
			return false;
		}
		});							
	});
</script>
<script>
	$(document).on('click', '#top-fixed input[name="search"]', function () {
	var autoSearchFixed = $('#top-fixed input[name="search"]');
	var customAutocomplete = null;
	$('#top-fixed ul.dropdown-menu.autosearch').remove();
	autoSearchFixed.autocompleteSerach({
		delay: 500,
	responsea : function (items){
		if (items.length) {
			for (i = 0; i < items.length; i++) {
				this.items[items[i]['value']] = items[i];
			}
		}
		var html='';
		if(items.length){
			$.each(items,function(key,item){
				if(item.product_id!=0){
					html += '<li><a href="'+ item.href +'" class="autosearch_link">';
					html += '<div class="ajaxadvance">';
					html += '<div class="image">';
					if(item.image){
					html += '<img title="'+item.name+'" src="'+item.image+'"/>';
					}
					html += '</div>';
					html += '<div class="content">';
					html += 	'<h3 class="name">'+item.label+'</h3>';
					if(item.model){
					html += 	'<div class="model">';
					html +=		'<?php echo $text_autosearch_model;?> '+ item.model;
					html +=		'</div>';
					}
					if(item.manufacturer){
					html += 	'<div class="manufacturer">';
					html +=		'<?php echo $text_autosearch_manufacturer;?> '+ item.manufacturer;			
					html +=		'</div>';		
					}
					if(item.stock_status){
					html += 	'<div class="stock_status">';
					html +=		'<?php echo $text_autosearch_stock_status;?> '+ item.stock_status;			
					html +=		'</div>';
					}	
					if(item.price){
					html += 	'<div class="price"> ';
					if (!item.special) { 
					html +=			 item.price;
					} else {	
					html +=			'<span class="price-old">'+ item.price +'</span> <span class="price-new">'+ item.special +'</span>';
					}	
					html +=		'</div>';
					}	
									
					if (item.rating) {
					html +=		'<div class="ratings"> ';
					for (var i = 1; i <= 5; i++) {
					if (item.rating < i) { 
					html +=		'<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>';
					} else {	
					html +=		'<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>';
					} 
					}
					html +=		'</div>';
					}
					html +='</div>';
					html += '</div></a></li>'
				}
			});
					html +=	'<li><a class="search-view-all-result" href="index.php?route=product/search&search=' + autoSearchFixed.val() + '"><?php echo $text_autosearch_view_all;?></a></div>';
		}	
		if (html) {
			autoSearchFixed.siblings('ul.dropdown-menu').show();
		} else {
			autoSearchFixed.siblings('ul.dropdown-menu').hide();
		}

		$(autoSearchFixed).siblings('ul.dropdown-menu').html(html);
	},
		source: function(request, response) {
		customAutocomplete = this;
			$.ajax({
				url: 'index.php?route=extension/module/cyber_autosearch/ajaxLiveSearch&filter_name=' +  encodeURIComponent(request),
				dataType : 'json',
				success : function(json) {
				customAutocomplete.responsea($.map(json, function(item) {
					return {
					label: item.name,
						name: item.name1,
						value: item.product_id,
						model: item.model,
						stock_status: item.stock_status,
						image: item.image,
						manufacturer: item.manufacturer,
						price: item.price,
						special: item.special,
						category: item.category,
						rating: item.rating,
						reviews: item.reviews,
						href:item.href
						}
				}));
				}
			});
		},
		select : function (ui){	
			return false;
		},
		selecta: function(ui) {
		if(ui.href){
			location = +ui.href;
		} 
			return false;
		},
		focus: function(event, ui) {
			return false;
		}
		});			
	});
</script>
<?php } ?>
				