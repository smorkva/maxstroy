<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-purchase" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-purchase" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-form-field" data-toggle="tab"><?php echo $tab_form_field; ?></a></li>
            <li><a href="#list-tab" data-toggle="tab"><?php echo $tab_list; ?></a></li>         
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-form-field">	
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $entry_status;?></label>
					<div class="col-sm-9">
						<div class="checkbox-group-qa">
							<label><input type="checkbox" name="qadata[status]" value="1" <?php echo (isset($qadata['status']) ? 'checked="checked"' : '') ?> /><span></span></label>						 
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $entry_send_email_status;?></label>
					<div class="col-sm-9">
						<div class="checkbox-group-qa">
							<label><input type="checkbox" name="qadata[send_email_status]" value="1" <?php echo (isset($qadata['send_email_status']) ? 'checked="checked"' : '') ?> /><span></span></label>						 					
						</div>
					</div>
				</div>
				<div class="form-group required">
					<label class="col-sm-3 control-label" for="input-email-found-cheaper"><?php echo $entry_email; ?></label>
					<div class="col-sm-9">
						<input type="text" name="qadata[email_question_answer]" value="<?php echo $qadata['email_question_answer']; ?>" id="input-email-found-cheaper" class="form-control" />
						<?php if ($error_email_question_answer) { ?>
							<div class="text-danger"><?php echo $error_email_question_answer; ?></div>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-3 title-fields"><?php echo $text_field_name?></div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_status_fields;?></label>
					<div class="col-sm-9">
						<div class="checkbox-group-qa">
						<label><input type="checkbox" name="qadata[name_field]" value="1" <?php echo (isset($qadata['name_field']) ? 'checked="checked"' : '') ?> /><span></span></label>						
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_requared_fields;?></label>
					<div class="col-sm-9">
						<div class="checkbox-group-qa">
						<label><input type="checkbox" name="qadata[name_field_required]" value="1" <?php echo (isset($qadata['name_field_required']) ? 'checked="checked"' : '') ?> /><span></span></label>						
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_placeholder_fields; ?></label>
					<div class="col-sm-9">
						<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><?php if($VERSION < 2.2){?>
								<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
							<?php } else { ?>
								<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
							<?php } ?></span>
								<input name="qadata[name_field_placeholder][<?php echo $language['language_id']; ?>][text]" class="form-control" value="<?php echo isset($qadata['name_field_placeholder'][$language['language_id']]) ? $qadata['name_field_placeholder'][$language['language_id']]['text'] : ''; ?>"></input>
							</div>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-3 title-fields"><?php echo $text_field_telephone?></div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_status_fields;?></label>
					<div class="col-sm-9">
						<div class="checkbox-group-qa">
							<label><input type="checkbox" name="qadata[telephone_field]" value="1" <?php echo (isset($qadata['telephone_field']) ? 'checked="checked"' : '') ?> /><span></span></label>				
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_telephone_mask_fields; ?></label>
					<div class="col-sm-3">
						<input name="qadata[telephone_field_mask]" class="form-control" value="<?php echo isset($qadata['telephone_field_mask']) ? $qadata['telephone_field_mask'] : ''; ?>"></input>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_requared_fields;?></label>
					<div class="col-sm-9">
						<div class="checkbox-group-qa">
						<label><input type="checkbox" name="qadata[telephone_field_required]" value="1" <?php echo (isset($qadata['telephone_field_required']) ? 'checked="checked"' : '') ?> /><span></span></label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_placeholder_fields; ?></label>
					<div class="col-sm-3">
						<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><?php if($VERSION < 2.2){?>
								<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
							<?php } else { ?>
								<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
							<?php } ?></span>
								<input name="qadata[telephone_field_placeholder][<?php echo $language['language_id']; ?>][text]" class="form-control" value="<?php echo isset($qadata['telephone_field_placeholder'][$language['language_id']]) ? $qadata['telephone_field_placeholder'][$language['language_id']]['text'] : ''; ?>"></input>
							</div>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-3 title-fields"><?php echo $text_field_email;?></div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_status_fields;?></label>
					<div class="col-sm-9">
						<div class="checkbox-group-qa">
							<label><input type="checkbox" name="qadata[email_field]" value="1" <?php echo (isset($qadata['email_field']) ? 'checked="checked"' : '') ?> /><span></span></label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_requared_fields;?></label>
					<div class="col-sm-9">
						<div class="checkbox-group-qa">
						<label><input type="checkbox" name="qadata[email_field_required]" value="1" <?php echo (isset($qadata['email_field_required']) ? 'checked="checked"' : '') ?> /><span></span></label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $text_placeholder_fields; ?></label>
					<div class="col-sm-3">
						<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><?php if($VERSION < 2.2){?>
								<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
							<?php } else { ?>
								<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
							<?php } ?></span>
								<input name="qadata[email_field_placeholder][<?php echo $language['language_id']; ?>][text]" class="form-control" value="<?php echo isset($qadata['email_field_placeholder'][$language['language_id']]) ? $qadata['email_field_placeholder'][$language['language_id']]['text'] : ''; ?>"></input>
							</div>
						<?php } ?>
					</div>
				</div>		
				
				<div class="form-group">
					<div class="col-sm-3 title-fields"><?php echo $text_field_captcha;?></div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $entry_status; ?></label>
					<div class="col-sm-3">
						<div class="checkbox-group-qa">
							<label><input type="checkbox" name="qadata[captcha_field]" value="1" <?php echo (isset($qadata['captcha_field']) ? 'checked="checked"' : '') ?> /><span></span></label>
						</div>
					</div>
				</div>
            </div>
            <div class="tab-pane" id="list-tab">
              <div id="list_applications"></div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script>
function saveCommentManager(qa_id) {
	var comment_manager = $('#comment_manager_' + qa_id).val();
	console.log(comment_manager);
  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/module/cyber_question_answer/saveCommentManager&token=<?php echo $token; ?>&qa_id=' + qa_id + '&comment_manager=' + comment_manager,
    dataType: 'json',
    success: function(json) {
     if (json['success']) {
	 $('.alert.alert-danger.update_status').remove();
		$('#list_applications').load('index.php?route=extension/module/cyber_question_answer/list_applications&token=<?php echo $token; ?>');
		$('#list_applications').before('<div class="alert alert-success update_status"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');	
	}
    }
  });
}
function update_status() {
  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/module/cyber_question_answer/update_status&token=<?php echo $token; ?>',
    data: $('#list_applications input.checkbox_question_answer_selected[type=\'checkbox\']:checked'),
    dataType: 'json',
    success: function(json) {
		$('.alert.alert-danger.update_status, .alert.alert-success.update_status').remove();
		if (json['error']) {
			$('#list_applications').before('<div class="alert alert-danger update_status"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');	
		} 
		if (json['success']) {
			$('#list_applications').load('index.php?route=extension/module/cyber_question_answer/list_applications&token=<?php echo $token; ?>');
			$('#list_applications').before('<div class="alert alert-success update_status"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');	
		} 
     
    }
  });
}
function del_selected() {
  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/module/cyber_question_answer/del_selected&token=<?php echo $token; ?>',
    data: $('#list_applications input.checkbox_question_answer_selected[type=\'checkbox\']:checked'),
    dataType: 'json',
    success: function(json) {
		$('.alert.alert-danger.del_selected, .alert.alert-success.del_selected').remove();
		if (json['error']) {
			$('#list_applications').before('<div class="alert alert-danger del_selected"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');	
		} 
		if (json['success']) {
			$('#list_applications').load('index.php?route=extension/module/cyber_question_answer/list_applications&token=<?php echo $token; ?>');
			$('#list_applications').before('<div class="alert alert-success del_selected"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');	
		} 
     
    }
  });
}
$('#list_applications').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();
  $('#list_applications').load(this.href);
});
$('#list_applications').load('index.php?route=extension/module/cyber_question_answer/list_applications&token=<?php echo $token; ?>');
<?php if($tablist == 1){?>
$('.nav-tabs a[href="#list-tab"]').trigger('click');
<?php } ?>
</script>
<?php echo $footer; ?>