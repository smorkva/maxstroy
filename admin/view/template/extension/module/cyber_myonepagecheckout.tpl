<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">
			<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $entry_status;?>
					<div class="label-description"><?php echo $text_status_description;?></div>
					</label>
					<div class="col-sm-9">
						<div class="radio-group-infinity">	
							<?php if ($config_show_onepcheckout) { ?>
							<input id="config_show_onepcheckout_yes" class="hide-radio" type="radio" name="config_show_onepcheckout" value="1" checked="checked" />
							<label for="config_show_onepcheckout_yes"><?php echo $text_yes; ?></label>
							<?php } else { ?>
							<input id="config_show_onepcheckout_yes" class="hide-radio" type="radio" name="config_show_onepcheckout" value="1" />
							<label for="config_show_onepcheckout_yes"><?php echo $text_yes; ?></label>
							<?php } ?>
							<?php if (!$config_show_onepcheckout) { ?>
							<input id="config_show_onepcheckout_no" class="hide-radio" type="radio" name="config_show_onepcheckout" value="0" checked="checked" />							
							<label for="config_show_onepcheckout_no"><?php echo $text_no; ?></label>
							<?php } else { ?>
							<input id="config_show_onepcheckout_no" class="hide-radio" type="radio" name="config_show_onepcheckout" value="0" />							
							<label for="config_show_onepcheckout_no"><?php echo $text_no; ?></label>
							<?php } ?>						  
						</div>						 
					</div>
			</div>
           <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-details" data-toggle="tab"><?php echo $text_tab_details; ?></a></li>
            <li><a href="#tab-address" data-toggle="tab"><?php echo $text_tab_address; ?></a></li>
            <li><a href="#tab-delivery" data-toggle="tab"><?php echo $text_tab_delivery; ?></a></li>
         
          </ul>
		   <div class="tab-content">
		  <div class="tab-pane active" id="tab-details">
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-details-last-name"><?php echo $text_details_last_name; ?></label>
					<div class="col-sm-10">
					  <select name="details_last_name" id="input-details-last-name" class="form-control">
						<?php if ($details_last_name=='required') { ?>
						<option value="0"><?php echo $text_disabled; ?></option>
						<option value="required" selected="selected"><?php echo $text_enabled_required; ?></option>
						<option value="no_required"><?php echo $text_enabled_no_required; ?></option>
						<?php } elseif($details_last_name=='no_required') { ?>
						<option value="0"><?php echo $text_disabled; ?></option>
						<option value="required"><?php echo $text_enabled_required; ?></option>
						<option value="no_required" selected="selected"><?php echo $text_enabled_no_required; ?></option>
						<?php } else { ?>
						<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						<option value="required"><?php echo $text_enabled_required; ?></option>
						<option value="no_required"><?php echo $text_enabled_no_required; ?></option>
						<?php } ?>
					  </select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-details-payment-email"><?php echo $text_details_payment_email; ?></label>
					<div class="col-sm-10">
					  <select name="details_payment_email" id="input-details-payment-email" class="form-control">
						<?php if ($details_payment_email=='required') { ?>
						<option value="0"><?php echo $text_disabled; ?></option>
						<option value="required" selected="selected"><?php echo $text_enabled_required; ?></option>
						<option value="no_required"><?php echo $text_enabled_no_required; ?></option>
						<?php } elseif($details_payment_email=='no_required') { ?>
						<option value="0"><?php echo $text_disabled; ?></option>
						<option value="required"><?php echo $text_enabled_required; ?></option>
						<option value="no_required" selected="selected"><?php echo $text_enabled_no_required; ?></option>
						<?php } else { ?>
						<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						<option value="required"><?php echo $text_enabled_required; ?></option>
						<option value="no_required"><?php echo $text_enabled_no_required; ?></option>
						<?php } ?>
					  </select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-details-telephone"><?php echo $text_details_telephone; ?></label>
					<div class="col-sm-10">
					  <select name="details_telephone" id="input-details-telephone" class="form-control">
						<?php if ($details_telephone=='required') { ?>
						<option value="0"><?php echo $text_disabled; ?></option>
						<option value="required" selected="selected"><?php echo $text_enabled_required; ?></option>
						<option value="no_required"><?php echo $text_enabled_no_required; ?></option>
						<?php } elseif($details_telephone=='no_required') { ?>
						<option value="0"><?php echo $text_disabled; ?></option>
						<option value="required"><?php echo $text_enabled_required; ?></option>
						<option value="no_required" selected="selected"><?php echo $text_enabled_no_required; ?></option>
						<?php } else { ?>
						<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						<option value="required"><?php echo $text_enabled_required; ?></option>
						<option value="no_required"><?php echo $text_enabled_no_required; ?></option>
						<?php } ?>
					  </select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-details-payment-fax"><?php echo $text_details_payment_fax; ?></label>
					<div class="col-sm-10">
					  <select name="details_payment_fax" id="input-details-telephone" class="form-control">
						<?php if ($details_payment_fax) { ?>
						<option value="0"><?php echo $text_disabled; ?></option>						
						<option value="no_required" selected="selected"><?php echo $text_enabled; ?></option>
						<?php } else { ?>
						<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						<option value="no_required"><?php echo $text_enabled; ?></option>
						<?php } ?>
					  </select>
					</div>
				</div>
			</div>
			<div class="tab-pane" id="tab-address">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-payment_company"><?php echo $text_address_company; ?></label>
						<div class="col-sm-10">
						  <select name="address_payment_company" id="input-payment_company" class="form-control">
							<?php if ($address_payment_company) { ?>
							<option value="0"><?php echo $text_disabled; ?></option>						
							<option value="no_required" selected="selected"><?php echo $text_enabled; ?></option>
							<?php } else { ?>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<option value="no_required"><?php echo $text_enabled; ?></option>
							<?php } ?>
						  </select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-address-address-1"><?php echo $text_address_address_1; ?></label>
						<div class="col-sm-10">
						  <select name="address_payment_address_1" id="input-address-address-1" class="form-control">
							<?php if ($address_payment_address_1=='required') { ?>
							<option value="0"><?php echo $text_disabled; ?></option>
							<option value="required" selected="selected"><?php echo $text_enabled_required; ?></option>
							<option value="no_required"><?php echo $text_enabled_no_required; ?></option>
							<?php } elseif($address_payment_address_1=='no_required') { ?>
							<option value="0"><?php echo $text_disabled; ?></option>
							<option value="required"><?php echo $text_enabled_required; ?></option>
							<option value="no_required" selected="selected"><?php echo $text_enabled_no_required; ?></option>
							<?php } else { ?>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<option value="required"><?php echo $text_enabled_required; ?></option>
							<option value="no_required"><?php echo $text_enabled_no_required; ?></option>
							<?php } ?>
						  </select>
						</div>
					</div>					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-address-address-2"><?php echo $text_address_address_2; ?></label>
						<div class="col-sm-10">
						  <select name="address_payment_company" id="input-address-address-2" class="form-control">
							<?php if ($address_payment_address_2) { ?>
							<option value="0"><?php echo $text_disabled; ?></option>						
							<option value="no_required" selected="selected"><?php echo $text_enabled; ?></option>
							<?php } else { ?>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<option value="no_required"><?php echo $text_enabled; ?></option>
							<?php } ?>
						  </select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-address-city"><?php echo $text_address_city; ?></label>
						<div class="col-sm-10">
						  <select name="address_payment_city" id="input-address-city" class="form-control">
							<?php if ($address_payment_city=='required') { ?>
							<option value="0"><?php echo $text_disabled; ?></option>
							<option value="required" selected="selected"><?php echo $text_enabled_required; ?></option>
							<option value="no_required"><?php echo $text_enabled_no_required; ?></option>
							<?php } elseif($address_payment_city=='no_required') { ?>
							<option value="0"><?php echo $text_disabled; ?></option>
							<option value="required"><?php echo $text_enabled_required; ?></option>
							<option value="no_required" selected="selected"><?php echo $text_enabled_no_required; ?></option>
							<?php } else { ?>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<option value="required"><?php echo $text_enabled_required; ?></option>
							<option value="no_required"><?php echo $text_enabled_no_required; ?></option>
							<?php } ?>
						  </select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-address-postcode"><?php echo $text_address_postcode; ?></label>
						<div class="col-sm-10">
						  <select name="address_payment_postcode" id="input-address-postcode" class="form-control">
							<?php if ($address_payment_postcode) { ?>
							<option value="0"><?php echo $text_disabled; ?></option>						
							<option value="no_required" selected="selected"><?php echo $text_enabled; ?></option>
							<?php } else { ?>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<option value="no_required"><?php echo $text_enabled; ?></option>
							<?php } ?>
						  </select>
						</div>
					</div>
					
				</div>
				<div class="tab-pane" id="tab-delivery">				
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-shipping-address"><?php echo $text_shipping_address; ?></label>
						<div class="col-sm-10">
						  <select name="address_shipping_address" id="input-shipping-address" class="form-control">
							<?php if ($address_shipping_address) { ?>
							<option value="0"><?php echo $text_disabled; ?></option>						
							<option value="no_required" selected="selected"><?php echo $text_enabled; ?></option>
							<?php } else { ?>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<option value="no_required"><?php echo $text_enabled; ?></option>
							<?php } ?>
						  </select>
						</div>
					</div>
				</div>
			</div> 
		  
		           
          
        </form>
      </div>
    </div>
  </div>
  </div>
 <style>
 .hide-radio {
	display:none;
}
.radio-group-infinity {
	display: inline-block;
	margin-top: 9px;
	border-radius:15px;
	background-color: white;
	background-image: linear-gradient(to bottom, #eeeeee, white 25px);
	padding:3px;
	box-shadow: 0 -1px white inset, 0 1px 1px rgba(0, 0, 0, 0.05) inset;
}
.hide-radio + label {
	background: #eceeef none repeat scroll 0 0;
	color: #fff;
	display: block;
	float: left;
	font-family: "Oswald",sans-serif;
	padding: 5px 0;
	text-align: center;
	-webkit-transition: background-image 0.15s ease-in-out;
	-moz-transition: background-image 0.15s ease-in-out;
	-o-transition: background-color 0.15s ease-in-out;
	transition: background-image 0.15s ease-in-out;
	width: 45px;
	margin-bottom:0px;	
	position:relative;
	color:#969696;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.15) inset, 0 0 3px rgba(0, 0, 0, 0.2) inset;
	text-shadow:0 1px rgba(255, 255, 255, 0.8);
}
.hide-radio + label:hover {
	box-shadow:2px 3px 3px rgba(0, 0, 0, 0.25) inset;
}
.hide-radio:first-child + label{
	border-radius:15px 0px 0px 15px;
}
.radio-group-infinity > label:last-child{
	border-radius:0px 15px 15px 0px;	
	margin-left:-1px;
}
 
.hide-radio:checked + label {
	background-image: linear-gradient(#47a8d8, #47a8d8);
	display: inline-block;
	margin-bottom:0px;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.15) inset, 0 0 3px rgba(0, 0, 0, 0.2) inset;
	color:#fff;
	text-shadow:0 1px rgba(0, 0, 0, 0.2);
}

.label-description {
	color: #b9b9b9;
	font-size: 10px;
	font-weight: normal;
}
 </style>
<?php echo $footer; ?>