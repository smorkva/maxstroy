<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
		
      <div class="pull-right">
		<a class="btn btn-primary" onclick="location='<?php echo $sticker_list; ?>'"><span><?php echo $button_sticker_list; ?></span></a>
		<a class="btn btn-primary" onclick="location='<?php echo $products; ?>'"><span><?php echo $button_products; ?></span></a>
		<a class="btn btn-success"  data-toggle="tooltip" title="<?php echo $button_insert;?>" onclick="location='<?php echo $insert; ?>'"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
		<a onclick="$('#form').submit();" class="btn btn-primary"><?php echo $button_save; ?></a>
		<a class="btn btn-default" href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"><i class="fa fa-reply"></i></a>
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
		<div class="alert alert-danger"><?php echo $error_warning; ?></div>
	<?php } ?>
	<?php if ($success) { ?>
		<div class="alert alert-success"><?php echo $success; ?></div>
		<script type="text/javascript">$('.alert-success').fadeOut(7000);</script>
	<?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
				<li><a href="#tab-systems" data-toggle="tab"><?php echo $tab_systems; ?></a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab-general">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="input-cyber_pro_sticker_status"><?php echo $entry_status; ?></label>
							<div class="col-sm-8">
							  <select name="cyber_pro_sticker_status" id="input-cyber_pro_sticker_status" class="form-control">
								<?php if ($cyber_pro_sticker_status) { ?>
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
							<label class="col-sm-4 control-label"><?php echo $entry_class; ?></label>
							<div class="col-sm-8">
							  <input type="text" name="cyber_pro_sticker_settings[class]" value="<?php echo $settings['class']; ?>" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label"><?php echo $entry_class_main_image; ?></label>
							<div class="col-sm-8">
							  <input type="text" name="cyber_pro_sticker_settings[class_main_image]" value="<?php echo $settings['class_main_image']; ?>" class="form-control" />
							</div>
						</div>
					
						<div class="form-group">
							<label class="col-sm-4 control-label"><?php echo $entry_min_width; ?></label>
							<div class="col-sm-8">
							  <input type="text" name="cyber_pro_sticker_settings[min_width]" value="<?php echo $settings['min_width']; ?>" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label"><?php echo $entry_min_height; ?></label>
							<div class="col-sm-8">
							  <input type="text" name="cyber_pro_sticker_settings[min_height]" value="<?php echo $settings['min_height']; ?>" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label"><?php echo $entry_z_index; ?></label>
							<div class="col-sm-8">
							  <input type="text" name="cyber_pro_sticker_settings[z_index]" value="<?php echo $settings['z_index']; ?>" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label"><?php echo $entry_hide_hover; ?></label>
							<div class="col-sm-8">
							   <select class="form-control" name="cyber_pro_sticker_settings[hide_hover]">
									<?php if ($settings['hide_hover']) { ?>
									<option value="0"><?php echo $text_no; ?></option>
									<option value="1" selected="selected"><?php echo $text_yes; ?></option>
									<?php } else { ?>
									<option value="0" selected="selected"><?php echo $text_no; ?></option>
									<option value="1"><?php echo $text_yes; ?></option>
									<?php } ?>
							   </select>
							</div>
						</div>						
			</div>
					<div class="tab-pane" id="tab-systems">
						<fieldset>
							 <legend><?php echo $entry_special; ?></legend>
						
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
								<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[special_status]">
									<?php if ($settings['special_status']) { ?>
									<option value="0"><?php echo $text_disabled; ?></option>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<?php } else { ?>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<option value="1"><?php echo $text_enabled; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_position; ?></label>
								<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[special_position]">
									<?php foreach ($positions as $position=>$value) { ?>
									<?php if ($settings['special_position'] == $position) { ?>
									<option value="<?php echo $position; ?>" selected="selected"><?php echo ${'text_' . $position}; ?></option>
									<?php } else { ?>
									<option value="<?php echo $position; ?>"><?php echo ${'text_' . $position}; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $column_image; ?></label>
							<div class="col-sm-10">
								<a href="" id="special_thumb" data-toggle="image" class="img-thumbnail">
								<img src="<?php echo $special_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
								<input type="hidden" name="cyber_pro_sticker_settings[special_image]" value="<?php echo $settings['special_image']; ?>" id="special_image" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $text_sticker; ?></label>
							<div class="col-sm-10">
							<?php foreach ($languages as $language) { ?>
								<div class="col-sm-6">
									<div class="input-group"><span class="input-group-addon">
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
									</span>
										<input class="form-control" name="cyber_pro_sticker_settings[special_text_sticker][<?php echo $language['language_id']; ?>]" type="text" value="<?php echo isset($settings['special_text_sticker'][$language['language_id']]) ? $settings['special_text_sticker'][$language['language_id']] : ''; ?>" size="3" />
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group"><span class="input-group-addon"><?php echo $column_text_color;?></span>
										<input class="form-control color" type="text" name="cyber_pro_sticker_settings[special_text_color][<?php echo $language['language_id']; ?>]" value="<?php echo isset($settings['special_text_color'][$language['language_id']]) ? $settings['special_text_color'][$language['language_id']] : ''; ?>" />
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group"><span class="input-group-addon"><?php echo $column_text_bg;?></span>
										<input class="form-control color" type="text" name="cyber_pro_sticker_settings[special_bg_color][<?php echo $language['language_id']; ?>]" value="<?php echo isset($settings['special_bg_color'][$language['language_id']]) ? $settings['special_bg_color'][$language['language_id']] : ''; ?>" />
									</div>
								</div>
							<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_stiker_design; ?></label>
								<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[special_stiker_design]">
									<?php if ($settings['special_stiker_design']) { ?>
									<option value="0"><?php echo $text_sticker_img; ?></option>
									<option value="1" selected="selected"><?php echo $text_sticker_text; ?></option>
									<?php } else { ?>
									<option value="0" selected="selected"><?php echo $text_sticker_img; ?></option>
									<option value="1"><?php echo $text_sticker_text; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_status_discount_percent; ?></label>
								<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[special_status_dp]">
									<?php if ($settings['special_status_dp']) { ?>
									<option value="0"><?php echo $text_disabled; ?></option>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<?php } else { ?>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<option value="1"><?php echo $text_enabled; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $text_sticker_dp_color_bg; ?></label>
							<div class="col-sm-10">
							<?php foreach ($languages as $language) { ?>
								<div class="col-sm-3">
									<div class="input-group">
									<span class="input-group-addon">
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
									</span>
									<span class="input-group-addon"><?php echo $column_text_color;?></span>
										<input class="form-control color" type="text" name="cyber_pro_sticker_settings[special_dp_color][<?php echo $language['language_id']; ?>]" value="<?php echo isset($settings['special_dp_color'][$language['language_id']]) ? $settings['special_dp_color'][$language['language_id']] : ''; ?>" />
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group">
									<span class="input-group-addon">
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
									</span>
									<span class="input-group-addon"><?php echo $column_text_bg;?></span>
										<input class="form-control color" type="text" name="cyber_pro_sticker_settings[special_dp_bg_color][<?php echo $language['language_id']; ?>]" value="<?php echo isset($settings['special_dp_bg_color'][$language['language_id']]) ? $settings['special_dp_bg_color'][$language['language_id']] : ''; ?>" />
									</div>
								</div>
							<?php } ?>
							</div>
						</div>
						
						<legend><?php echo $entry_new; ?></legend>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
								<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[new_status]">
									<?php if ($settings['new_status']) { ?>
									<option value="0"><?php echo $text_disabled; ?></option>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<?php } else { ?>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<option value="1"><?php echo $text_enabled; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_position; ?></label>
								<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[new_position]">
									<?php foreach ($positions as $position=>$value) { ?>
									<?php if ($settings['new_position'] == $position) { ?>
									<option value="<?php echo $position; ?>" selected="selected"><?php echo ${'text_' . $position}; ?></option>
									<?php } else { ?>
									<option value="<?php echo $position; ?>"><?php echo ${'text_' . $position}; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $column_image; ?></label>
							<div class="col-sm-10">
								<a href="" id="new_thumb" data-toggle="image" class="img-thumbnail">
								<img src="<?php echo $new_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
								<input type="hidden" name="cyber_pro_sticker_settings[new_image]" value="<?php echo $settings['new_image']; ?>" id="new_image" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_days_new; ?></label>
								<div class="col-sm-10">
								<input class="form-control" name="cyber_pro_sticker_settings[days_new]" type="text" value="<?php echo $settings['days_new']; ?>" size="3" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $text_sticker; ?></label>
							<div class="col-sm-10">
							<?php foreach ($languages as $language) { ?>
								<div class="col-sm-6">
									<div class="input-group"><span class="input-group-addon">
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
									</span>
										<input class="form-control" name="cyber_pro_sticker_settings[new_text_sticker][<?php echo $language['language_id']; ?>]" type="text" value="<?php echo isset($settings['new_text_sticker'][$language['language_id']]) ? $settings['new_text_sticker'][$language['language_id']] : ''; ?>" size="3" />
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group"><span class="input-group-addon"><?php echo $column_text_color;?></span>
										<input class="form-control color" type="text" name="cyber_pro_sticker_settings[new_text_color][<?php echo $language['language_id']; ?>]" value="<?php echo isset($settings['new_text_color'][$language['language_id']]) ? $settings['new_text_color'][$language['language_id']] : ''; ?>" />
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group"><span class="input-group-addon"><?php echo $column_text_bg;?></span>
										<input class="form-control color" type="text" name="cyber_pro_sticker_settings[new_bg_color][<?php echo $language['language_id']; ?>]" value="<?php echo isset($settings['new_bg_color'][$language['language_id']]) ? $settings['new_bg_color'][$language['language_id']] : ''; ?>" />
									</div>
								</div>
							<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_stiker_design; ?></label>
								<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[new_stiker_design]">
									<?php if ($settings['new_stiker_design']) { ?>
									<option value="0"><?php echo $text_sticker_img; ?></option>
									<option value="1" selected="selected"><?php echo $text_sticker_text; ?></option>
									<?php } else { ?>
									<option value="0" selected="selected"><?php echo $text_sticker_img; ?></option>
									<option value="1"><?php echo $text_sticker_text; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						
						<legend><?php echo $entry_bestseller; ?></legend>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
								<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[bestseller_status]">
									<?php if ($settings['bestseller_status']) { ?>
									<option value="0"><?php echo $text_disabled; ?></option>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<?php } else { ?>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<option value="1"><?php echo $text_enabled; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_position; ?></label>
								<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[bestseller_position]">
									<?php foreach ($positions as $position=>$value) { ?>
									<?php if ($settings['bestseller_position'] == $position) { ?>
									<option value="<?php echo $position; ?>" selected="selected"><?php echo ${'text_' . $position}; ?></option>
									<?php } else { ?>
									<option value="<?php echo $position; ?>"><?php echo ${'text_' . $position}; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $column_image; ?></label>
							<div class="col-sm-10">
								<a href="" id="bestseller_thumb" data-toggle="image" class="img-thumbnail">
								<img src="<?php echo $bestseller_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
								<input type="hidden" name="cyber_pro_sticker_settings[bestseller_image]" value="<?php echo $settings['bestseller_image']; ?>" id="bestseller_image" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_limit_order; ?></label>
								<div class="col-sm-10">
								<input class="form-control" name="cyber_pro_sticker_settings[limit_order]" type="text" value="<?php echo $settings['limit_order']; ?>" size="3" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $text_sticker; ?></label>
							<div class="col-sm-10">
							<?php foreach ($languages as $language) { ?>
								<div class="col-sm-6">
									<div class="input-group"><span class="input-group-addon">
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
									</span>
										<input class="form-control" name="cyber_pro_sticker_settings[bestseller_text_sticker][<?php echo $language['language_id']; ?>]" type="text" value="<?php echo isset($settings['bestseller_text_sticker'][$language['language_id']]) ? $settings['bestseller_text_sticker'][$language['language_id']] : ''; ?>" size="3" />
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group"><span class="input-group-addon"><?php echo $column_text_color;?></span>
										<input class="form-control color" type="text" name="cyber_pro_sticker_settings[bestseller_text_color][<?php echo $language['language_id']; ?>]" value="<?php echo isset($settings['bestseller_text_color'][$language['language_id']]) ? $settings['bestseller_text_color'][$language['language_id']] : ''; ?>" />
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group"><span class="input-group-addon"><?php echo $column_text_bg;?></span>
										<input class="form-control color" type="text" name="cyber_pro_sticker_settings[bestseller_bg_color][<?php echo $language['language_id']; ?>]" value="<?php echo isset($settings['bestseller_bg_color'][$language['language_id']]) ? $settings['bestseller_bg_color'][$language['language_id']] : ''; ?>" />
									</div>
								</div>
							<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_stiker_design; ?></label>
								<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[bestseller_stiker_design]">
									<?php if ($settings['bestseller_stiker_design']) { ?>
									<option value="0"><?php echo $text_sticker_img; ?></option>
									<option value="1" selected="selected"><?php echo $text_sticker_text; ?></option>
									<?php } else { ?>
									<option value="0" selected="selected"><?php echo $text_sticker_img; ?></option>
									<option value="1"><?php echo $text_sticker_text; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						
						<legend><?php echo $entry_popular; ?></legend>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
								<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[popular_status]">
									<?php if ($settings['popular_status']) { ?>
									<option value="0"><?php echo $text_disabled; ?></option>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<?php } else { ?>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<option value="1"><?php echo $text_enabled; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_position; ?></label>
								<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[popular_position]">
									<?php foreach ($positions as $position=>$value) { ?>
									<?php if ($settings['popular_position'] == $position) { ?>
									<option value="<?php echo $position; ?>" selected="selected"><?php echo ${'text_' . $position}; ?></option>
									<?php } else { ?>
									<option value="<?php echo $position; ?>"><?php echo ${'text_' . $position}; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $column_image; ?></label>
							<div class="col-sm-10">
								<a href="" id="popular_thumb" data-toggle="image" class="img-thumbnail">
								<img src="<?php echo $popular_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
								<input type="hidden" name="cyber_pro_sticker_settings[popular_image]" value="<?php echo $settings['popular_image']; ?>" id="popular_image" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_limit_viewed; ?></label>
								<div class="col-sm-10">
								<input class="form-control" name="cyber_pro_sticker_settings[limit_viewed]" type="text" value="<?php echo isset($settings['limit_viewed']) ? $settings['limit_viewed'] : 15; ?>" size="3" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $text_sticker; ?></label>
							<div class="col-sm-10">
							<?php foreach ($languages as $language) { ?>
								<div class="col-sm-6">
									<div class="input-group"><span class="input-group-addon">
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
									</span>
										<input class="form-control" name="cyber_pro_sticker_settings[popular_text_sticker][<?php echo $language['language_id']; ?>]" type="text" value="<?php echo isset($settings['popular_text_sticker'][$language['language_id']]) ? $settings['popular_text_sticker'][$language['language_id']] : ''; ?>" size="3" />
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group"><span class="input-group-addon"><?php echo $column_text_color;?></span>
										<input class="form-control color" type="text" name="cyber_pro_sticker_settings[popular_text_color][<?php echo $language['language_id']; ?>]" value="<?php echo isset($settings['popular_text_color'][$language['language_id']]) ? $settings['popular_text_color'][$language['language_id']] : ''; ?>" />
									</div>
								</div>
								<div class="col-sm-3">
									<div class="input-group"><span class="input-group-addon"><?php echo $column_text_bg;?></span>
										<input class="form-control color" type="text" name="cyber_pro_sticker_settings[popular_bg_color][<?php echo $language['language_id']; ?>]" value="<?php echo isset($settings['popular_bg_color'][$language['language_id']]) ? $settings['popular_bg_color'][$language['language_id']] : ''; ?>" />
									</div>
								</div>
							<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_stiker_design; ?></label>
								<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[popular_stiker_design]">
									<?php if ($settings['popular_stiker_design']) { ?>
									<option value="0"><?php echo $text_sticker_img; ?></option>
									<option value="1" selected="selected"><?php echo $text_sticker_text; ?></option>
									<?php } else { ?>
									<option value="0" selected="selected"><?php echo $text_sticker_img; ?></option>
									<option value="1"><?php echo $text_sticker_text; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						
						
						<legend><?php echo $entry_manufacturer; ?></legend>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
							<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[manufacturer_status]">
									<?php if ($settings['manufacturer_status']) { ?>
									<option value="0"><?php echo $text_disabled; ?></option>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<?php } else { ?>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<option value="1"><?php echo $text_enabled; ?></option>
									<?php } ?>
							   </select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_position; ?></label>
							<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[manufacturer_position]">
									<?php foreach ($positions as $position=>$value) { ?>
									<?php if ($settings['manufacturer_position'] == $position) { ?>
									<option value="<?php echo $position; ?>" selected="selected"><?php echo ${'text_' . $position}; ?></option>
									<?php } else { ?>
									<option value="<?php echo $position; ?>"><?php echo ${'text_' . $position}; ?></option>
									<?php } ?>
									<?php } ?>
							   </select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_width; ?></label>
								<div class="col-sm-10">
								<input class="form-control" name="cyber_pro_sticker_settings[width]" type="text" value="<?php echo $settings['width']; ?>" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_height; ?></label>
								<div class="col-sm-10">
								<input class="form-control" name="cyber_pro_sticker_settings[height]" type="text" value="<?php echo $settings['height']; ?>" />
							</div>
						</div>
						<legend><?php echo $entry_quantity; ?></legend>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
							<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[quantity_status]">
									<?php if ($settings['quantity_status']) { ?>
									<option value="0"><?php echo $text_disabled; ?></option>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<?php } else { ?>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<option value="1"><?php echo $text_enabled; ?></option>
									<?php } ?>
							   </select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_stiker_design; ?></label>
								<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[quantity_stiker_design]">
									<?php if ($settings['quantity_stiker_design']) { ?>
									<option value="0"><?php echo $text_sticker_img; ?></option>
									<option value="1" selected="selected"><?php echo $text_sticker_text; ?></option>
									<?php } else { ?>
									<option value="0" selected="selected"><?php echo $text_sticker_img; ?></option>
									<option value="1"><?php echo $text_sticker_text; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_position; ?></label>
							<div class="col-sm-10">
								<select class="form-control" name="cyber_pro_sticker_settings[quantity_position]">
									<?php foreach ($positions as $position=>$value) { ?>
									<?php if ($settings['quantity_position'] == $position) { ?>
									<option value="<?php echo $position; ?>" selected="selected"><?php echo ${'text_' . $position}; ?></option>
									<?php } else { ?>
									<option value="<?php echo $position; ?>"><?php echo ${'text_' . $position}; ?></option>
									<?php } ?>
									<?php } ?>
								  </select>
							</div>
						</div>
						</fieldset>
						<table class="table table-striped table-bordered table-hover" id="quantity-sticker-table">
							<thead>
								<tr>   
									<td class="center">Min</td>
									<td class="center">Max</td>
									<td class="center"><?php echo $text_sticker; ?></td>
									<td class="center"><?php echo $column_text_color; ?></td>
									<td class="center"><?php echo $column_text_bg; ?></td>
									<td class="center"><?php echo $column_image; ?></td>
									<td class="center"></td>
								</tr>
							</thead>
							<?php $quantity_row = 0; ?>
							<?php foreach ($settings['quantity'] as $param) { ?>
							<tbody id="quantity-row<?php echo $quantity_row; ?>">
								<tr>
									<td class="text-left"><input class="form-control" type="text" name="cyber_pro_sticker_settings[quantity][<?php echo $quantity_row; ?>][min]" value="<?php echo $param['min']; ?>" /></td>
									<td class="text-left"><input class="form-control" type="text" name="cyber_pro_sticker_settings[quantity][<?php echo $quantity_row; ?>][max]" value="<?php echo $param['max']; ?>" /></td>
									<td class="text-left">
									<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon">
											<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
											</span>
											<input class="form-control" name="cyber_pro_sticker_settings[quantity][<?php echo $quantity_row; ?>][quantity_text_sticker][<?php echo $language['language_id']; ?>]" type="text" value="<?php echo isset($param['quantity_text_sticker'][$language['language_id']]) ? $param['quantity_text_sticker'][$language['language_id']] : ''; ?>" />
										</div>
									<?php } ?>
									</td>
									<td class="text-left">
									<?php foreach ($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input class="form-control color" type="text" name="cyber_pro_sticker_settings[quantity][<?php echo $quantity_row; ?>][quantity_text_color][<?php echo $language['language_id']; ?>]" value="<?php echo isset($param['quantity_text_color'][$language['language_id']]) ? $param['quantity_text_color'][$language['language_id']] : ''; ?>" />
										</div>
									<?php } ?>
									</td>
									<td class="text-left">
									<?php foreach ($languages as $language) { ?>
									<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
										<input class="form-control color" type="text" name="cyber_pro_sticker_settings[quantity][<?php echo $quantity_row; ?>][quantity_bg_color][<?php echo $language['language_id']; ?>]" value="<?php echo isset($param['quantity_bg_color'][$language['language_id']]) ? $param['quantity_bg_color'][$language['language_id']] : ''; ?>" />
									</div>
									<?php } ?>
									</td>
									<td class="text-center">
										<a href="" id="thumb_quantity<?php echo $quantity_row; ?>" data-toggle="image" class="img-thumbnail">
										<img src="<?php echo $param['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
										<input type="hidden" name="cyber_pro_sticker_settings[quantity][<?php echo $quantity_row; ?>][image]" value="<?php echo $param['image']; ?>" id="image_quantity<?php echo $quantity_row; ?>" />
									</td>
									<td class="text-center"><a class="btn btn-danger" onclick="$('#quantity-row<?php echo $quantity_row; ?>').remove();"><i class="fa fa-trash-o"></i> <?php echo $button_delete;?></a></td>
								</tr>
							</tbody>
							<?php $quantity_row++; ?>
							<?php } ?>
							<tfoot>
								<tr>
									<td colspan="3"></td>
									<td class="text-center"><a class="btn btn-primary" onclick="addqQantityRow();"><i class="fa fa-plus"></i> <?php echo $button_add;?></a></td>
								</tr>
							</tfoot>
						</table>
				
				   </div>
			</div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
var quantity_row = <?php echo $quantity_row; ?>;

function addqQantityRow() {
	html  = '         <tbody id="quantity-row' + quantity_row + '">';
	html += '          <tr>';
	
	html += '           <td class="text-left"><input class="form-control type="text" name="cyber_pro_sticker_settings[quantity][' + quantity_row + '][min]" value="" size="5" /></td>';
	html += '           <td class="text-left"><input class="form-control type="text" name="cyber_pro_sticker_settings[quantity][' + quantity_row + '][max]" value="" size="5" /></td>';
	html += '			<td class="text-left">';
						<?php foreach ($languages as $language) { ?>
	html += '			<div class="input-group"><span class="input-group-addon">';
	html += '			<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
	html += '				<input class="form-control" name="cyber_pro_sticker_settings[quantity][' + quantity_row + '][quantity_text_sticker][<?php echo $language['language_id']; ?>]" type="text" value="" />';
	html += '			</div>';
						<?php } ?>
	html += '			</td>';
	html += '			<td class="text-left">';
						<?php foreach ($languages as $language) { ?>
	html += '			<div class="input-group">';
	html += '				<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
	html += '					<input class="form-control color" type="text" name="cyber_pro_sticker_settings[quantity][' + quantity_row + '][quantity_text_color][<?php echo $language['language_id']; ?>]" value="" />';
	html += '			</div>';
						<?php } ?>
	html += '			</td>';
	html += '			<td class="text-left">';
						<?php foreach ($languages as $language) { ?>
	html += '				<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
	html += '					<input class="form-control color" type="text" name="cyber_pro_sticker_settings[quantity][' + quantity_row + '][quantity_bg_color][<?php echo $language['language_id']; ?>]" value="" />';
	html += '				</div>';
						<?php } ?>
	html += '			</td>';
	
	html += '			<td class="text-center">';
	html += '				<a href="" id="thumb_quantity' + quantity_row + '" data-toggle="image" class="img-thumbnail">';
	html += '				<img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>';
	html += '				<input type="hidden" name="cyber_pro_sticker_settings[quantity][' + quantity_row + '][image]" value="" id="image_quantity' + quantity_row + '" />';
	html += '			</td>';								
	html += '           <td class="text-center"><a class="btn btn-danger" onclick="$(\'#quantity-row' + quantity_row + '\').remove();"><i class="fa fa-trash-o"></i> <?php echo $button_delete;?></a></td>';
	html += '          </tr>';
	html += '         </tbody>';
	
	$('#quantity-sticker-table tfoot').before(html);
	
	quantity_row++;
}
//--></script>
<script type="text/javascript"><!--
$('#tabs a').tab();
//--></script>
<?php echo $footer; ?>