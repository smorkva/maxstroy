<?php echo $header; ?>
<div class="container">
<div class="col-sm-12 content-box-cs">
  <ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
			<?php if($i+1<count($breadcrumbs)){ ?>
				<li>
					<a href="<?php echo $breadcrumb['href']; ?>">
					  <span><?php echo $breadcrumb['text']; ?></span>
					</a>
				  </li>
			<?php } else { ?>
				<li>
					<span><?php echo $breadcrumb['text']; ?></span>
				</li>
			<?php } ?>
		<?php } ?>
	</ul>
  <div class="row">
  <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-8 col-md-6'; ?>
	<?php $cols_class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-8 col-md-9'; ?>
	<?php $cols_class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
	<?php $cols_class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
		<?php echo $content_top; ?>
		<div class="row rating-info-box">
			<div class="col-xs-12 col-md-12">
				<div class="well well-sm">
					<div class="row">
						<div class="col-xs-12 col-md-3 text-center">
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
							<div>
								<span class="glyphicon glyphicon-user"></span> <?php echo $text_sum_reviews;?> <?php echo $total_rs;?>
							</div>
							
						</div>
						<div class="col-xs-12 col-md-5">
							<div class="row rating-desc">
								<div class="col-xs-3 col-md-2 text-right">
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
								<div class="col-xs-3 col-md-2 text-right">
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
								<div class="col-xs-3 col-md-2 text-right">
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
								<div class="col-xs-3 col-md-2 text-right">
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
								<div class="col-xs-3 col-md-2 text-right">
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
						<div class="col-xs-12 col-md-4">
							<div class="rsinfo">
							<?php foreach($reviews_theme_rating as $result_info){?>
							<div class="rsinfo-item">
							<span><?php echo $result_info['theme_text']; ?></span>
							<span class="rating">
							<?php for ($i = 1; $i <= 5; $i++) { ?>
								<?php if ($result_info['avg_rating'] < $i) { ?>
									<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
								<?php } else { ?>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
								<?php } ?>
							<?php } ?>
							</span>
							</div>
							<?php }?>
							<?php if($review_guest) { ?>
								<button type="button" onclick="popupFormReviewStore()" class="btn btn-primary text-right btnpfrs"><?php echo $btn_write_review; ?></button>
							<?php } else { ?>
								<?php echo $text_review_guest;?>
							<?php } ?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
			<?php if ($reviews_store) { ?>
			<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-xs-center text-sm-center text-md-center text-lg-left localstorage" style="margin:0px 0px 20px 0px">
			<div class="btn-group">
				 <div class="btn-group">
					 <button type="button" class="btn btn-sort-limit dropdown-toggle" data-toggle="dropdown">
						<?php echo str_replace(":","",$text_sort); ?>
						<span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu text-left">
						<?php foreach ($sorts as $sorts) { ?>
						<?php if ($sorts['value'] == $sort) { ?>
						<li class="active"><a href="<?php echo $sorts['href']; ?>" rel="nofollow"><?php echo $sorts['text']; ?></a></li>
						<?php } else { ?>
						<li><a href="<?php echo $sorts['href']; ?>" rel="nofollow"><?php echo $sorts['text']; ?></a></li>
						<?php } ?>
						<?php } ?>
					  </ul>
				</div>
				<div class="btn-group">
                  <ul class="dropdown-menu text-left">
                    <?php foreach ($limits as $limits) { ?>
                    <?php if ($limits['value'] == $limit) { ?>
                    <li class="active"><a href="<?php echo $limits['href']; ?>" rel="nofollow"><?php echo $limits['text']; ?></a></li>
                    <?php $mmr_limit_active = $limits['text']; ?>
                    <?php } else { ?>
                    <li><a href="<?php echo $limits['href']; ?>" rel="nofollow"><?php echo $limits['text']; ?></a></li>
                    <?php } ?>
                    <?php } ?>
                  </ul>
                  <button type="button" class="btn btn-sort-limit dropdown-toggle" data-toggle="dropdown" title="<?php echo $text_limit;?>">
                    <i class="fa fa-arrows-v hidden-md hidden-lg"></i> <span class="hidden-xs hidden-sm"><?php echo $text_limit; ?> </span><?php echo isset($mmr_limit_active) ? $mmr_limit_active : $limits['text']; ?>
                    <span class="caret"></span>
                  </button>
                </div>
			</div>
		</div>
		 </div>
			<div class="row">
			<div class="col-sm-12">
			<div class="all-review-box">
				<?php foreach ($reviews_store as $review_store) { ?>
					<div id="review_store_box_<?php echo $review_store['reviews_store_id']?>">
						<div class="panel panel-default">
							<div class="panel-heading clearfix">
								<div class="col-xs-12 col-sm-4 rev-author"><span class="glyphicon glyphicon-user"></span> <?php echo $review_store['author'];?></div>
								<div class="col-xs-12 col-sm-4 rev-rating">
									<div class="avg-rating">
										<div class="avg-rating-stars"><div class="avg-realrating" style="width:<?php echo ($review_store['avg_customer_rating']*100/5)?>%;"></div></div>
									</div>
								</div>
								<div class="col-xs-12 col-sm-4 rev-date-add"><?php echo $review_store['date_added'];?></div>
							</div>
							<div class="panel-body">
								<?php echo $review_store['description'];?>
							</div>
							<?php if(isset($reviews_store_setting['show_like_dislike']) && ($reviews_store_setting['show_like_dislike'] == 1)){?>
							<div class="panel-footer clearfix pf-rev-mod">
								<div class="like-dislike-box pull-right ">	
									<button type="button" onclick="likeDislike('<?php echo $review_store['reviews_store_id']?>','like')" id="like_reviews_store<?php echo $review_store['reviews_store_id']?>" class="btn-like like"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
										<span class="likes"><?php echo $review_store['like'];?></span>
									</button>
									<button type="button" onclick="likeDislike('<?php echo $review_store['reviews_store_id']?>','dislike')" id="dislike_reviews_store<?php echo $review_store['reviews_store_id']?>" class="btn-dislike dislike"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i>
									<span class="dislikes"><?php echo $review_store['dislike'];?></span>
									</button>							
								</div>
							</div>
							<?php } ?>
						</div>
					</div>
					<?php if($review_store['admin_response']){?>
						<div class="admin-response">
							<span class="discussion-item-icon">
							<i class="fa fa-level-up fa-rotate-90" aria-hidden="true"></i>
							</span>
							<?php echo $review_store['admin_response'];?>
						</div>
					<?php } ?>	
				<?php } ?>	
			</div>
			</div>
			</div>
				<div class="row top-10">
				<div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
				<div class="col-sm-12 text-right"><?php echo $results; ?></div>
			  </div>
			<?php } ?>	
			<?php if (!$reviews_store) { ?>
			<p><?php echo $text_empty; ?></p>
			<div class="buttons">
			  <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
			</div>
			<?php } ?>
		<?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php if(isset($reviews_store_setting['show_like_dislike']) && ($reviews_store_setting['show_like_dislike'] == 1)){?>
<script><!--
	function likeDislike(reviews_store_id,typebtn) {
			var like = 0, dislike = 0;
			var isActiveLike = localStorage.getItem('like_'+reviews_store_id) == 'enabled';
			var hasActiveLike = localStorage.getItem('like_'+reviews_store_id) == 'enabled';
			var hasActiveDislike = localStorage.getItem('dislike_'+reviews_store_id) == 'enabled';
			var isActiveDislike = localStorage.getItem('dislike_'+reviews_store_id) == 'enabled';
			
			if (typebtn === 'like') {
				if (isActiveLike) {
					localStorage.setItem('like_'+reviews_store_id, 'disabled');
					like = -1;
				} else {
					if (hasActiveLike) {
						localStorage.removeItem('like_'+reviews_store_id); 
						dislike = -1;
					}
					if (hasActiveDislike) {
						localStorage.removeItem('dislike_'+reviews_store_id); 
						dislike = -1;
					}
					localStorage.setItem('like_'+reviews_store_id, 'enabled');
					like = 1;
					value = 1;
				}
			} else {
				if (isActiveDislike) {
					localStorage.setItem('dislike_'+reviews_store_id, 'disabled');
					dislike = -1;
				} else {
					if(hasActiveLike){
						localStorage.removeItem('like_'+reviews_store_id); 
						like = -1;
					}
					if(hasActiveDislike){
						localStorage.removeItem('dislike_'+reviews_store_id); 
						like = -1;
					}
					localStorage.setItem('dislike_'+reviews_store_id, 'enabled');
					dislike = 1;
					value = -1;
				}
			}
                    
			$.ajax({
				url: 'index.php?route=product/cyber_reviews_store/likeDislike',
				type: 'post',
				data: 'reviews_store_id='+ reviews_store_id + '&typebtn='+typebtn+'&like='+like+'&dislike='+dislike,
				dataType: 'json',
				success: function(json) {
					 $('#like_reviews_store'+reviews_store_id).find('.likes').text(json.like);
					 $('#dislike_reviews_store'+reviews_store_id).find('.dislikes').text(json.dislike);
				}
			});
		
    }
//--></script>
<?php } ?>
</div>
<?php echo $footer; ?>