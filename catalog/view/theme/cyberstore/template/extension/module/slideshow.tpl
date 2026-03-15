<div id="slideshow<?php echo $module; ?>" class="owl-carousel carousel-container" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<script><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 15000,
	singleItem: true,
	navigation: true,
	navigationText: ['<span class="slideshow-btn-prev"><i class="fa fa-angle-left" aria-hidden="true"></i></span>', '<span class="slideshow-btn-next"><i class="fa fa-angle-right" aria-hidden="true"></i></span>'],
	pagination: true,
	transitionStyle: 'fade'
});
--></script>