<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<a class="btn btn-primary" onclick="location='<?php echo $products; ?>'"><span><?php echo $button_products; ?></span></a>
				<a class="btn btn-success"  data-toggle="tooltip" title="<?php echo $button_insert;?>" onclick="location='<?php echo $insert; ?>'"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
				<a class="btn btn-danger"  data-toggle="tooltip" title="<?php echo $button_delete; ?>" onclick="$('form').submit();"><i class="fa fa-trash-o"></i></a>
				<a class="btn btn-default" href="<?php echo $back; ?>" data-toggle="tooltip" title="<?php echo $button_back; ?>"><i class="fa fa-reply"></i></a>
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
			<script type="text/javascript">$('.success').fadeOut(7000);</script>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
			</div>
			<div class="panel-body">
				<?php if ($stickers_lists) { ?>
					<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">
						<table class="table table-striped table-bordered table-hover" id="stickers_list">
							 <thead>
							  <tr>
							   <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
							   <td class="text-left"><a href="<?php echo $sort_name; ?>" class="<?php echo ($sort == 'sl.name') ? strtolower($order) : ''; ?>"><?php echo $column_name_sticker; ?></a></td>
							   <td class="text-center" width="20%"><a href="<?php echo $sort_order; ?>" class="<?php echo ($sort == 'sl.sort_order') ? strtolower($order) : ''; ?>"><?php echo $column_sort_order; ?></a></td>
							   <td class="text-center" width="10%"><?php echo $column_action; ?></td>
							  </tr>
							 </thead>
							 <tbody>
							  <?php foreach ($stickers_lists as $stickers_list) { ?>
							  <tr class="<?php echo ($stickers_list['selected']) ? 'selected' : ''; ?>">
							   <td class="text-center">
								<?php if ($stickers_list['selected']) { ?>
								<input type="checkbox" name="selected[]" value="<?php echo $stickers_list['sticker_id']; ?>" checked="checked" />
								<?php } else { ?>
								<input type="checkbox" name="selected[]" value="<?php echo $stickers_list['sticker_id']; ?>" />
								<?php } ?>
							   </td>
							   <td class="left name"><?php echo $stickers_list['name']; ?></td>
							   <td class="text-center"><?php echo $stickers_list['sort_order']; ?></td>
							   <td class="text-center"><a data-toggle="tooltip" title="<?php echo $text_edit; ?>" class="btn btn-primary" href="<?php echo $stickers_list['edit_sticker']; ?>"><i class="fa fa-pencil"></i></a>
							   </td>
							  </tr>
							  <?php } ?>
							 </tbody>
							</table>
					</form>
				<div class="row">
					<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
					<div class="col-sm-6 text-right"><?php echo $results; ?></div>
				</div>
				<?php } else { ?>
					<div class="attention" align="text-center"><?php echo $text_no_results; ?></div>
				<?php } ?>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>