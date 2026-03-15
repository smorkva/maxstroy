<div id="popup-editor-product">
	<div class="title-editor"><?php echo $text_description;?></div>
	<form action="POST" method="post" enctype="multipart/form-data" id="description-form" class="form-horizontal">
		<input type="hidden" name="user_change" value="<?php echo $user_change;?>">
		<div class="form-group">
			<label class="col-sm-4 desc_edit_label"><?php echo $entry_keyword; ?></label>
			<div class="col-sm-6"><input class="form-control" type="text" name="keyword" value="<?php echo $keyword; ?>" /></div>
	   </div>
		<div class="form-group">
			<label class="col-sm-4 desc_edit_label"><?php echo $generate_url;?></label>
			<div class="col-sm-4">
				<a style="color:#fff;" class="btn-editor btn-primary-editor" onclick="auto_SEO_link('this_keywords','')"><?php echo $button_generate_keyword; ?></a>
			</div>		
			<?php if ($button_generate_url_keyword == 1) { ?>
			<div class="col-sm-4">
				<a style="color:#fff;" class="btn-editor btn-primary-editor" onclick="auto_SEO_link('this_keywords','<?php echo $product_id ;?>')"><?php echo $button_generate_keyword_id; ?></a>
			</div>
			<?php } ?>		
			<?php if ($button_generate_url_keyword == 2) { ?>
			<div class="col-sm-4">
				<a style="color:#fff;" class="btn-editor btn-primary-editor" onclick="auto_SEO_link('this_keywords','<?php echo $model ;?>')"><?php echo $button_generate_keyword_model; ?></a>
			</div>
			<?php } ?>	
			
		</div>
		<div class="tabs-product">
			<ul class="nav mytabs" id="language_desc">
				 <?php foreach ($languages as $language) { ?>
				<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><?php if($VERSION < 2.2){?><img src="admin/view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><?php } else { ?><img src="admin/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /><?php } ?> <?php echo $language['name']; ?></a></li>
				<?php } ?>
			</ul>
			<div class="tab-content">
					<?php foreach ($languages as $language) { ?>
						<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
							<div class="form-group">
								<label class="col-sm-3 desc_edit_label"><?php echo $entry_name; ?></label>
								<div class="col-sm-9">
									<input class="form-control" type="text" id="this_keywords" name="product_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" />
								</div>
							</div>
							<div class="form-group required">
						<label class="col-sm-3 desc_edit_label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
						<div class="col-sm-9">
						  <input type="text" name="product_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
						  <?php if (isset($error_meta_title[$language['language_id']])) { ?>
						  <div class="text-danger"><?php echo $error_meta_title[$language['language_id']]; ?></div>
						  <?php } ?>
						</div>
					  </div>
							<div class="form-group">
								<label class="col-sm-3 desc_edit_label"><?php echo $entry_meta_keyword; ?></label>
								<div class="col-sm-9">
									<input class="form-control" type="text" name="product_description[<?php echo $language['language_id']; ?>][meta_keyword]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_keyword'] : ''; ?>" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 desc_edit_label"><?php echo $entry_meta_description; ?></label>
								<div class="col-sm-9">
									<textarea class="form-control" name="product_description[<?php echo $language['language_id']; ?>][meta_description]" rows="2" rows="2"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 desc_edit_label"><?php echo $entry_tag; ?></label>
								<div class="col-sm-9">
									<input class="form-control" type="text" name="product_description[<?php echo $language['language_id']; ?>][tag]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['tag'] : ''; ?>" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<textarea class="form-control" name="product_description[<?php echo $language['language_id']; ?>][description]" id="input-description<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea>
								</div>
							</div>
							 
							
						</div>
					<?php } ?>				
			</div>
		</div>
	</form>
	<div class="row mtb10">
		<div class="col-xs-12 text-center">
			<button class="btn-editor btn-primary-editor" type="button" data-toggle="collapse" data-target="#change_edit_descs" aria-expanded="false" aria-controls="collapseExample">
			<?php echo $button_last_change;?>
			</button>
		</div>
	</div>
	<div class="row collapse" id="change_edit_descs">
	<div class="col-xs-12">
	<table class="table table-bordered table-hover">
    <thead>
      <tr>
        <th class="text-center"><?php echo $ch_user; ?></th>
        <th class="text-center"><?php echo $ch_prname; ?></th>
        <th class="text-center"><?php echo $ch_meta_title; ?></th>
        <th class="text-center"><?php echo $ch_meta_keyword; ?></th>
        <th class="text-center"><?php echo $ch_meta_description; ?></th>
        <th class="text-center"><?php echo $ch_tag; ?></th>
        <th class="text-center"><?php echo $ch_description; ?></th>
        <th class="text-center"><?php echo $ch_date; ?></th>
      </tr>
    </thead>
    <tbody>
	<?php $i=0;?>
		<?php foreach ($change_edit_descs as $change_edit_desc ) { ?>
			<?php if($i >= 10) break;?>
			<tr>
				<td class="text-center"><div class="ch-user-name"><?php echo $change_edit_desc['user_name'];?></div></label></td>
				<td class="text-center"><?php if($change_edit_desc['product_name'] !='') { ?>
					<i class="fa fa-check-square-o ch-green" aria-hidden="true"></i>
				<?php } else { ?>
					<i class="fa fa-minus-square ch-red" aria-hidden="true"></i>
				<?php } ?>
				</td>
				<td class="text-center"><?php if($change_edit_desc['seo_title'] !='') { ?>
					<i class="fa fa-check-square-o ch-green" aria-hidden="true"></i>
				<?php } else { ?>
					<i class="fa fa-minus-square ch-red" aria-hidden="true"></i>
				<?php } ?>
				</td>
				<td class="text-center"><?php if($change_edit_desc['meta_keyword'] !='') { ?>
					<i class="fa fa-check-square-o ch-green" aria-hidden="true"></i>
				<?php } else { ?>
					<i class="fa fa-minus-square ch-red" aria-hidden="true"></i>
				<?php } ?>
				</td>
				<td class="text-center"><?php if($change_edit_desc['meta_description'] !='') { ?>
					<i class="fa fa-check-square-o ch-green" aria-hidden="true"></i>
				<?php } else { ?>
					<i class="fa fa-minus-square ch-red" aria-hidden="true"></i>
				<?php } ?>
				</td>
				<td class="text-center"><?php if($change_edit_desc['tag'] !='') { ?>
					<i class="fa fa-check-square-o ch-green" aria-hidden="true"></i>
				<?php } else { ?>
					<i class="fa fa-minus-square ch-red" aria-hidden="true"></i>
				<?php } ?>
				</td>
				<td class="text-center"><?php if($change_edit_desc['description'] !='') { ?>
					<i class="fa fa-check-square-o ch-green" aria-hidden="true"></i>
				<?php } else { ?>
					<i class="fa fa-minus-square ch-red" aria-hidden="true"></i>
				<?php } ?>
				</td>
				<td class="text-center"><?php echo $change_edit_desc['date_modified'];?></td>
			</tr>
		<?php $i++;?>
	<?php } ?>
    </tbody>
  </table>
	</div>
</div>
	<div class="text-right">
		<button onclick="$('.popup_banner').popup('hide');" class="btn-editor btn-cancel-editor" type="button"><?php echo $button_cancel;?></button>
		<button onclick="CKupdate();saveEditor();" class="btn-editor btn-save-editor" type="button"><?php echo $button_save;?></button>
	</div>
</div>
<script>
function CKupdate(){
    for ( instance in CKEDITOR.instances )
        CKEDITOR.instances[instance].updateElement();
}
</script>
<script>
function saveEditor() {
	$.ajax({
			url: 'index.php?route=module/editproduct/editdescription/saveEditor&product_id=<?php echo $product_id;?>',
			type: 'post',
			dataType: 'json',
			data: $('#description-form').serialize(),
			beforeSend: function() {
				$('.popup-alert').remove();
				$('#description-form').prepend('<div id="loading_img_svg"></div>');
				$('#description-form').css('opacity',0.5);
				loading_img_svg(true);
			},
			complete: function() {
				loading_img_svg(false);
				$('#description-form').css('opacity',1);
			},
			success: function(json) {				
				$('.popup-alert').remove();
				if (json['error']) {
					$('#description-form').before('<div class="popup-alert alert alert-danger"><i class="fa fa-info-circle"></i> '+ json['error'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				if (json['success']) {
					$('#description-form').before('<div class="popup-alert alert alert-success"><i class="fa fa-info-circle"></i> '+ json['success'] +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				location.reload();
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});	
};
</script>
<style>
	
	.note-toolbar.btn-toolbar {
		background: #fff none repeat scroll 0 0;
	}
	.note-editable {
		background: #fff none repeat scroll 0 0;
	}
	.note-editor	.btn-sm, .btn-group-sm > .btn {
	  border-radius: 2px;
	  font-size: 11px;
	  line-height: 1.5;
	  padding: 4px 9px;
	  background:#ffffff;
	}
	.note-editor .btn-toolbar {
		margin-left: 0px;
	}
</style>
<script src="catalog/view/editproduct/ckeditor454/ckeditor.js"></script>
<script><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('input-description<?php echo $language['language_id']; ?>');
CKEDITOR.on('dialogDefinition', function (event){
    var editor = event.editor;
    var dialogDefinition = event.data.definition;
    var dialogName = event.data.name;
    var tabCount = dialogDefinition.contents.length;
    for (var i = 0; i < tabCount; i++) {
		var browseButton = dialogDefinition.contents[i].get('browse');
        if (browseButton !== null) {
            browseButton.hidden = false;
            browseButton.onClick = function() {
				$('#modal-image').remove();
				$.ajax({
					url: 'index.php?route=common/filemanagernew&token=<?php echo $token; ?>&ckedialog='+this.filebrowser.target,
					dataType: 'html',
					success: function(html) {
						$('body').append('<div id="modal-image" style="z-index: 10020;" class="modal">' + html + '</div>');
						$('#modal-image').modal('show');
					}
				});	
			}
        }
    }
});
<?php } ?>
//--></script> 
<script>
$('#language_desc a:first').tab('show');
</script> 
<script>
	function auto_SEO_link(e,id){
		var name = $("#"+e).val();
		var link_name = get_link_SEO.translit(name+'-'+id);
		$("input[name='keyword']").val(link_name);
	}
var get_link_SEO = {
  fromChars : 'абвгдезиклмнопрстуфыэйхё',
  toChars : 'abvgdeziklmnoprstufyejxe',
  biChars : {'ж':'zh','ц':'ts','ч':'ch','ш':'sh','щ':'sch','ю':'ju','я':'ja','&':'-and-'},
  vowelChars : 'аеёиоуыэюя',
  translit : function(str) {
    str = str.replace(/[_\s\.,?!\[\](){}\\\/"':;]+/g, '-')
             .toLowerCase()
             .replace(new RegExp('(ь|ъ)(['+this.vowelChars+'])', 'g'), 'j$2')
             .replace(/(ь|ъ)/g, '');

    var _str = '';
    for (var x=0; x<str.length; x++)
      if ((index = this.fromChars.indexOf(str.charAt(x))) > -1)
        _str += this.toChars.charAt(index);
      else
        _str += str.charAt(x);
    str = _str;

    var _str = '';
    for (var x=0; x<str.length; x++)
      if (this.biChars[str.charAt(x)])
        _str += this.biChars[str.charAt(x)];
      else
        _str += str.charAt(x);
    str = _str;

    str = str.replace(/j{2,}/g, 'j')
             .replace(/[^-0-9a-z]+/g, '')
             .replace(/-{2,}/g, '-')
             .replace(/^-+|-+$/g, '');

    return str;
  }
}
</script>