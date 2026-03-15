<div class="container-accordion-menu">
	<div class="box-heading"><i class="fa fa-bars"></i><?php echo $heading_title; ?></div>
	<ul class="navcategory">
		<?php foreach ($categories as $category) { ?>
		<?php if ($category['children']) { ?>	
			<li class="<?php if ($category['category_id'] == $category_id) { ?>parent-category active<?php } else { ?>parent-category<?php } ?>">
				<a class="parent-link" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?>
				<span class="dropdown_icon1"><i class="fa fa-angle-down arrow"></i></span>
				</a>
					<div class="dropdown-menu-category">							
						<div class="col-menu-12">
							<?php foreach ($category['children'] as $child) { ?>	
								<div class="child-box-cell <?php if($child['children']) { ?> child_children<?php } ?>">
									<?php if($child['children']) { ?>
										<a class="sub-category-link" href="<?php echo $child['href']; ?>"><span class="dropdown_icon1"><i class="fa fa-angle-down arrow"></i></span><?php echo $child['name']; ?></a>
									<?php } else { ?>
										<a class="sub-category-link" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
									<?php } ?>
										<?php if($child['children']) { ?>
											<div class="child2-box">
												<?php foreach ($child['children'] as $child) { ?>
												<div class="child_children_link">
													<a href="<?php echo $child['href']; ?>"><i class="fa fa fa-level-up fa-rotate-90"></i> <?php echo $child['name']; ?></a>
												</div>	
												<?php } ?>
											</div>
										<?php } ?>
									</div>
								<?php } ?>
								</div>	
						</div>
			</li>	
			<?php } else { ?>
				<li class="parent-category no-child"><a class="parent-link" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
			<?php } ?>
		<?php } ?>
	</ul>	
</div>

