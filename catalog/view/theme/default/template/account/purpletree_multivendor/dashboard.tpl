<?php echo $header; ?>

<div class="pts-container container">
	<div class="pts-row d-flex row"><?php echo $column_left; ?>
		<div id="content" class="pts-col-sm-9 col-sm-9 pts-col-md-9 col-md-9 pts-col-lg-10 col-lg-10 pts-col-xs-12 col-xs-12"> 
			<div class="page-header">
			 <?php  if (isset($error_warning) && $error_warning != ''): ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
    <?php  endif; ?>
	<?php  if (isset($success) && $success != '') { ?>
		<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i><?php echo $success; ?></div>
	<?php } ?>
    <div class="container-fluid">
     <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
	  <?php  foreach($breadcrumbs as $breadcrumb): ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php  endforeach; ?>
              </ul>
			  <?php if ($helpcheck) { ?>
			  <div class="pull-right float-right">
					<!-- <a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>	 -->			
			   </div>
			  <?php } ?>   
    </div>
  </div>
			
			<div class="pts-row">
				<div class="pts-col-md-3">
					<div class="pts-dash-box pts-dash-box1">
						<div class="pts-box-top">
							<?php echo $text_sales; ?>
						</div>
						<div class="pts-box-body">
							<?php echo $total_sale; ?>
						</div>
						<div class="pts-box-bottom">
							<a  href="<?php echo $my_orders; ?>"><?php echo $text_view_more; ?></a>
						</div>
					</div>
				</div>
				<div class="pts-col-md-3">
					<div class="pts-dash-box pts-dash-box1">
						<div class="pts-box-top">
							<?php echo $text_payments; ?>
						</div>
						<div class="pts-box-body">
							<?php echo $total_payments; ?>
						</div>
						<div class="pts-box-bottom">
							<a  href="<?php echo $my_payments; ?>"> <?php echo $text_view_more; ?></a>
						</div>
					</div>
				</div>
				<div class="pts-col-md-3">
					<div class="pts-dash-box pts-dash-box1">
						<div class="pts-box-top">
							<?php echo $text_pending_payments; ?>
						</div>
						<div class="pts-box-body">
							<?php echo $pending_payments; ?>
						</div>
						<div class="pts-box-bottom">
							<a  href="<?php echo $my_payments; ?>"><?php echo $text_view_more; ?></a>
						</div>
					</div>
				</div>
				<div class="pts-col-md-3">
					<div class="pts-dash-box pts-dash-box1">
						<div class="pts-box-top">
							<?php echo $text_total_commission; ?>
						</div>
						<div class="pts-box-body">
							<?php echo $total_order_commission; ?>
						</div>
						<div class="pts-box-bottom">
							<a  href="<?php echo $my_commission; ?>"><?php echo $text_view_more; ?></a>
						</div>
					</div>
				</div>
			</div>
			
			<h2 class="pts-dash-heading">
				<i class="fa fa-shopping-cart " ></i>&nbsp;<?php echo $text_latest_order; ?>
				<span><?php echo $text_last_five_records; ?></span>
				<div class="pts-right-link pts-pull-right">
					<a href="<?php echo $my_orders ; ?>"><?php echo $text_view_more; ?></a>
				</div>
			</h2>		
			<div class="pts-table-responsive">
				<table class="pts-table pts-table-bordered pts-table-hover pts-dash-table">
					<thead>
						<tr>
							<td><?php echo $text_order_id; ?></td>
							<td><?php echo $text_customer; ?></td>
							<td><?php echo $text_status; ?></td>
							<td><?php echo $text_admin_status; ?></td>
							<td><?php echo $text_commission; ?></td>
							<td><?php echo $text_total; ?></td>
							<td><?php echo $text_date_added; ?></td>
							<td><?php echo $text_date_modified; ?></td>
							<td><?php echo $text_action; ?></td>
						</tr>
					</thead>
					<tbody>
						
						
						<?php
							
							
							if ($seller_orders) {
								foreach ($seller_orders as $seller_order) { ?>
								<tr>
									<td><?php echo $seller_order['order_id']; ?></td>
									<td><?php echo $seller_order['customer']; ?></td>
									<td><?php echo $seller_order['order_status']; ?></td>
									<td><?php echo $seller_order['admin_order_status']; ?></td>
									<td><?php echo $seller_order['commission']; ?></td>
									<td><?php echo $seller_order['total']; ?> </td>
									<td><?php echo $seller_order['date_added']; ?></td>
									<td><?php echo $seller_order['date_modified']; ?></td>
									<td><a href="<?php echo $seller_order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="pts-btn pts-btn-info"><i class="fa fa-eye"></i></a></td>
								</tr>
							<?php } }else {?>
							<tr>
								<td class="pts-text-center" colspan="8"><?php echo $text_no_results; ?></td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
			</div>
			
			<h2 class="pts-dash-heading">
				
				<i class="fa fa-money"></i>
				
				<!--<i class="fa fa-percent"></i>-->&nbsp;<?php echo $text_latest_commission; ?>
				<span><?php echo $text_last_five_records; ?></span>
				<div class="pts-right-link pts-pull-right">
					<a  href="<?php echo $my_commission; ?>"><?php echo $text_view_more; ?></a> 
				</div>
			</h2>
			
			<div class="pts-table-responsive">
				<table class="pts-table pts-table-bordered pts-table-hover pts-dash-table">
					<thead>
						<tr>
							<td><?php echo $text_order_id; ?></td>
							<td><?php echo $text_product_name; ?></td>
							<td><?php echo $text_product_price; ?></td>
							<td><?php echo $text_commission; ?></td>
							<td><?php echo $text_created_date; ?></td>
						</tr>
					</thead>
					<tbody>
						
						<?php if (!empty($seller_commissions)) { ?>
							<?php foreach ($seller_commissions as $seller_commission) { ?>
								<tr>
									<td><?php echo $seller_commission['order_id']; ?></td>
									<td><?php echo $seller_commission['product_name']; ?></td>
									<td><?php echo $seller_commission['price']; ?></td>
									<td><?php echo $seller_commission['commission']; ?></td>
									<td><?php echo $seller_commission['created_at'] ; ?></td>
								</tr>
							<?php } ?>
							<?php }else { ?>
							<tr>
								<td class="pts-text-center" colspan="8"><?php echo $text_no_results; ?></td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
			</div>
			<h2 class="pts-dash-heading">
				<i class="fa fa-cc-visa" ></i>&nbsp;<?php echo $text_latest_setlements; ?>
				<span><?php echo $text_last_five_records; ?></span>
				<div class="pts-right-link pts-pull-right">		 
					<a href="<?php echo $my_payments; ?>"><?php echo $text_view_more; ?></a>
				</div> 
			</h2>			
			
			<div class="pts-table-responsive">
				<table class="pts-table pts-table-bordered pts-table-hover pts-dash-table">
					<thead>
						<tr>
							<td><?php echo $text_transaction_id; ?></td>
							<td><?php echo $text_amount; ?></td>
							<td><?php echo $text_payment_mode; ?></td>
							<td><?php echo $text_status; ?></td>
							<td><?php echo $text_created_date; ?></td>
						</tr>
					</thead>
					<tbody>
						
						<?php if (!empty($seller_payments)) { ?>
							<?php foreach ($seller_payments as $seller_payment) { ?>
								<tr>
									<td><?php echo $seller_payment['transaction_id'] ; ?></td>
									<td><?php echo $seller_payment['amount']; ?></td>
									<td><?php echo $seller_payment['payment_mode']; ?></td>
									<td><?php echo $seller_payment['status']; ?></td>
									<td><?php echo $seller_payment['created_at']; ?></td>
								</tr>
							<?php } }else { ?>
							<tr>
								<td class="pts-text-center" colspan="8"><?php echo $text_no_results; ?></td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>