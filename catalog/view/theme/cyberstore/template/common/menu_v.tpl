<div class="menu-header-box">
	<div class="container">
	<div class="row">   
		<div class="col-sm-12 col-md-3 menu-box <?php if(isset($main_menu_fix_mobile) && ($main_menu_fix_mobile == 1)) { ?>hidden-xs hidden-sm<?php } ?>">
			<?php if ($items) { ?>
			<nav id="menu" class="btn-group btn-block">
				<button type="button" class="btn btn-menu btn-block dropdown-toggle hidden-md hidden-lg" <?php if(isset($type_mobile_menu) && ($type_mobile_menu == '1')){ ?> data-toggle="offcanvas" data-target="#menu-mobile-ns.navmenu.offcanvas" data-canvas="body"<?php } else { ?>data-toggle="dropdown"<?php } ?>>
					<i class="fa fa-bars"></i>
					<span class="text-category hidden-xs hidden-sm"><?php echo $text_category; ?></span>
				</button>
				<button type="button" class="btn btn-menu btn-block dropdown-toggle hidden-xs hidden-sm" data-toggle="dropdown">
					<i class="fa fa-bars"></i>
					<span class="text-category"><?php echo $text_category; ?></span>
					<i class="fa fa-angle-down arrow"></i>
				</button>
				<ul id="menu-list" class="dropdown-menu">
					<?php foreach ($items as $item) { ?>
						<?php if ($item['children']) { ?>
							<li class="dropdown <?php if($item['additional_menu']=="additional"){ ?>hidden-md hidden-lg<?php } ?>">
							<span class="toggle-child">
								<i class="fa fa-plus plus"></i>
								<i class="fa fa-minus minus"></i>
							</span>
								<a href="<?php echo $item['href']; ?>" <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link" class="parent-link"'; } else {echo 'class="parent-link dropdown-img"';} ?>>
									<?php if($item['thumb']){?>
										<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
									<?php } ?>
									<?php if($item['thumb_hover']){?>
										<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
									<?php } ?>
									<div class="item-name<?php if($item['thumb']){?> himg<?php } ?>"><?php echo $item['name'];?></div>
									<div class="item-dop-info<?php if($item['thumb']){?> himg<?php } ?>"><?php echo $item['dop_info_vm'];?></div>
									<?php if(!empty($item['sticker_parent'])){?>
										<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
									<?php } ?>
									<i class="fa fa-angle-right arrow"></i>
								</a>
								
								<?php if(($item['type']=="freelink") || ($item['type']=="category")){?>
								<?php if($item['subtype']=="simple"){ ?>
								  <div class="ns-dd dropdown-menu-simple nsmenu-type-category-simple">
										<ul class="list-unstyled nsmenu-haschild">
											<?php foreach ($item['children'] as $child) { ?>
											<li <?php if(!empty($child['children'])){?> class="nsmenu-issubchild"<?php } ?>>
												<a href="<?php echo $child['href']; ?>"><?php if(!empty($child['children'])){ ?><i class="fa fa-angle-down arrow"></i><?php } ?><?php echo $child['name']; ?></a>
												<?php if(!empty($child['children'])){ ?>
												<ul class="list-unstyled nsmenu-ischild nsmenu-ischild-simple">
													<?php foreach ($child['children'] as $subchild) { ?>
														<?php if($item['type']=="freelink"){ ?>
															<li><a href="<?php echo $subchild['link']; ?>"><?php echo $subchild['title']; ?></a></li>
														<?php } else { ?>
															<li class="<?php if(count($subchild['child_4level_data'])){?> ischild_4level_simple<?php } ?>">
																<a href="<?php echo $subchild['href']; ?>"><?php if(count($subchild['child_4level_data'])){?><i class="fa fa-angle-down arrow"></i><?php }?>
																<?php echo $subchild['name']; ?>
																</a>
																<?php if(!empty($subchild['child_4level_data'])){ ?>
																<ul class="list-unstyled child_4level_simple">
																	<?php foreach ($subchild['child_4level_data'] as $child_4level_data) { ?>
																		<li><a href="<?php echo $child_4level_data['href']; ?>"><?php echo $child_4level_data['name']; ?></a></li>
																	<?php } ?>
																</ul>
																<?php } ?>
															</li>				
														<?php } ?>
													<?php } ?>
												</ul>
												<?php } ?>				
											</li>
											<?php } ?>
										</ul>
									</div>
									<?php } ?>	
									<?php } ?>
									
										<?php if(($item['type']=="freelink") || ($item['type']=="category")){?>
										<?php if(($item['subtype']=="full_image") || ($item['subtype']=="full")){?>
										<div class="ns-dd dropdown-menu-full-image nsmenu-type-category-full-image box-col-3">
												<div class="col-sm-<?php if ($item['add_html']) { ?>9<?php } else { ?>12<?php } ?> nsmenu-haschild">
												 <?php $num_columns = ($item['add_html']) ? 3 : 4; ?>
													<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
													<div class="row-flex">
														<?php foreach ($children as $child) { ?>
														<div class="nsmenu-parent-block<?php if(count($child['children'])){?> nsmenu-issubchild<?php }?> col-md-<?php if ($item['add_html']) { ?>4<?php } else { ?>3<?php } ?> col-sm-12 col-xs-12">
															<?php if($item['subtype']=="full_image"){?>
															<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img class="lazyload" src="<?php echo $lazy_img;?>" data-src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>"/></a>
															<?php } ?>
															<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
															<?php if(!empty($child['children'])){ ?>
																<ul class="list-unstyled nsmenu-ischild">
																	<?php foreach ($child['children'] as $subchild) { ?>
																		<?php if($item['type']=="freelink"){ ?>
																			<li><a href="<?php echo $subchild['link']; ?>"><?php echo $subchild['title']; ?></a></li>
																		<?php } else { ?>
																			<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>				
																		<?php } ?>
																	<?php } ?>
																</ul>
															<?php } ?>	
														</div>
														<?php } ?>	
													</div>
													<?php } ?>	
												</div>
												<?php if($item['add_html']){?>
												<div class="col-sm-3 menu-add-html">
													<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
												</div>
												<?php }?>
										</div>
										<?php }?>
										<?php }?>
										
										<?php if($item['type']=="html"){?>
										  <div class="ns-dd dropdown-menu-html-block nsmenu-type-html box-col-2">
											<div class="nsmenu-html-block">				
												<?php echo html_entity_decode($item['html'], ENT_QUOTES, 'UTF-8'); ?>
											</div>           
										   </div>	
										<?php } ?>
										
										<?php if($item['type']=="manufacturer"){ ?>
											<div class="ns-dd dropdown-menu-manufacturer nsmenu-type-manufacturer <?php if($item['add_html']){?>box-col-3<?php } else{ ?> box-col-2 <?php } ?>">
												<?php if($item['type_manuf'] == "type_alphabet"){ ?>
														<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
															<?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
															<?php if ($item['result_manufacturer_a']) { ?>
																<?php foreach (array_chunk($item['result_manufacturer_a'], $num_columns) as $manufacturer_a) { ?>
																<div class="row">
																<?php foreach ($manufacturer_a as $man_alphabet) { ?>
																	<?php if ($man_alphabet['manufacturer']) { ?>
																		<?php foreach (array_chunk($man_alphabet['manufacturer'], $num_columns) as $manufacturers) { ?>
																			<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
																			<span class="name-manuf-a"><?php echo $man_alphabet['name']; ?></span>
																				<?php foreach ($manufacturers as $manufacturer) { ?>
																					<div class="manuf-res"><a data-toggle="tooltip" title="<img src='<?php echo $manufacturer['thumb']; ?>' alt='<?php echo $manufacturer['name']; ?>' title='<?php echo $manufacturer['name']; ?>' />" href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
																				<?php } ?>
																			</div>
																		<?php } ?>
																	
																	<?php } ?>
																<?php } ?>
																</div>
																<?php } ?>
															<?php } ?>
														</div>
														<?php if($item['add_html']){ ?>
														<div class="col-sm-4 menu-add-html">
															<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
														</div>
														<?php } ?>
													<?php } ?>
													<?php if($item['type_manuf'] == "type_image"){ ?>
														<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
														 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
															<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
															<div class="row">
																<?php foreach ($children as $child) { ?>
																<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
																	<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img class="lazyload" src="<?php echo $lazy_img;?>" data-src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
																	<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
																</div>
																<?php } ?>	
															</div>
															<?php } ?>	
														</div>
														<?php if($item['add_html']){ ?>
														<div class="col-sm-4 menu-add-html">
															<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
														</div>
														<?php } ?>
													<?php } ?>	           
											</div>
									
										<?php }?>
										
										<?php if($item['type']=="information"){?>
											<div class="ns-dd dropdown-menu-information nsmenu-type-information <?php if($item['add_html']){?>box-col-3<?php } else{ ?> box-col-1 <?php } ?>">
													<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
													 <?php $num_columns = ($item['add_html']) ? 2 : 1; ?>
														<?php foreach (array_chunk($item['children'], ceil(count($item['children']) / $num_columns)) as $children) { ?>
															<ul class="list-unstyled nsmenu-haschild <?php if($item['add_html']){ ?>col-xs-12 col-sm-6<?php } ?>">
																<?php foreach ($children as $child) { ?>
																	<li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
																<?php } ?>
															</ul>
														<?php } ?>	
													</div>
													<?php if($item['add_html']){ ?>
													<div class="col-sm-4 menu-add-html">
														<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
													</div>
													<?php } ?>
											</div>
										<?php } ?>
										
										<?php if($item['type']=="product"){ ?>
											<div class="ns-dd dropdown-menu-product nsmenu-type-product box-col-3">
												<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
													 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
														<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
														<div class="row">
															<?php foreach ($children as $child) { ?>
															<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
																<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img class="lazyload" src="<?php echo $lazy_img;?>" data-src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
																<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
																<div class="price">
																	<?php if (!$child['special']) { ?>
																		<?php echo $child['price']; ?>
																	<?php } else { ?>
																		<span class="price-old"><?php echo $child['price']; ?></span> 
																		<span class="price-new"><?php echo $child['special']; ?></span>
																	<?php } ?>
																</div>
															</div>
															<?php } ?>	
														</div>
														<?php } ?>	
												</div>
												<?php if($item['add_html']){?>
												<div class="col-sm-4 menu-add-html">
													<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
												</div>
												<?php }?>
											</div>
										<?php } ?>
							</li>
						<?php } else {  ?>
								<li <?php if($item['additional_menu']=="additional"){ ?>class="hidden-md hidden-lg"<?php } ?>>						
									<a <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link"';} else {echo 'class="dropdown-img"';} ?> href="<?php echo $item['href']; ?>">
										<?php if($item['thumb']){?>
											<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
										<?php } ?>
										<?php if($item['thumb_hover']){?>
											<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
										<?php } ?>
										<?php if(!empty($item['sticker_parent'])){?>
											<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
										<?php } ?>
										<div class="item-name<?php if($item['thumb']){?> himg<?php } ?>"><?php echo $item['name'];?></div>
										<div class="item-dop-info<?php if($item['thumb']){?> himg<?php } ?>"><?php echo $item['dop_info_vm'];?></div>
									</a>
								</li>							
						<?php } ?>
					<?php } ?>
				</ul>
			</nav>
				<?php if(isset($main_menu_mask) && ($main_menu_mask == 1)) { ?>
				<div id="maskMenuHC"></div>	
				<?php } ?>
			<?php } ?>
		</div>	
		<div class="col-md-9 hidden-xs hidden-sm clearfix">	   	
		<?php if($additional) {?>
		<nav id="additional-menu" class="navbar hmenu_type">
		<div>
		  <ul class="nav navbar-nav">
			<?php foreach ($items as $item) { ?>
				<?php if($item['children']) { ?>
				<?php if($item['additional_menu']=="additional"){ ?>
				<li class="dropdown">
					<a href="<?php echo $item['href']; ?>" <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link"';} else {echo 'class="dropdown-toggle dropdown-img" data-toggle="dropdown"';} ?>>
						<?php if($item['thumb']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
						<?php } ?>
						<?php if($item['thumb_hover']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
						<?php } ?>
						<?php if(!empty($item['sticker_parent'])){?>
							<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
						<?php } ?>
						<?php echo $item['name']; ?>
						<i class="fa fa-angle-down arrow"></i>
					</a>
				
							<?php if(($item['type']=="freelink") || ($item['type']=="category")){?>
							<?php if($item['subtype']=="simple"){ ?>
							<?php if($item['additional_menu']=="additional"){ ?>
							 <div class="dropdown-menu nsmenu-type-category-simple">
									<ul class="list-unstyled nsmenu-haschild">
										<?php foreach ($item['children'] as $child) { ?>
										<li <?php if(!empty($child['children'])){?>class="nsmenu-issubchild"<?php } ?>>
											<a href="<?php echo $child['href']; ?>">
											<?php echo $child['name']; ?>
											<?php if(!empty($child['children'])){ ?><i class="fa fa-angle-down arrow"></i><?php } ?>
											</a>
											<?php if(!empty($child['children'])){?>
											<ul class="list-unstyled nsmenu-ischild nsmenu-ischild-simple">
											 <?php foreach ($child['children'] as $subchild) { ?>
												<?php if($item['type']=="freelink"){ ?>
													<li><a href="<?php echo $subchild['link']; ?>"><?php echo $subchild['title']; ?></a></li>
												<?php } else { ?>
													<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>
												<?php } ?>
															
											<?php } ?>
											</ul>
											<?php } ?>				
										</li>
										<?php } ?>
									</ul>
								</div>
							<?php } ?>	
							<?php } ?>
							<?php } ?>
					
							<?php if(($item['type']=="freelink") || ($item['type']=="category")){?>
							<?php if(($item['subtype']=="full_image") || ($item['subtype']=="full") ){?>
							<?php if($item['additional_menu']=="additional"){ ?>
								<div class="dropdown-menu nsmenu-type-category-full-image nsmenu-bigblock-additional">
									<div class="col-sm-<?php if ($item['add_html']) { ?>9<?php } else { ?>12<?php } ?> nsmenu-haschild">
										 <?php $num_columns = ($item['add_html']) ? 3 : 4; ?>
											<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
											<div class="row-flex">
												<?php foreach ($children as $child) { ?>
												<div class="nsmenu-parent-block<?php if(count($child['children'])){?> nsmenu-issubchild<?php }?> col-md-<?php if ($item['add_html']) { ?>4<?php } else { ?>3<?php } ?> col-sm-12 col-xs-12">
													<div class="mbflex">
													<?php if($item['subtype']=="full_image") { ?>
													<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img class="lazyload" src="<?php echo $lazy_img;?>" data-src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>"/></a>
													<?php } ?>
													<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
													</div>
													<?php if(!empty($child['children'])){ ?>
														<ul class="list-unstyled nsmenu-ischild">
															<?php foreach ($child['children'] as $subchild) { ?>
																<?php if($item['type']=="freelink"){ ?>
																	<li><a href="<?php echo $subchild['link']; ?>"><?php echo $subchild['title']; ?></a></li>	
																<?php } else { ?>
																	<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>	
																<?php } ?>
															<?php } ?>
														</ul>
													<?php } ?>	
												</div>
												<?php } ?>	
											</div>
											<?php } ?>	
									</div>
									<?php if($item['add_html']){?>
										<div class="col-sm-3 menu-add-html">
											<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
										</div>
									<?php }?>
								</div>
								<?php } ?>	
								<?php } ?>
								<?php } ?>
								<?php if($item['type']=="html"){?>
								<?php if($item['additional_menu']=="additional"){ ?>
								  <div class="dropdown-menu nsmenu-type-html">
									<div class="nsmenu-html-block">				
										<?php echo html_entity_decode($item['html'], ENT_QUOTES, 'UTF-8'); ?>
									</div>            
								   </div>	
								<?php } ?>
								<?php } ?>
								<?php if($item['type']=="manufacturer"){?>
								<?php if($item['additional_menu']=="additional"){ ?>
									<div class="dropdown-menu nsmenu-type-manufacturer nsmenu-bigblock-additional">
										<?php if($item['type_manuf'] == "type_alphabet"){ ?>
											<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
												<?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
												<?php if ($item['result_manufacturer_a']) { ?>
													<?php foreach (array_chunk($item['result_manufacturer_a'], $num_columns) as $manufacturer_a) { ?>
													<div class="row">
													<?php foreach ($manufacturer_a as $man_alphabet) { ?>
														<?php if ($man_alphabet['manufacturer']) { ?>
															<?php foreach (array_chunk($man_alphabet['manufacturer'], $num_columns) as $manufacturers) { ?>
																<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
																<span class="name-manuf-a"><?php echo $man_alphabet['name']; ?></span>
																	<?php foreach ($manufacturers as $manufacturer) { ?>
																		<div class="manuf-res"><a data-toggle="tooltip" title="<img src='<?php echo $manufacturer['thumb']; ?>' alt='<?php echo $manufacturer['name']; ?>' title='<?php echo $manufacturer['name']; ?>' />" href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
																	<?php } ?>
																</div>
															<?php } ?>
														
														<?php } ?>
													<?php } ?>
													</div>
													<?php } ?>
												<?php } ?>
											</div>
											<?php if($item['add_html']){ ?>
											<div class="col-sm-4 menu-add-html">
												<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
											</div>
											<?php } ?>
										<?php } ?>
										<?php if($item['type_manuf'] == "type_image"){ ?>
											<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
											 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
												<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
												<div class="row">
													<?php foreach ($children as $child) { ?>
													<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
														<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img class="lazyload" src="<?php echo $lazy_img;?>" data-src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
														<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
													</div>
													<?php } ?>	
												</div>
												<?php } ?>	
											</div>
											<?php if($item['add_html']){ ?>
											<div class="col-sm-4 menu-add-html">
												<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
											</div>
											<?php } ?>
										<?php } ?>		
									</div>
								<?php }?>
								<?php }?>
								
								<?php if($item['type']=="information"){?>
								<?php if($item['additional_menu']=="additional"){ ?>								
									<div class="dropdown-menu nsmenu-type-information <?php if($item['add_html']){?>nsmenu-bigblock-additional<?php }?>">
										<?php if($item['add_html']){?>
											<div class="menu-add-html">
												<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
											</div>
										<?php }?>									  
										<ul class="list-unstyled nsmenu-haschild <?php if($item['add_html']){?>nsmenu-blockwithimage<?php }?>">
											<?php foreach ($item['children'] as $child) { ?>
												<li class=""><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
											<?php } ?>
										</ul>
									</div>
								<?php } ?>
								<?php } ?>
								
								<?php if($item['type']=="product"){?>
								<?php if($item['additional_menu']=="additional"){ ?>
									<div class="dropdown-menu nsmenu-type-product nsmenu-bigblock-additional">
										<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
										 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
											<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
											<div class="row">
												<?php foreach ($children as $child) { ?>
												<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
													<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img class="lazyload" src="<?php echo $lazy_img;?>" data-src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
													<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
													<div class="price">
														<?php if (!$child['special']) { ?>
															<?php echo $child['price']; ?>
														<?php } else { ?>
															<span class="price-old"><?php echo $child['price']; ?></span> 
															<span class="price-new"><?php echo $child['special']; ?></span>
														<?php } ?>
													</div>
												</div>
												<?php } ?>	
											</div>
											<?php } ?>	
										</div>
										<?php if($item['add_html']){?>
										<div class="col-sm-4 menu-add-html">
											<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
										</div>
										<?php }?>									</div>
								<?php }?>
								<?php }?>
					</li>
					<?php } ?>
				<?php } else {  ?>
					<?php if($item['additional_menu']=="additional"){ ?>
						<li><a <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link"';}?> class="<?php if(!$item['thumb']){?>no-img-parent-link<?php } ?>" href="<?php echo $item['href']; ?>">
						<?php if($item['thumb']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
						<?php } ?>
						<?php if($item['thumb_hover']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
						<?php } ?>
						<?php if(!empty($item['sticker_parent'])){?>
							<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
						<?php } ?>
						<?php echo $item['name']; ?></a></li>
					<?php } ?>
				<?php } ?>
			<?php } ?>
		  </ul>
		</div>		
	   </nav>   
	    <?php if(isset($main_menu_mask) && ($main_menu_mask == 1)) { ?>
		  <div id="maskMenuDop"></div>	
		<?php } ?>
<?php } ?>	   
	  </div>
    </div>
    </div>
<?php if($main_menu_fix_mobile == 0) { ?>
<script>
$(document).ready(function() {
	$(function() {
		if (viewport().width <= 991) {				
			$('.box-search #searchtop').insertAfter('#menu button:eq(0)');
		} 
		$(window).resize(function() {
			if (viewport().width <= 991) {
				$('.box-search #searchtop').insertAfter('#menu button:eq(0)');
			} else {
				$('.box-search').prepend( $('#menu #searchtop') );	
			}
		}); 
	});
});
</script>
<?php } ?>
<?php if(isset($main_menu_fix_mobile) && ($main_menu_fix_mobile == 1)) { ?>
<div class="mob-block-fix" id="mob-info-block">
	<div class="mob-block-title"><?php echo $text_info_mob; ?></div>
	<div id="mob-info-block-inner">
	<?php echo html_entity_decode($desc_info_mob[$lang_id]['text'],ENT_QUOTES, 'UTF-8');?>
	</div>
	<button type="button" class="mob-block-close">×</button>
</div>
<div class="mob-block-fix" id="mob-search-block">
	<div id="mob-search-block-inner"></div>
</div>
<div id="top-fixed-mobile" class="hidden-md hidden-lg">
	<div class="container">
		<div class="box-flex-fix">
			<div class="mob-m-i menu_fix_mob">
				<?php if(isset($type_mobile_menu) && ($type_mobile_menu == '1')){ ?> 
				<button type="button" class="btn btn-menu-mobile" data-toggle="offcanvas" data-target="#menu-mobile-ns.navmenu.offcanvas" data-canvas="body">
					<i class="fa fa-bars"></i>
				</button>
				<?php } else { ?>
				<button type="button" class="btn btn-menu-mobile" data-toggle="collapse" data-target="#menu-mobile-ns .navbar-type2-collapse">
					<i class="fa fa-bars"></i>
				</button>
				<script><!--
				$(".btn-menu-mobile").click(function() {
					 if ($("#menu-mobile-ns .navbar-type2-collapse").hasClass("in")) {
						 return $("body").removeClass("no-scroll-html");
					 } else {
						 return $("body").addClass("no-scroll-html");
					 }
				});
				--></script>
				<?php } ?>
			</div>
			<div class="box-fm-r">
				<div class="mob-m-i info_fix_mob"><a id="info-btn-mob"><i class="fa fa-info" aria-hidden="true"></i></a></div>
				<div class="mob-m-i account_fix_mob">
					<a data-toggle="dropdown" class="dropdown-toggle"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
				</div>
				<div class="mob-m-i search_fix_mob"><a id="search-btn-mob"><i class="fa fa-search icon-btn" aria-hidden="true"></i></a></div>
				<div class="mob-m-i compare-h-fix"><i class="fa fa-retweet" aria-hidden="true"></i></div>
				<div class="mob-m-i wishlist-h-fix"><i class="fa fa-heart-o" aria-hidden="true"></i></div>
				<div class="mob-m-i cart_fix_mob"><i class="fa fa-shopping-basket" aria-hidden="true"></i></div>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
$('#mob-info-block-inner,#top-fixed-mobile #menu.open #menu-list').css("height",$( window ).height() - 40);
	$(function() {
		var width_dev_ns = viewport().width;
		if (width_dev_ns <= 991) {
			$('#top-fixed-mobile').addClass('sticky-header-mobile');
			$('#top').addClass('hidden-xs');
			$('header.pad-top #mob-info-block-inner').prepend( $('.header-nav-links') );	
			$('header.pad-top #mob-info-block-inner').prepend( $('#currency') );	
			$('header.pad-top #mob-info-block-inner').prepend( $('#language') );	
			$('header.pad-top #top-fixed-mobile .account_fix_mob').prepend( $('.box-account .dropdown-menu') );	
			$('#mob-search-block-inner').prepend( $('header.pad-top .box-search #search') );
			$('#top-fixed-mobile .compare-h-fix').empty().prepend( $('header.pad-top .h-box .compare-h') );
			$('#top-fixed-mobile .wishlist-h-fix').empty().prepend( $('header.pad-top .h-box .wishlist-h') );
			$('#top-fixed-mobile .cart_fix_mob').empty().prepend( $('header.pad-top .h-box .box-cart .shopping-cart') );	
		} 
		$(window).resize(function() {
			var width_dev_ns = viewport().width;
			if (width_dev_ns <= 991) {
				$('#top').addClass('hidden-xs');
				$('#top-fixed-mobile').addClass('sticky-header-mobile');
				$('#mob-info-block-inner').prepend( $('.header-nav-links') );	
				$('#mob-info-block-inner').prepend( $('#currency') );	
				$('#mob-info-block-inner').prepend( $('#language') );	
				$('#top-fixed-mobile .account_fix_mob').prepend( $('.box-account .dropdown-menu') );	
				$('#mob-search-block-inner').prepend( $('header.pad-top .box-search #search') );
				if ($("header.pad-top .box-cart >").hasClass("compare-h")) {
					$('header.pad-top #top-fixed-mobile .compare-h-fix').empty().prepend( $('header.pad-top .h-box .compare-h') );
				} else {
					$('header.pad-top #top-fixed-mobile .compare-h-fix').prepend( $('header.pad-top .h-box .compare-h') );
				}
				if ($("header.pad-top .box-cart >").hasClass("wishlist-h")) {
					$('header.pad-top #top-fixed-mobile .wishlist-h-fix').empty().prepend( $('header.pad-top .h-box .wishlist-h') );
				} else {
					$('header.pad-top #top-fixed-mobile .wishlist-h-fix').prepend( $('header.pad-top .h-box .wishlist-h') );
				}
				if ($("header.pad-top .box-cart >").hasClass("shopping-cart")) {
					$('header.pad-top #top-fixed-mobile .cart_fix_mob').empty().prepend( $('header.pad-top .h-box .box-cart .shopping-cart') );	
				} else {
					$('header.pad-top #top-fixed-mobile .cart_fix_mob').prepend( $('header.pad-top .h-box .box-cart .shopping-cart') );	
				}
				
			} else {
				$('#top').removeClass('hidden-xs');
				$('#top-fixed-mobile').removeClass('sticky-header-mobile');
				$('.box-currency').prepend( $('#currency') );	
				$('.box-language').prepend( $('#language') );
				$('.box-question').prepend( $('#mob-info-block-inner .header-nav-links') );
				$('header.pad-top .box-account').prepend( $('header.pad-top #top-fixed-mobile .dropdown-menu') );
				$('header.pad-top .box-search #searchtop').prepend( $('#mob-search-block-inner #search') );
				$('header.pad-top .box-cart').prepend( $('header.pad-top #top-fixed-mobile .cart_fix_mob .shopping-cart ') );
				$('header.pad-top .box-cart').prepend( $('header.pad-top #top-fixed-mobile .wishlist-h ') );
				$('header.pad-top .box-cart').prepend( $('header.pad-top #top-fixed-mobile .compare-h ') );
			}
		}); 
	});
});
$('#info-btn-mob').on('click', function() {
	$('#menu-mobile-ns .navbar-type2-collapse').removeClass('in');
	$('body').removeClass('no-scroll-html');
	$('#mob-info-block').toggleClass('active');
	$('html').toggleClass('no-scroll-html');
});
$('#search-btn-mob').on('click', function() {
	$('#menu-mobile-ns .navbar-type2-collapse').removeClass('in');
	$('body').removeClass('no-scroll-html');
	$('#mob-search-block').slideToggle();
	$('html').toggleClass('no-scroll-html');
});
$(".mob-block-close").click(function(){
	$(".mob-block-fix").removeClass('active');
	$('html').removeClass('no-scroll-html');
});
</script>	
<?php } ?>
<?php if($config_fixed_panel_top) { ?>
<script>
$(document).ready(function() {
	var width_fmns = viewport().width;
	var header_h = $('header').outerHeight();
	var menu_v = $('#menu #menu-list').outerHeight();
	if (width_fmns >= 992) {	
	$(window).scroll(function(){
		if($(this).scrollTop() > header_h + 55) {
			if($("#top-fixed").length==0) {
				$('header .dropdown-menu.autosearch').css('display','none');
				$('#top').before('<div id="top-fixed" class="hidden-xs hidden-sm"><header></header></div>');	
				$('header > ').clone().appendTo('#top-fixed header');
				$('#top-fixed').addClass('fixed-top-header');
				$('#top-fixed #menu-list').menuAim({
					activateCallback: activateSubmenu_fixed,
					deactivateCallback: deactivateSubmenu_fixed,
				});
				function activateSubmenu_fixed(row) {$(row).addClass('menu-open');}
				function deactivateSubmenu_fixed(row) {$(row).removeClass('menu-open');}
				function exitMenu_fixed(row) {return true;}
				$('#top-fixed .dropdown-menu-simple .nsmenu-haschild').menuAim({
					activateCallback: activateSubmenu2level_fixed,
					deactivateCallback: deactivateSubmenu2level_fixed,
				});
				function activateSubmenu2level_fixed(row) {$(row).addClass('menu-open-2level');}
				function deactivateSubmenu2level_fixed(row) {$(row).removeClass('menu-open-2level');}
				function exitMenu2level_fixed(row) {return true;}
				$('#top-fixed #search a').bind('click', function() {
					$("#top-fixed #selected_category").val($(this).attr('data-idsearch'));
					$('#top-fixed .category-name').html($(this).html());
				});
				$('#top-fixed #phone .contact-header').hover(function() {
				  $(this).find('#top-fixed .drop-contacts').stop(true, true).delay(10).fadeIn(10);
				  $(this).addClass('open');
				}, function() {
				   $(this).find('#top-fixed .drop-contacts').stop(true, true).delay(10).fadeOut(10);
					$(this).removeClass('open');
				});
				$('#top-fixed #additional-menu li.dropdown').hover(function() {
					$(this).find('.dropdown-menu').stop(true, true).delay(10);
					$(this).addClass('open');
					$('#maskMenuDop').addClass('open');
					$(this).find('.dropdown-toggle').attr('aria-expanded', 'true');
				}, function() {
					$(this).find('.dropdown-menu').stop(true, true).delay(10);
					$(this).removeClass('open');
					$('#maskMenuDop').removeClass('open');
					$(this).find('.dropdown-toggle').attr('aria-expanded', 'false')
				});
				$('#top-fixed .btn-search').bind('click', function() {										
					url = $('base').attr('href') + 'index.php?route=product/search';
					var value = $('#top-fixed input[name=\'search\']').val();
					if (value) {
						url += '&search=' + encodeURIComponent(value);
					} else {
						url += '&search=';
					}
					var category_id = $('#top-fixed input[name=\'category_id\']').prop('value');
					if (category_id > 0) {url += '&category_id=' + encodeURIComponent(category_id) + '&sub_category=true';}
					location = url;
				});
			}
		}else{
			$('#top-fixed').remove();
		}		
	});
	}
	$(document).on('click', '#top-fixed .m-fix-btn', function () {
		$(this).toggleClass('rotate-icon');
		$('#top-fixed').toggleClass('open-fix-mm');
	});
	
});
</script>
<?php } ?>
<?php if(isset($type_mobile_menu) && ($type_mobile_menu == 1) || (isset($main_menu_fix_mobile) && ($main_menu_fix_mobile == 1))) { ?>
<div class="page-no-scroll-bg"></div>
<div class="hidden-md hidden-lg">
	<nav id="menu-mobile-ns" class="<?php if(isset($type_mobile_menu) && ($type_mobile_menu == '1')){ ?>navmenu-fixed-left <?php } else { ?>menu-collapse-down<?php } ?>">
		<div <?php if(isset($type_mobile_menu) && ($type_mobile_menu == '0')){ ?>class="collapse navbar-collapse navbar-type2-collapse"<?php } ?>>
		  <ul class="nav navbar-nav">
			<?php if(isset($type_mobile_menu) && ($type_mobile_menu == '1')){ ?>
			<li class="fix-close-menu"><button class="close-menu" data-toggle="offcanvas"><?php echo $text_category; ?><i class="fa fa-close"></i></button></li>
			<?php } ?>
			<?php foreach ($items as $item) { ?>
				<li><a href="<?php echo $item['href']; ?>" rel="nofollow">
					<?php if($item['thumb']){?>
						<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
					<?php } ?>
					<?php if($item['thumb_hover']){?>
						<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
					<?php } ?>
					<div class="item-name<?php if($item['thumb']){?> himg<?php } ?>"><?php echo $item['name'];?></div>
					<?php if ($item['children']) { ?><span class="show-sc-mobile" data-toggle="collapse"><i class="fa fa-plus plus"></i></span><?php } ?>
					<?php if(!empty($item['sticker_parent'])){?>
						<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
					<?php } ?>
					</a>
					<?php if($item['type']=="html"){?>
						<div class="collapse mob-submenu-list">
							<div class="mob-html-block">				
								<?php echo html_entity_decode($item['html'][$lang_id], ENT_QUOTES, 'UTF-8'); ?>
							</div>
					   </div>	
					<?php } ?>
					<?php if(!empty($item['children']) && ($item['type']!='html')) { ?>
						<div class="collapse mob-submenu-list">
							<ul class="list-unstyled">
								<?php foreach ($item['children'] as $child) { ?>
									<li>
										<a href="<?php echo $child['href']; ?>" rel="nofollow"><?php echo $child['name']; ?>
											<?php if (!empty($child['children'])) { ?><span class="show-sc-mobile" data-toggle="collapse"><i class="fa fa-plus plus"></i></span><?php } ?>
										</a>
											<?php if (!empty($child['children'])) { ?>
												<div class="collapse mob-submenu-list-3lev">
													<ul class="list-unstyled">
														<?php foreach ($child['children'] as $subchild) { ?>
															<?php if($item['type']=="freelink"){ ?>
																<li><a href="<?php echo $subchild['link']; ?>"><?php echo $subchild['title']; ?></a></li>
															<?php } else { ?>
																<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>
															<?php } ?>
														<?php } ?>
													</ul>
												</div>
											<?php } ?>
									</li>
								<?php } ?>
							</ul>
						</div>
					<?php } ?>
					
				</li>
			<?php } ?>
			
		  </ul>
		</div>
	</nav>
</div>
<script><!--
$("#menu-mobile-ns .show-sc-mobile").click(function () {
	$(this).siblings(".collapsible").toggle();
	$(this).toggleClass("open-sc-mobile");
	$(this).parent().next().toggleClass("in");
});

$('[data-toggle="offcanvas"]').on('click', function(e) {
    $('#menu-mobile-ns.navmenu-fixed-left').toggleClass('active');
    $('body').toggleClass('modal-open');
	if ($("#menu-mobile-ns").hasClass('active') == true) {
	$(document).mouseup(function (e){ 
		var div = $("#menu-mobile-ns.active"); 
		if (!div.is(e.target) 
			&& div.has(e.target).length === 0) { 
			$('#menu-mobile-ns.navmenu-fixed-left').removeClass('active');
			$('body').removeClass('modal-open');
		}
	});
	}
});
--></script>
<?php } ?>
</div>