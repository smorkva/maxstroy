<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-reviews-list').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
			<div class="well">
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-author"><?php echo $entry_name_author; ?></label>
                <input type="text" name="filter_author" value="<?php echo $filter_author; ?>" placeholder="<?php echo $entry_name_author; ?>" id="input-author" class="form-control" />
              </div>
            </div>
			<div class="col-sm-4">
			   <div class="form-group">
                <label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
                <select name="filter_status" id="input-status" class="form-control">
                  <option value="*"></option>
                  <?php if ($filter_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <?php } ?>
                  <?php if (!$filter_status && !is_null($filter_status)) { ?>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
			<div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
            </div>
            <div class="col-sm-12">
             
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>	
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-reviews-list">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-center"><?php echo $column_name; ?></td>
                  <td class="text-center"><?php echo $column_description; ?></td>
				  <td class="text-center"><?php echo $column_like_dislike;?></td>
					<?php foreach($theme_reviews_store as $theme_review_store) { ?>
					<td class="text-center"><?php echo $theme_review_store['theme_text']?></td>
					<?php } ?>
				  <td class="text-center"><?php echo $column_avg_rating; ?></td>
				  <td class="text-center"><?php echo $column_status; ?></td>
				  <td class="text-center"><?php echo $column_status_check; ?></td>
                  <td class="text-center"><?php echo $column_date_added; ?></td>
                  <td class="text-center"><?php echo $column_action; ?></td>
                </tr>
              </thead>
			  <style>
			  .avg-rating {
					height: 16px;
					line-height: 16px;
					display: inline-block;
					
				}
				
				.avg-rating-stars {
					background:url("view/image/avg-rating/star_empty_m.png") repeat-x;
					width:80px;
					height:16px;
					
				}
				.avg-realrating {
					background:url("view/image/avg-rating/star_m.png") repeat-x;
					height:16px;
				}
				.rating-theme .fa-stack {
					width: 1em;
				}
				.rating-theme .fa-stack-1x {
					font-size: 16px;
				}
				.rating-theme .fa-star {
					color:#ccc;
				}
				.rating-theme .fa-star.active {
					color:#fdf507;
				}
				.btn-like,
				.btn-dislike {
					padding:4px 2px;
					border:0px;
					background:transparent;
					border:1px solid #d9d9d9;
					border-radius:4px;
					margin:0px 2px;
				}
				.btn-like span,
				.btn-dislike span {
					margin-left:5px;
				}
				.btn-like i {
					color:#008000;
					font-size:14px;
				}
				.btn-like span.likes {
					color:#008000;
					font-size:12px;
				}
				.btn-dislike span.dislikes {
					color:#d00000;
					font-size:12px;
				}
				.btn-dislike i {
					color:#d00000;
					font-size:14px;
				}
			  </style>
              <tbody>
                <?php if ($reviews_store) { ?>
                <?php foreach ($reviews_store as $review_store) { ?>
                <tr>
					<td class="text-center"><?php if (in_array($review_store['reviews_store_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $review_store['reviews_store_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $review_store['reviews_store_id']; ?>" />
                    <?php } ?></td>
					<td><i class="fa fa-user" aria-hidden="true"></i> <?php echo $review_store['author'];?></td>
					<td style="max-width:200px;word-break: break-all;"><?php echo $review_store['description'];?></td>
					<td class="text-center">
						<div class="like-dislike-box pull-right ">	
							<span class="btn-like like"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
								<span class="likes"><?php echo $review_store['like'];?></span>
							</span>
							<span class="btn-dislike dislike"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i>
								<span class="dislikes"><?php echo $review_store['dislike'];?></span>
							</span>							
						</div>
					</td>
					<?php foreach($review_store['ratings_theme'] as $rating_theme) { ?>
					<td class="text-center rating-theme">
					  <?php echo '('. $rating_theme['rating'] . ')';?>
					</td>
					<?php } ?>
					<td class="text-center">
					<div class="avg-rating">
						<div class="avg-rating-stars"><div class="avg-realrating" style="width:<?php echo ($review_store['avg_customer_rating']*100/5)?>%;"></div></div>
					</div>
					</td>
					<td class="text-center"><a class="columnstatus" id="status-<?php echo $review_store['reviews_store_id']; ?>"><?php echo $review_store['status']; ?></a></td>
					<td class="text-center"><a class="columnstatuscheck" id="status_check-<?php echo $review_store['reviews_store_id']; ?>"><?php echo $review_store['status_check']; ?></a></td>
					<td class="text-center"><?php echo $review_store['date_added'];?></td>
					<td class="text-center"><a href="<?php echo $review_store['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
</div>
<script><!--
$('.columnstatus').click(function() {
	var object_id=$(this).attr('id');
	$.ajax({
		url: 'index.php?route=catalog/reviews_store/changeStatus&token=<?php echo $token; ?>',
		type: 'get',
		data: {object_id:object_id},
		dataType: 'html',
		success: function(html) {
			if(html!=''){				
				$('#'+object_id).html(html);
			}
		}
	});
});	
$('.columnstatuscheck').click(function() {
	var object_id=$(this).attr('id');
	$.ajax({
		url: 'index.php?route=catalog/reviews_store/changeStatusCheck&token=<?php echo $token; ?>',
		type: 'get',
		data: {object_id:object_id},
		dataType: 'json',
		success: function(json) {
			if(json['status']!=''){				
				$('#'+object_id).html(json['status']);
			}
			if(json['countreviewsoff']!=''){				
				$('#count-reviews-store').html(json['countreviewsoff']);
			}
		}
	});
});	
$('#button-filter').on('click', function() {
	url = 'index.php?route=catalog/reviews_store&token=<?php echo $token; ?>';
	
	var filter_author = $('input[name=\'filter_author\']').val();
	
	if (filter_author) {
		url += '&filter_author=' + encodeURIComponent(filter_author);
	}
	
	var filter_status = $('select[name=\'filter_status\']').val();
	
	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status); 
	}		
			
	var filter_date_added = $('input[name=\'filter_date_added\']').val();
	
	if (filter_date_added) {
		url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
	}

	location = url;
});
//--></script>
  <script><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script>
<?php echo $footer; ?>