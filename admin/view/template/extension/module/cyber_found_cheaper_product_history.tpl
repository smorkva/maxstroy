<?php if ($foundcheaper_data) { ?>
	<div class="row" style="margin-bottom:10px">
		<div class="col-sm-12 text-right">
			 <a class="btn btn-primary" href="javascript:void(0);" onclick="update_status();"><?php echo $btn_change_status;?></a>
			 <a class="btn btn-danger" href="javascript:void(0);" onclick="del_selected();"><?php echo $btn_del;?></a>
		</div>
	</div>
<?php } ?>
<div class="table-responsive">
  <table class="table table-bordered">
    <thead>
      <tr>
        <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected_id_found_cheaper\']').attr('checked', this.checked);" /></td>
        <td class="text-left" ><?php echo $column_buyer; ?></td>
        <td class="text-left" ><?php echo $column_product; ?></td>
        <td class="text-left"><?php echo $column_comment_manager; ?></td>
        <td class="text-left"><?php echo $column_status; ?></td>
        <td class="text-left"><?php echo $column_date_added; ?></td>
        <td class="text-left"><?php echo $column_date_modified; ?></td>
        
      </tr>
    </thead>
    <tbody>
    <?php if ($foundcheaper_data) { ?>
      <?php foreach ($foundcheaper_data as $result) { ?>
      <tr>
        <td style="text-align: center;"><input class="checkbox_found_cheaper_selected" type="checkbox" name="selected_id_found_cheaper[]" value="<?php echo $result['id_found_cheaper']; ?>" /></td>
        <td class="text-left">
			<?php if($result['name_field'] !='') { ?><div class="name_field"><i class="fa fa-user fa-fw"></i> <?php echo $result['name_field']; ?></div><?php } ?>
			<?php if($result['telephone_field'] !='') { ?><div class="telephone_field"><i class="fa fa-phone-square fa-fw"></i> <?php echo $result['telephone_field']; ?></div><?php } ?>
			<?php if($result['email_field'] !='') { ?><div class="email_field"><i class="fa fa-envelope-o fa-fw"></i> <?php echo $result['email_field']; ?></div><?php } ?>
			<?php if($result['link_field'] !='') { ?><div class="link_field"><i class="fa fa-link fa-fw"></i> <?php echo $result['link_field']; ?></div><?php } ?>
			<?php if($result['comment_field'] !='') { ?><div class="comment_field"><i class="fa fa-comment-o fa-fw"></i> <?php echo $result['comment_field']; ?></div><?php } ?>
        </td>
		<td><div class="name-product"><?php echo $result['product']['name']; ?></div>
		<div class="image-product"><img src="<?php echo $result['product']['thumb']; ?>" alt="<?php echo $result['product']['name']; ?>" title="<?php echo $result['product']['name']; ?>" class="img-responsive"/></div>
		<div class="cod-product">
			<?php if($result['product']['sku'] !='') { ?><span class="sku"><b><?php echo $text_sku_product;?></b><?php echo $result['product']['sku']; ?></span></br><?php } ?>
			<?php if($result['product']['model'] !='') { ?><span class="sku"><b><?php echo $text_model_product;?></b><?php echo $result['product']['model']; ?></span><?php } ?>
		</div>
		</td>
		<td class="text-left">
		<textarea class="form-control" id="comment_manager_<?php echo $result['id_found_cheaper']; ?>" name="<?php echo $result['comment_manager']; ?>"><?php echo $result['comment_manager']; ?></textarea>
		<a class="btn btn-info martb" onclick="saveCommentManager('<?php echo $result['id_found_cheaper']; ?>');"><?php echo $btn_change_comment_manager;?></a>
		</td>
        <?php if ($result['status_id'] == '1') { ?>
            <td class="right" style="background:#0BED0B !important;"><?php echo $result['status'] ?></td>
        <?php } else { ?>
			<td class="right" style="background:#EDB40B !important;"><?php echo $result['status']; ?></td>
        <?php } ?>
        
        <td class="text-left"><?php echo $result['date_added']; ?></td>
        <td class="text-left"><?php echo $result['date_modified']; ?></td>
      </tr>
      <?php } ?>
      <?php } else { ?>
        <tr>
          <td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
        </tr>
      <?php } ?>
    </tbody>
  </table>
</div>
<div class="row">
  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>