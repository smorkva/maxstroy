<?php if($products) { ?>
<div class="table-responsive">
<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td class="text-left"><?php echo $column_image; ?></td>
									<td class="text-left"><?php echo $column_name; ?></td>
									<td class="text-left"><?php echo $column_model; ?></td>
									<td class="text-right"><?php echo $column_quantity; ?></td>
									<td class="text-right"><?php echo $column_price; ?></td>
									<td class="text-right"><?php echo $column_total; ?></td>
									<td class="delete_td text-center"></td>
								</tr>
							</thead>
							<tbody>
								<?php foreach ($products as $product) { ?>
								<tr>
									<td class="image text-center"><img src="<?php echo $product['thumb']; ?>" class="img-thumbnail" title="<?php echo $product['name']; ?>" /></td>
									<td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
										<?php foreach ($product['option'] as $option) { ?>
										<br />
										&nbsp;<small> - <?php echo $option['name']; ?>: <?php if (isset($option['option_value']) && !empty($option['option_value'])) echo $option['option_value'];else if (isset($option['value'])) echo $option['value']; ?></small>
									<?php } ?></td>
									<td class="text-left"><?php echo $product['model']; ?></td>
									<td class="text-right nsupdatequantitycheckout">
										<div class="input-group">
											<span class="input-group-btn">
												<button class="btn btn-default" type="button" onclick="updateQuantityCheckout('<?php echo $product['key']; ?>','<?php echo $product['quantity']-1; ?>');" >-</button>
											</span>
												<input type="text" class="form-control" value="<?php echo $product['quantity']; ?>" onchange="updateQuantityCheckout('<?php echo $product['key']; ?>', $(this).val());">
											<span class="input-group-btn">
												<button class="btn btn-default" type="button" onclick="updateQuantityCheckout('<?php echo $product['key']; ?>','<?php echo $product['quantity']+1; ?>');">+</button>
											</span>
										</div>
									</td>
									<td class="text-right"><?php echo $product['price']; ?></td>
									<td class="text-right"><?php echo $product['total']; ?></td>
									<td class="delete_td text-center"><button type="button" onclick="cart.remove('<?php echo $product['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-link-delete"><i class="fa fa-trash-o"></i></button></td>
								</tr>
								<?php } ?>
								<?php foreach ($vouchers as $voucher) { ?>
									<tr>
										<td class="text-left"><?php echo $voucher['description']; ?></td>
										<td class="text-left hidden-xs"></td>
										<td class="text-right hidden-xs">1</td>
										<td class="text-right hidden-xs"><?php echo $voucher['amount']; ?></td>
										<td class="text-right"><?php echo $voucher['amount']; ?></td>
									</tr>
								<?php } ?>
							</tbody>
						</table>
						</div>
						<table class="coupon_table">
						<?php if ($coupon) { ?>
						<tr>
							<td>
								<div class="coupon input-group">
									<input type="text" name="coupon" value="" placeholder="<?php echo $entry_coupon; ?>" id="input-coupon" class="form-control" />
									<span class="input-group-btn">
										<button id="button-coupon" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_apply; ?></button>
									</span>
								</div>
							</td>
						</tr>
						<?php } ?>
						<?php if ($reward) { ?>
						<tr>
							<td>
								<div class="coupon input-group">
									<input type="text" name="reward" value="" placeholder="<?php echo $entry_reward; ?>" id="input-reward" class="form-control" />
									<span class="input-group-btn">
										<button id="button-reward" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_apply; ?></button>
									</span>
								</div>
							</td>
						</tr>
						<?php } ?>
						<?php if ($voucher) { ?>
						<tr>
							<td>
								<div class="coupon input-group">
									<input type="text" name="voucher" value="" placeholder="<?php echo $entry_voucher; ?>" id="input-voucher" class="form-control" />
									<span class="input-group-btn">
										<button id="button-voucher" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_apply; ?></button>
									</span>
								</div>
							</td>
						</tr>
						<?php } ?>
						</table>
						<table class="table_total">
							<?php foreach ($totals as $total) { ?>
									<tr>
										<td colspan="5" class="text-right  hidden-xs"><?php echo $total['title']; ?>:</td>
										<td colspan="1" class="text-right  visible-xs"><?php echo $total['title']; ?>:</td>
										<td class="text-right"><?php echo $total['text']; ?></td>
									</tr>
								<?php } ?>
						</table>
<?php } else { ?>
<script>
	$(document).ready(function() {
		window.location.reload();
	});
</script>
<?php } ?>