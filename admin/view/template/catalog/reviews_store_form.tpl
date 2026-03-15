<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-product_tabs" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-reviews-store-form" class="form-horizontal">
				<div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name-author"><?php echo $entry_name_author; ?></label>
                    <div class="col-sm-10">
						<input type="text" name="author" value="<?php echo $author;?>" id="input-name-author" class="form-control" />
                    </div>
                </div>
				<div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name-description"><?php echo $entry_description_review; ?></label>
                    <div class="col-sm-10">
						<textarea rows="5" type="text" name="description" id="input-name-description" class="form-control"><?php echo $description;?></textarea>
                    </div>
                </div>
				<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-name-admin-response"><?php echo $entry_admin_response; ?></label>
                    <div class="col-sm-10">
						<textarea rows="5" type="text" name="admin_response" id="input-name-admin-response" class="form-control"><?php echo $admin_response;?></textarea>
                    </div>
                </div>
				<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-name-like"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> <?php echo $entry_like; ?></label>
                    <div class="col-sm-10">
						<input type="number" min="0" name="like" value="<?php echo $like;?>" id="input-name-like" class="form-control" />
                    </div>
                </div>
				<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-name-dislike"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> <?php echo $entry_dislike; ?></label>
                    <div class="col-sm-10">
						<input type="number" min="0" name="dislike" value="<?php echo $dislike;?>" id="input-name-dislike" class="form-control" />
                    </div>
                </div>
				<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-name-date-added"><?php echo $entry_date_added; ?></label>
                    <div class="col-sm-3">
						<div class="input-group datetime">
                            <input type="text" name="date_added" value="<?php echo $date_added; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-name-date-added" class="form-control" />
                            <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span>
						</div>
                    </div>
                </div>
				<script>
				$('.datetime').datetimepicker({
					pickDate: true,
					pickTime: true
				});
				</script>
				<style>
						.rating-store {
							font-size: 0;
							color: #ccc;
							display: inline-block;
							vertical-align: middle;
						}
						.rating-store input {
							display: none;
						}
						.rating-store * {
							margin: 0 1px 0 0;
						}
						.rating-store label .fa {
							font-size: 22px;
							padding: 2px 4px 2px 0px;
							cursor: pointer;
						}
						.star-rating.active {
							color: #fdf507 !important;
						}
						.star-rating.checked {
							color: #fdf507;
						}
						.row.top-10 {
							margin-top:10px;
						}
					</style>
				<?php foreach($rating as $item){?>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $item['theme_text'];?></label>
						<div class="col-sm-8">
							<div class="rating-store">
								<input id="rat1<?php echo $item['reviews_store_theme_id'];?>" type="radio" name="rating[<?php echo $item['reviews_store_theme_id'];?>]" value="1" /><label class="star-rating label-star<?php echo $item['reviews_store_theme_id'];?>" for="rat1<?php echo $item['reviews_store_theme_id'];?>"><i class="fa fa-star"></i></label>
								<input id="rat2<?php echo $item['reviews_store_theme_id'];?>" type="radio" name="rating[<?php echo $item['reviews_store_theme_id'];?>]" value="2" /><label class="star-rating label-star<?php echo $item['reviews_store_theme_id'];?>" for="rat2<?php echo $item['reviews_store_theme_id'];?>"><i class="fa fa-star"></i></label>
								<input id="rat3<?php echo $item['reviews_store_theme_id'];?>" type="radio" name="rating[<?php echo $item['reviews_store_theme_id'];?>]" value="3" /><label class="star-rating label-star<?php echo $item['reviews_store_theme_id'];?>" for="rat3<?php echo $item['reviews_store_theme_id'];?>"><i class="fa fa-star"></i></label>
								<input id="rat4<?php echo $item['reviews_store_theme_id'];?>" type="radio" name="rating[<?php echo $item['reviews_store_theme_id'];?>]" value="4" /><label class="star-rating label-star<?php echo $item['reviews_store_theme_id'];?>" for="rat4<?php echo $item['reviews_store_theme_id'];?>"><i class="fa fa-star"></i></label>
								<input id="rat5<?php echo $item['reviews_store_theme_id'];?>" type="radio" name="rating[<?php echo $item['reviews_store_theme_id'];?>]" value="5" /><label class="star-rating label-star<?php echo $item['reviews_store_theme_id'];?>" for="rat5<?php echo $item['reviews_store_theme_id'];?>"><i class="fa fa-star"></i></label>
							</div>
							<script><!--
									$('.label-star<?php echo $item['reviews_store_theme_id'];?>').hover(function () {
										$(this).prevAll('.label-star<?php echo $item['reviews_store_theme_id'];?>').addClass('active');
										$(this).addClass('active');
									},function () {
										$(this).prevAll('.label-star<?php echo $item['reviews_store_theme_id'];?>').removeClass('active');
										$(this).removeClass('active');
									});
									
									$('.label-star<?php echo $item['reviews_store_theme_id'];?>').click(function(){
										$('.label-star<?php echo $item['reviews_store_theme_id'];?>').each(function(){
											$(this).removeClass('checked');
											$(this).prevAll('.label-star<?php echo $item['reviews_store_theme_id'];?>').removeClass('checked');
										});
										
										$(this).addClass('checked');
										$(this).prevAll('.label-star<?php echo $item['reviews_store_theme_id'];?>').addClass('checked');
									});
									$('#rat<?php echo $item['rating']?><?php echo $item['reviews_store_theme_id']?>').next().trigger('click');
							//--></script>
						</div>
					</div>
				<?php } ?>
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
<?php echo $footer; ?>