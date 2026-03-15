<div class="menu-header-box-h">
<?php if($config_fixed_panel_top) { ?>
<script>
$(document).ready(function() {
	var width_fmns = viewport().width;
	var header_h = $('header').outerHeight();
	if (width_fmns >= 992) {
	$(window).scroll(function(){		
		if($(this).scrollTop() > header_h + 55) {
			$('header .dropdown-menu.autosearch').css('display','none');
			$('body').addClass('fixed-top-header');
			$('body').css('padding-top',header_h);
			$('body').addClass('active-fix');
		}else{
			$('body').removeClass('fixed-top-header');
			$('body').removeClass('active-fix');
			$('body').removeClass('open-fix-mm');
			$('.m-fix-btn').removeClass('rotate-icon');
			$('body').css('padding-top',0);
		}		
	});
	}
	$(".m-fix-btn").on('click', function() {
		$(this).toggleClass('rotate-icon');
		$('body').toggleClass('open-fix-mm');
	});

$('#top-fixed').hover(function() {
$('#top-fixed #horizontal-menu .menu-full-width .dropdown-menu').each(function() {
	var menu = $('#horizontal-menu .container').offset();
	var dropdown = $(this).parent().offset();		
	var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#horizontal-menu .container').outerWidth());	
							
	if (i > 0) {
		$(this).css('margin-left', '-' + (i + 10) + 'px');
	} 
	var width = $('#horizontal-menu .container').outerWidth();
	$(this).css('width', '' + (width - 23) + 'px');
});
});
});
</script>
<?php } ?>
<?php if ($items) { ?>
<div class="menu-fixed <?php if(isset($main_menu_fix_mobile) && ($main_menu_fix_mobile == 1)) { ?>hidden-xs hidden-sm<?php } ?>">
	<?php if($hmenu_type =='1') { ?>
		<nav id="horizontal-menu" class="navbar">
	<?php } ?>
  <div class="container">
  	<?php if($hmenu_type =='0') { ?>
		<nav id="horizontal-menu" class="navbar hmenu_type">
	<?php } ?>
		<div class="navbar-header">
		  <button type="button" class="btn btn-navbar navbar-toggle-m" <?php if(isset($type_mobile_menu) && ($type_mobile_menu == '1')){ ?> data-toggle="offcanvas" data-target="#menu-mobile-ns.navmenu.offcanvas" data-canvas="body"<?php } else { ?>data-toggle="collapse" data-target=".navbar-ex1-collapse"<?php } ?>><i class="fa fa-bars"></i></button>
		</div>
		<div class="collapse nav-coll-m navbar-ex1-collapse">
		  <ul class="nav navbar-nav">
			<?php foreach ($items as $item) { ?>
				<?php if ($item['children']) { ?>
				<li class="dropdown">
					<a href="<?php echo $item['href']; ?>" <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link"';} else {echo 'class="dropdown-toggle dropdown-img" data-toggle="dropdown"';} ?>>
						<?php if($item['thumb']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
						<?php } ?>
						<?php if($item['thumb_hover']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
						<?php } ?>
						<?php if(!empty($item['sticker_parent'])){?>
							<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
						<?php } ?>	
						<?php echo $item['name']; ?>
						<i class="fa fa-angle-down arrow"></i>
					</a>
					<?php if($item['type']=="freelink"){ ?>
					<?php if($item['subtype']=="simple"){ ?>
					  <div class="dropdown-menu nsmenu-type-category-simple">
							<ul class="list-unstyled nsmenu-haschild">
								<?php foreach ($item['children'] as $child) { ?>
								<li class="<?php if(count($child['children'])){?> nsmenu-issubchild<?php }?>">
									<a href="<?php echo $child['href']; ?>"><?php if(!empty($child['children'])){ ?><i class="fa fa-angle-down arrow"></i><?php } ?><?php echo $child['name']; ?></a>
									<?php if(count($child['children'])){?>
										<ul class="list-unstyled nsmenu-ischild nsmenu-ischild-simple">
											<?php foreach ($child['children'] as $subchild) { ?>
												<li><a href="<?php echo $subchild['link']; ?>"><?php echo $subchild['title']; ?></a></li>				
											<?php } ?>
										</ul>
									<?php } ?>				
								</li>
								<?php } ?>
							</ul>
					   </div>
					<?php } ?>
					<?php } ?>
					<?php if($item['type']=="freelink"){?>
					<?php if(($item['subtype']=="full_image") || ($item['subtype']=="full")){?>
						 <div class="dropdown-menu nsmenu-type-category-full-image nsmenu-bigblock">
								<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
								 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
									<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
									<div class="row-flex">
										<?php foreach ($children as $child) { ?>
										<div class="nsmenu-parent-block<?php if(!empty($child['children'])){?> nsmenu-issubchild<?php }?> col-md-<?php if ($item['add_html']) { ?>4<?php } else { ?>3<?php } ?> col-sm-12 col-xs-12">
											<div class="mbflex">
												<?php if($item['subtype']=="full_image") { ?>
												<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img class="lazyload" src="<?php echo $lazy_img;?>" data-src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>"/></a>
												<?php } ?>
												<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
											</div>
											<?php if(!empty($child['children'])){ ?>
												<ul class="list-unstyled nsmenu-ischild">
													<?php foreach ($child['children'] as $subchild) { ?>
													<li><a href="<?php echo $subchild['link']; ?>"><?php echo $subchild['title']; ?></a></li>				
													<?php } ?>
												</ul>
											<?php } ?>	
										</div>
										<?php } ?>	
									</div>
									<?php } ?>	
								</div>
								<?php if($item['add_html']){?>
								<div class="col-sm-4 menu-add-html">
									<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
								</div>
								<?php }?>
						</div>
					<?php } ?>
					<?php } ?>	
					<?php if($item['type']=="category"){ ?>
					<?php if($item['subtype']=="simple"){ ?>
					  <div class="dropdown-menu nsmenu-type-category-simple">
							<ul class="list-unstyled nsmenu-haschild">
								<?php foreach ($item['children'] as $child) { ?>
								<li <?php if(!empty($child['children'])){?>class="nsmenu-issubchild"<?php }?>>
									<a href="<?php echo $child['href']; ?>"><?php if(!empty($child['children'])){ ?><i class="fa fa-angle-down arrow"></i><?php } ?>
									<?php echo $child['name']; ?></a>
									<?php if(!empty($child['children'])){?>
									<ul class="list-unstyled nsmenu-ischild nsmenu-ischild-simple">
									 <?php foreach ($child['children'] as $subchild) { ?>
									<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>				
									<?php } ?>
									</ul>
									<?php } ?>				
								</li>
								<?php } ?>
							</ul>
						</div>
						<?php } ?>	
						<?php } ?>
						
							<?php if($item['type']=="category"){?>
							<?php if(($item['subtype']=="full_image") || ($item['subtype']=="full")){?>
							  <div class="dropdown-menu nsmenu-type-category-full-image nsmenu-bigblock">
									<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
										 <?php $num_columns = ($item['add_html']) ? 3 : 4; ?>
											<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
											<div class="row-flex">
												<?php foreach ($children as $child) { ?>
												<div class="nsmenu-parent-block<?php if(!empty($child['children'])){?> nsmenu-issubchild<?php }?> col-md-<?php if ($item['add_html']) { ?>4<?php } else { ?>3<?php } ?> col-sm-12 col-xs-12">
													<div class="mbflex">
													<?php if($item['subtype']=="full_image" && deviceType == 'computer') { ?>
													<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img class="lazyload" src="<?php echo $lazy_img;?>" data-src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>"/></a>
													<?php } ?>
													<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
													</div>
													<?php if(!empty($child['children'])){ ?>
														<ul class="list-unstyled nsmenu-ischild">
															<?php foreach ($child['children'] as $subchild) { ?>
															<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>				
															<?php } ?>
														</ul>
													<?php } ?>	
													<?php if($child['showmore']){ ?>
														<div class="showmore-c"><a href="<?php echo $child['href']; ?>"><?php echo $text_all_category;?></a></div>
													<?php } ?>
												</div>
												<?php } ?>	
											</div>
											<?php } ?>	
										</div>
										<?php if($item['add_html']){?>
										<div class="col-sm-4 menu-add-html">
											<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
										</div>
										<?php }?>
								</div>
								<?php }?>	
								<?php }?>
								
								<?php if($item['type']=="html"){?>
								  <div class="dropdown-menu nsmenu-type-html nsmenu-bigblock">
										<div><?php echo html_entity_decode($item['html'], ENT_QUOTES, 'UTF-8'); ?></div>
								   </div>	
								<?php } ?>
								
								<?php if($item['type']=="manufacturer"){?>
									<div class="dropdown-menu nsmenu-type-manufacturer nsmenu-bigblock">
										<?php if($item['type_manuf'] == "type_alphabet"){ ?>
											<div class="col-sm-<?php if($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
												<?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
												<?php if ($item['result_manufacturer_a']) { ?>
													<?php foreach (array_chunk($item['result_manufacturer_a'], $num_columns) as $manufacturer_a) { ?>
													<div class="row">
													<?php foreach ($manufacturer_a as $man_alphabet) { ?>
														<?php if ($man_alphabet['manufacturer']) { ?>
															<?php foreach (array_chunk($man_alphabet['manufacturer'], $num_columns) as $manufacturers) { ?>
																<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
																<span class="name-manuf-a"><?php echo $man_alphabet['name']; ?></span>
																	<?php foreach ($manufacturers as $manufacturer) { ?>
																		<div class="manuf-res"><a data-toggle="tooltip" title="<img src='<?php echo $manufacturer['thumb']; ?>' alt='<?php echo $manufacturer['name']; ?>' title='<?php echo $manufacturer['name']; ?>' />" href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
																	<?php } ?>
																</div>
															<?php } ?>
														
														<?php } ?>
													<?php } ?>
													</div>
													<?php } ?>
												<?php } ?>
											</div>
											<?php if($item['add_html']){ ?>
											<div class="col-sm-4 menu-add-html">
												<?php echo html_entity_decode($item['add_html'][$lang_id], ENT_QUOTES, 'UTF-8'); ?>
											</div>
											<?php } ?>
										<?php } ?>
										<?php if($item['type_manuf'] == "type_image"){ ?>
											<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
											 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
												<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
												<div class="row">
													<?php foreach ($children as $child) { ?>
													<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
														<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img class="lazyload" src="<?php echo $lazy_img;?>" data-src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
														<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
													</div>
													<?php } ?>	
												</div>
												<?php } ?>	
											</div>
											<?php if($item['add_html']){ ?>
											<div class="col-sm-4 menu-add-html">
												<?php echo html_entity_decode($item['add_html'][$lang_id], ENT_QUOTES, 'UTF-8'); ?>
											</div>
											<?php } ?>
										<?php } ?>	            
									</div>
								<?php } ?>
								
								<?php if($item['type']=="information"){?>	
									<div class="dropdown-menu nsmenu-type-information <?php if($item['add_html']){?>nsmenu-bigblock<?php } ?>">
										<?php if($item['add_html']){?>
											<div class="menu-add-html">
												<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
											</div>
										<?php }?>									  
										<ul class="list-unstyled nsmenu-haschild <?php if($item['add_html']){?>nsmenu-blockwithimage<?php } ?>">
											<?php foreach ($item['children'] as $child) { ?>
												<li class=""><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
											<?php } ?>
										</ul>
									</div>
								<?php } ?>
								
								<?php if($item['type']=="product"){?>
									<div class="dropdown-menu nsmenu-type-product nsmenu-bigblock">
										<div class="col-xs-12 col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
										 <?php $num_columns = ($item['add_html']) ? 3 : 6; ?>
											<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
											<div class="row">
												<?php foreach ($children as $child) { ?>
												<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>4<?php } else { ?>2<?php } ?> col-sm-12 col-xs-12">
													<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img class="lazyload" src="<?php echo $lazy_img;?>" data-src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
													<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
													<div class="price">
														<?php if (!$child['special']) { ?>
															<?php echo $child['price']; ?>
														<?php } else { ?>
															<span class="price-old"><?php echo $child['price']; ?></span> 
															<span class="price-new"><?php echo $child['special']; ?></span>
														<?php } ?>
													</div>	
												</div>
												<?php } ?>	
											</div>
											<?php } ?>	
										</div>
										<?php if($item['add_html']){?>
										<div class="hidden-xs col-sm-4 menu-add-html">
											<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
										</div>
										<?php }?>
									</div>
								<?php } ?>
					</li>
				<?php } else {  ?>
					<li><a <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link"';} else {echo 'class="dropdown-img"';} ?> href="<?php echo $item['href']; ?>"><?php if($item['thumb']){?>
							<img alt="<?php echo $item['name'][$lang_id]; ?>" class="nsmenu-thumb" src="<?php echo $item['thumb']?>"/>
						<?php } ?>
						<?php if(!empty($item['sticker_parent'])){?>
							<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
						<?php } ?>
						<?php echo $item['name']; ?></a></li>
				<?php } ?>
			<?php } ?>
		  </ul>
		</div>
		<?php if($hmenu_type =='0') { ?>
			</nav>
			 <?php if(isset($main_menu_mask) && ($main_menu_mask == 1)) { ?>
			  <div id="maskMenuHor"></div>	
			<?php } ?>
		<?php } ?>
	</div>
		<?php if($hmenu_type =='1') { ?>
			</nav>
			 <?php if(isset($main_menu_mask) && ($main_menu_mask == 1)) { ?>
		  <div id="maskMenuHor"></div>	
		<?php } ?>
		<?php } ?>
		
 </div>
<?php } ?>
<?php if($main_menu_fix_mobile == 0) { ?>
<script>
$(document).ready(function() {
	$(function() {
		if (viewport().width <= 991) {				
			$('.box-search #searchtop').insertAfter('#horizontal-menu .navbar-header button:eq(0)');
		} 
		$(window).resize(function() {
			if (viewport().width <= 991) {
				$('.box-search #searchtop').insertAfter('#horizontal-menu .navbar-header button:eq(0)');
			} else {
				$('.box-search').prepend( $('#horizontal-menu .navbar-header #searchtop') );	
			}
		}); 
	});
});
</script>
<?php } ?>
<?php if(isset($main_menu_fix_mobile) && ($main_menu_fix_mobile == 1)) { ?>
<div class="mob-block-fix" id="mob-info-block">
	<div class="mob-block-title"><?php echo $text_info_mob; ?></div>
	<div id="mob-info-block-inner">
	<?php echo html_entity_decode($desc_info_mob[$lang_id]['text'],ENT_QUOTES, 'UTF-8');?>
	</div>
	<button type="button" class="mob-block-close">×</button>
</div>
<div class="mob-block-fix" id="mob-search-block">
	<div id="mob-search-block-inner"></div>
</div>
<div id="top-fixed-mobile" class="hidden-md hidden-lg">
	<div class="container">
		<div class="box-flex-fix">
			<div class="mob-m-i menu_fix_mob">
				<?php if(isset($type_mobile_menu) && ($type_mobile_menu == '1')){ ?> 
				<button type="button" class="btn btn-menu-mobile" data-toggle="offcanvas" data-target="#menu-mobile-ns.navmenu.offcanvas" data-canvas="body">
					<i class="fa fa-bars"></i>
				</button>
				<?php } else { ?>
				<button type="button" class="btn btn-menu-mobile" data-toggle="collapse" data-target="#menu-mobile-ns .navbar-type2-collapse">
					<i class="fa fa-bars"></i>
				</button>
				<script><!--
				$(".btn-menu-mobile").click(function() {
					 if ($("#menu-mobile-ns .navbar-type2-collapse").hasClass("in")) {
						 return $("body").removeClass("no-scroll-html");
					 } else {
						 return $("body").addClass("no-scroll-html");
					 }
				});
				--></script>
				<?php } ?>
			</div>
			<div class="box-fm-r">
				<div class="mob-m-i info_fix_mob"><a id="info-btn-mob"><i class="fa fa-info" aria-hidden="true"></i></a></div>
				<div class="mob-m-i account_fix_mob">
					<a data-toggle="dropdown" class="dropdown-toggle"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
				</div>
				<div class="mob-m-i search_fix_mob"><a id="search-btn-mob"><i class="fa fa-search icon-btn" aria-hidden="true"></i></a></div>
				<div class="mob-m-i compare-h-fix"><i class="fa fa-retweet" aria-hidden="true"></i></div>
				<div class="mob-m-i wishlist-h-fix"><i class="fa fa-heart-o" aria-hidden="true"></i></div>
				<div class="mob-m-i cart_fix_mob"><i class="fa fa-shopping-basket" aria-hidden="true"></i></div>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
	$(function() {
		var width_dev_ns = viewport().width;
		if (width_dev_ns <= 991) {
			$('#mob-info-block-inner').prepend( $('.header-nav-links') );	
			$('#mob-info-block-inner').prepend( $('#currency') );	
			$('#mob-info-block-inner').prepend( $('#language') );	
			$('#top-fixed-mobile .account_fix_mob').prepend( $('.box-account .dropdown-menu') );	
			$('#mob-search-block-inner').prepend( $('.box-search #search') );
			$('#top-fixed-mobile .compare-h-fix').empty().prepend( $('.compare-h') );
			$('#top-fixed-mobile .wishlist-h-fix').empty().prepend( $('.wishlist-h') );
			$('#top-fixed-mobile .cart_fix_mob').empty().prepend( $('.box-cart .shopping-cart') );	
		} 
		$(window).resize(function() {
			var width_dev_ns = viewport().width;
			if (width_dev_ns <= 991) {
				$('#mob-info-block-inner').prepend( $('.header-nav-links') );	
				$('#mob-info-block-inner').prepend( $('#currency') );	
				$('#mob-info-block-inner').prepend( $('#language') );	
				$('#top-fixed-mobile .account_fix_mob').prepend( $('.box-account .dropdown-menu') );	
				$('#mob-search-block-inner').prepend( $('.box-search #search') );
				if ($(".box-cart >").hasClass("compare-h")) {
				$('#top-fixed-mobile .compare-h-fix').empty().prepend( $('.h-box .compare-h') );
				} else {
				$('#top-fixed-mobile .compare-h-fix').prepend( $('.h-box .compare-h') );
				}
				if ($(".box-cart >").hasClass("wishlist-h")) {
				console.log('has class wi');
				$('#top-fixed-mobile .wishlist-h-fix').empty().prepend( $('.h-box .wishlist-h') );
				} else {
					$('#top-fixed-mobile .wishlist-h-fix').prepend( $('.h-box .wishlist-h') );
				}
				if ($(".box-cart >").hasClass("shopping-cart")) {
				$('#top-fixed-mobile .cart_fix_mob').empty().prepend( $('.h-box .box-cart .shopping-cart') );	
				} else {
				$('#top-fixed-mobile .cart_fix_mob').prepend( $('.h-box .box-cart .shopping-cart') );	
				}
			} else {
				$('.box-currency').prepend( $('#currency') );	
				$('.box-language').prepend( $('#language') );
				$('.box-question').prepend( $('#mob-info-block-inner .header-nav-links') );
				$('.box-account').prepend( $('#top-fixed-mobile .dropdown-menu ') );
				$('.box-search #searchtop').prepend( $('#mob-search-block-inner #search') );	
				$('.box-cart').prepend( $('#top-fixed-mobile .cart_fix_mob .shopping-cart ') );
				$('.box-cart').prepend( $('#top-fixed-mobile .wishlist-h ') );
				$('.box-cart').prepend( $('#top-fixed-mobile .compare-h ') );
			}
		}); 
	});
});				
$('#info-btn-mob').on('click', function() {
	$('#menu-mobile-ns .navbar-type2-collapse').removeClass('in');
	$('body').removeClass('no-scroll-html');
	$('#mob-info-block').toggleClass('active');
	$('html').toggleClass('no-scroll-html');
});
$('#search-btn-mob').on('click', function() {
	$('#menu-mobile-ns .navbar-type2-collapse').removeClass('in');
	$('body').removeClass('no-scroll-html');
	$('#mob-search-block').slideToggle();
	$('html').toggleClass('no-scroll-html');
});
$(".mob-block-close").click(function(){
	$(".mob-block-fix").removeClass('active');
	$('html').removeClass('no-scroll-html');
});
</script>	
<?php } ?>
<?php if(isset($type_mobile_menu) && ($type_mobile_menu == 1) || (isset($main_menu_fix_mobile) && ($main_menu_fix_mobile == 1))) { ?>
<div class="page-no-scroll-bg"></div>
<div class="hidden-md hidden-lg">
	<nav id="menu-mobile-ns" class="<?php if(isset($type_mobile_menu) && ($type_mobile_menu == '1')){ ?>navmenu-fixed-left <?php } else { ?>menu-collapse-down<?php } ?>">
		<div <?php if(isset($type_mobile_menu) && ($type_mobile_menu == '0')){ ?>class="collapse navbar-collapse navbar-type2-collapse"<?php } ?>>
		  <ul class="nav navbar-nav">
			<?php if(isset($type_mobile_menu) && ($type_mobile_menu == '1')){ ?>
			<li class="fix-close-menu"><button class="close-menu" data-toggle="offcanvas"><?php echo $text_category; ?><i class="fa fa-close"></i></button></li>
			<?php } ?>
			<?php foreach ($items as $item) { ?>
				<li><a href="<?php echo $item['href']; ?>" rel="nofollow"><?php echo $item['name']; ?>
					<?php if ($item['children']) { ?><span class="show-sc-mobile" data-toggle="collapse"><i class="fa fa-plus plus"></i></span><?php } ?>
					<?php if(!empty($item['sticker_parent'])){?>
						<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
					<?php } ?>	
					</a>
					<?php if($item['type']=="html"){?>
						<div class="collapse mob-submenu-list">
							<div class="mob-html-block">				
								<?php echo html_entity_decode($item['html'][$lang_id], ENT_QUOTES, 'UTF-8'); ?>
							</div>
					   </div>	
					<?php } ?>
					<?php if(!empty($item['children']) && ($item['type']!='html')) { ?>
						<div class="collapse mob-submenu-list">
							<ul class="list-unstyled">
								<?php foreach ($item['children'] as $child) { ?>
									<li>
										<a href="<?php echo $child['href']; ?>" rel="nofollow"><?php echo $child['name']; ?>
											<?php if (!empty($child['children'])) { ?><span class="show-sc-mobile" data-toggle="collapse"><i class="fa fa-plus plus"></i></span><?php } ?>
										</a>
											<?php if (!empty($child['children'])) { ?>
												<div class="collapse mob-submenu-list-3lev">
													<ul class="list-unstyled">
														<?php foreach ($child['children'] as $subchild) { ?>
															<?php if($item['type']=="freelink"){ ?>
																<li><a href="<?php echo $subchild['link']; ?>"><?php echo $subchild['title']; ?></a></li>
															<?php } else { ?>
																<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>
															<?php } ?>
														<?php } ?>
													</ul>
												</div>
											<?php } ?>
									</li>
								<?php } ?>
							</ul>
						</div>
					<?php } ?>
					
				</li>
			<?php } ?>
			
		  </ul>
		</div>
	</nav>
</div>
<script><!--
$("#menu-mobile-ns .show-sc-mobile").click(function () {
	$(this).siblings(".collapsible").toggle();
	$(this).toggleClass("open-sc-mobile");
	$(this).parent().next().toggleClass("in");
});

$('[data-toggle="offcanvas"]').on('click', function(e) {
    $('#menu-mobile-ns.navmenu-fixed-left').toggleClass('active');
    $('body').toggleClass('modal-open');
	if ($("#menu-mobile-ns").hasClass('active') == true) {
	$(document).mouseup(function (e){ 
		var div = $("#menu-mobile-ns.active"); 
		if (!div.is(e.target) 
			&& div.has(e.target).length === 0) { 
			$('#menu-mobile-ns.navmenu-fixed-left').removeClass('active');
			$('body').removeClass('modal-open');
		}
	});
	}
});
--></script>
<?php } ?>
</div>