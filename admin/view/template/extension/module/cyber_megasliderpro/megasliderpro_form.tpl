<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right" id="buttons-apply">
		<a onclick="apply_btn()" id="btn-apply-setting" class="btn btn-success" data-toggle="tooltip" title="<?php echo $text_btn_apply;?>" data-placement="bottom"><i class="fa fa-check"></i></a>
        <button type="submit" form="form-megasliderpro" data-toggle="tooltip" data-placement="bottom" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" data-placement="bottom" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
      <script src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script src="view/javascript/summernote/opencart.js"></script>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
	<?php if ($error_megasliderpro_image) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_megasliderpro_image; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-megasliderpro" class="form-horizontal">
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
		  
		  	<div class="form-group">
				<label class="col-sm-2 control-label" for="input-effect"><?php echo $entry_effect; ?></label>
				<div class="col-sm-10">
				<select name="effect" id="input-effect" class="form-control">
					<?php $effects = $effect_option; ?>
					<?php if($effects) {?>
						<?php foreach($effects as $effect1) { ?>
							<option <?php if($effect1['value'] == $effect) { echo 'selected ="selected"'; } ?>  value=<?php echo $effect1['value'];?>><?php echo $effect1['label']; ?></option>
						<?php } ?>
					<?php } ?>
				</select>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-delay"><?php echo $entry_delay; ?></label>
				<div class="col-sm-10">
					<input type="text" name="delay" value="<?php echo $delay; ?>" placeholder="<?php echo $entry_delay; ?>" id="input-delay" class="form-control" />
					  <?php if ($error_delay) { ?>
					  <div class="text-danger"><?php echo $error_delay; ?></div>
					  <?php } ?>
				</div>
			</div>
		    
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-hover"><?php echo $entry_hover; ?></label>
            <div class="col-sm-10">
              <select name="hover" id="input-hover" class="form-control">
                 <?php if ($hover) { ?>
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
            <label class="col-sm-2 control-label" for="input-nextback"><?php echo $entry_nextback; ?></label>
            <div class="col-sm-10">
              <select name="nextback" id="input-nextback" class="form-control">
                 <?php if ($nextback) { ?>
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
            <label class="col-sm-2 control-label" for="input-contrl"><?php echo $entry_contrl; ?></label>
            <div class="col-sm-10">
              <select name="contrl" id="input-contrl" class="form-control">
                <?php if ($contrl) { ?>
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
          <div class="row">
            <div class="col-sm-2">
              <ul class="nav nav-pills nav-stacked" id="module">
                <?php $module_row = 1; ?>
                <?php foreach ($megaslider_images as $megaslider_image) { ?>
                <li><a href="#tab-module<?php echo $module_row; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-module<?php echo $module_row; ?>\']').parent().remove(); $('#tab-module<?php echo $module_row; ?>').remove(); $('#module a:first').tab('show');"></i> <?php echo $tab_slider . ' ' . $module_row; ?></a></li>
                <?php $module_row++; ?>
                <?php } ?>
                <li id="module-add"><a onclick="addModule();"><i class="fa fa-plus-circle"></i> <?php echo $button_add_banner; ?></a></li>
              </ul>
            </div>
            <div class="col-sm-10">
              <div class="tab-content">
			    <?php $module_row = 1; ?>
			    <?php foreach ($megaslider_images as $megaslider_image) { ?>
                <div class="tab-pane" id="tab-module<?php echo $module_row; ?>">
					<ul class="nav nav-tabs" id="language<?php echo $module_row; ?>">
						<?php foreach ($languages as $language) { ?>
							<li><a href="#tab-module<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
						<?php } ?>
					</ul>
					<div class="tab-content">
						<?php foreach ($languages as $language) { ?>
						<div class="tab-pane" id="tab-module<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-heading<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
								<div class="col-sm-10">
									<input type="text" name="megaslider_image[<?php echo $module_row; ?>][megaslider_image_description][<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($megaslider_image['megaslider_image_description'][$language['language_id']]) ? $megaslider_image['megaslider_image_description'][$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
								</div>
							</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-effect-title<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_effect_title; ?></label>
							<div class="col-sm-10">
							<select name="megaslider_image[<?php echo $module_row; ?>][megaslider_image_description][<?php echo $language['language_id']; ?>][effect_title]" class="form-control">
								<?php 
								if(!empty($megaslider_image['megaslider_image_description'][$language['language_id']]['effect_title'])){
									$effect_title = $megaslider_image['megaslider_image_description'][$language['language_id']]['effect_title'];
								} else {
									$effect_title = 'no_select';
								}
								?>
								<?php if($effect_title == 'no_select') { ?>
								<option selected="selected" value="no_select"><?php echo $text_select; ?></option>
								<?php } else { ?>
								<option value="no_select"><?php echo $text_select; ?></option>
								<?php } ?>
								<?php if($effect_text_options) {?>
									<?php foreach($effect_text_options as $result) { ?>
										<option <?php if($result['value'] == $effect_title) { echo 'selected="selected"'; } ?>  value="<?php echo $result['value'];?>"><?php echo $result['label']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
							</div>
						</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-bg_title<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_bg_title; ?></label>
								<div class="col-sm-10">
									<input type="text" name="megaslider_image[<?php echo $module_row; ?>][megaslider_image_description][<?php echo $language['language_id']; ?>][bg_title]" value="<?php echo isset($megaslider_image['megaslider_image_description'][$language['language_id']]['bg_title']) ? $megaslider_image['megaslider_image_description'][$language['language_id']]['bg_title'] : ''; ?>" class="form-control color" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-opacity_bg_title<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_opacity; ?></label>
								<div class="col-sm-2">
									<input type="number" min="0.0" max="1.0" step="0.01" name="megaslider_image[<?php echo $module_row; ?>][megaslider_image_description][<?php echo $language['language_id']; ?>][opacity_bg_title]" value="<?php echo isset($megaslider_image['megaslider_image_description'][$language['language_id']]['opacity_bg_title']) ? $megaslider_image['megaslider_image_description'][$language['language_id']]['opacity_bg_title'] : '1.0'; ?>" class="form-control" />
									
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-color_title<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_color_title; ?></label>
								<div class="col-sm-10">
									<input type="text" name="megaslider_image[<?php echo $module_row; ?>][megaslider_image_description][<?php echo $language['language_id']; ?>][color_title]" value="<?php echo isset($megaslider_image['megaslider_image_description'][$language['language_id']]['color_title']) ? $megaslider_image['megaslider_image_description'][$language['language_id']]['color_title'] : ''; ?>" class="form-control color" />
								</div>
							</div> 							
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-sub_title<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_subtitle; ?></label>
								<div class="col-sm-10">
									<input type="text" name="megaslider_image[<?php echo $module_row; ?>][megaslider_image_description][<?php echo $language['language_id']; ?>][sub_title]" value="<?php echo isset($megaslider_image['megaslider_image_description'][$language['language_id']]) ? $megaslider_image['megaslider_image_description'][$language['language_id']]['sub_title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-effect_sub_title<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_effect_sub_title; ?></label>
								<div class="col-sm-10">
								<select name="megaslider_image[<?php echo $module_row; ?>][megaslider_image_description][<?php echo $language['language_id']; ?>][effect_sub_title]" class="form-control">
									<?php 
									if(!empty($megaslider_image['megaslider_image_description'][$language['language_id']]['effect_sub_title'])){
										$effect_sub_title = $megaslider_image['megaslider_image_description'][$language['language_id']]['effect_sub_title'];
									} else {
										$effect_sub_title = 'no_select';
									}
									?>
									<?php if($effect_sub_title == 'no_select') { ?>
									<option selected="selected" value="no_select"><?php echo $text_select; ?></option>
									<?php } else { ?>
									<option value="no_select"><?php echo $text_select; ?></option>
									<?php } ?>
									<?php if($effect_text_options) {?>
										<?php foreach($effect_text_options as $result) { ?>
											<option <?php if($result['value'] == $effect_sub_title) { echo 'selected="selected"'; } ?>  value="<?php echo $result['value'];?>"><?php echo $result['label']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-bg_sub_title<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_bg_sub_title; ?></label>
								<div class="col-sm-10">
									<input type="text" name="megaslider_image[<?php echo $module_row; ?>][megaslider_image_description][<?php echo $language['language_id']; ?>][bg_sub_title]" value="<?php echo isset($megaslider_image['megaslider_image_description'][$language['language_id']]['bg_sub_title']) ? $megaslider_image['megaslider_image_description'][$language['language_id']]['bg_sub_title'] : ''; ?>" class="form-control color" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-opacity_bg_sub_title<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_opacity; ?></label>
								<div class="col-sm-2">
									<input type="number" min="0.0" max="1.0" step="0.01" name="megaslider_image[<?php echo $module_row; ?>][megaslider_image_description][<?php echo $language['language_id']; ?>][opacity_bg_sub_title]" value="<?php echo isset($megaslider_image['megaslider_image_description'][$language['language_id']]['opacity_bg_sub_title']) ? $megaslider_image['megaslider_image_description'][$language['language_id']]['opacity_bg_sub_title'] : '1.0'; ?>" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-color_sub_title<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_color_sub_title; ?></label>
								<div class="col-sm-10">
									<input type="text" name="megaslider_image[<?php echo $module_row; ?>][megaslider_image_description][<?php echo $language['language_id']; ?>][color_sub_title]" value="<?php echo isset($megaslider_image['megaslider_image_description'][$language['language_id']]['color_sub_title']) ? $megaslider_image['megaslider_image_description'][$language['language_id']]['color_sub_title'] : ''; ?>" class="form-control color" />
								</div>
							</div> 
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-effect_description_title<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_effect_description_title; ?></label>
								<div class="col-sm-10">
								<select name="megaslider_image[<?php echo $module_row; ?>][megaslider_image_description][<?php echo $language['language_id']; ?>][effect_description_title]" class="form-control">
									<?php 
									if(!empty($megaslider_image['megaslider_image_description'][$language['language_id']]['effect_description_title'])){
										$effect_description_title = $megaslider_image['megaslider_image_description'][$language['language_id']]['effect_description_title'];
									} else {
										$effect_description_title = 'no_select';
									}
									?>
									<?php if($effect_description_title == 'no_select') { ?>
									<option selected="selected" value="no_select"><?php echo $text_select; ?></option>
									<?php } else { ?>
									<option value="no_select"><?php echo $text_select; ?></option>
									<?php } ?>
									<?php if($effect_text_options) {?>
										<?php foreach($effect_text_options as $result) { ?>
											<option <?php if($result['value'] == $effect_description_title) { echo 'selected="selected"'; } ?>  value="<?php echo $result['value'];?>"><?php echo $result['label']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-description<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
								<div class="col-sm-10">
									<textarea name="megaslider_image[<?php echo $module_row; ?>][megaslider_image_description][<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($megaslider_image['megaslider_image_description'][$language['language_id']]) ? $megaslider_image['megaslider_image_description'][$language['language_id']]['description'] : ''; ?></textarea>
								</div>
							</div> 
						</div>
						<?php } ?>  
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-link<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_link; ?></label>
							<div class="col-sm-10">
								<input type="text" name="megaslider_image[<?php echo $module_row; ?>][link]" value="<?php echo isset($megaslider_image['link']) ? $megaslider_image['link'] : ''; ?>" placeholder="<?php echo $entry_link; ?>" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
							<div class="col-sm-10">
								<a href="" id="thumb-image-bg-<?php echo $module_row.'-'.$module_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo isset($megaslider_image['thumb']) ? $megaslider_image['thumb'] :  $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
								<input type="hidden"  name="megaslider_image[<?php echo $module_row; ?>][image]"  value="<?php echo $megaslider_image['image']; ?>" id="input-image-bg<?php echo $module_row.'-'.$module_row; ?>" /> 
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_small_image; ?></label>
							<div class="col-sm-10">
								<a href="" id="thumb-small_image-<?php echo $module_row.'-'.$module_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo isset($megaslider_image['small_thumb']) ? $megaslider_image['small_thumb'] :  $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
								<input type="hidden" name="megaslider_image[<?php echo $module_row; ?>][small_image]"  value="<?php echo $megaslider_image['small_image']; ?>" id="input-small_image<?php echo $module_row.'-'.$module_row; ?>" /> 
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_type; ?></label>
							<div class="col-sm-10">
								<select name="megaslider_image[<?php echo $module_row; ?>][type]" id="input-type" class="form-control">
									<?php if($megaslider_image['type'] == 1) { ?>
									<option value="1" selected="selected">1</option>
									<option value="2">2</option>
									<?php } elseif($megaslider_image['type'] == 2) { ?>
									<option value="1">1</option>
									<option value="2" selected="selected">2</option>														
									<?php } else { ?>
									<option value="1" selected="selected">1</option>
									<option value="2">2</option>									
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-link<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_sort_order; ?></label>
							<div class="col-sm-10">
								<input type="text" name="megaslider_image[<?php echo $module_row; ?>][sort_order]" value="<?php echo isset($megaslider_image['sort_order']) ? $megaslider_image['sort_order'] : '0'; ?>" placeholder="<?php echo $entry_link; ?>" class="form-control" />
							</div>
						</div>
					</div>
                </div>
<script><!--
$('#language<?php echo $module_row; ?> li:first-child a').tab('show');
<?php foreach ($languages as $language) { ?>
$('#input-description<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>').summernote({
	height: 300
});
<?php } ?>
//--></script>
				  <?php $module_row++; ?>
                <?php } ?>
              </div>
            </div>
          </div>
		  <input type="hidden" value="" class="megaslider_data" name="megaslider_data"/>
        </form>
      </div>
    </div>
  </div>
<script><!--
var module_row = <?php echo $module_row; ?>; 
function addModule() {
	html  = '<div class="tab-pane" id="tab-module' + module_row + '">';
	html += '  <ul class="nav nav-tabs" id="language' + module_row + '">';
    <?php foreach ($languages as $language) { ?>
    html += '    <li><a href="#tab-module' + module_row + '-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>';
    <?php } ?>
	html += '  </ul>';

	html += '  <div class="tab-content">';
	<?php foreach ($languages as $language) { ?>
	html += '    <div class="tab-pane" id="tab-module' + module_row + '-language<?php echo $language['language_id']; ?>">';
	
	html += '      <div class="form-group">';
	html += '        <label class="col-sm-2 control-label" for="input-title' + module_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>';
	html += '        <div class="col-sm-10"><input type="text" name="megaslider_image[' + module_row + '][megaslider_image_description][<?php echo $language['language_id']; ?>][title]"placeholder="<?php echo $entry_title; ?>" class="form-control" id="input-title' + module_row + '-language<?php echo $language['language_id']; ?>"/></div>';
	html += '      </div>';
	
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label" for="input-effect-title' + module_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_effect_title; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<select name="megaslider_image[' + module_row + '][megaslider_image_description][<?php echo $language['language_id']; ?>][effect_title]" class="form-control">';
	html += '				<option selected="selected" value="no_select"><?php echo $text_select; ?></option>';
	html += '				<?php if($effect_text_options) {?>';
	html += '				<?php foreach($effect_text_options as $result) { ?>';
	html += '				<option value="<?php echo $result['value'];?>"><?php echo $result['label']; ?></option>';
	html += '				<?php } ?>';
	html += '				<?php } ?>';
	html += '			</select>';
	html += '		</div>';
	html += '	</div>';
	
	html += '      <div class="form-group">';
	html += '        <label class="col-sm-2 control-label" for="input-bg_title' + module_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_bg_title; ?></label>';
	html += '        <div class="col-sm-10"><input type="text" name="megaslider_image[' + module_row + '][megaslider_image_description][<?php echo $language['language_id']; ?>][bg_title]"placeholder="<?php echo $entry_bg_title; ?>" class="form-control color" id="input-bg_title' + module_row + '-language<?php echo $language['language_id']; ?>"/></div>';
	html += '      </div>';
	
	html += '      <div class="form-group">';
	html += '        <label class="col-sm-2 control-label" for="input-opacity_bg_title' + module_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_opacity; ?></label>';
	html += '        <div class="col-sm-2"><input type="number" value="1.0" min="0.0" max="1.0" step="0.01" name="megaslider_image[' + module_row + '][megaslider_image_description][<?php echo $language['language_id']; ?>][opacity_bg_title]" class="form-control" id="input-opacity_bg_title' + module_row + '-language<?php echo $language['language_id']; ?>"/></div>';
	html += '      </div>';
	
	html += '      <div class="form-group">';
	html += '        <label class="col-sm-2 control-label" for="input-color_title' + module_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_color_title; ?></label>';
	html += '        <div class="col-sm-10"><input type="text" name="megaslider_image[' + module_row + '][megaslider_image_description][<?php echo $language['language_id']; ?>][color_title]" class="form-control color" id="input-color_title' + module_row + '-language<?php echo $language['language_id']; ?>"/></div>';
	html += '      </div>';
	
	html += '      <div class="form-group">';
	html += '        <label class="col-sm-2 control-label" for="input-subtitle' + module_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_subtitle; ?></label>';
	html += '        <div class="col-sm-10"><input class="form-control" type="text" name="megaslider_image[' + module_row + '][megaslider_image_description][<?php echo $language['language_id']; ?>][sub_title]" placeholder="<?php echo $entry_subtitle; ?>" id="input-subtitle' + module_row + '-language<?php echo $language['language_id']; ?>"/></div>';
	html += '      </div>';
	
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label" for="input-effect_sub_title' + module_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_effect_sub_title; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<select name="megaslider_image[' + module_row + '][megaslider_image_description][<?php echo $language['language_id']; ?>][effect_sub_title]" class="form-control">';
	html += '				<option selected="selected" value="no_select"><?php echo $text_select; ?></option>';
	html += '				<?php if($effect_text_options) {?>';
	html += '				<?php foreach($effect_text_options as $result) { ?>';
	html += '				<option value="<?php echo $result['value'];?>"><?php echo $result['label']; ?></option>';
	html += '				<?php } ?>';
	html += '				<?php } ?>';
	html += '			</select>';
	html += '		</div>';
	html += '	</div>';
	
	
	html += '      <div class="form-group">';
	html += '        <label class="col-sm-2 control-label" for="input-bg_sub_title' + module_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_bg_sub_title; ?></label>';
	html += '        <div class="col-sm-10"><input class="form-control color" type="text" name="megaslider_image[' + module_row + '][megaslider_image_description][<?php echo $language['language_id']; ?>][bg_sub_title]" id="input-bg_sub_title' + module_row + '-language<?php echo $language['language_id']; ?>"/></div>';
	html += '      </div>';
	
	html += '      <div class="form-group">';
	html += '        <label class="col-sm-2 control-label" for="input-opacity_bg_sub_title' + module_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_opacity; ?></label>';
	html += '        <div class="col-sm-2"><input class="form-control" type="number" value="1.0" min="0.0" max="1.0" step="0.01" name="megaslider_image[' + module_row + '][megaslider_image_description][<?php echo $language['language_id']; ?>][opacity_bg_sub_title]" id="input-opacity_bg_sub_title' + module_row + '-language<?php echo $language['language_id']; ?>"/></div>';
	html += '      </div>';
	
	html += '      <div class="form-group">';
	html += '        <label class="col-sm-2 control-label" for="input-color_sub_title' + module_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_color_sub_title; ?></label>';
	html += '        <div class="col-sm-10"><input class="form-control color" type="text" name="megaslider_image[' + module_row + '][megaslider_image_description][<?php echo $language['language_id']; ?>][color_sub_title]" id="input-color_sub_title' + module_row + '-language<?php echo $language['language_id']; ?>"/></div>';
	html += '      </div>';

	
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label" for="input-effect_description_title' + module_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_effect_description_title; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<select name="megaslider_image[' + module_row + '][megaslider_image_description][<?php echo $language['language_id']; ?>][effect_description_title]" class="form-control">';
	html += '				<option selected="selected" value="no_select"><?php echo $text_select; ?></option>';
	html += '				<?php if($effect_text_options) {?>';
	html += '				<?php foreach($effect_text_options as $result) { ?>';
	html += '				<option value="<?php echo $result['value'];?>"><?php echo $result['label']; ?></option>';
	html += '				<?php } ?>';
	html += '				<?php } ?>';
	html += '			</select>';
	html += '		</div>';
	html += '	</div>';
	
	html += '      <div class="form-group">';
	html += '        <label class="col-sm-2 control-label" for="input-description' + module_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>';
	html += '        <div class="col-sm-10"><textarea name="megaslider_image[' + module_row + '][megaslider_image_description][<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description' + module_row + '-language<?php echo $language['language_id']; ?>"></textarea></div>';
	html += '      </div>';
	html += '    </div>';
	<?php } ?>
	
	html += '      <div class="form-group">';
	html += '        <label class="col-sm-2 control-label" for="input-link' + module_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_link; ?></label>';
	html += '        <div class="col-sm-10"><input class="form-control" type="text" name="megaslider_image[' + module_row + '][link]" placeholder="<?php echo $entry_link; ?>" id="input-link' + module_row + '-language<?php echo $language['language_id']; ?>"/></div>';
	html += '      </div>';
	
	html += '      <div class="form-group">';
	html += '        	<label class="col-sm-2 control-label" for="input-image-bg' + module_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_image; ?></label>';
	html += '			<div class="col-sm-10"><a href="" id="thumb-image' + module_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="megaslider_image[' + module_row + '][image]" value="" id="input-image-bg' + module_row + '" /></div>';
	html += '      </div>';
	
	html += '		<div class="form-group">';
	html += '			<label class="col-sm-2 control-label" for="input-image">'+'<?php echo $entry_small_image; ?>'+'</label>';
	html += '			<div class="col-sm-10">';
	html += '				<a href="" id="thumb-small_image-'+ module_row +'" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>';
	html += '				<input type="hidden"  name="megaslider_image['+ module_row +'][small_image]"  value="" id="input-small_image'+module_row+'" />';
	html += '			</div>';
	html += '		</div>';
	
	html +='  		<div class="form-group">';
	html +='			<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_type; ?></label>';
	html +='			<div class="col-sm-10">';
	html +='				<select name="megaslider_image[' + module_row + '][type]" id="input-type" class="form-control">';
	html +='					<option value="1" >Type 1</option><option value="2">Type 2</option>';
	html +='				</select>';
	html +='			</div>';
	html +='		</div>';
	html += '      <div class="form-group">';
	html += '        <label class="col-sm-2 control-label" for="input-link' + module_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_sort_order; ?></label>';
	html += '        <div class="col-sm-10"><input class="form-control" type="text" name="megaslider_image[' + module_row + '][sort_order]" value="0" placeholder="<?php echo $entry_link; ?>" id="input-link' + module_row + '-language<?php echo $language['language_id']; ?>"/></div>';
	html += '      </div>';
	html += '</div>';
	html += '</div>';

	$('.tab-content:first-child').append(html);
	
	<?php foreach ($languages as $language) { ?>
	$('#input-description' + module_row + '-language<?php echo $language['language_id']; ?>').summernote({
		height: 300
	});
	<?php } ?>
	jscolor.bind();
	$('#module-add').before('<li><a href="#tab-module' + module_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-module' + module_row + '\\\']\').parent().remove(); $(\'#tab-module' + module_row + '\').remove(); $(\'#module a:first\').tab(\'show\');"></i> <?php echo $tab_slider; ?> ' + module_row + '</a></li>');

	$('#module a[href=\'#tab-module' + module_row + '\']').tab('show');

	$('#language' + module_row + ' li:first-child a').tab('show');
		
	module_row++;
}
//--></script> 
  <script><!--
$('#module li:first-child a').tab('show');
//--></script></div>
<script>
$(window).scroll(function(){
if ($(window).scrollTop() > 100){
$("#buttons-apply").addClass("fixed-btn-top");
} else {
$("#buttons-apply").removeClass("fixed-btn-top");
}
});
function apply_btn(){
		$('#form-megasliderpro').find("input.megaslider_data").val();
		var megaslider_data = $("#form-megasliderpro").serialize();
        $('#form-megasliderpro').find("input.megaslider_data").val(megaslider_data);
		$.ajax({
			<?php if($megasliderpro_id !='0'){ ?>
			url: 'index.php?route=extension/module/cyber_megasliderpro/apply_btn_update&megasliderpro_id=<?php echo $megasliderpro_id;?>&token=<?php echo $token;?>',
			<?php } else { ?>
			url: 'index.php?route=extension/module/cyber_megasliderpro/apply_btn_insert&token=<?php echo $token;?>',
			<?php }  ?>
			type: 'post',
			dataType: 'json',
			data: $("#form-megasliderpro input.megaslider_data"),
			beforeSend: function() {
				$('#btn-apply-setting').attr("disabled", true);
				$('#btn-save-setting').attr("disabled", true);
			},
			complete: function() {
				$('#btn-apply-setting').attr("disabled", false);
				$('#btn-save-setting').attr("disabled", false);
			},	
			success: function(json) {
				$('.alert.alert-danger, .alert.alert-success').remove();
					if(json['error']){
					if (json['error']['warning']) {
						$('#form-megasliderpro').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error']['warning'] + '</div>');	
					}
					if (json['error']['name']) {
						$('#form-megasliderpro').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error']['name'] + '</div>');	
					}
					if (json['error']['delay']) {
						$('#form-megasliderpro').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error']['delay'] + '</div>');	
					}
					if (json['error']['error_megasliderpro_image']) {
						$('#form-megasliderpro').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error']['error_megasliderpro_image'] + '</div>');	
					}
					}
					if (json['success']) {
						$('#form-megasliderpro').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
						setTimeout(function(){
							$('.alert.alert-danger, .alert.alert-success').remove();
						}, 2000)
					}
			}
		});
	}
</script>
<style>
.fixed-btn-top {
  background: #fff none repeat scroll 0 0;
  border-bottom: 1px solid #ccc;
  border-left: 1px solid #ccc;
  box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);
  overflow: auto;
  padding: 10px 12px;
  position: fixed;
  right: 0;
  top: 0;
  z-index: 999;
}
	#module-add img {display:none!important;}
</style>
<?php echo $footer; ?>
