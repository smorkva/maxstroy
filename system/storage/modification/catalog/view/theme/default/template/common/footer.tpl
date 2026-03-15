<footer>
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
    <p><?php echo $powered; ?></p>
  </div>
</footer>

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
			

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->


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
			
</body></html>