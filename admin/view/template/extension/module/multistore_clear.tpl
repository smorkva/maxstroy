<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if (!empty($errors)) { ?>
      <?php foreach($errors as $error) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?>
          <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
      <?php } ?>
    <?php } ?>
    <?php if (!empty($success)) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $text_quantity_clear; ?></div>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-review" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-category"><?php echo $entry_category; ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="min-height: 150px;max-height: 500px;overflow: auto;">
                <table class="table table-striped">
                  <?php foreach ($categories as $category) { ?>
                    <tr>
                      <td class="checkbox">
                        <label>
                          <?php if (in_array($category['category_id'], $checked_category)) { ?>
                          <input type="checkbox" name="checked_category[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                          <?php echo $category['name']; ?>
                          <?php } else { ?>
                          <input type="checkbox" name="checked_category[]" value="<?php echo $category['category_id']; ?>" />
                          <?php echo $category['name']; ?>
                          <?php } ?>
                        </label>
                      </td>
                    </tr>
                  <?php } ?>
                </table>
              </div>
              <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-manufacturer"><?php echo $entry_manufacturer; ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="min-height: 150px;max-height: 500px;overflow: auto;">
                <table class="table table-striped">
                  <?php foreach ($manufacturers as $manufacturer) { ?>
                    <tr>
                      <td class="checkbox">
                        <label>
                          <?php if (in_array($manufacturer['manufacturer_id'], $checked_manufacturer)) { ?>
                          <input type="checkbox" name="checked_manufacturer[]" value="<?php echo $manufacturer['manufacturer_id']; ?>" checked="checked" />
                          <?php echo $manufacturer['name']; ?>
                          <?php } else { ?>
                          <input type="checkbox" name="checked_manufacturer[]" value="<?php echo $manufacturer['manufacturer_id']; ?>" />
                          <?php echo $manufacturer['name']; ?>
                          <?php } ?>
                        </label>
                      </td>
                    </tr>
                  <?php } ?>
                </table>
              </div>
              <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-multistore"><?php echo $entry_multistore; ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="min-height: 150px;max-height: 500px;overflow: auto;">
                <table class="table table-striped">
                  <?php foreach ($multistores as $multistore) { ?>
                    <tr>
                      <td class="checkbox">
                        <label>
                          <?php if (in_array($multistore['multistore_id'], $checked_multistore)) { ?>
                          <input type="checkbox" name="checked_multistore[]" value="<?php echo $multistore['multistore_id']; ?>" checked="checked" />
                          <?php echo $multistore['name']; ?>
                          <?php } else { ?>
                          <input type="checkbox" name="checked_multistore[]" value="<?php echo $multistore['multistore_id']; ?>" />
                          <?php echo $multistore['name']; ?>
                          <?php } ?>
                        </label>
                      </td>
                    </tr>
                  <?php } ?>
                </table>
              </div>
              <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-2"></div>
            <div class="col-sm-10">
              <button type="submit" class="btn btn-danger"><?php echo $button_clear; ?></button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>