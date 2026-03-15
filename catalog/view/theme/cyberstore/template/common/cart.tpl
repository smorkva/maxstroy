<div class="shopping-cart type_cart">
<div id="cart" class="btn-group btn-block">
  <button type="button" <?php if($on_off_shopping_cart_click == '1') { ?> onclick="fastorder_open_cart();" <?php } else { ?>data-toggle="dropdown"<?php } ?> data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block dropdown-toggle">	
	<?php if(!isset($icon_shopcart) || $icon_shopcart == ''){?>
	<i class="shop-bag fa fa-shopping-basket"></i>
	<?php } elseif(strpos($icon_shopcart,'fa fa-') !== false){ ?>
	<i class="shop-bag <?php echo $icon_shopcart;?>"></i>
	<?php } else { ?>
	<img class="shop-bag" src="<?php echo $icon_shopcart;?>" alt="" title="" />
	<?php } ?>
    <span class="cart-total"><?php echo $text_items; ?></span>
  </button>
  <ul class="dropdown-menu pull-right"  >
    <?php if ($products || $vouchers) { ?>
    <li>
      <table class="table table-striped">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-left"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?></td>
           <td class="text-right"><div class="cart-quantity-header">x <?php echo $product['quantity']; ?></div></td>
          <td class="text-right"><?php echo $product['total']; ?></td>
          <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-link-delete"><i class="fa fa-trash-o"></i></button></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-link-delete"><i class="fa fa-trash-o"></i></button></td>
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
      <div>
        <table class="table table-bordered">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
            <td class="text-right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <p class="text-left"><a class="btn btn-shopping" href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a><a class="btn btn-checkout" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></p>
      </div>
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
</div>
</div>
