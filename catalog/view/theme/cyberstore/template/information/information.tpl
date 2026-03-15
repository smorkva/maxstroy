<?php echo $header; ?>
<div class="container">
<div class="col-sm-12 content-box-cs">
  <ul class="breadcrumb <?php if (isset($menu_open_information) && (($menu_open_information =='1') && ($main_menu =='1') && ($column_left))) { ?>col-md-offset-3 col-lg-offset-3<?php } ?>" itemscope itemtype="http://data-vocabulary.org/Breadcrumb" >
		<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
			<?php if($i+1<count($breadcrumbs)){ ?>
				<li><a itemprop="url" href="<?php echo $breadcrumb['href']; ?>"><span itemprop="title"><?php echo $breadcrumb['text']; ?></span></a></li>
			<?php } else { ?>
				<li><?php echo $breadcrumb['text']; ?></li>
			<?php } ?>
		<?php } ?>
	</ul>
  <div class="row">
   <?php if (isset($menu_open_information) && (($menu_open_information =='1') && ($main_menu =='1') && ($column_left))) { ?>
		<script>
		if(window.matchMedia("(min-width: 992px)").matches){
			$('header #menu-list').addClass("nsmenu-block");
			$(function(){$('#column-left').css({'margin-top': $('header #menu-list').outerHeight() - 54});});
		}
		$(window).resize(function() {
			if ($(window).width() > 992) {
				$('header #menu-list').addClass("nsmenu-block");
				$(function(){$('#column-left').css({'margin-top': $('header #menu-list').outerHeight() - 54});});
			} else {
				$('header #menu-list').removeClass("nsmenu-block");
			}
		});
		</script>
	<?php } ?>
  <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-4 col-md-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-8 col-md-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
  <?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $description; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
</div>
<?php echo $footer; ?>