<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-3 control-label">
					<?php echo $cx_key;?><br />
					<?php echo $cx_text;?><br />
					<?php echo $cx_link;?><br />
				</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="cx_key_ediprod" value="<?php echo $cx_key_ediprod; ?>"  />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">
					<?php echo $api_key;?><br />
					<?php echo $api_link;?><br />
				</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="api_key_ediprod" value="<?php echo $api_key_ediprod; ?>"  />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_button_generate_url_keyword ; ?></label>
				<?php if ($config_button_generate_url_keyword == '') { ?>
					<div class="col-sm-3">
						<input type="radio" name="config_button_generate_url_keyword" value="1" />
						<?php echo $text_id_keyword?>
					</div>
					<div class="col-sm-3">
						<input type="radio" name="config_button_generate_url_keyword" value="2" />
						<?php echo $text_model_keyword?>
					</div>
				<?php } elseif ($config_button_generate_url_keyword == "1") { ?>
					<div class="col-sm-3">
						<input type="radio" name="config_button_generate_url_keyword" value="1" checked="checked" />
						<?php echo $text_id_keyword?>
					</div>
					<div class="col-sm-3">
						<input type="radio" name="config_button_generate_url_keyword" value="2" />
						<?php echo $text_model_keyword?>
					</div>
				<?php } elseif ($config_button_generate_url_keyword == "2") { ?>
					<div class="col-sm-3">
						<input type="radio" name="config_button_generate_url_keyword" value="1"  />
					   <?php echo $text_id_keyword?>
					</div>
					<div class="col-sm-3">
						<input type="radio" name="config_button_generate_url_keyword" value="2" checked="checked" />
						<?php echo $text_model_keyword?>
					</div>
				<?php } ?>					
			</div>	
			<div class="form-group">
				<div class="col-sm-12 text-center">
					<h2><?php echo $text_seo_template;?></h2>
				</div>
			</div>
			<div class="well">
				<div class="form-group">
					<label class="col-sm-3 control-label">
						<?php echo $text_seo_prod_meta_title;?>
					</label>
					<div class="col-sm-9">
						<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><?php if($VERSION < 2.2){?><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><?php } else { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /><?php } ?></span>
								 <input class="form-control" type="text" name="seo_prod[<?php echo $language['language_id']; ?>][seo_prod_meta_title]" value="<?php echo isset($seo_prod[$language['language_id']]) ? $seo_prod[$language['language_id']]['seo_prod_meta_title'] : ''; ?>"  />
							</div>
						 <?php } ?>
						
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_on_off_seo_template;?></label>
					<div class="col-sm-9">
						<div class="radio-group-ns">
							<?php if ($seo_prod['meta_title_on_off']) { ?>
								<input id="seo_prod_meta_title_yes" class="hide-radio" type="radio" name="seo_prod[meta_title_on_off]" value="1" checked="checked" />
								<label for="seo_prod_meta_title_yes"><?php echo $text_yes; ?></label>
							<?php } else { ?>
								<input id="seo_prod_meta_title_yes" class="hide-radio" type="radio" name="seo_prod[meta_title_on_off]" value="1" />
								<label for="seo_prod_meta_title_yes"><?php echo $text_yes; ?></label>
							<?php } ?>
							<?php if (!$seo_prod['meta_title_on_off']) { ?>
								<input id="seo_prod_meta_title_no" class="hide-radio" type="radio" name="seo_prod[meta_title_on_off]" value="0" checked="checked" />							
								<label for="seo_prod_meta_title_no"><?php echo $text_no; ?></label>
							<?php } else { ?>
								<input id="seo_prod_meta_title_no" class="hide-radio" type="radio" name="seo_prod[meta_title_on_off]" value="0" />							
								<label for="seo_prod_meta_title_no"><?php echo $text_no; ?></label>
							<?php } ?>							
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">
						<?php echo $text_seo_prod_meta_h1;?>
					</label>
					<div class="col-sm-9">
						<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><?php if($VERSION < 2.2){?><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><?php } else { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /><?php } ?></span>
								 <input class="form-control" type="text" name="seo_prod[<?php echo $language['language_id']; ?>][seo_prod_meta_h1]" value="<?php echo isset($seo_prod[$language['language_id']]) ? $seo_prod[$language['language_id']]['seo_prod_meta_h1'] : ''; ?>"  />
							</div>
						 <?php } ?>
						
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_on_off_seo_template;?></label>
					<div class="col-sm-9">
						<div class="radio-group-ns">
							<?php if ($seo_prod['meta_h1_on_off']) { ?>
								<input id="seo_prod_meta_h1_yes" class="hide-radio" type="radio" name="seo_prod[meta_h1_on_off]" value="1" checked="checked" />
								<label for="seo_prod_meta_h1_yes"><?php echo $text_yes; ?></label>
							<?php } else { ?>
								<input id="seo_prod_meta_h1_yes" class="hide-radio" type="radio" name="seo_prod[meta_h1_on_off]" value="1" />
								<label for="seo_prod_meta_h1_yes"><?php echo $text_yes; ?></label>
							<?php } ?>
							<?php if (!$seo_prod['meta_h1_on_off']) { ?>
								<input id="seo_prod_meta_h1_no" class="hide-radio" type="radio" name="seo_prod[meta_h1_on_off]" value="0" checked="checked" />							
								<label for="seo_prod_meta_h1_no"><?php echo $text_no; ?></label>
							<?php } else { ?>
								<input id="seo_prod_meta_h1_no" class="hide-radio" type="radio" name="seo_prod[meta_h1_on_off]" value="0" />							
								<label for="seo_prod_meta_h1_no"><?php echo $text_no; ?></label>
							<?php } ?>							
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">
						<?php echo $text_seo_prod_meta_description;?>
					</label>
					<div class="col-sm-9">
						<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><?php if($VERSION < 2.2){?><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><?php } else { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /><?php } ?></span>
								 <input class="form-control" type="text" name="seo_prod[<?php echo $language['language_id']; ?>][seo_prod_meta_description]" value="<?php echo isset($seo_prod[$language['language_id']]) ? $seo_prod[$language['language_id']]['seo_prod_meta_description'] : ''; ?>"  />
							</div>
						 <?php } ?>
						
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_on_off_seo_template;?></label>
					<div class="col-sm-9">
						<div class="radio-group-ns">
							<?php if ($seo_prod['meta_description_on_off']) { ?>
								<input id="meta_description_on_off_yes" class="hide-radio" type="radio" name="seo_prod[meta_description_on_off]" value="1" checked="checked" />
								<label for="meta_description_on_off_yes"><?php echo $text_yes; ?></label>
							<?php } else { ?>
								<input id="meta_description_on_off_yes" class="hide-radio" type="radio" name="seo_prod[meta_description_on_off]" value="1" />
								<label for="meta_description_on_off_yes"><?php echo $text_yes; ?></label>
							<?php } ?>
							<?php if (!$seo_prod['meta_description_on_off']) { ?>
								<input id="meta_description_on_off_no" class="hide-radio" type="radio" name="seo_prod[meta_description_on_off]" value="0" checked="checked" />							
								<label for="meta_description_on_off_no"><?php echo $text_no; ?></label>
							<?php } else { ?>
								<input id="meta_description_on_off_no" class="hide-radio" type="radio" name="seo_prod[meta_description_on_off]" value="0" />							
								<label for="meta_description_on_off_no"><?php echo $text_no; ?></label>
							<?php } ?>							
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">
						<?php echo $text_seo_prod_meta_keyword;?>
					</label>
					<div class="col-sm-9">
						<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><?php if($VERSION < 2.2){?><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><?php } else { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /><?php } ?></span>
								 <input class="form-control" type="text" name="seo_prod[<?php echo $language['language_id']; ?>][seo_prod_meta_keyword]" value="<?php echo isset($seo_prod[$language['language_id']]) ? $seo_prod[$language['language_id']]['seo_prod_meta_keyword'] : ''; ?>"  />
							</div>
						 <?php } ?>
						
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_on_off_seo_template;?></label>
					<div class="col-sm-9">
						<div class="radio-group-ns">
							<?php if ($seo_prod['meta_keyword_on_off']) { ?>
								<input id="meta_keyword_on_off_yes" class="hide-radio" type="radio" name="seo_prod[meta_keyword_on_off]" value="1" checked="checked" />
								<label for="meta_keyword_on_off_yes"><?php echo $text_yes; ?></label>
							<?php } else { ?>
								<input id="meta_keyword_on_off_yes" class="hide-radio" type="radio" name="seo_prod[meta_keyword_on_off]" value="1" />
								<label for="meta_keyword_on_off_yes"><?php echo $text_yes; ?></label>
							<?php } ?>
							<?php if (!$seo_prod['meta_keyword_on_off']) { ?>
								<input id="meta_keyword_on_off_no" class="hide-radio" type="radio" name="seo_prod[meta_keyword_on_off]" value="0" checked="checked" />							
								<label for="meta_keyword_on_off_no"><?php echo $text_no; ?></label>
							<?php } else { ?>
								<input id="meta_keyword_on_off_no" class="hide-radio" type="radio" name="seo_prod[meta_keyword_on_off]" value="0" />							
								<label for="meta_keyword_on_off_no"><?php echo $text_no; ?></label>
							<?php } ?>							
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">
						<?php echo $text_seo_prod_meta_tag;?>
					</label>
					<div class="col-sm-9">
						<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><?php if($VERSION < 2.2){?><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><?php } else { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /><?php } ?></span>
								 <input class="form-control" type="text" name="seo_prod[<?php echo $language['language_id']; ?>][seo_prod_meta_tag]" value="<?php echo isset($seo_prod[$language['language_id']]) ? $seo_prod[$language['language_id']]['seo_prod_meta_tag'] : ''; ?>"  />
							</div>
						 <?php } ?>
						
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_on_off_seo_template;?></label>
					<div class="col-sm-9">
						<div class="radio-group-ns">
							<?php if ($seo_prod['meta_tag_on_off']) { ?>
								<input id="meta_tag_on_off_yes" class="hide-radio" type="radio" name="seo_prod[meta_tag_on_off]" value="1" checked="checked" />
								<label for="meta_tag_on_off_yes"><?php echo $text_yes; ?></label>
							<?php } else { ?>
								<input id="meta_tag_on_off_yes" class="hide-radio" type="radio" name="seo_prod[meta_tag_on_off]" value="1" />
								<label for="meta_tag_on_off_yes"><?php echo $text_yes; ?></label>
							<?php } ?>
							<?php if (!$seo_prod['meta_tag_on_off']) { ?>
								<input id="meta_tag_on_off_no" class="hide-radio" type="radio" name="seo_prod[meta_tag_on_off]" value="0" checked="checked" />							
								<label for="meta_tag_on_off_no"><?php echo $text_no; ?></label>
							<?php } else { ?>
								<input id="meta_tag_on_off_no" class="hide-radio" type="radio" name="seo_prod[meta_tag_on_off]" value="0" />							
								<label for="meta_tag_on_off_no"><?php echo $text_no; ?></label>
							<?php } ?>							
						</div>
					</div>
				</div>
				<div class="form-group">  
					<label class="col-sm-3 control-label"><?php echo $text_seo_designations;; ?></label>
					<div class="col-sm-9" style="padding-top:9px;">
						<span><?php echo $text_seo_product_name;?></span>
						<span><?php echo $text_seo_price;?></span>
						<span><?php echo $text_seo_model;?></span>
						<span><?php echo $text_seo_sku;?></span>						
						<span><?php echo $text_seo_category;?></span>
						<span><?php echo $text_seo_manufacturer;?></span>									
						<span><?php echo $text_seo_random_text;?></span>				
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-6"><?php echo $text_display_settings_editor;?></label>
			</div>
			<div class="table-responsive">
				<table class="table table-bordered table-hover">	
					<thead>
						<td class="text-right"><?php echo $text_groups_name;?></td>
						<td class="text-center"><button type="button"  data-toggle="tooltip" title="<?php echo $text_link_module_admin;?>" class="btn btn-primary"><i class="fa fa-cog" aria-hidden="true"></i></button></td>
						<td class="text-center"><button type="button"  data-toggle="tooltip" title="<?php echo $text_product_admin;?>" class="btn btn-primary"><i class="fa fa-cogs" aria-hidden="true"></i></button></td>
						<td class="text-center"><button type="button"  data-toggle="tooltip" title="<?php echo $text_description;?>" class="btn btn-primary"><i class="fa fa-newspaper-o" aria-hidden="true"></i></button></td>
						<td class="text-center"><button type="button"  data-toggle="tooltip" title="<?php echo $text_code;?>" class="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button></td>
						<td class="text-center"><button type="button"  data-toggle="tooltip" title="<?php echo $text_category;?>" class="btn btn-primary"><i class="fa fa-sitemap" aria-hidden="true"></i></button></td>
						<td class="text-center"><button type="button"  data-toggle="tooltip" title="<?php echo $text_image;?>" class="btn btn-primary"><i class="fa fa-picture-o" aria-hidden="true"></i></button></td>
						<td class="text-center"><button type="button"  data-toggle="tooltip" title="<?php echo $text_image_url;?>" class="btn btn-primary"><i class="fa fa-link" aria-hidden="true"></i></button></td>
						<td class="text-center"><button type="button"  data-toggle="tooltip" title="<?php echo $text_image_google;?>" class="btn btn-primary"><i class="fa fa-google" aria-hidden="true"></i></button></td>
						<td class="text-center"><button type="button"  data-toggle="tooltip" title="<?php echo $text_price;?>" class="btn btn-primary"><i class="fa fa-money" aria-hidden="true"></i></button></td>					
						<td class="text-center"><button type="button"  data-toggle="tooltip" title="<?php echo $text_special;?>" class="btn btn-primary"><i class="fa fa-tag" aria-hidden="true"></i></button></td>
						<td class="text-center"><button type="button"  data-toggle="tooltip" title="<?php echo $text_related;?>" class="btn btn-primary"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i></button></td>
						<td class="text-center"><button type="button"  data-toggle="tooltip" title="<?php echo $text_attribute;?>" class="btn btn-primary"><i class="fa fa-buysellads" aria-hidden="true"></i></button></td>
						<td class="text-center"><button type="button"  data-toggle="tooltip" title="<?php echo $text_option;?>" class="btn btn-primary"><i class="fa fa-cubes" aria-hidden="true"></i></button></td>
						<td class="text-center"><button type="button"  data-toggle="tooltip" title="<?php echo $text_group_editor;?>" class="btn btn-primary"><i class="fa fa-thumbs-up" aria-hidden="true"></i></button></td>
						
					</thead>
					<?php $user_groups_prod_row = 0;?>

					<?php foreach($user_groups_edit_prod as $user_groups_prod) { ?>
						<tr>
							<td class="text-right">
								<span style="font-weight:bold; font-size:14px;margin:5px;"><?php echo $user_groups_prod['name'];?></span></br>
							</td>
							<td class="text-center">
								<input class="hidden_input" id="c14<?php echo $user_groups_prod_row;?>" <?php if ( 'Y' == $user_groups_prod['link_module_edit_admin'] ) echo 'checked="checked"'; ?> type="checkbox" name="user_groups_prod[<?php echo $user_groups_prod_row;?>][link_module_edit_admin]" value="<?php echo "Y" ;?>"></input>
								<label class="lable_edit" for="c14<?php echo $user_groups_prod_row;?>"><span></span></label></br>
							</td>
							<td class="text-center">
								<input class="hidden_input" id="c15<?php echo $user_groups_prod_row;?>" <?php if ( 'Y' == $user_groups_prod['link_product_admin'] ) echo 'checked="checked"'; ?> type="checkbox" name="user_groups_prod[<?php echo $user_groups_prod_row;?>][link_product_admin]" value="<?php echo "Y" ;?>"></input>
								<label class="lable_edit" for="c15<?php echo $user_groups_prod_row;?>"><span></span></label></br>
							</td>
							<td class="text-center">
								<input type="hidden" name="user_groups_prod[<?php echo $user_groups_prod_row;?>][user_group_id]" value="<?php echo $user_groups_prod['user_group_id'];?>"></input>
								<input class="hidden_input" id="c1<?php echo $user_groups_prod_row;?>" <?php if ( 'Y' == $user_groups_prod['description_edit'] ) echo 'checked="checked"'; ?> type="checkbox" name="user_groups_prod[<?php echo $user_groups_prod_row;?>][description_edit]" value="<?php echo "Y" ;?>"></input>
								<label class="lable_edit" for="c1<?php echo $user_groups_prod_row;?>"><span></span></label></br>
							</td>
							<td class="text-center">
								<input class="hidden_input" id="c11<?php echo $user_groups_prod_row;?>" <?php if ( 'Y' == $user_groups_prod['code_edit'] ) echo 'checked="checked"'; ?> type="checkbox" name="user_groups_prod[<?php echo $user_groups_prod_row;?>][code_edit]" value="<?php echo "Y" ;?>"></input>
								<label class="lable_edit" for="c11<?php echo $user_groups_prod_row;?>"><span></span></label></br>
							</td>
							<td class="text-center">
								<input class="hidden_input" id="c2<?php echo $user_groups_prod_row;?>" <?php if ( 'Y' == $user_groups_prod['category_edit'] ) echo 'checked="checked"'; ?> type="checkbox" name="user_groups_prod[<?php echo $user_groups_prod_row;?>][category_edit]" value="<?php echo "Y" ;?>"></input>
								<label class="lable_edit" for="c2<?php echo $user_groups_prod_row;?>"><span></span></label></br>
							</td>
							<td class="text-center">
								<input class="hidden_input" id="c3<?php echo $user_groups_prod_row;?>" <?php if ( 'Y' == $user_groups_prod['image_edit'] ) echo 'checked="checked"'; ?> type="checkbox" name="user_groups_prod[<?php echo $user_groups_prod_row;?>][image_edit]" value="<?php echo "Y" ;?>"></input>
								<label class="lable_edit" for="c3<?php echo $user_groups_prod_row;?>"><span></span></label></br>
							</td>
							<td class="text-center">
								<input class="hidden_input" id="c4<?php echo $user_groups_prod_row;?>" <?php if ( 'Y' == $user_groups_prod['image_url_edit'] ) echo 'checked="checked"'; ?> type="checkbox" name="user_groups_prod[<?php echo $user_groups_prod_row;?>][image_url_edit]" value="<?php echo "Y" ;?>"></input>
								<label class="lable_edit" for="c4<?php echo $user_groups_prod_row;?>"><span></span></label></br>
							</td>	
							<td class="text-center">
								<input class="hidden_input" id="c5<?php echo $user_groups_prod_row;?>" <?php if ( 'Y' == $user_groups_prod['image_google_edit'] ) echo 'checked="checked"'; ?> type="checkbox" name="user_groups_prod[<?php echo $user_groups_prod_row;?>][image_google_edit]" value="<?php echo "Y" ;?>"></input>
								<label class="lable_edit" for="c5<?php echo $user_groups_prod_row;?>"><span></span></label></br>
							</td>
							<td class="text-center">
								<input class="hidden_input" id="c6<?php echo $user_groups_prod_row;?>" <?php if ( 'Y' == $user_groups_prod['price_edit'] ) echo 'checked="checked"'; ?> type="checkbox" name="user_groups_prod[<?php echo $user_groups_prod_row;?>][price_edit]" value="<?php echo "Y" ;?>"></input>
								<label class="lable_edit" for="c6<?php echo $user_groups_prod_row;?>"><span></span></label></br>
							</td>							
							<td class="text-center">
								<input class="hidden_input" id="c9<?php echo $user_groups_prod_row;?>" <?php if ( 'Y' == $user_groups_prod['special_edit'] ) echo 'checked="checked"'; ?> type="checkbox" name="user_groups_prod[<?php echo $user_groups_prod_row;?>][special_edit]" value="<?php echo "Y" ;?>"></input>
								<label class="lable_edit" for="c9<?php echo $user_groups_prod_row;?>"><span></span></label></br>
							</td>
							<td class="text-center">
								<input class="hidden_input" id="c10<?php echo $user_groups_prod_row;?>" <?php if ( 'Y' == $user_groups_prod['related_edit'] ) echo 'checked="checked"'; ?> type="checkbox" name="user_groups_prod[<?php echo $user_groups_prod_row;?>][related_edit]" value="<?php echo "Y" ;?>"></input>
								<label class="lable_edit" for="c10<?php echo $user_groups_prod_row;?>"><span></span></label></br>
							</td>
							
							<td class="text-center">
								<input class="hidden_input" id="c12<?php echo $user_groups_prod_row;?>" <?php if ( 'Y' == $user_groups_prod['attribute_edit'] ) echo 'checked="checked"'; ?> type="checkbox" name="user_groups_prod[<?php echo $user_groups_prod_row;?>][attribute_edit]" value="<?php echo "Y" ;?>"></input>
								<label class="lable_edit" for="c12<?php echo $user_groups_prod_row;?>"><span></span></label></br>
							</td>
							<td class="text-center">
								<input class="hidden_input" id="c13<?php echo $user_groups_prod_row;?>" <?php if ( 'Y' == $user_groups_prod['option_edit'] ) echo 'checked="checked"'; ?> type="checkbox" name="user_groups_prod[<?php echo $user_groups_prod_row;?>][option_edit]" value="<?php echo "Y" ;?>"></input>
								<label class="lable_edit" for="c13<?php echo $user_groups_prod_row;?>"><span></span></label></br>
							</td>
							<td class="text-center">
								<input class="hidden_input" id="cge<?php echo $user_groups_prod_row;?>" <?php if ( 'Y' == $user_groups_prod['group_editor'] ) echo 'checked="checked"'; ?> type="checkbox" name="user_groups_prod[<?php echo $user_groups_prod_row;?>][group_editor]" value="<?php echo "Y" ;?>"></input>
								<label class="lable_edit" for="cge<?php echo $user_groups_prod_row;?>"><span></span></label></br>
							</td>
							
						</tr>
					<?php $user_groups_prod_row++?>
				<?php } ?>
				</table>
			</div>
        </form>
      </div>
    </div>
  </div>
 </div>
<?php echo $footer; ?>