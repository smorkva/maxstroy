<div id="popup-found-cheaper">
  <div class="popup-heading"><?php echo isset($fcpdata['title_popup_found_cheaper'][$lang_id]) ? $fcpdata['title_popup_found_cheaper'][$lang_id]['text'] : ''; ?></div>
	<?php if($fcpdata['found_cheaper_info_text'][$lang_id]){?>
	<div class="info-text-found-cheaper">
		<?php echo isset($fcpdata['found_cheaper_info_text'][$lang_id]) ? html_entity_decode($fcpdata['found_cheaper_info_text'][$lang_id]['text'],ENT_QUOTES, 'UTF-8') : ''; ?>   
	</div>
	<?php } ?>
  <div class="popup-center">
	<form method="post" class="form-horizontal" enctype="multipart/form-data" id="form-found-cheaper">
	   <?php if ($fcpdata['name_field']) { ?>
		<div class="marb <?php echo $fcpdata['name_field_required'] == '1' ? 'sections_block_rquaired' : 'sections_block' ; ?>">
			<div class="input-group margin-bottom-sm">			
				<input id="contact-name" class="form-control contact-name" type="text" placeholder="<?php echo isset($fcpdata['name_field_placeholder'][$lang_id]) ? $fcpdata['name_field_placeholder'][$lang_id]['text'] : ''; ?>" value="<?php echo $name_field;?>" name="name_field">		
				<span class="input-group-addon"><i class="icon-append-1 fa fa-user fa-fw"></i></span>
			</div>
		</div>
		<?php } ?>
		<?php if ($fcpdata['telephone_field']) { ?>
		<div class="marb <?php echo $fcpdata['telephone_field_required'] == '1' ? 'sections_block_rquaired' : 'sections_block' ; ?>">
			<div class="input-group margin-bottom-sm">			
				<input id="contact-telephone" class="form-control contact-telephone" type="text" placeholder="<?php echo isset($fcpdata['telephone_field_placeholder'][$lang_id]) ? $fcpdata['telephone_field_placeholder'][$lang_id]['text'] : ''; ?>" value="<?php echo $telephone_field;?>" name="telephone_field">		
				<span class="input-group-addon"><i class="icon-append-1 fa fa-phone-square fa-fw"></i></span>
			</div>
		</div>
		<?php } ?>
		<?php if ($fcpdata['email_field']) { ?>
		<div class="marb <?php echo $fcpdata['email_field_required'] == '1' ? 'sections_block_rquaired' : 'sections_block' ; ?>">
			<div class="input-group margin-bottom-sm">			
				<input id="contact-email" class="form-control contact-email" type="text" placeholder="<?php echo isset($fcpdata['email_field_placeholder'][$lang_id]) ? $fcpdata['email_field_placeholder'][$lang_id]['text'] : ''; ?>" value="<?php echo $email_field;?>" name="email_field">		
				<span class="input-group-addon"><i class="icon-append-1 fa fa-envelope-o fa-fw"></i></span>
			</div>			
		</div>
		<?php } ?>
       <?php if ($fcpdata['link_field']) { ?>
		<div class="marb <?php echo $fcpdata['link_field_required'] == '1' ? 'sections_block_rquaired' : 'sections_block' ; ?>">
			<div class="input-group margin-bottom-sm">			
				<input id="contact-link" class="form-control contact-link" type="text" placeholder="<?php echo isset($fcpdata['link_field_placeholder'][$lang_id]) ? $fcpdata['link_field_placeholder'][$lang_id]['text'] : ''; ?>" value="" name="link_field">		
				<span class="input-group-addon"><i class="icon-append-1 fa fa-link fa-fw"></i></span>
			</div>			
		</div>
		<?php } ?>
		<?php if ($fcpdata['comment_field']) { ?>
		<div class="marb <?php echo $fcpdata['comment_field_required'] == '1' ? 'sections_block_rquaired' : 'sections_block' ; ?>">
			<div class="input-group margin-bottom-sm">			
				<input id="contact-comment" class="form-control contact-link" type="text" placeholder="<?php echo isset($fcpdata['comment_field_placeholder'][$lang_id]) ? $fcpdata['comment_field_placeholder'][$lang_id]['text'] : ''; ?>" value="" name="comment_field">		
				<span class="input-group-addon"><i class="icon-append-1 fa fa-comment-o fa-fw"></i></span>
			</div>			
		</div>
		<?php } ?>
      <input type="hidden" name="fcp_product_id" value="<?php echo $product_id;?>"/>
	<?php if ($text_agree) { ?>
        <div class="col-xs-12 text-center">
		  <?php echo $text_agree; ?>          
            <input type="checkbox" name="agree" value="1" />
			<div class="error_agree"></div>
        </div>
		<?php } ?>
	</form>
  </div>
  <div class="popup-footer">
    <button type="button" onclick="found_cheaper_product_confirm()"  class="btn btn-found-cheaper"><?php echo $button_send_found_cheaper; ?></button>
  </div>
 <script>
$(document).ready(function() {
	<?php if ($fcpdata['telephone_field_mask'] != '') { ?>
		$("#contact-telephone").mask("<?php echo $fcpdata['telephone_field_mask'];?>");
	<?php } ?>
});
</script>
<script><!--
function found_cheaper_product_confirm() {
	$('#popup-found-cheaper #form-found-cheaper').prepend('<div class="masked_bg"></div><div class="loading_masked"></div>');
	var success = 'false';
		$('#callback_url').val(window.location.href);
		$.ajax({
			url: 'index.php?route=extension/module/cyber_found_cheaper_product/found_cheaper_product_confirm',
			type: 'post',
			data: $('#form-found-cheaper').serialize() + '&action=send',
			dataType: 'json',
			beforeSend: function() {
				loading_masked(true);
			},
			success: function(json) {
				loading_masked(false);	
				$('.masked_bg').remove();				
				$('.loading_masked').remove();
				$('.alert').remove();					
				$('#contact-name').removeClass('error_input');				
				$('#contact-telephone').removeClass('error_input');			
				$('#contact-comment').removeClass('error_input');				
				$('#contact-link').removeClass('error_input');
				$('.text-danger').empty();
				if (json['error']) {
					if (json['error']['name_field']) {						
						$('#contact-name').attr('placeholder',json['error']['name_field']);
						$('#contact-name').addClass('error_input');							
					}										
					if (json['error']['telephone_field']) {						
						$('#contact-telephone').attr('placeholder',json['error']['telephone_field']);
						$('#contact-telephone').addClass('error_input');									
					}											
					if (json['error']['comment_field']) {
						$('#contact-comment').attr('placeholder',json['error']['comment_field']);
						$('#contact-comment').addClass('error_input');				
					}						
					if (json['error']['link_field']) {						
						$('#contact-link').attr('placeholder',json['error']['link_field']);
						$('#contact-link').addClass('error_input');						
					}
					if (json['error']['email_field']) {						
						$('#contact-email').attr('placeholder',json['error']['email_field']);
						$('#contact-email').addClass('error_input');						
					}
					if (json['error']['error_agree']) {
						$('.error_agree').append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['error_agree'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');	
					}
				}
				
				if (json['success']){ 	
				$.magnificPopup.close();
				html  = '<div id="modal-found-cheaper" class="modal fade">';
				html += '  <div class="modal-dialog">';
				html += '    <div class="modal-content">';
				html += '      <div class="modal-body alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></div>';
				html += '    </div>';
				html += '  </div>';
				html += '</div>';

				$('body').append(html);

				$('#modal-found-cheaper').modal('show');
				}	
			}

		});
}
//--></script>
<style>
<?php if ($fcpdata['color_send_button']) { ?>
#found-cheaper-wrapper .popup-footer .btn-found-cheaper {color:<?php echo $fcpdata['color_send_button']; ?>; }
<?php } ?>
<?php if ($fcpdata['background_send_button']) { ?>
#found-cheaper-wrapper .popup-footer .btn-found-cheaper {background:<?php echo $fcpdata['background_send_button']; ?>; }
<?php } ?>
<?php if ($fcpdata['background_send_button_hover']) { ?>
#found-cheaper-wrapper .popup-footer .btn-found-cheaper:hover {background:<?php echo $fcpdata['background_send_button_hover']; ?>; }
<?php } ?>
<?php if ($fcpdata['border_send_button']) { ?>
#found-cheaper-wrapper .popup-footer .btn-found-cheaper {border-color:<?php echo $fcpdata['border_send_button']; ?>; }
<?php } ?>
<?php if ($fcpdata['border_send_button_hover']) { ?>
#found-cheaper-wrapper .popup-footer .btn-found-cheaper:hover {border-color:<?php echo $fcpdata['border_send_button_hover']; ?>; }
<?php } ?>
</style>
</div>
