<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $home_page; ?>" />
<meta property="og:image" content="<?php echo !empty($og_image) ? $og_image : $logo; ?>" />
<meta property="og:site_name" content="<?php echo $name; ?>" />
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="preload" as="style" />
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<?php echo $csscyberstore ;?>
<?php if($minifycss){?>
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php } ?>
<?php if ($config_ns_themes_custom_bg_mode !='off') { ?>
	<?php if ($config_themes_custom_bg_img_preview) { ?>
		<style>.content-box-cs {background: #fff;-webkit-box-shadow: 0px 0px 2px rgba(0,0,0,0.15);box-shadow: 0px 0px 2px rgba(0,0,0,0.15);padding-top:10px;padding-bottom:10px;margin-top:7px;border-radius:2px;}.mtopm10 {margin-top:-10px;}
		body {background:url('image/<?php echo $config_themes_custom_bg_img_preview; ?>')<?php if ($config_themes_custom_bg_repeat) { echo $config_themes_custom_bg_repeat; } ?> <?php if ($config_themes_custom_bg_attachment) { echo $config_themes_custom_bg_attachment; } ?> <?php if ($config_themes_custom_bg_position) { echo $config_themes_custom_bg_position; } ?>;}</style>
	<?php } ?>
	<?php if($config_ns_themes_custom_bg_mode_color !='') { ?>  
		<style>.content-box-cs {background: #fff;-webkit-box-shadow: 0px 0px 2px rgba(0,0,0,0.15);box-shadow: 0px 0px 2px rgba(0,0,0,0.15);padding-top:10px;padding-bottom:10px;margin-top:7px;border-radius:2px;}.mtopm10 {margin-top:-10px;}
		body {background-color: <?php echo $config_ns_themes_custom_bg_mode_color; ?>;}</style>
	<?php } ?>
<?php } else { ?>
<style>.content-box-cs {padding-left:0px;padding-right:0px;}</style>
<?php } ?>
<?php if ($config_on_off_shopping_cart_hover =='1') { ?>
<style>
#cart:hover .dropdown-menu{display:block;}
</style>
<?php } ?>
<?php if (isset($nst_data['header_bg_mode']) && ($nst_data['header_bg_mode'] == '1')){ ?>
	<?php if ($nst_data['header_bg_img']) { ?>
		<style>header {background:url('image/<?php echo $nst_data['header_bg_img']; ?>')<?php if ($nst_data['header_bg_repeat']) { echo $nst_data['header_bg_repeat']; } ?> <?php if ($nst_data['header_bg_position']) { echo $nst_data['header_bg_position']; } ?>;}</style>
	<?php } ?>
<?php } elseif(isset($nst_data['header_bg_mode']) && ($nst_data['header_bg_mode'] == '0')){?>
	<?php if($nst_data['header_bg_mode_color'] !='') { ?>  
		<style>header {background-color: <?php echo $nst_data['header_bg_mode_color']; ?>;}</style>
	<?php } ?>
<?php } ?>
<?php if(isset($nst_data['defaut_display_view'])){?>
<script>
if (localStorage.getItem('display') === null) {
localStorage.setItem('display', '<?php echo $nst_data['defaut_display_view'];?>');
}
</script>
<?php } ?>
<?php if(isset($site_screen_width) && ($site_screen_width == 2)){?>
<style>
@media (min-width: 1330px){
	.container{width:1300px;}
}
</style>
<?php } elseif(isset($site_screen_width) && ($site_screen_width == 3)) { ?>
<style>
header.pad-top{
    background-size: cover;
    background-position: center bottom;
}
#phone .contact-header, .glass{
    background: #ffffff82;
    padding: 0 10px;
    border-radius: 14px;
    box-shadow: 0 0 2px white;
}
@media (min-width: 1500px){
	.container{width:1470px;}
	header .col-md-3.logo-top {width:20%;}
	header .col-md-3.menu-box {width:20%;}	
	.breadcrumb.col-lg-offset-3, .breadcrumb.col-md-offset-3 {margin-left: 20.4%;}
	.container .sw-80 {width: 80%;}
	.container .sw-20 {width: 20%;}
	#content.col-md-9 {width: 80%;}	
	#column-left.col-md-3,#column-right.col-md-3{ width:20%;}
}
</style>
<?php } ?>
<style>
.product-grid.grid4.col-1 .actions .cart .btn-general {
	padding:5px 6px;
}
.product-grid.grid4.col-1 .actions .cart i {
	display:none;
}
.product-grid.grid4.col-lg-1-5 .actions .cart .btn-general {
	padding:5px 6px;
}
.product-grid.grid4.col-lg-1-5 .actions .cart i {
	display:none;
}
<?php if(!isset($status_border_radius) || ($status_border_radius =='0')) { ?>
* {border-radius:0px !important;}
<?php } ?>
<?php if(isset($setting_module['mobile_qrp']) && ($setting_module['mobile_qrp'] =='1')) { ?>
@media (max-width: 768px) {
.product-thumb .actions div.cart .btn span {
display:none;
}
.product-thumb .actions div.cart .btn i.fa-lock {width:18px;}
}
<?php } ?>
<?php if(!empty($config_change_color_icon_sticker_popular)){?>.sticker-ns.popular .fa{ color:<?php echo $config_change_color_icon_sticker_popular;?> }<?php } ?>
<?php if(!empty($config_change_background_sticker_popular)){?>.sticker-ns.popular{background: <?php echo $config_change_background_sticker_popular;?>;}	<?php } ?>	
<?php if(!empty($config_change_color_text_sticker_popular)){?>.sticker-ns.popular{color:<?php echo $config_change_color_text_sticker_popular;?>; }<?php } ?>
<?php if(!empty($config_change_color_icon_sticker_special)){?>.sticker-ns.special .fa{ color:<?php echo $config_change_color_icon_sticker_special;?> }<?php } ?>
<?php if(!empty($config_change_color_text_sticker_special)){?>.sticker-ns.special { color:<?php echo $config_change_color_text_sticker_special;?>; }<?php } ?>
<?php if(!empty($config_change_background_sticker_special)){?>.sticker-ns.special { background: <?php echo $config_change_background_sticker_special;?>;}<?php } ?>
<?php if(!empty($config_change_color_icon_sticker_topbestseller)){?>.sticker-ns.bestseller .fa{ color:<?php echo $config_change_color_icon_sticker_topbestseller;?> }<?php } ?>
<?php if(!empty($config_change_color_text_sticker_topbestseller)){?>.sticker-ns.bestseller { color:<?php echo $config_change_color_text_sticker_topbestseller;?>; }<?php } ?>
<?php if(!empty($config_change_background_sticker_topbestseller)){?>.sticker-ns.bestseller { background: <?php echo $config_change_background_sticker_topbestseller;?>;}<?php } ?>
<?php if(!empty($config_change_color_icon_sticker_newproduct)){?>.sticker-ns.newproduct .fa{ color:<?php echo $config_change_color_icon_sticker_newproduct;?> }<?php } ?>
<?php if(!empty($config_change_color_text_sticker_newproduct)){?>.sticker-ns.newproduct{ color:<?php echo $config_change_color_text_sticker_newproduct;?>; }<?php } ?>
<?php if(!empty($config_change_background_sticker_newproduct)){?>.sticker-ns.newproduct{ background: <?php echo $config_change_background_sticker_newproduct;?>;}<?php } ?>
<?php if(isset($cs_type_btn) && ($cs_type_btn == 2)){ ?>
@media (min-width: 992px) {
.product-thumb .actions{
	position:absolute !important;
	left:5px;
	right:5px;
}
.product-thumb .caption {
	margin-bottom:0px !important;
	padding-bottom:3px !important;
}
.product-thumb:hover > .caption {
	background:rgba(255,255,255,0.85)
}
.product-thumb:hover > .caption {
	margin-top:-44px;
	padding-bottom:47px !important;
	margin-bottom:0px;
}
.product-list .product-thumb .actions {
	bottom:-60px;
	transition:all 150ms ease;
}
.product-list .product-thumb:hover .actions {
	bottom:0px;
}
.product-thumb:hover > .actions {
	bottom:5px;
}
.row_items .product-thumb:hover > .caption{
margin-top:0px !important;
padding-bottom:0px !important;
}
.row_items .product-thumb:hover > .actions {
	bottom:0px !important;
}
}
<?php } ?>
<?php if(isset($item_setting['prod_name_align']) && ($item_setting['prod_name_align'] == 2)){?>.product-thumb .product-name {text-align:left;}<?php } ?>
<?php if(isset($item_setting['model_align']) && ($item_setting['model_align'] == 2)){?>.product-thumb .product-model {text-align:left;}<?php } ?>
<?php if(isset($item_setting['rating_align']) && ($item_setting['rating_align'] == 2)){?>.product-thumb .rating {text-align:left;} .product-thumb .rating .rating-box{padding-left:0px;}<?php } ?>
<?php if(isset($item_setting['reverse_btn']) && ($item_setting['reverse_btn'] == 1)){?>.product-thumb .actions {flex-direction: row-reverse;}<?php } ?>
<?php if(isset($item_setting['title_mod']) && ($item_setting['title_mod'] == 2)){?>
.container-module .title-module, .container-module-productany .title-module, .categorywall-container .title-module{text-align:center;}
.container-module .title-module span, .container-module-productany .title-module span, .categorywall-container .title-module span {padding-right:0px;}
.container-module .title-module:after, .container-module-productany .title-module:after, .categorywall-container .title-module:after {left: calc(50% - 75px);width: 150px;}
<?php } ?>
</style>
<?php if (isset($nst_data['page_mobile_qrp']) && ($nst_data['page_mobile_qrp'] == '1')){ ?>
<?php if(deviceType == 'phone'){ ?>
<script>localStorage.setItem('display', 'grid');</script>
<style>@media (max-width: 768px) {.category-page {margin-left:-5px; margin-right:-5px;}.category-page .product-grid {width:50%;float:left;padding-right:5px;padding-left:5px;}}</style>
<?php } ?>
<?php } ?>
<?php echo $jscyberstore; ?>
<?php if($minifyjs){?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>"></script>
<?php } ?>
<?php } ?>
<script>
function init(elem, options){
elem.addClass('countdownHolder');
$.each(['Days','Hours','Minutes','Sec'],function(i){
var clas;
if (this=='Days') {clas="<?php echo $days; ?>";}
if (this=='Hours') {clas="<?php echo $hours; ?>";}
if (this=='Minutes') {clas="<?php echo $minutes; ?>";}
if (this=='Sec') {clas="<?php echo $sec; ?>";}
out_timer = "";
out_timer += '<span class="count'+this+'">';
out_timer += '<span class="num-time">';
out_timer += '<span class="position"><span class="digit static">0</span></span>';
out_timer += '<span class="position"><span class="digit static">0</span></span>';
out_timer += '</span>';
out_timer += '<span class="time_productany">'+clas+'</span>';
out_timer += '</span>';
$(out_timer).appendTo(elem);	
});
}
var button_shopping = "<?php echo $button_shopping; ?>";
var button_checkout = "<?php echo $button_checkout; ?>";
var link_checkout = "<?php echo $checkout; ?>";
var link_onepcheckout = "<?php echo $onepcheckout; ?>";
var text_showmore = '<?php echo $text_showmore?>';
var color_schem = '<?php echo $color_schem?>';
var loading_masked_img = '<img src="catalog/view/theme/cyberstore/image/ring-alt-'+ color_schem +'.svg" />';
function loading_masked(action) {
if (action) {
$('.loading_masked').html(loading_masked_img);
$('.loading_masked').show();
} else {
$('.loading_masked').html('');
$('.loading_masked').hide();
}
}
function creatOverlayLoadPage(action) {
if (action) {
$('#messageLoadPage').html(loading_masked_img);
$('#messageLoadPage').show();
} else {
$('#messageLoadPage').html('');
$('#messageLoadPage').hide();
}
}
</script>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">
    <div id="spec-tool"></div>
<p id="back-top"><a rel="nofollow" class="btn btn-scroll-top" href="#top"><i class="fa fa-long-arrow-up" aria-hidden="true"></i></a></p>
<nav id="top" <?php if(isset($main_menu_fix_mobile) && ($main_menu_fix_mobile == 1)) { ?>class="hidden-xs hidden-sm"<?php } ?>>
  <div class="container">
  <div class="row">
  <?php if(!empty($header_nav_menu_links)) { ?>
	<div class="pull-left">
		<div class="btn-group box-question">
			<button data-toggle="dropdown" type="button" class="visible-xs visible-sm btn btn-link"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></button>
			<ul class="dropdown-menu dropdown-menu-left header-nav-links">
				<?php foreach($header_nav_menu_links as $header_nav_menu_link) { ?>
					<li><button <?php if(($header_nav_menu_link['popup']=='1') && ($header_nav_menu_link['link'] !='')){ ?> onclick="$('.side-collapse').toggleClass('in'); banner_link_open('<?php echo $header_nav_menu_link['link']; ?>')" <?php } elseif(($header_nav_menu_link['popup']=='0') && ($header_nav_menu_link['link'] !='')) { ?>onclick="location='<?php echo $header_nav_menu_link['link']; ?>'" <?php } ?> type="button" class="btn btn-link"><?php if(!empty($header_nav_menu_link['icon_image'])){?><i class="<?php echo $header_nav_menu_link['icon_image'];?>"></i> <?php } ?><?php echo $header_nav_menu_link['title'][$lang_id]; ?></button></li>						
				<?php  } ?>
			</ul>
		</div>		
	</div>
	<?php } ?>
	<div class="pull-right">	
		<div class="pull-right btn-group box-account">
				<button data-toggle="dropdown" type="button" class="dropdown-toggle btn btn-link">
				<i class="fa fa-user-circle-o"></i>
				<?php if ($logged) { ?>
				<?php echo '<b>'.$first_name.' '.$last_name.'</b>';?>
				<?php } else { ?>
				<span class="hidden-xs hidden-sm"><?php echo $text_account; ?></span> <span class="caret"></span>		
				<?php } ?>
				</button>
			<ul class="dropdown-menu dropdown-menu-right">
				<?php if ($logged) { ?>
				<li><a rel="nofollow" href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				<li><a rel="nofollow" href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				<li><a rel="nofollow" href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
				<li><a rel="nofollow" href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
				<li><a rel="nofollow" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
				<?php } else { ?>
				<li><a rel="nofollow" href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
				<li><a rel="nofollow" href="javascript:void(0)" id="login-popup" data-load-url="index.php?route=common/login_modal"><?php echo $text_login; ?></a></li>
				<?php } ?>
			</ul>
		</div>
		<div class="pull-right box-currency"><?php echo $currency; ?></div>
		<div class="pull-right box-language"><?php echo $language; ?></div>
	</div>
  </div>
  </div>
</nav>
<header <?php if(isset($main_menu_fix_mobile) && ($main_menu_fix_mobile == 1)) { ?>class="pad-top"<?php } ?>>
  <div class="container h-box">
    <div class="row-flex vertical-align">
		<div class="<?php if(isset($main_menu_fix_mobile) && ($main_menu_fix_mobile == 1)) { ?>col-xs-6 col-sm-6<?php } else { ?>col-xs-12 col-sm-4 col-sm-push-4 col-md-push-0<?php } ?> col-md-3 logo-top">
			<div class="m-fix-btn"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
			<div id="logo">
			<?php if ($logo) { ?>
				<?php if ($home == $home_page) { ?>
				  <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
				<?php } else { ?>
				  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
				<?php } ?>
			  <?php } else { ?>
				<h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
			  <?php } ?>
			</div>
		</div>
		<div class="phone-box- col-xs-6 <?php if(isset($main_menu_fix_mobile) && ($main_menu_fix_mobile == 1)) { ?>col-sm-6 text-xs-right text-sm-right<?php } else { ?>col-sm-4 col-sm-pull-4 col-md-pull-0 text-xs-left text-sm-left text-md-center<?php } ?> col-md-3 col-lg-2 <?php if(isset($swap_header_blocks) && ($swap_header_blocks =='1')){?>col-md-push-4 col-lg-push-5<?php } ?> text-md-left">
			<div id="phone">
				<div class="contact-header">
					<div class="dropdown-toggle">
						<?php foreach($config_phones_array as $result_hp) { ?>
							<div class="additional-tel dth">
							<?php if(!empty($result_hp['type'])){?>
								<a <?php echo $result_hp['type']?>>
								<?php if($result_hp['icon_phone'] !=''){ ?>
									<div class="icon-image"><img src="<?php echo $result_hp['icon_phone'];?>" alt="<?php echo $result_hp['phone'];?>" /></div>
									<?php } elseif($result_hp['icon'] !=''){ ?>
									<div class="icon-image"><i class="<?php echo $result_hp['icon'];?>"></i></div>	
								<?php } ?>
								<?php echo $result_hp['phone']?></a>
							<?php } else { ?>
								<?php if($result_hp['icon_phone'] !=''){ ?>
									<div class="icon-image"><img src="<?php echo $result_hp['icon_phone'];?>" alt="<?php echo $result_hp['phone'];?>" /></div>
									<?php } elseif($result_hp['icon'] !=''){ ?>
									<div class="icon-image"><i class="<?php echo $result_hp['icon'];?>"></i></div>	
								<?php } ?>
								<?php echo $result_hp['phone']?>
							<?php } ?>
							</div>
						<?php } ?>
						<?php if(!empty($header_phones_dropdown) || $arbitrary_text[$lang_id]['text']) { ?>	
							<span class="drop-icon-info"><i class="car-down fa fa-angle-down"></i></span>
						<?php } ?>			
					</div>	
					<?php if(!empty($header_phones_dropdown) || $arbitrary_text[$lang_id]['text']) { ?>	
					<ul class="dropdown-menu drop-contacts">
						<?php if(isset($arbitrary_text[$lang_id]['text']) && (!empty($arbitrary_text[$lang_id]['text']))){ ?>
						<li class="info-contact">
							<?php echo html_entity_decode($arbitrary_text[$lang_id]['text'], ENT_QUOTES, 'UTF-8');?>
						</li>
						<li class="line-contact"></li>
						<?php } ?>
						<?php if(!empty($header_phones_dropdown)) { ?>
							<?php foreach($header_phones_dropdown as $result_ddh) { ?>
								<li>
								<?php if(!empty($result_ddh['type'])){?>
									<a <?php echo $result_ddh['type']?>>
										<?php if($result_ddh['icon_phone'] !=''){ ?>
										<div class="icon-image"><img src="<?php echo $result_ddh['icon_phone'];?>" alt="<?php echo $result_ddh['phone'];?>" /></div>
										<?php } elseif($result_ddh['icon'] !=''){ ?>
										<div class="icon-image"><i class="<?php echo $result_ddh['icon'];?>"></i></div>	
										<?php } ?>
										<?php echo html_entity_decode($result_ddh['phone'], ENT_QUOTES, 'UTF-8');?>
									</a>
									<?php } else { ?>
										<div>
										<?php if($result_ddh['icon_phone'] !=''){ ?>
											<div class="icon-image"><img src="<?php echo $result_ddh['icon_phone'];?>" alt="<?php echo $result_ddh['phone'];?>" /></div>
											<?php } elseif($result_ddh['icon'] !=''){ ?>
											<div class="icon-image"><i class="<?php echo $result_ddh['icon'];?>"></i></div>	
											<?php } ?>
											<?php echo html_entity_decode($result_ddh['phone'], ENT_QUOTES, 'UTF-8');?>
										</div>
									<?php } ?>
								</li>
							<?php } ?>
						<?php } ?>
					</ul>
					<?php } ?>
					<div class="text_after_phone"><?php echo $text_after_phone;?></div>	
				</div>
			</div>
		</div>
		<div class="box-search hidden-sm hidden-xs col-xs-12 col-sm-8 col-md-4 col-lg-5 <?php if(isset($swap_header_blocks) && ($swap_header_blocks =='1')){?> col-md-pull-3 col-lg-pull-2<?php } ?> search-top"><?php echo $search; ?></div>
		<div class="glass box-cart <?php if(isset($main_menu_fix_mobile) && ($main_menu_fix_mobile == 1)) { ?>hidden-xs hidden-sm<?php } ?> col-xs-6 col-sm-4 col-md-2 col-lg-2" style="width: unset;    margin: 12px 0;">
			<?php if(isset($show_h_compare) && ($show_h_compare == 1)){?>
				<div class="compare-h">
					<a rel="nofollow" class="btn btn-compare-h" href="<?php echo $compare; ?>"  id="compare-total" title="<?php echo $text_compare; ?>">
					<i class="fa fa-retweet" aria-hidden="true"></i><span><?php if($total_compare > 0){?><?php echo $total_compare;?><?php } ?></span></a>
				</div>
			<?php } ?>
			<?php if(isset($show_h_wishlist) && ($show_h_wishlist == 1)){?>
			<div class="wishlist-h">
				<a rel="nofollow" class="btn btn-wishlist-h" href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>">
				<i class="fa fa-heart-o" aria-hidden="true"></i><span><?php if($total_wishlist > 0){?><?php echo $total_wishlist;?><?php } ?></span></a>
			</div>
			<?php } ?>
		<?php echo $cart; ?>
		</div>
	</div>  
  </div>
	<?php if($megamenu_status){ ?>	
		<?php echo $menuvh;?>
	<?php } ?>
</header>