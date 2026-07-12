<div class="multistore">
<h3><?php if ($multistore_title) echo $multistore_title; ?></h3>
<?php if (!empty($multistore_before)) echo $multistore_before; ?>
<ul id="multistores-<?php echo $hash; ?>" class="multistores-loading list-group"></ul>
<?php if (!empty($multistore_after)) echo $multistore_after; ?>
<script>
	document.addEventListener("DOMContentLoaded", function(){
		const multistore<?php echo $hash; ?> = new Multistore({
			url: '<?php echo $get; ?>',
			hash: '<?php echo $hash; ?>'
		});
	});
</script>
</div>