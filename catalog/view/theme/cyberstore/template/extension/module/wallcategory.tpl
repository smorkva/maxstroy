<?php if($categories){?>
<?php if($status_slider == 1){?>
<div class="container-fcat carousel-mod">
	<div class="box-title">
		<?php if(!empty($heading_title[$lang_id]['title_name'])) { ?>
		<div class="title-text"><?php echo $heading_title[$lang_id]['title_name'];?></div>
		<?php } ?>
	</div>
<div id="featured-category-slider<?php echo $module; ?>" class="owl-carousel carousel-fcat">
  <?php foreach ($categories as $category) { ?>
	<div class="item text-center box-fcat">
		<div class="fcat-img">
			<span <?php if ($category['subcategories']) { ?>class="drop-sub scb<?php echo $module;?>" data-wcatId="<?php echo $category['category_id']; ?><?php } ?>"><img class="lazyload" src="<?php echo $lazy_img;?>" data-src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>"></span>
		</div>
		<div class="fcat-name"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div>
	</div>
  <?php } ?>
</div>
<div class="bsc box-sub-category<?php echo $module;?>"></div>
<script>
$(document).on('click', '.scb<?php echo $module;?>', function () {
	if($(this).hasClass('active')){
		$('.scb<?php echo $module;?>').removeClass('active');
		$('.fcat-img').removeClass('active');
		$('.box-sub-category<?php echo $module;?>').removeClass('active');
		$('.box-sub-category<?php echo $module;?>').html("");
	} else {
		$('.scb<?php echo $module;?>').removeClass('active');
		$('.fcat-img').removeClass('active');
		$('.box-sub-category<?php echo $module;?>').addClass('active');
		$(this).addClass("active");
		$(this).parent().addClass("active");
			$('.box-sub-category<?php echo $module;?>').removeClass('active');
			$('.box-sub-category<?php echo $module;?>').html("");
			$.ajax({
				url: 'index.php?route=extension/module/cyber_wallcategory/loadSubCateogry',
				type: 'post',
				data: 'category_id=' + $(this).attr('data-wcatId') + '&module=<?php echo $module;?>&limit_sub_category=<?php echo $limit_sub_category;?>&limit3lv=<?php echo $limit3lv;?>',
				dataType: 'html',
				beforeSend: function() {
					$('.box-sub-category<?php echo $module;?>').removeClass('active');
					$('.box-sub-category<?php echo $module;?>').html("");
				},
				complete: function() {
					$('.box-sub-category<?php echo $module;?>').addClass('active');
				},	
				success:function(html){
					$('.box-sub-category<?php echo $module;?>').append(html);
				}
			});
		
	}
});
</script>  
<script><!--
$('#featured-category-slider<?php echo $module; ?>').owlCarousel({
	items: 6,	
	navigation: true,
	navigationText: ['<div class="btn btn-carousel-module next-prod"><i class="fa fa-angle-left arrow"></i></div>', '<div class="btn btn-carousel-module prev-prod"><i class="fa fa-angle-right arrow"></i></div>'],
	pagination: false
});
--></script>
</div>
<?php } else { ?>
<div class="categorywall-container categorywall-<?php echo $module; ?>">	
<?php if(!empty($heading_title[$lang_id]['title_name'])) { ?>
<div class="title-module"><span><?php echo $heading_title[$lang_id]['title_name'];?></span></div>
<?php } ?>
	<div class="wall-category-box">
		<?php foreach ($categories as $category) { ?>
			<div class="box-item col-xs-12 col-sm-6 col-md-3 col-lg-3">
				<div class="item-category <?php if ($category['subcategories']) { ?> parent_category <?php } ?>">
					<div class="wall-cat-image show-sub-cat-<?php echo $module; ?>">
					<?php if ($category['subcategories']) { ?>
					<img class="lazyload" src="<?php echo $lazy_img;?>" data-src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>">
					<?php } else { ?>
					<a href="<?php echo $category['href']; ?>"><img class="lazyload" src="<?php echo $lazy_img;?>" data-src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>"></a>
					<?php } ?>
					</div>
					<div class="wall-cat-name"><div class="display-table"><div class="display-table-cell"><a href="<?php echo $category['href']; ?>" ><?php echo $category['name']; ?></a></div></div></div>
						<?php if ($category['subcategories']) { ?>
						<div class="item-sub-category">
							<?php foreach ($category['subcategories'] as $subcategory) { ?>
								<div class="subcategory-name"><a href="<?php echo $subcategory['href']; ?>"><?php echo $subcategory['name']; ?></a></div>
							<?php } ?>
						</div>		
						<?php } ?>
				</div>		  
			</div>
      <?php } ?>
	  </div>
</div>	
<script>
$(document).ready(function() {
	if (viewport().width >= 992) {
		setTimeout(function () {
			$('.item-sub-category').scrollpanel({prefix: 'nswc-'});	
		}, 500);
	} else {
		$(document).on('click', '.show-sub-cat-<?php echo $module; ?>', function () {
			$(this).parent().find('.item-sub-category').toggleClass('active-sub-menu');
		});
	}	
	$(window).resize(function() {	
			if (viewport().width >= 992) {
				$('.item-sub-category').scrollpanel({
					prefix: 'nswc-'
				});		
			} else {
				$(document).on('click', '.show-sub-cat-<?php echo $module; ?>', function () {
					$(this).parent().find('.item-sub-category').toggleClass('active-sub-menu');
				});
			}
		}); 
	if ($(".categorywall-<?php echo $module; ?>").parents("#column-left, #column-right").length) {
		$('.categorywall-<?php echo $module; ?> .box-item').removeClass("col-sm-6 col-md-4 col-lg-3");
		$('.categorywall-<?php echo $module; ?> .box-item').addClass("col-sm-12 col-md-12 col-lg-12");
	}
});
</script>
<?php } ?>
<?php } ?>