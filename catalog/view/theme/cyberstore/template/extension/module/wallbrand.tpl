<?php if(!empty($manufacturers)){ ?>
<?php if($status_slider == 1){?>
<div class="container-fcat carousel-mod">
	<div class="box-title">
		<?php if(!empty($heading_title[$lang_id]['title_name'])) { ?>
		<div class="title-text"><?php echo $heading_title[$lang_id]['title_name'];?></div>
		<?php } ?>
	</div>
<div id="brand-m-slider<?php echo $module; ?>" class="owl-carousel carousel-fcat">
  <?php foreach ($manufacturers as $manufacturer) { ?>
	<div class="item text-center box-fcat">
		<div class="fcat-img">
			<a href="<?php echo $manufacturer['href']; ?>"><img src="<?php echo $manufacturer['thumb']; ?>" alt="<?php echo $manufacturer['name']; ?>"></a>
		</div>
		<div class="fcat-name"><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
	</div>
  <?php } ?>
</div>
<script><!--
$('#brand-m-slider<?php echo $module; ?>').owlCarousel({
	items: 6,	
	navigation: true,
	navigationText: ['<div class="btn btn-carousel-module next-prod"><i class="fa fa-angle-left arrow"></i></div>', '<div class="btn btn-carousel-module prev-prod"><i class="fa fa-angle-right arrow"></i></div>'],
	pagination: false
});
--></script>
</div>
<?php } else { ?>
<div class="wall-category-box">
   <?php foreach ($manufacturers as $manufacturer) { ?>
		<div class="box-item col-xs-12 col-sm-6 col-md-3 col-lg-3">
			<div class="item-category">
				<a href="<?php echo $manufacturer['href']; ?>" >
					<div class="wall-cat-image"><img src="<?php echo $manufacturer['thumb']; ?>" alt="<?php echo $manufacturer['name']; ?>"></div>
					<div class="wall-cat-name"><div class="display-table"><div class="display-table-cell"><?php echo $manufacturer['name']; ?></div></div></div>
				</a>
			</div>
		</div>
  <?php } ?>
 </div>
<?php } ?>
<?php } ?>