<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-pctabs" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-pctabs" class="form-horizontal">
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
                <label class="col-sm-2 control-label" for="input-category"><?php echo $entry_category; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="min-height: 150px;max-height: 500px;overflow: auto;">
                    <table class="table table-striped">
                    <?php foreach ($categories as $category) { ?>
                    <tr>
                      <td class="checkbox">
                        <label>
                          <?php if (in_array($category['category_id'], $category_sel)) { ?>
                          <input type="checkbox" name="category_sel[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                          <?php echo $category['name']; ?>
                          <?php } else { ?>
                          <input type="checkbox" name="category_sel[]" value="<?php echo $category['category_id']; ?>" />
                          <?php echo $category['name']; ?>
                          <?php } ?>
                        </label>
                      </td>
                    </tr>
                    <?php } ?>
                    </table>
                  </div>
                  </div>
              </div>
		   
		  
		   <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_sort; ?></label>
            <div class="col-sm-10">
             <select name="sorts_product" id="input-sort" class="form-control">
            <?php foreach ($sorts as $sorts) { ?>
			<?php if ($sorts['value'] == $sorts_product) { ?>
            <option value="<?php echo $sorts['value']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['value']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
            </div>
          </div>
		  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-filter_sub_category"><?php echo $entry_sub_category; ?></label>
				<div class="col-sm-10">
				  <select name="filter_sub_category" id="input-filter_sub_category" class="form-control">
					<?php if ($filter_sub_category) { ?>
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
				  <input type="text" name="limit_max" value="<?php echo $limit_max; ?>" placeholder="<?php echo $entry_limit_max; ?>" id="input-limit-max" class="form-control" />
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
              <input type="text" name="limit_tablet" value="<?php echo $limit_tablet; ?>" placeholder="<?php echo $entry_limit_table; ?>" id="input-limit" class="form-control" />
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit_mob; ?></label>
            <div class="col-sm-10">
              <input type="text" name="limit_mob" value="<?php echo $limit_mob; ?>" placeholder="<?php echo $entry_limit_mob; ?>" id="input-limit" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
            <div class="col-sm-10">
              <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
            <div class="col-sm-10">
              <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
            </div>
          </div>
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
        </form>
      </div>
    </div>
  </div>
</div>
<style>
.hide-radio {
	display:none;
}
.radio-group-infinity {
	display: inline-block;
	margin-top: 9px;
	border-radius:15px;
	background-color: white;
	background-image: linear-gradient(to bottom, #eeeeee, white 25px);
	padding:3px;
	box-shadow: 0 -1px white inset, 0 1px 1px rgba(0, 0, 0, 0.05) inset;
}
.hide-radio + label {
	background: #eceeef none repeat scroll 0 0;
	color: #fff;
	display: block;
	float: left;
	font-family: "Oswald",sans-serif;
	padding: 5px 0;
	text-align: center;
	-webkit-transition: background-image 0.15s ease-in-out;
	-moz-transition: background-image 0.15s ease-in-out;
	-o-transition: background-color 0.15s ease-in-out;
	transition: background-image 0.15s ease-in-out;
	width: 45px;
	margin-bottom:0px;	
	position:relative;
	color:#969696;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.15) inset, 0 0 3px rgba(0, 0, 0, 0.2) inset;
	text-shadow:0 1px rgba(255, 255, 255, 0.8);
}
.hide-radio + label:hover {
	box-shadow:2px 3px 3px rgba(0, 0, 0, 0.25) inset;
}
.hide-radio:first-child + label{
	border-radius:15px 0px 0px 15px;
}
.radio-group-infinity > label:last-child{
	border-radius:0px 15px 15px 0px;	
	margin-left:-1px;
}
 
.hide-radio:checked + label {
	background-image: linear-gradient(#47a8d8, #47a8d8);
	display: inline-block;
	margin-bottom:0px;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.15) inset, 0 0 3px rgba(0, 0, 0, 0.2) inset;
	color:#fff;
	text-shadow:0 1px rgba(0, 0, 0, 0.2);
}

</style>
<?php echo $footer; ?>