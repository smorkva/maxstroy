<div class="container-module">
	<div class="tabs">
		<ul class="nav nav-tabs my-tabs" id="prodCatTab<?php echo $module;?>">
			<?php $tn = 0?>
			<?php foreach($categories as $category){?>
			<li <?php if($tn == 0){?>class="active"<?php } ?>><a data-toggle="tab" data-catid="<?php echo $category['category_id'];?>" href="#cat-tab-<?php echo $module;?>-<?php echo $category['category_id'];?>"><?php echo $category['name'];?></a></li>
			<?php $tn++; ?>
			<?php } ?>
		</ul>
		<div class="tab-content prod_cat_tab_content">
			<?php $tc = 0?>
			<?php foreach($categories as $category){?>
			<div class="tab-pane fade <?php if($tc == 0){?>active in<?php } ?>" id="cat-tab-<?php echo $module;?>-<?php echo $category['category_id'];?>">
				<div class="content-items">
				</div>
			</div>
			<?php $tc++; ?>
			<?php } ?>
		  </div>
	</div>
</div>
<script>
$(document).ready(function(){
	var idCategory = $('#prodCatTab<?php echo $module;?> > li:first-child a').attr("data-catid");
	var checkExistHtml = $("#cat-tab-<?php echo $module;?>-"+idCategory+" .content-items").html();
	if($.trim(checkExistHtml).length==0||checkExistHtml==undefined){
		$.ajax({
				url: '<?php echo $ajaxurl;?>',
				type: 'post',
				data: 'category_id='+ idCategory+'&module=<?php echo $module;?>&setting=<?php echo $setting;?>',
				dataType: 'html',
				success: function(data) {
					$("#cat-tab-<?php echo $module;?>-"+idCategory+" .content-items").html(data);
				}
		});
	}		
});
$("#prodCatTab<?php echo $module;?> > li a").click(function(){
	var Categoryid = $(this).attr("data-catid");
	var checkExistHtml = $("#cat-tab-<?php echo $module;?>-"+Categoryid+" .content-items").html();
		if($.trim(checkExistHtml).length==0||checkExistHtml==undefined){
			$.ajax({
					url: '<?php echo $ajaxurl;?>',
					type: 'post',
					data: 'category_id='+ Categoryid+'&module=<?php echo $module;?>&setting=<?php echo $setting;?>',
					dataType: 'html',
					success: function(data) {
						$("#cat-tab-<?php echo $module;?>-"+Categoryid+" .content-items").html(data);
						setTimeout(function () {
						$('a > img').each(function () {
							if ($(this).attr('data-status')) {
								var status = $(this).attr('data-status');
								$(this).after('<div class="product_status">'+status+'</div>');
							}
							if ($( document ).width()>767) {
								if ($(this).attr('data-additional-hover')) {
									var img_src = $(this).attr('data-additional-hover');
									$(this).addClass('main-img');
									$(this).after('<img src="'+img_src+'" class="additional-img-hover img-responsive" title="'+$(this).attr('alt')+'" />');
								}		
							}		
						});
						},1000);
					}
			});
		}
	});
</script>