<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body style="font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; color: #000000;">
<div>
<a href="<?php echo $store_url; ?>" title="<?php echo $store_name; ?>"><img src="<?php echo $logo; ?>" alt="<?php echo $store_name; ?>" style="margin-bottom: 20px; border: none;" /></a>
<br/>
<table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;margin-top: 10px;">
  <thead>
    <tr>
      <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"><?php echo $text_buyer; ?></td>
      <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"><?php echo $text_dateadded; ?></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;">
      <?php if($data_buyer['name_field'] !='') { ?><b><?php echo $text_name_fields; ?>:</b> <?php echo $data_buyer['name_field']; ?><br/><?php } ?>
      <?php if($data_buyer['telephone_field'] !='') { ?><b><?php echo $text_telephone_field; ?>:</b> <?php echo $data_buyer['telephone_field']; ?><br/><?php } ?>
      <?php if($data_buyer['link_field'] !='') { ?><b><?php echo $text_link_field; ?>:</b> <?php echo $data_buyer['link_field']; ?><br/><?php } ?>
      <?php if($data_buyer['comment_field'] !='') { ?><b><?php echo $text_comment_field; ?>:</b> <?php echo $data_buyer['comment_field']; ?><br/><?php } ?>
      <?php if($data_buyer['email_field'] !='') { ?><b><?php echo $text_email_field; ?>:</b> <?php echo $data_buyer['email_field']; ?><br/><?php } ?>
      </td>
      <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $date_added; ?></td>
    </tr>
  </tbody>
</table>
</div>
</body>
</html>
