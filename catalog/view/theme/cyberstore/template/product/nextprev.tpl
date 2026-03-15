<div class="nextprevprod btn-group">
    <?php if (isset($products['prev'])) { ?>
		<button id="prev-prod-btn" type="button" onclick="location.href='<?php echo $products['prev']['href']; ?>'"  class="btn btn-default"><?php echo $products['prev']['name'];?></button>
	<?php } ?>
    <?php if (isset($products['next'])) { ?>
		<button id="next-prod-btn" type="button" onclick="location.href='<?php echo $products['next']['href']; ?>'" class="btn btn-default"><?php echo $products['next']['name'];?></button>
    <?php } ?>
	<script>
	<?php if (isset($products['prev'])) { ?>
	$('#prev-prod-btn').popover({
		html: true,
		placement: 'bottom',
		trigger: 'hover',
		content: function() {
			html  = '<div class="popover-pr-image"><img class="img-responsive" src="<?php echo $products['prev']['image'];?>" title="" alt="" /></div>';
			html += '<div class="popover-pr-name"><?php echo addslashes($products['prev']['name']);?></div>';
			html += '<div class="price">';
			html += '	<?php if ($products['prev']['price']) { ?>';
			html += '	  <?php if (!$products['prev']['special']) { ?>';
			html += '		<span><?php echo $products['prev']['price']; ?></span>';
			html += '	  <?php } else { ?>';
			html += '		<span class="price-old"><span><?php echo $products['prev']['price']; ?></span></span> <span class="price-new"><span><?php echo $products['prev']['special']; ?></span></span>';
			html += '	  <?php } ?>';
			html += '	<?php } ?>';
			html += '</div>';
			return html;
		}
	});
	 <?php } ?>
	 <?php if (isset($products['next'])) { ?>
	$('#next-prod-btn').popover({
		html: true,
		placement: 'bottom',
		trigger: 'hover',
		content: function() {
			html  = '<div class="popover-pr-image"><img class="img-responsive" src="<?php echo $products['next']['image'];?>" title="" alt="" /></div>';
			html += '<div class="popover-pr-name"><?php echo addslashes($products['next']['name']);?></div>';
			html += '<div class="price">';
			html += '	<?php if ($products['next']['price']) { ?>';
			html += '	  <?php if (!$products['next']['special']) { ?>';
			html += '		<span><?php echo $products['next']['price']; ?></span>';
			html += '	  <?php } else { ?>';
			html += '		<span class="price-old"><span><?php echo $products['next']['price']; ?></span></span> <span class="price-new"><span><?php echo $products['next']['special']; ?></span></span>';
			html += '	  <?php } ?>';
			html += '	<?php } ?>';
			html += '</div>';	
			return html;
		}
	});
	<?php } ?>
	</script>
</div>
<div class="clearfix"></div>
