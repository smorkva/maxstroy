<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<table class="review_list table table-striped table-bordered">
  <tr>
    <td style="width:30%;"><i class="fa fa-user" aria-hidden="true"></i> 
	<span><?php echo $review['author']; ?></span>
	<?php if($review['purchased']) {?><span class="purchased"><i class="fa fa-cart-plus" aria-hidden="true"></i> <?php echo $text_purchased?></span><?php } ?></td>
	<td style="width:30%;">
	<div class="rating">
	<?php for ($i = 1; $i <= 5; $i++) { ?>
      <?php if ($review['rating'] < $i) { ?>
      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
      <?php } else { ?>
      <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
      <?php } ?>
    <?php } ?>
	</div>
	</td>
    <td class="text-right"><?php echo $review['date_added']; ?></td>
  </tr>
  <tr>
    <td colspan="3">
		<div class="comment">
			<?php echo $review['text']; ?>
		</div>
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
	</td>
  </tr>
</table>
<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>
