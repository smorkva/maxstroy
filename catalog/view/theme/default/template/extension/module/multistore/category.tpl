<div class="multistore">
  <ul id="multistores-<?php echo $hash; ?>" class="multistores-loading list-group"></ul>
  <script>
    document.addEventListener("DOMContentLoaded", function(){
      const multistore<?php echo $hash; ?> = new Multistore({
        url: '<?php echo $get; ?>',
        hash: '<?php echo $hash; ?>',
      });
    });
  </script>
</div>

