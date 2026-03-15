<div class="mod-rs-cont container-module">
	<div class="title-module"><span><?php echo $heading_title;?></span></div>
<div class="row rating-info-box">
	<div class="col-xs-12 col-md-12">
			<div class="well well-sm">
			<div class="row">
				<div class="col-xs-12 col-md-3 text-center bottom-10 col-rl">
					<div <?php if($rating_store ==5){?>class="progress-striped-rev-full"<?php } ?>>
						<span class="rating-num
					<?php if(($rating_store >=1) && ($rating_store < 2)){?>
					rat-avg-1
					<?php } elseif(($rating_store >=2) && ($rating_store < 3)){ ?>
					rat-avg-2
					<?php } elseif(($rating_store >=3) && ($rating_store < 4)){ ?>
					rat-avg-3
					<?php } elseif(($rating_store >=4) && ($rating_store < 5)){ ?>
					rat-avg-4
					<?php } elseif($rating_store == 5){ ?>
					rat-avg-5
					<?php } ?>
					"><?php echo $rating_store;?></span>
					</div>
					<div class="testimonial-rating">
						<div class="testimonial-rating-stars"><div class="testimonial-realrating" style="width:<?php echo ($rating_store*100/5)?>%;"></div></div>
					</div>
					<div class="rs-sum-total">
						<span class="glyphicon glyphicon-user"></span> <?php echo $text_sum_reviews;?> <?php echo $total_rs;?>
					</div>
					
				</div>
				<div class="col-xs-12 col-md-5 bottom-10 col-rl">
					<div class="row rating-desc">
						<div class="col-xs-3 col-md-3 text-right">
							<i class="fa fa-star color-star-percent-5"></i>5
						</div>
						<div class="col-xs-8 col-md-9">
							<div class="progress progress-striped">
								<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20"
									aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $percent_rating['star5'];?>%">
									<span class="sr-only"><?php echo $percent_rating['star5'];?>%</span>
								</div>
							</div>
						</div>
						<div class="col-xs-3 col-md-3 text-right">
							<i class="fa fa-star color-star-percent-4"></i>4
						</div>
						<div class="col-xs-8 col-md-9">
							<div class="progress">
								<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20"
									aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $percent_rating['star4'];?>%">
									<span class="sr-only"><?php echo $percent_rating['star4'];?>%</span>
								</div>
							</div>
						</div>
						<div class="col-xs-3 col-md-3 text-right">
							<i class="fa fa-star color-star-percent-3"></i>3
						</div>
						<div class="col-xs-8 col-md-9">
							<div class="progress">
								<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20"
									aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $percent_rating['star3'];?>%">
									<span class="sr-only"><?php echo $percent_rating['star3'];?>%</span>
								</div>
							</div>
						</div>
						<div class="col-xs-3 col-md-3 text-right">
							<i class="fa fa-star color-star-percent-2"></i>2
						</div>
						<div class="col-xs-8 col-md-9">
							<div class="progress">
								<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20"
									aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $percent_rating['star2'];?>%">
									<span class="sr-only"><?php echo $percent_rating['star2'];?>%</span>
								</div>
							</div>
						</div>
						<div class="col-xs-3 col-md-3 text-right">
							<i class="fa fa-star color-star-percent-1"></i>1
						</div>
						<div class="col-xs-8 col-md-9">
							<div class="progress">
								<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80"
									aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $percent_rating['star1'];?>%">
									<span class="sr-only"><?php echo $percent_rating['star1'];?>%</span>
								</div>
							</div>
						</div>
					</div>
					
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 col-rl">
					<div class="rsinfo">
					<?php foreach($reviews_theme_rating as $result_info){?>
						<div class="rsinfo-item">
						<span><?php echo $result_info['theme_text']; ?></span>
						<div class="avg-rating">
							<div class="avg-rating-stars"><div class="avg-realrating" style="width:<?php echo ($result_info['avg_rating']*100/5)?>%;"></div></div>
						</div>
						</div>
					<?php }?>
					</div>
					<div class="btn-block-rs">
						<?php if($review_guest) { ?>
						<button type="button" onclick="popupFormReviewStore()" class="btn btn-primary"><?php echo $btn_write_review; ?></button>
						<?php } else { ?>
							<?php echo $text_review_guest;?>
						<?php } ?>
						<a href="<?php echo $all_review_link;?>" class="btn btn-primary"><?php echo $btn_all_review; ?></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="review-store-box review-store<?php echo $module;?>">
		<?php foreach ($reviews_store as $review_store) { ?>
		<div class="col-xs-12 col-sm-6 col-md-4 no-slider">
			<div class="item-rs">
				<div class="mod-desc-reviews">
					<?php echo $review_store['description'];?>
				</div>
				<div class="mod-rev-rating">
					<div class="avg-rating">
						<div class="avg-rating-stars"><div class="avg-realrating" style="width:<?php echo ($review_store['avg_customer_rating']*100/5)?>%;"></div></div>
					</div>
				</div>
				<div class="row-flex jcsb">
					<div class="rev-author"><span class="glyphicon glyphicon-user"></span> <?php echo $review_store['author'];?></div>
					<div class="rev-date-add"><?php echo $review_store['date_added'];?></div>
				</div>
			</div>
		</div>
		<?php } ?>
	</div>
	<?php if(isset($status_showmore) && $status_showmore !=0){?>
	<?php if($nextPage){?>
		<div class="showmore-review-store<?php echo $module;?> box-showmore"><span class="box-ajax-load"><span data-nextpage="<?php echo $nextPage;?>" class="review-store-ajax-load<?php echo $module;?>"><i class="fa fa-repeat" aria-hidden="true"></i> <?php echo $text_showmore;?></span></span></div>
	<?php } ?>
	<?php } ?>
</div>
<?php if(isset($status_showmore) && $status_showmore !=0){?>
<script>
$(document).on('click', '.review-store-ajax-load<?php echo $module;?>', function () {
	$.ajax({
		url: 'index.php?route=extension/module/cyber_reviews_store/getNextPage',
		type: 'post',
		data: 'page=' + $(this).attr('data-nextpage') + '&module=<?php echo $module;?>&setting=<?php echo $setting;?>',
		dataType: 'html',
		beforeSend: function() {
			$('.showmore-review-store<?php echo $module;?> i.fa-repeat').addClass('fa-spin');
		},
		complete: function() {
			$('.showmore-review-store<?php echo $module;?> i.fa-repeat').removeClass('fa-spin');
		},	
		success:function(data){
			$data = $(data);
			var $reviews_store = $data.find('.review-store<?php echo $module;?> > div.col-xs-12');
			$('.review-store<?php echo $module;?>').append($reviews_store);
			$('.showmore-review-store<?php echo $module;?>').replaceWith($data.find('.showmore-review-store<?php echo $module;?>'));
		}
	});
})
</script>  
<?php } ?>
</div>