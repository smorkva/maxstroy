<div class="pull-left">
  <div class="btn-group" id="multistore-selector">
    <button class="btn btn-link dropdown-toggle" data-toggle="dropdown" style="padding-top: 0;padding-bottom: 0;">
      <i class="fa fa-map-marker" style="margin-right:6px;font-size: 20px;color: #fa4646;"></i> <span class="hidden-xs hidden-sm" style="font-weight: bold;color: black;font-size: 20px;"><?php echo $selected_name; ?></span> <i class="fa fa-caret-down"></i>
    </button>
    <ul class="dropdown-menu">
      <?php foreach ($multistores as $multistore) { ?>
      <li>
        <button class="multistore-select btn btn-link btn-block" type="button" data-id="<?php echo $multistore['multistore_id']; ?>" <?php if ($selected == $multistore['multistore_id']) { ?>style="font-weight:bold;color:#333"<?php } ?>>
          <?php echo $multistore['name']; ?>
        </button>
      </li>
      <?php } ?>
    </ul>
  </div>
</div>
<script>
var multistorePhones = {};
var multistoreMapData = {};
<?php foreach ($multistores as $multistore) { ?>
multistorePhones[<?php echo $multistore['multistore_id']; ?>] = <?php echo json_encode($multistore['phones']); ?>;
multistoreMapData[<?php echo $multistore['multistore_id']; ?>] = <?php echo json_encode($multistore['map_data']); ?>;
<?php } ?>

$('.multistore-select').on('click', function(){
  var id = $(this).data('id');
  $.post('<?php echo $action; ?>', {multistore_id: id}, function(){
    location.reload();
  });
});
</script>
