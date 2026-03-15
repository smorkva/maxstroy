<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-reviews-store" formaction="<?php echo $action; ?>" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form method="post" enctype="multipart/form-data" id="form-reviews-store" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
				  <?php if ($error_name) { ?>
				  <div class="text-danger"><?php echo $error_name; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
				</div>
			  </div>
			   <div class="form-group">
				<label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit_table; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="limit_tablet" value="<?php echo (isset($limit_tablet) ? $limit_tablet : '2') ?>" placeholder="<?php echo $entry_limit_table; ?>" id="input-limit" class="form-control" />
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit_mob; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="limit_mob" value="<?php echo (isset($limit_mob) ? $limit_mob : '1') ?>" placeholder="<?php echo $entry_limit_mob; ?>" id="input-limit" class="form-control" />
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-entry_status_showmore"><?php echo $entry_status_showmore; ?></label>
				<div class="col-sm-10">
				  <select name="status_showmore" id="input-entry_status_showmore" class="form-control">
					<?php if ($status_showmore) { ?>
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
				<label class="col-sm-2 control-label" for="input-limit-max"><?php echo $entry_limit_max; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="limit_max" value="<?php echo (isset($limit_max) ? $limit_max : '') ?>" placeholder="<?php echo $entry_limit_max; ?>" id="input-limit-max" class="form-control" />
				</div>
			  </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status-reviews-store"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="status" id="input-status-reviews-store" class="form-control">
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
			  
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
