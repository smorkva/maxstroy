<link href="catalog/view/theme/cyberstore/stylesheet/popup-question-answer/stylefcp.css" rel="stylesheet" media="screen" />     
<?php if($question_answer){?>
	<?php foreach($question_answer as $result){?>
		<div class="info-client">
			<div class="client-name"><i class="fa fa-user" aria-hidden="true"></i> <?php echo $result['name_field'];?></div>
			<div class="client-date-added"><?php echo $result['date_added'];?></div>
		</div>
		<div class="question-client"><?php echo $result['comment_field'];?></div>
		<?php if($result['comment_manager'] !=''){?><div class="answer-admin"><span><i class="fa fa-reply fa-rotate-180" aria-hidden="true"></i> <?php echo $text_answer_admin;?></span><?php echo $result['comment_manager'];?></div><?php } ?>
	<?php } ?>
<?php } else { ?>
<?php echo $text_no_question;?>
<?php } ?>


<div class="pagination_question">
	<div class="text-right"><?php echo $pagination;?></div>
	<div class="text-right"><?php echo $results;?></div>
	<div class="text-center"><button class="btn btn-primary" onclick="$('#form-question-answer').slideToggle();"><?php echo $text_write_a_question;?></button></div>
</div>
<form class="form-horizontal well well-sm" id="form-question-answer">
	<?php if (isset($qadata['name_field']))  { ?>
		<div class="form-group <?php echo (isset($qadata['name_field_required']) ? 'sections_block_rquaired' : 'sections_block'); ?>">
			<div class="col-xs-12">
			<div class="input-group margin-bottom-sm">
				<span class="input-group-addon"><i class="icon-append-1 fa fa-user fa-fw"></i></span>
				<input id="contact-name" class="form-control contact-name" type="text" placeholder="<?php echo isset($qadata['name_field_placeholder'][$lang_id]) ? $qadata['name_field_placeholder'][$lang_id]['text'] : ''; ?>" value="<?php echo $name_field;?>" name="name_field">		
			</div>
			</div>
		</div>
		<?php } ?>
		<?php if (isset($qadata['telephone_field'])) { ?>
		<div class="form-group <?php echo (isset($qadata['telephone_field_required']) ? 'sections_block_rquaired' : 'sections_block'); ?>">
			<div class="col-xs-12">
			<div class="input-group margin-bottom-sm">	
				<span class="input-group-addon"><i class="icon-append-1 fa fa-phone-square fa-fw"></i></span>
				<input id="contact-telephone" class="form-control contact-telephone" type="text" placeholder="<?php echo isset($qadata['telephone_field_placeholder'][$lang_id]) ? $qadata['telephone_field_placeholder'][$lang_id]['text'] : ''; ?>" value="<?php echo $telephone_field;?>" name="telephone_field">						
			</div>
			</div>
		</div>
		<?php } ?>
		<?php if (isset($qadata['email_field'])) { ?>
		<div class="form-group <?php echo (isset($qadata['email_field_required']) ? 'sections_block_rquaired' : 'sections_block'); ?>">
			<div class="col-xs-12">
				<div class="input-group margin-bottom-sm">	
					<span class="input-group-addon"><i class="icon-append-1 fa fa-envelope-o fa-fw"></i></span>
					<input id="contact-email" class="form-control contact-email" type="text" placeholder="<?php echo isset($qadata['email_field_placeholder'][$lang_id]) ? $qadata['email_field_placeholder'][$lang_id]['text'] : ''; ?>" value="<?php echo $email_field;?>" name="email_field">		
				</div>			
			</div>			
		</div>
		<?php } ?>
		<div class="form-group required">
		<div class="col-xs-12">
			<label class="control-label" for="input-comment-field"><?php echo $entry_question; ?></label>
            <textarea name="comment_field" rows="5" id="input-comment-field" class="form-control"></textarea>
            <div class="help-block"><?php echo $text_note_html; ?></div>
        </div>
        </div>
		<?php if ($text_agree) { ?>
        <div class="col-xs-12 text-center">
		  <?php echo $text_agree; ?>          
            <input type="checkbox" name="agree" value="1" />
			<div class="error_agree"></div>
        </div>
		<?php } ?>
	<div class="form-group">
		<div class="col-xs-12">
	<?php if(isset($qadata['captcha_field'])){?>
	<?php echo $captcha_qa;?>
	<?php } ?>
		</div>
	</div>
	<div class="buttons clearfix">
        <div class="pull-right">
            <button type="button" id="button-question-answer" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $add_question; ?></button>
		</div>
     </div>
	<input type="hidden" name="qa_product_id" value="<?php echo $product_id;?>"/>
		
</form>
<script>
			
		$('#button-question-answer').on('click', function() {
			$.ajax({
				url: 'index.php?route=extension/module/cyber_question_answer/validateForm',
				type: 'post',
				data: $('#form-question-answer input, #form-question-answer textarea').serialize(),
				dataType: 'json',
				beforeSend: function() {
					$('#button-question-answer').button('loading');
				},
				complete: function() {
					$('#button-question-answer').button('reset');
				},
				success: function(json) {
				$('.alert').remove();
				$('.loading_masked').remove();				
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
						$('#form-question-answer').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['comment_field'] + '</div>');									
					}
					if (json['error']['captcha']) {
						$('#form-question-answer').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['captcha'] + '</div>');	
					}						
					if (json['error']['email_field']) {						
						$('#contact-email').attr('placeholder',json['error']['email_field']);
						$('#contact-email').addClass('error_input');						
					}
					if (json['error']['error_agree']) {
						$('.error_agree').append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['error_agree'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');	
					}
				}
					if (json['success']) {
						$('#question-answer').append('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
						$('#form-question-answer').slideToggle();
						$('#form-question-answer').val('');
					}					
				}
			});
		});
	</script>