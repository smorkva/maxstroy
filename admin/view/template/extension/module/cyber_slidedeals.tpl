<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-slidedeals" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-slidedeals" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-3 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-9">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div> 
			<div class="form-group">
			  <label for="input-verdeals" class="col-sm-3 control-label"><?php echo $text_verdeals;?></label>
			  <div class="col-sm-9">
				<select onchange="change_verdeals(this.value);" class="form-control" id="input-verdeals" name="verdeals">
					<?php if($verdeals =='1') { ?>
					<option selected="selected" value="1">№1</option>
					<?php } else { ?>
					<option value="1">№1</option>
					<?php } ?>
					<?php if($verdeals =='0') { ?>
					 <option selected="selected" value="0">№2</option>
					<?php } else { ?>
					 <option value="0">№2</option>
					<?php } ?>          
				</select>
			  </div>
			</div>
			<script>
				$(window).load(function(){ 
					var verdeals = $('#input-verdeals option:selected').val();		
					if (verdeals =='1') {
						$('.show_td').addClass('active');
					} else if (verdeals =='0') {
						$('.show_td').removeClass('active');
					}
				})
				function change_verdeals(verdeals){	
					if (verdeals =='1') {
						$('.show_td').addClass('active');
					} else if (verdeals =='0') {
						$('.show_td').removeClass('active');
					}
				}
			</script>
			<div class="form-group show_td">
				<label class="col-sm-3 control-label"><?php echo $text_title; ?></label>
				<div class="col-sm-9">
				<tr>
					<td class="text-left">
					<?php foreach ($languages as $language) { ?>
                       <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                          <textarea name="title[<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="" class="form-control"><?php echo isset($title[$language['language_id']]) ? $title[$language['language_id']]['text'] : ''; ?></textarea>
                        </div>
                    <?php } ?>
					</td>
				</tr>
				</div>
			</div>
			<div class="form-group show_td">
				<label class="col-sm-3 control-label"><?php echo $text_description; ?></label>
				<div class="col-sm-9">
				<tr>
					<td class="text-left">
					<?php foreach ($languages as $language) { ?>
                       <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                          <textarea name="description[<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="" class="form-control"><?php echo isset($description[$language['language_id']]) ? $description[$language['language_id']]['text'] : ''; ?></textarea>
                        </div>
                    <?php } ?>
					</td>
				</tr>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $text_on_off_model_product;?></label>
				<div class="col-sm-9">
					<div class="checkbox-group-pixelshop">
						<label><input type="checkbox" name="on_off_model_product" value="1" <?php echo isset($on_off_model_product) && $on_off_model_product =='1' ? 'checked="checked"' : '' ?> /><span></span></label>						 
					</div>
				</div>
			</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_on_off_description;?></label>
					<div class="col-sm-9">
						<div class="checkbox-group-pixelshop">
							<label><input type="checkbox" name="on_off_description" value="1" <?php echo isset($on_off_description) && $on_off_description =='1' ? 'checked="checked"' : '' ?> /><span></span></label>						 
						</div>
					</div>
				</div>
				<div class="form-group">
                  <label for="input-config_on_off_productany_slider_additional_image" class="col-sm-3 control-label"><?php echo $text_additional_image;?></label>
                  <div class="col-sm-9">
                    <select class="form-control" id="on_off_productany_slider_additional_image" name="on_off_slider_additional_image">
						
						<?php if($on_off_slider_additional_image =='2') { ?>
						<option selected="selected" value="2"><?php echo $text_additional_image_hover;?></option>
						<?php } else { ?>
						<option value="2"><?php echo $text_additional_image_hover;?></option>
						<?php } ?>
                        <?php if($on_off_slider_additional_image =='0') { ?>
						 <option selected="selected" value="0"><?php echo $text_no; ?></option>
						<?php } else { ?>
						 <option value="0"><?php echo $text_no; ?></option>
						<?php } ?>          
                    </select>
                  </div>
                </div>
				
				
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_on_off_rating;?></label>
					<div class="col-sm-9">
						<div class="checkbox-group-pixelshop">
							<label><input type="checkbox" name="on_off_rating" value="1" <?php echo isset($on_off_rating) && $on_off_rating =='1' ? 'checked="checked"' : '' ?> /><span></span></label>						 
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_on_off_quantity_reviews;?></label>
					<div class="col-sm-9">
						<div class="checkbox-group-pixelshop">
							<label><input type="checkbox" name="on_off_quantity_reviews" value="1" <?php echo isset($on_off_quantity_reviews) && $on_off_quantity_reviews =='1' ? 'checked="checked"' : '' ?> /><span></span></label>						 
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_on_off_fastorder;?></label>
					<div class="col-sm-9">
						<div class="checkbox-group-pixelshop">
							<label><input type="checkbox" name="on_off_fastorder" value="1" <?php echo isset($on_off_fastorder) && $on_off_fastorder =='1' ? 'checked="checked"' : '' ?> /><span></span></label>						 
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_on_off_wishlist;?></label>
					<div class="col-sm-9">
						<div class="checkbox-group-pixelshop">
							<label><input type="checkbox" name="on_off_wishlist" value="1" <?php echo isset($on_off_wishlist) && $on_off_wishlist =='1' ? 'checked="checked"' : '' ?> /><span></span></label>						 
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_on_off_compare;?></label>
					<div class="col-sm-9">
						<div class="checkbox-group-pixelshop">
							<label><input type="checkbox" name="on_off_compare" value="1" <?php echo isset($on_off_compare) && $on_off_compare =='1' ? 'checked="checked"' : '' ?> /><span></span></label>						 
						</div>
					</div>
				</div>
			
			
			
			
			
			<div class="form-group">
				<label class="col-sm-3 control-label" for="input-bg-timer"><?php echo $entry_bg_timer; ?></label>
				<div class="col-sm-9">
				  <input type="text" name="bg_timer" value="<?php echo $bg_timer; ?>" id="input-bg-timer" class="form-control color" />
				</div>
			</div>
          <div class="form-group">
            <label class="col-sm-3 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-9">
              <input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label" for="input-width"><?php echo $entry_width; ?></label>
            <div class="col-sm-9">
              <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label" for="input-height"><?php echo $entry_height; ?></label>
            <div class="col-sm-9">
              <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-3 control-label" for="input-statu-stimer-special"><?php echo $entry_timer; ?></label>
            <div class="col-sm-9">
              <select name="status_timer_special" id="input-statu-stimer-special" class="form-control">
                <?php if ($status_timer_special) { ?>
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
            <label class="col-sm-3 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-9">
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
.show_td {
	display:none;
}
.show_td.active {
	display:block;
}
.checkbox-group-pixelshop label {margin-bottom:0px;}
.checkbox-group-pixelshop {
	background-color: white;
	background-image: linear-gradient(to bottom, #eeeeee, white 25px);
	border-radius: 20px / 20px;
	box-shadow: 0 -1px white inset, 0 1px 1px rgba(0, 0, 0, 0.05) inset;
	display: inline-block;
	padding: 3px;
}
.checkbox-group-pixelshop input[type="checkbox"] {display:none}
.checkbox-group-pixelshop input[type="checkbox"] + span {
position:relative;
display:inline-block;
vertical-align:middle;
width:50px;
height:23px;
background:#ECEEEF;
border-radius:20px / 20px;
box-shadow:0 1px 2px rgba(0, 0, 0, 0.15) inset, 0 0 3px rgba(0, 0, 0, 0.2) inset;
cursor:pointer;
transition:all ease-in-out .2s;}
.checkbox-group-pixelshop input[type="checkbox"]:checked + span {background:#3F95C0;}

.checkbox-group-pixelshop label:hover input[type="checkbox"] + span {background:#ECEEEF;}
.checkbox-group-pixelshop label:hover input[type="checkbox"]:checked + span {background:#3F95C0;}

.checkbox-group-pixelshop input[type="checkbox"] + span:after {position:absolute;left:auto;top:3px;right:3px;width:17px;height:17px;content:'';background:#fff;border-radius:100%;box-shadow:0 1px 1px #777;transition:all ease-in-out .2s;}
.checkbox-group-pixelshop input[type="checkbox"]:checked + span:after {left:3px;right:auto;background:#fff;transition:all ease-in-out .2s;}

</style>
<?php echo $footer; ?>