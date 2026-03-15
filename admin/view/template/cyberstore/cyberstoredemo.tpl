<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="col-sm-12"><div class="alert alert-danger"><?php echo $description;?></div></div>
				<div class="col-sm-12" id="demo_bd">
						<button type="button" onclick="addDemoBd('cyberstore_1');" class="btn btn-info" ><?php echo $text_btn_1;?></button>
			   </div>
			</div>
		</div>
          
    <script type="text/javascript">
		function addDemoBd(bdname) {
			$.ajax({
				type:'get',
				dataType:'json',
				data:'bdname=' + bdname,
				url:'index.php?route=cyberstore/cyberstoredemo/addDemoBd&token=<?php echo $token; ?>',	
				success: function(json){
					$('.alert.alert-danger, .alert.alert-success').remove();
					if (json['error']) {
						$('#demo_bd').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');		
						setTimeout(function(){
							$('.alert-success').remove();
						}, 2000)
						
					}
					if (json['success']) {
						$('#demo_bd').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');		
						setTimeout(function(){
							$('.alert-success').remove();
						}, 2000)
						
					}	
				}
			});				
			
		};
</script>
  </div>
</div>
<?php echo $footer; ?>