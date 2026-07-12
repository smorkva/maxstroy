<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-review" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-review" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <?php foreach ($languages as $language) { ?>
                <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                  <input type="text" name="description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($description[$language['language_id']]) ? $description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" />
                </div>
              <?php } ?>
              <?php if (!empty($error_name)) { ?>
                <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_description; ?></label>
            <div class="col-sm-10">
              <?php foreach ($languages as $language) { ?>
                <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                  <textarea name="description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" class="form-control summernote" id="input-description-<?php echo $language['language_id']; ?>" rows="5"><?php echo isset($description[$language['language_id']]) ? $description[$language['language_id']]['description'] : ''; ?></textarea>
                </div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-type"><?php echo $entry_type; ?></label>
            <div class="col-sm-10">
              <select name="type" id="input-type" class="form-control">
                <?php foreach($stock_types as $key => $name) { ?>
                <?php if ($type == $key) { ?>
                <option value="<?= $key; ?>" selected="selected"><?= $name; ?></option>
                <?php } else { ?>
                <option value="<?= $key; ?>"><?= $name; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
            <div class="col-sm-10">
              <select name="geo_zone_id" id="input-geo-zone" class="form-control">
                <option value="0"><?= $text_geo_all; ?></option>
                <?php foreach($geo_zones as $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $geo_zone_id) { ?>
                <option value="<?= $geo_zone['geo_zone_id']; ?>" selected="selected"><?= $geo_zone['name']; ?></option>
                <?php } else { ?>
                <option value="<?= $geo_zone['geo_zone_id']; ?>"><?= $geo_zone['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($stores as $store) { ?>
                <div class="checkbox">
                  <label>
                    <?php if (in_array($store['store_id'], $multistore_store)) { ?>
                    <input type="checkbox" name="multistore_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="multistore_store[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-infinity"><?php echo $entry_infinity; ?></label>
            <div class="col-sm-10">
              <select name="infinity" id="input-infinity" class="form-control">
                <?php if ($infinity) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-alias"><?php echo $entry_alias; ?></label>
            <div class="col-sm-10">
              <input type="text" name="alias" value="<?php echo $alias; ?>" placeholder="<?php echo $entry_alias; ?>" id="input-alias" class="form-control" />
              <?php if (!empty($error_alias)) { ?>
                <div class="text-danger"><?php echo $error_alias; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort; ?></label>
            <div class="col-sm-10">
              <input type="number" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">Телефони</label>
            <div class="col-sm-10">
              <div id="multistore-phones">
                <?php $phone_row = 0; ?>
                <?php if (!empty($phones)) { foreach ($phones as $phone) { ?>
                <div class="input-group" style="margin-bottom:5px;">
                  <span class="input-group-addon" style="cursor:pointer;" onclick="iconPicker(this)" title="Натисніть для вибору іконки">
                    <?php if (!empty($phone['icon'])) { ?><i class="<?php echo $phone['icon']; ?>"></i><?php } else { ?>Іконка<?php } ?>
                  </span>
                  <input type="hidden" name="phones[<?php echo $phone_row; ?>][icon]" value="<?php echo isset($phone['icon']) ? $phone['icon'] : ''; ?>" />
                  <input type="text" name="phones[<?php echo $phone_row; ?>][name]" value="<?php echo isset($phone['name']) ? $phone['name'] : ''; ?>" placeholder="Ім'я / опис" class="form-control" />
                  <input type="text" name="phones[<?php echo $phone_row; ?>][number]" value="<?php echo isset($phone['number']) ? $phone['number'] : ''; ?>" placeholder="Номер телефону" class="form-control" />
                  <span class="input-group-btn"><a class="btn btn-danger" onclick="$(this).closest('.input-group').remove()"><i class="fa fa-trash-o"></i></a></span>
                </div>
                <?php $phone_row++; } } ?>
              </div>
              <a onclick="addMultistorePhone();" class="btn btn-primary" style="margin-top:5px;"><i class="fa fa-plus"></i> Додати телефон</a>
            </div>
          </div>
          <script>
          var ms_phone_row = <?php echo $phone_row; ?>;
          function addMultistorePhone() {
            var html = '<div class="input-group" style="margin-bottom:5px;">';
            html += '<span class="input-group-addon" style="cursor:pointer;" onclick="iconPicker(this)" title="Натисніть для вибору іконки">Іконка</span>';
            html += '<input type="hidden" name="phones['+ ms_phone_row +'][icon]" value="" />';
            html += '<input type="text" name="phones['+ ms_phone_row +'][name]" value="" placeholder="Ім\'я / опис" class="form-control" />';
            html += '<input type="text" name="phones['+ ms_phone_row +'][number]" value="" placeholder="Номер телефону" class="form-control" />';
            html += '<span class="input-group-btn"><a class="btn btn-danger" onclick="$(this).closest(\'.input-group\').remove()"><i class="fa fa-trash-o"></i></a></span>';
            html += '</div>';
            $('#multistore-phones').append(html);
            ms_phone_row++;
          }
          function iconPicker(el) {
            var current = $(el).next('input[type=hidden]').val();
            var icon = prompt('Введіть клас іконки FontAwesome (наприклад: fa fa-phone, fa fa-whatsapp)', current);
            if (icon !== null) {
              $(el).next('input[type=hidden]').val(icon);
              if (icon) {
                $(el).html('<i class="' + icon + '"></i>');
              } else {
                $(el).html('Іконка');
              }
            }
          }
          </script>
          <div class="form-group">
            <label class="col-sm-2 control-label">Карта</label>
            <div class="col-sm-10">
              <div class="row">
                <div class="col-sm-4">
                  <label>Широта (lat)</label>
                  <input type="text" name="map_data[lat]" value="<?php echo isset($map_data['lat']) ? $map_data['lat'] : ''; ?>" placeholder="47.954141" class="form-control" />
                </div>
                <div class="col-sm-4">
                  <label>Довгота (lng)</label>
                  <input type="text" name="map_data[lng]" value="<?php echo isset($map_data['lng']) ? $map_data['lng'] : ''; ?>" placeholder="35.250122" class="form-control" />
                </div>
                <div class="col-sm-4">
                  <label>Зум</label>
                  <input type="number" name="map_data[zoom]" value="<?php echo isset($map_data['zoom']) ? $map_data['zoom'] : '14'; ?>" placeholder="14" class="form-control" min="1" max="20" />
                </div>
              </div>
              <div class="row" style="margin-top:10px;">
                <div class="col-sm-12">
                  <label>Назва маркера</label>
                  <input type="text" name="map_data[marker_title]" value="<?php echo isset($map_data['marker_title']) ? $map_data['marker_title'] : ''; ?>" placeholder="Торговий зал Максим" class="form-control" />
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
<?php if (isset($ckeditor) && $ckeditor) { ?>
  <script>
    <?php foreach ($languages as $language) { ?>
      ckeditorInit('input-description-<?php echo $language['language_id']; ?>', getURLVar('token'));
    <?php } ?>
  </script>
<?php } ?>