<?php echo $header; ?>
<div class="container">
<div class="col-sm-12 content-box-cs">
 <ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
			<?php if($i+1<count($breadcrumbs)){ ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><span><?php echo $breadcrumb['text']; ?></span></a></li>
			<?php } else { ?>
				<li><?php echo $breadcrumb['text']; ?></li>
			<?php } ?>
		<?php } ?>
	</ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-md-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1 class="heading_title_reviews"><?php echo $heading_title; ?></h1>
      <?php if ($reviews) { ?>
      <div class="row">
        <?php foreach ($reviews as $review) { ?>
        <div class="product-layout product-list col-xs-12">
         <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $review['prod_href']; ?>"><img src="<?php echo $review['prod_thumb']; ?>" alt="<?php echo $review['prod_name']; ?>" title="<?php echo $review['prod_name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
              <div class="product-name"><h4><a href="<?php echo $review['prod_href']; ?>"><?php echo $review['prod_name']; ?></a></h4></div>
              <?php if ($review['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($review['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <p class="reviews-description"><?php echo $review['description']; ?></p>
			  <?php if($show_review_plus && $review['plus']) { ?>
					<div class="review_plus">
						<div><span><i class="fa fa-plus" aria-hidden="true"></i> <?php echo $text_plus; ?></span>
						<?php echo $review['plus']; ?>
						</div>
					</div>
				<?php } ?>
				<?php if($show_review_minus && $review['minus']) { ?>
				<div class="review_minus">
					<div><span><i class="fa fa-minus" aria-hidden="true"></i> <?php echo $text_minus; ?></span>
					<?php echo $review['minus']; ?>
				</div>
				</div>
				<?php } ?>
				
				<?php if (isset($review['admin_reply']) && $review['admin_reply'] != '') { ?> 
					<div class="admin_reply">
						<span><i class="fa fa-reply fa-rotate-180" aria-hidden="true"></i> <?php echo $text_admin_reply; ?></span>
						<?php echo $review['admin_reply']; ?>
					</div>
				<?php } ?>
              <div class="reviews-sign">
                <div class="reviews-author">
				<i class="fa fa-user" aria-hidden="true"></i> <?php echo $review['author']; ?>
				<?php if($review['purchased']) {?><span class="purchased"><i class="fa fa-cart-plus" aria-hidden="true"></i> <?php echo $text_purchased?></span><?php } ?>
				</div>
                <div class="reviews-date"><?php echo $review['date_added']; ?></div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
</div>
<?php echo $footer; ?>