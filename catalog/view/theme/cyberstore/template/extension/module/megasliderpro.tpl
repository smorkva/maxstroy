<div class="megasliderpro">
<div class="row">
<div class="megasliderpro-container col-sm-12">
	<div class="oc-nivoslider">
		<div id="oc-inivoslider<?php echo $module;?>" class="slides">
			<?php $config = $slide_setting[0]; ?>
			<?php $i = 1; $style_msp = '';?>
			<?php foreach($megasliders as $resultbg) {?>
			<?php if($i > 1){ $style_msp = 'style="display: none;"';?><?php } ?>
			<?php if(!empty($resultbg['link'])) { ?>
					<a href="<?php echo $resultbg['link']; ?>"><img class="bg-image-slider" <?php echo $style_msp;?> src="<?php echo $resultbg['image']; ?>" alt="" title="#msp-caption<?php echo $i; ?><?php echo $module;?>"  /></a>
			<?php } else { ?>
					<img class="bg-image-slider" <?php echo $style_msp;?> src="<?php echo $resultbg['image']; ?>" alt="" title="#msp-caption<?php echo $i; ?><?php echo $module;?>"/>
			<?php } ?>
			<?php $i ++; ?>			
			<?php }?> 
		</div>
		<?php $i = 1;?>
		<?php foreach($megasliders as $result) { ?>
		<?php 
			$class = "";
			if($result['type']==1){ $class = "slide-type1"; }
			if($result['type']==2){ $class = "slide-type2"; }
		?>
			<div id="msp-caption<?php echo $i; ?><?php echo $module;?>" class="msp-caption nivo-html-caption nivo-caption">
				<div class="<?php echo $class; ?>">	
					<?php if($result['small_image']){ ?>
						<div class="row-slider-small-img">
						<div class="msp-small_image">
							<img src="<?php echo $result['small_image']; ?>" alt="" title="small" />
						</div>
						</div>
					<?php } ?>
					<div class="row-slider-info">
						<?php if($result['title']){ ?>
						<div class="msp-title effect_title<?php echo $i; ?><?php echo $module;?>">
							<div class="text-title" <?php if($result['bg_title'] !='' || $result['color_title']){?>style="<?php if(!empty($result['bg_title'])){?>background:<?php echo $result['bg_title'];?>;<?php } ?> <?php if(!empty($result['color_title'])){?>color:<?php echo $result['color_title'];?>"<?php } ?><?php } ?>><?php echo $result['title']; ?></div>
						</div>
						<?php } ?>
						<?php if($result['sub_title']){ ?>
						<div class="sub-title effect_sub_title<?php echo $i; ?><?php echo $module;?>">
							<div class="text-sub-title" <?php if($result['bg_sub_title'] !='' || $result['color_sub_title']){?>style="<?php if(!empty($result['bg_title'])){?>background:<?php echo $result['bg_sub_title'];?>;<?php } ?><?php if(!empty($result['color_sub_title'])){?>color:<?php echo $result['color_sub_title'];?>"<?php } ?><?php } ?>><?php echo $result['sub_title']; ?></div>
						</div>
						<?php } ?>
						<div class="msp-des effect_description_title<?php echo $i; ?><?php echo $module;?>">
							<?php echo $result['description']; ?>
						</div>
					</div>
				</div>							
			</div>						
			<?php $i++; ?>
		<?php } ?>
		<script>
            $(document).ready(function () {
                $('#oc-inivoslider<?php echo $module;?>').nivoSlider({
					effect: '<?php if($config['effect']) { echo $config['effect'];} else { echo 'random'; } ?>',
                    slices: 25,
                    boxCols: 14,
                    boxRows: 8,
                    animSpeed:500,
                    pauseTime: '<?php  if($config['delay']) { echo $config['delay']; } else { echo 3000;} ?>',
                    startSlide: 0,
					controlNav:  <?php  if(isset($config['contrl']) && $config['contrl'] == 1) { echo 'true' ; } else { echo 'false';} ?>,
					directionNav:  <?php  if(isset($config['nextback'])&& $config['nextback'] == 1) { echo 'true' ; } else { echo 'false';} ?>,
                    controlNavThumbs: false,
                    pauseOnHover:  <?php  if(isset($config['hover'])&& $config['hover'] == 1) { echo 'true' ; } else { echo 'false';} ?>,
                    prevText: '<i class="fa fa-angle-left" aria-hidden="true"></i>',
                    nextText: '<i class="fa fa-angle-right" aria-hidden="true"></i>',						
                });
            });
			
		</script>
	</div>
</div>
</div>
</div>