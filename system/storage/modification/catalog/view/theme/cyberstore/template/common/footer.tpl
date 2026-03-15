<footer>
<?php if(!empty($banner_items_footers)){?>
<div class="box-banner-container">
<div class="container">
<div class="row banner-footer">
	<?php foreach($banner_items_footers as $banner_items_footer) { ?>
	<div class="col-xs-12 col-sm-6 col-md-3">
		<div class="block-banner-footer  <?php if(($banner_items_footer['popup']=='1') && ($banner_items_footer['link']) || ($banner_items_footer['popup']=='0') && ($banner_items_footer['link'])){ ?>is_a_link<?php } ?>" <?php if(($banner_items_footer['popup']=='1') && ($banner_items_footer['link'])){ ?> onclick="banner_link_open('<?php echo $banner_items_footer['link']?>')"<?php } elseif(($banner_items_footer['popup']=='0') && ($banner_items_footer['link'])) { ?>onclick="location='<?php echo $banner_items_footer['link']; ?>'" <?php } ?>>
			<div class="icon-banner-footer">
				<span><i class="<?php echo $banner_items_footer['icon_image']?>"></i></span>
			</div>
			<div class="text-footer-banner">
				<div class="banner-title-footer"><?php echo $banner_items_footer['title'][$lang_id];?></div>
				<div class="banner-description-footer"><?php echo $banner_items_footer['description'][$lang_id];?></div>
			</div>
		</div>
	</div>
	<?php } ?>
</div>
</div>
</div>
<?php } ?>
<div class="footer-top">
<div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <div class="title-f"><?php if(isset($fcols['column_1'][$lang_id]['icon_image']) && ($fcols['column_1'][$lang_id]['icon_image'] !='')){ ?><i class="<?php echo $fcols['column_1'][$lang_id]['icon_image'];?>"></i> <?php } ?>
		<?php echo isset($fcols['column_1'][$lang_id]['name_column']) ? $fcols['column_1'][$lang_id]['name_column'] : ''; ?></div>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
		  <?php if(isset($fcols['link_contact'])){ ?><li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li><?php } ?>
		 
		  <?php if(isset($fcols['link_sitemap'])){ ?><li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li><?php } ?>
		  <?php if(isset($fcols['link_manufacturer'])){ ?><li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li><?php } ?>
		 
		  <?php if(isset($fcols['link_affiliate'])){ ?><li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li><?php } ?>
		  <?php if(isset($fcols['link_special'])){ ?><li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li><?php } ?>
		  <?php if ($footer_links) { ?>
				<?php foreach($footer_links as $result) { ?>
					<?php if($result['column_link'] == 4) { ?>
						<li><a href="<?php echo $result['link']; ?>"><?php echo $result['title']; ?></a></li>
					<?php } ?>
				<?php } ?>
			<?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
         <div class="title-f"><?php if(isset($fcols['column_2'][$lang_id]['icon_image']) && ($fcols['column_2'][$lang_id]['icon_image'] !='')){ ?><i class="<?php echo $fcols['column_2'][$lang_id]['icon_image'];?>"></i> <?php } ?>
		<?php echo isset($fcols['column_2'][$lang_id]['name_column']) ? $fcols['column_2'][$lang_id]['name_column'] : ''; ?></div>
        <ul class="list-unstyled">
			<?php if ($footer_links) { ?>
				<?php foreach($footer_links as $result) { ?>
					<?php if($result['column_link'] == 2) { ?>
						<li><a href="<?php echo $result['link']; ?>"><?php echo $result['title']; ?></a></li>
					<?php } ?>
				<?php } ?>
			<?php } ?>
        </ul>
      </div>
      <div class="col-sm-3">
        <div class="title-f"><?php if(isset($fcols['column_3'][$lang_id]['icon_image']) && ($fcols['column_3'][$lang_id]['icon_image'] !='')){ ?><i class="<?php echo $fcols['column_3'][$lang_id]['icon_image'];?>"></i> <?php } ?>
		<?php echo isset($fcols['column_3'][$lang_id]['name_column']) ? $fcols['column_3'][$lang_id]['name_column'] : ''; ?></div>
        <ul class="list-unstyled">
			<?php if(isset($fcols['link_account'])){ ?><li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li><?php } ?>
			<?php if(isset($fcols['link_order'])){ ?><li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li><?php } ?>
			<?php if(isset($fcols['link_wishlist'])){ ?><li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li><?php } ?>
			<?php if(isset($fcols['link_newsletter'])){ ?><li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li><?php } ?>
			<?php if(isset($fcols['link_return'])){ ?><li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li><?php } ?>
			 <?php if(isset($fcols['link_voucher'])){ ?><li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li><?php } ?>
			<?php if ($footer_links) { ?>
				<?php foreach($footer_links as $result) { ?>
					<?php if($result['column_link'] == 3) { ?>
						<li><a href="<?php echo $result['link']; ?>"><?php echo $result['title']; ?></a></li>
					<?php } ?>
				<?php } ?>
			<?php } ?>
        </ul>
		<?php if($social_footer) { ?>
		<div class="title-f"><?php echo $text_social_link; ?></div>
        <ul class="list-unstyled">
				<li>
				<?php foreach($social_footer as $rsf) { ?>
					<a <?php if(!empty($rsf['social_icon_footer'])){ ?> class="sficon" onmouseout="this.style.background=''" onMouseOver="this.style.background='<?php echo $rsf['bg_hover_icon'];?>'" <?php } ?> target="_blank" href="<?php if($rsf['social_link_footer']) { ?>//<?php echo $rsf['social_link_footer'];?><?php } else { ?>javascript:void(0);<?php } ?>">
					<?php if(!empty($rsf['social_icon_footer'])){?>
					<i class="<?php echo $rsf['social_icon_footer'];?>"></i>
					<?php } else { ?>
					<img src="<?php echo $rsf['ifs']; ?>" alt="" title="">
					<?php } ?>
					</a>
				<?php } ?>
				</li>
        </ul>
		<?php } ?>
      </div>
	  <div class="col-sm-3">
		<?php if(!empty($phones_footer)) { ?>
		<div class="title-f"><?php echo $text_contact_footer; ?></div>
		<?php } ?>
		<ul class="list-unstyled">
			<?php if($phones_footer) { ?>
				<?php foreach($phones_footer as $phone_footer) { ?>
					<?php if(!empty($phone_footer['type'])){ ?>
					<li><a <?php echo $phone_footer['type'];?>><i class="<?php echo $phone_footer['icon_footer_phone']; ?> fa-width"></i> <?php echo $phone_footer['phone_footer']; ?></a></li>
					<?php } else { ?>
					<li><i class="<?php echo $phone_footer['icon_footer_phone']; ?> fa-width"></i> <?php echo $phone_footer['phone_footer']; ?></li>
					<?php } ?>
				<?php } ?>
			<?php } ?>
		</ul>
		<div class="newsletter">

			<div class="title-f"><?php echo $text_subcribe; ?></div>
			<div class="input-group">
				<input type="text" class="form-control" id="input-newsletter" placeholder="<?php echo $text_placeholder_subcribe; ?>" value="" >
				<span class="input-group-btn igb-nl">
					<button id="subcribe" class="btn btn-newsletter" type="button"><i class="fa fa-send-o" aria-hidden="true"></i></button>
				</span>
			</div>
			<span id="error-msg"></span>
				
	   </div>
	   </div>
    </div>
  </div>
  </div>
<div class="fdesc_fmap">
<div class="container">
	<div class="row">
		<?php if($footer_desc_status){?>
		<div class="<?php if($footer_map_status == 'off'){?>col-md-12<?php } else { ?>col-md-6<?php } ?>">
		<?php echo html_entity_decode($description_store_footer[$lang_id]['config_description_store_footer'],ENT_QUOTES, 'UTF-8');?>
		</div>
		<?php } ?>
		<div class="<?php if($footer_desc_status){?>col-md-6<?php } else { ?>col-md-12<?php } ?>">
			<?php if($footer_map_status == 'codemap'){?><?php echo $code_map;?><?php } ?>
			<?php if($footer_map_status == 'gmap'){?>
			<div id="gmap_footer"></div>
<script src="//maps.google.com/maps/api/js?key=<?php echo $google_api_map_key;?>"></script>
<script async src="catalog/view/theme/cyberstore/js/markerclusterer.js"></script>
<script async src="catalog/view/theme/cyberstore/js/FullScreenControl.js"></script>
<script>
function initialize() {     
	var myLatlng = new google.maps.LatLng(<?php echo $center_google_map;?>);
	var myOptions = {
		zoom: <?php echo $zoom_google_map;?>,
		center: myLatlng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	var map = new google.maps.Map(document.getElementById("gmap_footer"), myOptions); 
	map.controls[google.maps.ControlPosition.TOP_RIGHT].push(FullScreenControl(map, '<span class="open-full-screen"><?php echo $gmap_full_screen;?></span>','<span class="normal-screen"><?php echo $gmap_normal_screen;?></span>'));
	var markers = []; 
	myPlaces = [];
	<?php foreach($gmap_setting as $gmap_new) { ?>
		myPlaces.push(new Place('<?php echo html_entity_decode($gmap_new['onelinetext'][$lang_id], ENT_QUOTES, 'UTF-8');?>', <?php echo $gmap_new['latlong'];?>, '<?php echo html_entity_decode($gmap_new['maptext'][$lang_id], ENT_QUOTES, 'UTF-8');?>'));
	<?php } ?>
for (var i = 0, n = myPlaces.length; i < n; i++) {
	var marker = new google.maps.Marker({    
    position: new google.maps.LatLng(myPlaces[i].latitude, myPlaces[i].longitude),
    map: map,
	title: myPlaces[i].name
});
	//Добавим попап, который будет появляться при клике на маркер
    var infowindow = new google.maps.InfoWindow({
        content: '<div class="title_popap_marker">' + myPlaces[i].name + '</div><div class="description_popap_marker">' + myPlaces[i].description + '</div>'
    });
    //привязываем попап к маркеру на карте
    makeInfoWindowEvent(map, infowindow, marker);	
  	
markers.push(marker);

    }	
markerClusterer = new MarkerClusterer(map, markers, { 
	maxZoom: 14,
	gridSize: 50,
	styles: null 
});    	
	

}
function makeInfoWindowEvent(map, infowindow, marker) {
    google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map, marker);
    });
}
function Place(name, latitude, longitude, description){
    this.name = name;
    this.latitude = latitude;  
    this.longitude = longitude;  
    this.description = description; 
}
google.maps.event.addDomListener(window, 'load', initialize);
</script>
			<?php } ?>
		</div>
	</div>
</div>
</div>
<div class="footer-copyright-payment">
<div class="container">
	<div class="row">
		<div class="col-sm-9 fpayment">
		<?php if($config_payments_footer) { ?>
        <ul class="list-unstyled">
			<?php foreach($config_payments_array_footer as $config_payments_footer) { ?>
			<li>
				<a target="_blank" href="<?php if($config_payments_footer['payments_link_footer']) { ?>//<?php echo $config_payments_footer['payments_link_footer']?><?php } else { ?>javascript:void(0);<?php } ?>"><img src="<?php echo $config_payments_footer['icon_footer_payments']; ?>" alt="" title=""></a>
			</li>
			<?php } ?>
        </ul>
		<?php } ?>
		</div>
		<div class="col-sm-3 fcopyright"><?php echo $powered_new; ?></div>
	</div>
</div>
<?php if(!empty($config_ns_footer_counters)){?>
<div class="container">
	<div class="row">
		<?php echo html_entity_decode($config_ns_footer_counters, ENT_QUOTES, 'UTF-8'); ?>
	</div>
</div>
<?php } ?>
</div>
</footer>

                <script>
                     function validateEmail($email) {
                        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
                        return emailReg.test( $email );
                      }
                    $(document).ready(function(){
                        $('#subcribe').click(function(){
                            var email = $('#input-newsletter').val();
                            if(email == ''){
                                var error = '<?php echo $text_empty_email;?>';
                            }
                            if( !validateEmail(email)) {
                                var error = '<?php echo $text_validate_email;?>';
                            }
                            if(error != null){
                                $('#error-msg').html('');
                                $('#error-msg').append('<b style=\"color:red\">' + error + '</b>');
                            } else {
                                var dataString = 'email='+ email;
                                $.ajax({
                                    url: 'index.php?route=common/footer/addToNewsletter',
                                    type: 'post',
                                    data: dataString,
									dataType: 'json',
                                    success: function(json) {
										if (json['warning']) {
											$('#error-msg').empty('');
											$('#input-newsletter').val('');	
											$('#error-msg').append('<b style=\"color:green\">' + json['warning'] + '</b>');
										}
										if (json['success']) {
											$('#error-msg').empty('');
											$('#input-newsletter').val('');											
											$('#error-msg').append('<b style=\"color:green\">' + json['success'] + '</b>');
										}
										
                                    }
                                    
                                });
                            }
                            
                        })
                    });
                </script>
                

				<?php if (isset($agreedata) && $agreedata['status'] != 0) { ?>
				<script>
				$(function() {
				<?php $delay_time = isset($agreedata['delay_time']) ? $agreedata['delay_time'] : '1000'; ?>
				<?php if (!isset($_COOKIE['PopupAgree'])) { ?>
					setTimeout(function(){
						ShowAgree();
					}, <?php echo $delay_time; ?>);
				<?php } ?>
				});
				var loading_masked_img = '<img src="catalog/view/theme/cyberstore/image/ring-alt-1.svg" />';
				function loading_agree(action) {
					if (action) {
						$('#loading_agree').html(loading_masked_img);
						$('#loading_agree').show();
					} else {
						$('#loading_agree').html('');
						$('#loading_agree').hide();
					}
				}
				function ShowAgree() {
					$('body').prepend('<div id="loading_agree"></div>');
					loading_agree(true); 
					$('body').append('<div class="popup_agree"></div>');
					$('.popup_agree').popup({
						transition: 'all 0.3s',
						escape: <?php if($agreedata['escape_click']=='1') { ?> true <?php } else { ?> false <?php } ?>,
						blur: <?php if($agreedata['blur_click']=='1') { ?> true <?php } else { ?> false <?php } ?>,
						closetransitionend: function () {$(this).remove();}
					});
					$('.popup_agree').load('index.php?route=extension/module/cyber_agree_popup', function() {
						loading_agree(false); 
						$('.popup_agree').popup('show');
					});
				}
				</script>
				<?php } ?>
			
<script><!--
function price_format(n){
	c = <?php echo (empty($currency['decimals']) ? "0" : $currency['decimals'] ); ?>;
	d = '<?php echo $currency['decimal_point']; ?>';
	t = '<?php echo $currency['thousand_point']; ?>';
	s_left = '<?php echo $currency['symbol_left']; ?>';
	s_right = '<?php echo $currency['symbol_right']; ?>';
	n = n * <?php echo $currency['value']; ?>;
	i = parseInt(n = Math.abs(n).toFixed(c)) + '';
	j = ((j = i.length) > 3) ? j % 3 : 0;
	return s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right;
}
//--></script>

<?php if(isset($callbackpro['status_animate_btn_4'])){ ?>
<div onclick="get_modal_callbacking();" id="animate_btn_4" class="animate_btn_4">
	<div class="ab4-circlephone"></div>
	<div class="ab4-circle-fill"></div>
	<div class="ab4-img-circle"><div class="ab4-img-circleblock"></div></div>
</div>
<?php } ?>
<?php if(isset($callbackpro['status_animate_btn_3'])){ ?>
<div onclick="get_modal_callbacking();" id="animate_btn_3" class="animate_btn_3">
    <div class="ab3-track"></div>
    <div class="ab3-back-circle"></div>
    <div class="ab3-circle">
        <div class="ab3-handset"></div>
    </div>
</div>
<?php } ?>
<?php if(isset($callbackpro['status_animate_btn_2'])){ ?>
<div onclick="get_modal_callbacking();" id="tcb-call">
	<div class="tcb-phone">
		<div class="tcb-phone-img"></div>
	</div>
	<div class="tcb-layout1"></div>
	<div class="tcb-layout2"></div>
	<div class="tcb-layout3"></div>
</div>
<?php } ?>
<?php if(isset($callbackpro['status_animate_btn_1'])){ ?>
<div onclick="get_modal_callbacking();" id="tcb_call_1">
	<div class="tcb_phone_1">
		<div class="tcb_phone_img_1"></div>
	</div>
	<div class="tcb_layout_1"></div>
	<div class="tcb_layout_2"></div>
</div>
<?php } ?>
<?php if(isset($callbackpro['config_right_callback_position_fixed'])){ ?>
<div onclick="get_modal_callbacking();" id="callback"  class="callback-view"><div><img src="catalog/view/theme/cyberstore/image/callback.png"/></div></div>
<?php } ?>
<script>	
function get_modal_callbacking() {		
		$.magnificPopup.open({
            tLoading: loading_masked_img,
            items: {
              src: 'index.php?route=extension/module/cyber_callback',
              type: 'ajax'
            },
          });
	}
</script>
<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/68a21f6bde72a619257fef72/1j2sklffi';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<style>
#spec-tool {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
  overflow: hidden;
  z-index:99;
}

.snowflake {
  position: absolute;
  top: -30px; /* старт сверху */
  color: rgb(142, 192, 249);
  opacity: 0.9;
  user-select: none;
  animation-timing-function: linear;
}

/* Анимация падения — через изменение top */
@keyframes fall {
  to {
    top: 100vh;
    opacity: 0;
  }
}

/* Анимация раскачивания (только transform) */
@keyframes sway {
  0%   { transform: translateX(0); }
  50%  { transform: translateX(25px); }
  100% { transform: translateX(0); }
}

</style>
<script>
    function createSnowflake() {
      const snow = document.getElementById('spec-tool');
      const flake = document.createElement('div');
      flake.className = 'snowflake';
      flake.textContent = '❄';
    
      // случайная позиция и размер
      flake.style.left = Math.random() * window.innerWidth + 'px';
      flake.style.fontSize = (10 + Math.random() * 20) + "px";
    
      const fallDuration = 5 + Math.random() * 6;     // скорость падения
      const swayDuration = 2 + Math.random() * 3;     // скорость раскачивания
    
      flake.style.animation = 
        `fall ${fallDuration}s linear forwards, sway ${swayDuration}s ease-in-out infinite`;
    
      snow.appendChild(flake);
    
      // удалить после падения
      setTimeout(() => flake.remove(), fallDuration * 1000);
    }
    
    // каждые 150 мс — новая снежинка
    //setInterval(createSnowflake, 150);
    </script>
<!--End of Tawk.to Script-->
			
</body></html>