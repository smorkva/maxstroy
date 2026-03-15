<div class="container-module">
<?php if ($module_header) { ?>
<div class="title-module rc-mod"><span><?php echo $module_header; ?></span></div>
<?php } ?>	
<div class="product-slider">
	<div class="reviews review-customer<?php echo $module;?>">
			<?php foreach ($reviews as $review) { ?>
			<div class="col-xs-12 col-sm-6 col-md-4 no-slider">
			<div class="item-review">
				<div class="rc-center">
					<div class="rc-media">
						<a href="<?php echo $review['prod_href']; ?>"><img src="<?php echo $lazy_img;?>" data-src="<?php echo $review['prod_thumb']; ?>" alt="<?php echo $review['prod_name']; ?>" title="<?php echo $review['prod_name']; ?>" class="img-responsive lazyload" /></a>
					</div>
					<div class="rc-media-body">
						<div class="rs-pr-name"><a href="<?php echo $review['prod_href']; ?>"><?php echo $review['prod_name']; ?></a></div>
						<div class="rating">
							<span class="rating-box">
								<?php for ($i = 1; $i <= 5; $i++) { ?>
									<?php if ($review['rating'] < $i) { ?>
									<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
									<?php } else { ?>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
									<?php } ?>
								<?php } ?>
							</span>
						</div>
						<div class="review-description"><?php echo $review['description']; ?></div>
					</div>
				</div>
				<div class="rc-bottom">
					<span class="reviews-author text-left"><i class="fa fa-user" aria-hidden="true"></i>  <?php echo $review['author']; ?></span>
					<span class="reviews-date text-right"><?php echo $review['date_added']; ?></span>
				</div>
			</div>
			</div>
		<?php } ?>
			
	</div>
	<div class="col-sm-12 text-center"><a class="see-all-reviews" href="<?php echo $link_all_reviews;?>"><?php echo $text_all_reviews;?></a></div>
		<?php if(isset($status_showmore) && $status_showmore !=0){?>
		<?php if($nextPage){?>
			<div class="showmore-review<?php echo $module;?> box-showmore"><span class="box-ajax-load"><span data-nextpage="<?php echo $nextPage;?>" class="review-ajax-load<?php echo $module;?>"><i class="fa fa-repeat" aria-hidden="true"></i> <?php echo $text_showmore;?></span></span></div>
		<?php } ?>
		<?php } ?>
	</div>
<?php if(isset($status_showmore) && $status_showmore !=0){?>
<script>
$(document).on('click', '.review-ajax-load<?php echo $module;?>', function () {
	$.ajax({
		url: 'index.php?route=extension/module/cyber_reviewscustomer/getNextPage',
		type: 'post',
		data: 'page=' + $(this).attr('data-nextpage') + '&module=<?php echo $module;?>&setting=<?php echo $setting;?>',
		dataType: 'html',
		beforeSend: function() {
			$('.showmore-review<?php echo $module;?> i.fa-repeat').addClass('fa-spin');
		},
		complete: function() {
			$('.showmore-review<?php echo $module;?> i.fa-repeat').removeClass('fa-spin');
		},	
		success:function(data){
			$data = $(data);
			var $products = $data.find('.review-customer<?php echo $module;?> > div.col-xs-12');
			$('.review-customer<?php echo $module;?>').append($products);
			$('.showmore-review<?php echo $module;?>').replaceWith($data.find('.showmore-review<?php echo $module;?>'));
		}
	});
})
</script>  
<?php } ?>
</div>