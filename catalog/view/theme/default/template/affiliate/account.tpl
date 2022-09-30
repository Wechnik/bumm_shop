<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $text_my_account; ?></h2>
      <? if (!$postcode) { ?>
      <h4><?php echo $text_massage; ?></h4>
      <h3><font color="red" face="Arial"><?php echo $text_status1; ?></font></h3>
      <? } ?>
      <h4><?php echo $text_transaction; ?></h4>
       <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-right"><b><?php echo $column_order_id; ?></b></td>
              <td class="text-left"><b><?php echo $column_customer; ?></b></td>
              <td class="text-right"><b><?php echo $column_name; ?></b></td>
              <td class="text-left"><b><?php echo $column_centr; ?></b></td>
           <!--   <td class="text-right"><?php echo $column_shipping; ?></td>  //-->
              <td class="text-left"><b><?php echo $column_date_added; ?></b></td>
           </tr>
          </thead>
          <tbody>
            <?php foreach ($orders as $order) { ?>
            <tr>
              <td class="text-right"><?php echo $order['order_id']; ?></td>
              <td class="text-left"><?php echo $order['customer']; ?></td>
              <td class="text-right"><a href="<?php echo $order['href']; ?>" target="_blank"><?php echo $order['name']; ?></a></td>
              <td class="text-left"><?php echo $order['centr']; ?></td>
           <!--   <td class="text-right"><?php echo $order['shipping']; ?></td>  //-->
              <td class="text-left"><?php echo $order['date_added']; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>