<div id="popup-agree">
	<div class="agree-header"><h1><?php if($agreedata['icon_agree_header'] !='') { ?><i class="<?php echo $agreedata['icon_agree_header']?> fa-fw"></i><?php } ?><?php echo isset($agreedata['title_agree'][$lang_id]) ? $agreedata['title_agree'][$lang_id]['text'] : ''; ?></h1></div>	
	<div class="agree-content">
		<div class="description_agree"><?php echo html_entity_decode($agreedata[$lang_id]['agree_description'],ENT_QUOTES, 'UTF-8');?></div>
	</div>
	<?php if($agreedata['status_btn_agree'] || ($agreedata['status_btn_disagree'])) { ?>
	<div class="agree-footer">
		<div class="text-right">
			<?php if($agreedata['status_btn_disagree']){ ?>
				<button onclick="location.href='<?php echo isset($agreedata['btn_disagree_location_href']) ? $agreedata['btn_disagree_location_href'] : ''; ?>'" class="btn-agree-disagree btn-disagree" type="button"><?php if($agreedata['icon_btn_disagree'] !='') { ?><i class="<?php echo $agreedata['icon_btn_disagree']?> fa-fw"></i><?php } ?><?php echo isset($agreedata['btn_disagree'][$lang_id]) ? $agreedata['btn_disagree'][$lang_id]['text'] : ''; ?></button>
			<?php } ?>
			<?php if($agreedata['status_btn_agree']){ ?>
				<button onclick="saveCookieAgree();" class="btn-agree-disagree btn-agree" type="button"><?php if($agreedata['icon_btn_agree'] !='') { ?><i class="<?php echo $agreedata['icon_btn_agree']?> fa-fw"></i><?php } ?><?php echo isset($agreedata['btn_agree'][$lang_id]) ? $agreedata['btn_agree'][$lang_id]['text'] : ''; ?></button>
			<?php } ?>
		</div>
	</div>
	<?php } ?>
<script>
function saveCookieAgree() {   
	$.ajax({
        type: 'get',
        url:  'index.php?route=extension/module/cyber_agree_popup/saveAgreeCookie&saveAgreeCookie=<?php echo isset($agreedata['cookie_day']) ? $agreedata['cookie_day'] : '1'; ?>'
    });
	$('.popup_agree').popup('hide');
}
</script>
</div>
<style>
	<?php if($agreedata['background_agree_header'] !=''){ ?>
		#popup-agree .agree-header { background:<?php echo $agreedata['background_agree_header']?>;}
	<?php } ?>
	<?php if($agreedata['text_color_agree_header'] !=''){ ?>
		#popup-agree .agree-header h1 { color:<?php echo $agreedata['text_color_agree_header']?>;}
	<?php } ?>
	
	<?php if($agreedata['background_btn_disagree'] !=''){ ?>
		#popup-agree .btn-disagree { background:<?php echo $agreedata['background_btn_disagree']?>;}
	<?php } ?>
	<?php if($agreedata['background_hover_btn_disagree'] !=''){ ?>
		#popup-agree .btn-disagree:hover { background:<?php echo $agreedata['background_hover_btn_disagree']?>;}
	<?php } ?>
	<?php if($agreedata['border_btn_disagree'] !=''){ ?>
		#popup-agree .btn-disagree { border-color:<?php echo $agreedata['border_btn_disagree']?>;}
	<?php } ?>
	<?php if($agreedata['border_hover_btn_disagree'] !=''){ ?>
		#popup-agree .btn-disagree:hover { border-color:<?php echo $agreedata['border_hover_btn_disagree']?>;}
	<?php } ?>
	<?php if($agreedata['text_color_btn_disagree'] !=''){ ?>
		#popup-agree .btn-disagree { color:<?php echo $agreedata['text_color_btn_disagree']?>;}
	<?php } ?>
	<?php if($agreedata['text_color_hover_btn_disagree'] !=''){ ?>
		#popup-agree .btn-disagree:hover { color:<?php echo $agreedata['text_color_hover_btn_disagree']?>;}
	<?php } ?>
	
	
	<?php if($agreedata['background_btn_agree'] !=''){ ?>
		#popup-agree .btn-agree { background:<?php echo $agreedata['background_btn_agree']?>;}
	<?php } ?>
	<?php if($agreedata['background_hover_btn_agree'] !=''){ ?>
		#popup-agree .btn-agree:hover { background:<?php echo $agreedata['background_hover_btn_agree']?>;}
	<?php } ?>
	<?php if($agreedata['border_btn_agree'] !=''){ ?>
		#popup-agree .btn-agree {border-color:<?php echo $agreedata['border_btn_agree']?>;}
	<?php } ?>
	<?php if($agreedata['border_hover_btn_agree'] !=''){ ?>
		#popup-agree .btn-agree:hover {border-color:<?php echo $agreedata['border_hover_btn_agree']?>;}
	<?php } ?>
	<?php if($agreedata['text_color_btn_agree'] !=''){ ?>
		#popup-agree .btn-agree { color:<?php echo $agreedata['text_color_btn_agree']?>;}
	<?php } ?>
	<?php if($agreedata['text_color_hover_btn_agree'] !=''){ ?>
		#popup-agree .btn-agree:hover { color:<?php echo $agreedata['text_color_hover_btn_agree']?>;}
	<?php } ?>
	<?php if($agreedata['background_agree_footer'] !=''){ ?>
		#popup-agree .agree-footer { background:<?php echo $agreedata['background_agree_footer']?>;}
	<?php } ?>
</style>

