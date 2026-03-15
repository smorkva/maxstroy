<?php echo $header; ?>
<span itemscope itemtype="http://schema.org/Organization">
<meta itemprop="name" content="<?php echo $name; ?>">
<meta itemprop="logo" content="<?php echo $logo; ?>">
<meta itemprop="url" content="<?php echo $url; ?>">
<span itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
<meta itemprop="addressLocality" content="<?php echo $addresslocality; ?>">
<meta itemprop="streetAddress" content="<?php echo $streetaddress; ?>">
<meta itemprop="addressCountry" content="<?php echo $addresscountry; ?>">
</span>
<meta itemprop="telephone" content="<?php echo $telephone; ?>">
<meta itemprop="email" content="<?php echo $email; ?>">
</span>
<?php if(isset($position_1)){ ?>
	<div class="container-fluid">
		<div class="row">	
		<div class="col-sm-12 pos1">
			<?php foreach($position_1 as $pos1){?>
				<?php echo $pos1; ?>
			<?php } ?>
		</div>
		</div>
	</div>
<?php } ?>
<div class="container">
	<div class="row">
	<?php if(($general_menu_on_off =='1') && ($main_menu =='1')) { ?>
		<div class="sw-20 col-sm-4 col-md-3 position-no-owl hidden-xs hidden-sm">
			<div id="menu-header-open"></div>
			<?php if(isset($position_0)){ ?>
				<?php foreach($position_0 as $pos0){?>
					<?php echo $pos0; ?>
				<?php } ?>
			<?php } ?>
		</div>
		<?php if(!isset($position_1)){ ?>
		<script>
		if(window.matchMedia("(min-width: 992px)").matches){
			$('header #menu-list').addClass("nsmenu-block");
			$(function(){$('#menu-header-open').css({'min-height': $('header #menu-list').outerHeight()});});
		}
		$(window).resize(function() {
			if ($(window).width() > 992) {
				$('header #menu-list').addClass("nsmenu-block");
				$(function(){$('#menu-header-open').css({'min-height': $('header #menu-list').outerHeight()});});
			} else {
				$('header #menu-list').removeClass("nsmenu-block");
			}
		});
		</script>
		<?php } else { ?>
		<script>
		if(window.matchMedia("(min-width: 992px)").matches){
			$('header #menu-list').addClass("nsmenu-block");
		}
		$(window).resize(function() {
			if ($(window).width() > 992) {
				$('header #menu-list').addClass("nsmenu-block");
			} else {
				$('header #menu-list').removeClass("nsmenu-block");
			}
		});
		</script>
		<?php } ?>
		<div class="sw-80 col-md-9"><?php echo $content_top; ?></div>
		<?php if(isset($position_17)){ ?>
			<div class="col-md-3 pos17">
				<?php foreach($position_17 as $pos17){?>
					<?php echo $pos17; ?>
				<?php } ?>	
			</div>
		<?php } ?>
		<?php if(isset($position_18)){ ?>
			<div class="col-md-3 pos18">
				<?php foreach($position_18 as $pos18){?>
					<?php echo $pos18; ?>
				<?php } ?>	
			</div>
		<?php } ?>
		<?php if(isset($position_19)){ ?>
			<div class="col-md-3 pos19">
				<?php foreach($position_19 as $pos19){?>
					<?php echo $pos19; ?>
				<?php } ?>	
			</div>
		<?php } ?>
		<?php if(isset($position_20)){ ?>
			<div class="col-md-6 pos20">
				<?php foreach($position_20 as $pos20){?>
					<?php echo $pos20; ?>
				<?php } ?>				
			</div>
		<?php } ?>
		<?php if(isset($position_21)){ ?>
			<div class="col-md-3 pos21">			
				<?php foreach($position_21 as $pos21){?>
					<?php echo $pos21; ?>
				<?php } ?>			
			</div>
		<?php } ?>
	<?php } else { ?>
		<div class="col-md-12"><?php echo $content_top; ?></div>
		<?php if(isset($position_17)){ ?>
			<div class="col-md-4 pos17">
				<?php foreach($position_17 as $pos17){?>
					<?php echo $pos17; ?>
				<?php } ?>	
			</div>
		<?php } ?>
		<?php if(isset($position_18)){ ?>
			<div class="col-md-4 pos18">
				<?php foreach($position_18 as $pos18){?>
					<?php echo $pos18; ?>
				<?php } ?>	
			</div>
		<?php } ?>
		<?php if(isset($position_19)){ ?>
			<div class="col-md-4 pos19">
				<?php foreach($position_19 as $pos19){?>
					<?php echo $pos19; ?>
				<?php } ?>	
			</div>
		<?php } ?>
		<?php if(isset($position_20)){ ?>
			<div class="col-md-8 pos20">
				<?php foreach($position_20 as $pos20){?>
					<?php echo $pos20; ?>
				<?php } ?>				
			</div>
		<?php } ?>
		<?php if(isset($position_21)){ ?>
			<div class="col-md-4 pos21">			
				<?php foreach($position_21 as $pos21){?>
					<?php echo $pos21; ?>
				<?php } ?>			
			</div>
		<?php } ?>
	<?php } ?>
	</div>
	<div class="row">
	<?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-4 col-md-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-8 col-md-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div class="<?php echo $class; ?>">
		<?php echo $content_bottom; ?>
	</div>
    <?php echo $column_right; ?>
	</div>
</div>
<?php if(isset($position_2) || isset($position_3)){ ?>
	<div class="box-bg-full bg_mode_pos_2">
	<div class="container">
		<div class="row">
			<?php if(isset($position_2)){ ?>
			<div class="col-sm-6 col-md-6 pos2">
			<?php foreach($position_2 as $pos2){?>
				<?php echo $pos2; ?>
			<?php } ?>
			</div>
			<?php } ?>
			<?php if(isset($position_3)){ ?>
			<div class="col-sm-6 col-md-6 pos3">
				<?php foreach($position_3 as $pos3){?>
					<?php echo $pos3; ?>
				<?php } ?>
			</div>
			<?php } ?>
		</div>
	</div>
	</div>
<?php } ?>

<?php if(isset($position_4) || isset($position_5)){ ?>
	<div class="container">
		<div class="row">
			<?php if(isset($position_4)){ ?>
			<div class="col-sm-4 col-md-3 pos4">
				<?php foreach($position_4 as $pos4){?>
					<?php echo $pos4; ?>
				<?php } ?>
			</div>
			<?php } ?>
			<?php if(isset($position_5)){ ?>
			<div class="col-sm-8 col-md-9 pos5">
				<?php foreach($position_5 as $pos5){?>
					<?php echo $pos5; ?>
				<?php } ?>
			</div>
			<?php } ?>
		</div>
	</div>
<?php } ?>

<?php if(isset($position_6) || isset($position_7)){ ?>
	<div class="container">
		<div class="row">
			<?php if(isset($position_6)){ ?>
			<div class="col-sm-8 col-md-9 pos6">	
				<?php foreach($position_6 as $pos6){?>
					<?php echo $pos6; ?>
				<?php } ?>
			</div>
			<?php } ?>
			<?php if(isset($position_7)){ ?>
			<div class="col-sm-4 col-md-3 pos7">	
				<?php foreach($position_7 as $pos7){?>
					<?php echo $pos7; ?>
				<?php } ?>
			</div>
			<?php } ?>
		</div>
	</div>
<?php } ?>

<?php if(isset($position_8) || isset($position_9) || isset($position_10)){ ?>
	<div class="container">
		<div class="row">
		<?php if(isset($position_8) && isset($position_9)){ ?>
		<?php $class10 = 'col-sm-4 col-md-6'; ?>
		<?php } elseif(isset($position_8) || isset($position_9)){ ?>
		<?php $class10 = 'col-sm-8 col-md-9'; ?>
		<?php } else { ?>
		<?php $class10 = 'col-sm-12'; ?>
		<?php } ?>
			<?php if(isset($position_8)){ ?>
				<div class="col-sm-4 col-md-3 position-no-owl pos8">
					<?php foreach($position_8 as $pos8){?>
						<?php echo $pos8; ?>
					<?php } ?>
				</div>
			<?php } ?>
			<?php if(isset($position_9)){ ?>
				<div class="col-sm-4 col-md-3 position-no-owl pos9">
					<?php foreach($position_9 as $pos9){?>
						<?php echo $pos9; ?>
					<?php } ?>
				</div>
			<?php } ?>
			<?php if(isset($position_10)){ ?>
				<div class="<?php echo $class10; ?> position-no-owl pos10">
					<?php foreach($position_10 as $pos10){?>
						<?php echo $pos10; ?>
					<?php } ?>
				</div>
			<?php } ?>
		</div>
	</div>
<?php } ?>
<?php if(isset($position_22)){ ?>
	<div class="box-bg-full bg_mode_pos_22">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 pos22">
			<?php foreach($position_22 as $pos22){?>
				<?php echo $pos22; ?>
			<?php } ?>
			</div>
		</div>
	</div>
	</div>
<?php } ?>
<?php if(isset($position_11) || isset($position_12) || isset($position_13) || isset($position_14)){ ?>
	<div class="box-bg-full bg_mode_pos_11">
	<div class="container">
		<div class="row">
			<?php if(isset($position_11)){ ?>
			<div class="col-sm-6 col-md-3 position-no-owl pos11">	
				<?php foreach($position_11 as $pos11){?>
					<?php echo $pos11; ?>
				<?php } ?>
			</div>
			<?php } ?>
			<?php if(isset($position_12)){ ?>
			<div class="col-sm-6 col-md-3 position-no-owl pos12">	
				<?php foreach($position_12 as $pos12){?>
					<?php echo $pos12; ?>
				<?php } ?>
			</div>
			<?php } ?>
			<?php if(isset($position_13)){ ?>
			<div class="col-sm-6 col-md-3 position-no-owl pos13">	
				<?php foreach($position_13 as $pos13){?>
					<?php echo $pos13; ?>
				<?php } ?>
			</div>
			<?php } ?>
			<?php if(isset($position_14)){ ?>
			<div class="col-sm-6 col-md-3 position-no-owl pos14">	
				<?php foreach($position_14 as $pos14){?>
					<?php echo $pos14; ?>
				<?php } ?>
			</div>
			<?php } ?>
		</div>
	</div>
</div>
<?php } ?>

<?php if(isset($position_15)){?>
	<div class="box-bg-full bg_mode_pos_15">
	<div class="container">
		<div class="row">
		<div class="col-sm-12 pos15">
			<?php foreach($position_15 as $pos15){?>
				<?php echo $pos15; ?>
			<?php } ?>
		</div>
		</div>
	</div>
	</div>
<?php } ?>
<?php if(isset($position_16)){?>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12 pos16">
			<?php foreach($position_16 as $pos16){?>
				<?php echo $pos16; ?>
			<?php } ?>
			</div>
		</div>
	</div>
<?php } ?>
<?php echo $footer; ?>