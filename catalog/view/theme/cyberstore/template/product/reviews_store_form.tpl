	<div id="popup-reviews-store">	
	<div class="popup-heading"><?php echo $text_store_rating;?></div>
		<div class="row">
              <div class="col-md-12">
                <form class="form-horizontal" id="form-reviews-store">
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="author" value="" id="input-name" class="form-control">
                    </div>
                  </div>
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-review-description"><?php echo $entry_review; ?></label>
                    <div class="col-sm-10">
                      <textarea name="description" rows="5" id="input-review-description" class="form-control"></textarea>
                      <div class="help-block"><?php echo $text_note; ?></div>
                    </div>
                  </div>
					<?php if($reviews_theme){?>
						<?php foreach($reviews_theme as $item){?>
							<div class="form-group required">
								<div class="col-sm-4"><?php echo $item['theme_text'];?></div>
								<div class="col-sm-8">
								<div class="rating-store">
									<input id="rat1<?php echo $item['reviews_store_theme_id'];?>" type="radio" name="rating[<?php echo $item['reviews_store_theme_id'];?>]" value="1" /><label class="star-rating label-star<?php echo $item['reviews_store_theme_id'];?>" for="rat1<?php echo $item['reviews_store_theme_id'];?>"><i class="fa fa-star"></i></label>
									<input id="rat2<?php echo $item['reviews_store_theme_id'];?>" type="radio" name="rating[<?php echo $item['reviews_store_theme_id'];?>]" value="2" /><label class="star-rating label-star<?php echo $item['reviews_store_theme_id'];?>" for="rat2<?php echo $item['reviews_store_theme_id'];?>"><i class="fa fa-star"></i></label>
									<input id="rat3<?php echo $item['reviews_store_theme_id'];?>" type="radio" name="rating[<?php echo $item['reviews_store_theme_id'];?>]" value="3" /><label class="star-rating label-star<?php echo $item['reviews_store_theme_id'];?>" for="rat3<?php echo $item['reviews_store_theme_id'];?>"><i class="fa fa-star"></i></label>
									<input id="rat4<?php echo $item['reviews_store_theme_id'];?>" type="radio" name="rating[<?php echo $item['reviews_store_theme_id'];?>]" value="4" /><label class="star-rating label-star<?php echo $item['reviews_store_theme_id'];?>" for="rat4<?php echo $item['reviews_store_theme_id'];?>"><i class="fa fa-star"></i></label>
									<input id="rat5<?php echo $item['reviews_store_theme_id'];?>" type="radio" name="rating[<?php echo $item['reviews_store_theme_id'];?>]" value="5" /><label class="star-rating label-star<?php echo $item['reviews_store_theme_id'];?>" for="rat5<?php echo $item['reviews_store_theme_id'];?>"><i class="fa fa-star"></i></label>
								</div>
								<script><!--
									$('.label-star<?php echo $item['reviews_store_theme_id'];?>').hover(function () {
										$(this).prevAll('.label-star<?php echo $item['reviews_store_theme_id'];?>').addClass('active');
										$(this).addClass('active');
									},function () {
										$(this).prevAll('.label-star<?php echo $item['reviews_store_theme_id'];?>').removeClass('active');
										$(this).removeClass('active');
									});
									
									$('.label-star<?php echo $item['reviews_store_theme_id'];?>').click(function(){
										$('.label-star<?php echo $item['reviews_store_theme_id'];?>').each(function(){
											$(this).removeClass('checked');
											$(this).prevAll('.label-star<?php echo $item['reviews_store_theme_id'];?>').removeClass('checked');
										});
										
										$(this).addClass('checked');
										$(this).prevAll('.label-star<?php echo $item['reviews_store_theme_id'];?>').addClass('checked');
									});
									
								//--></script>
								</div>
							</div>
						<?php } ?>
					<?php } ?>
					<?php if(isset($reviews_store_setting['captcha'])){?>
					<div class="form-group">
						<div class="col-sm-12">
							<?php echo $captcha_rs;?>
						</div>
					</div>
					<?php } ?>
                  <div class="popup-footer text-center">
					<button type="button" id="reviews_store" class="btn btn-primary"><?php echo $btn_add_new_review_store; ?></button>
                  </div>
                </form>
              </div>
            </div>
<script><!--
$('#reviews_store').on('click', function() {
$.ajax({
	url: 'index.php?route=product/cyber_reviews_store/write',
	type: 'post',
	data: $('#form-reviews-store').serialize(),
	dataType: 'json',
	success: function(json) {
	$('.alert-success, .alert-danger').remove();
	if (json['error']) {
		$('#popup-reviews-store #form-reviews-store').before('<div class="alert-popup-rs alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
	}
	
	if (json['success']) {
	  $('#popup-reviews-store #form-reviews-store').before('<div class="alert-popup-rs alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
		setTimeout(function () {
			$.magnificPopup.close();
			location.reload();
		}, 1000);
	}
  }
});
});
//--></script>
</div>