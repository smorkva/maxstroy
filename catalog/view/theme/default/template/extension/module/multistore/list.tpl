<?php if (!empty($multistores)) { ?>
<?php foreach($multistores as $multistore){ ?>
  <li class="list-group-item" id="multistore-<?php echo $multistore['multistore_id']; ?>">
    <p class="list-group-item-heading">
      <b><?php echo $multistore['name']; ?></b>
      <span class="badge pull-right" <?php if (!empty($multistore['color'])) { ?> style="background-color: <?php echo $multistore['color']; ?>" <?php } ?>><?php echo $multistore['quantity']; ?></span>
    </p>
    <p class="list-group-item-text"><?php echo $multistore['description']; ?></p>
  </li>
<?php } ?>
<?php } else { ?>
  <div><?php echo $text_not_multistore; ?></div>
<?php } ?>