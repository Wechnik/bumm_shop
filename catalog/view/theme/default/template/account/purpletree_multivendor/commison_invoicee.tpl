<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title><?php echo $title; ?></title>
		<link href="<?php echo $HTTPS_SERVER; ?>catalog/view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="all" />
		<div class="container">
			<div class="ptsc-commison-in-page-break">
				<h1><?php echo $invoice_number_text;?><?php echo $invoice_number; ?></h1>
				<table class="table table-bordered">
					<thead>
						<tr> 
							<td><?php echo $text_order_detail; ?></td>
							<td class="text-right"><?php echo $text_created_at; ?>: <?php echo $created_at; ?></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><address>
								<strong><?php echo $store_name; ?></strong><br />
								<?php echo $store_address; ?>
							</address>
							<b><?php echo $text_telephone; ?></b><?php echo $store_telephone; ?><br />
							<b><?php echo $text_email; ?></b> <?php echo $store_email; ?><br />
							<b><?php echo $text_website; ?></b> <a href="<?php echo $store_url; ?>"><?php echo $store_url; ?></a><br/>
							</td>
							<td><address>
								<strong><?php echo $sellerdetails['store_name'];?> </strong><br/>
								<?php echo $sellerdetails['store_address']; ?>&nbsp
									<?php echo $sellerdetails['store_city']; ?>&nbsp
									<?php echo $seller_country; ?>&nbsp
									<?php echo $sellerdetails['store_zipcode']; ?>
							</address>
							<b><?php echo $text_telephone; ?></b> <?php echo $sellerdetails['store_phone'] ?><br/>
							<b><?php echo $text_email; ?></b> <?php echo $sellerdetails['store_email'] ?><br />
							<?php if ($seller_vatnumber != '') { ?>
								<b><?php echo $seller_vatname ?></b> <?php echo $seller_vatnumber ?><br />
							<?php } ?>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="table table-bordered">
					<thead>
						<tr>
							<td><?php echo $order_id_text; ?></td>
							<td><b><?php echo $column_product; ?></b></td>
							<td class="text-right"><b><?php echo $column_quantity; ?></b></td>
							<td class="text-right"><b><?php echo $column_product_price; ?></b></td>
							<td class="text-right"><b><?php echo $column_commission_percent; ?></b></td>
							<td class="text-right"><b><?php echo $fixed_text; ?></b></td>
							<td class="text-right"><b><?php echo $commision_product; ?></b></td>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($orders as $order) { ?>
							<tr>
								<td class="text-right"><?php echo $order['order_id']; ?></td>
								<td><?php echo $order['product']['name']; ?>
									<?php foreach ($order['product']['option'] as $option) { ?>
										<br />
										&nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
									<?php } ?></td>
									<td class="text-right"><?php echo $order['product']['quantity']; ?></td>
									<td class="text-right"><?php echo $order['product']['price_total']; ?></td>
									<td class="text-right"><?php echo $order['commission_percent'];?></td>
									<td class="text-right"><?php echo $order['commission_fixed'];?></td>
									<td class="text-right"><?php echo $order['total_commission'];?></td>
							</tr>
						<?php } ?>
					</tbody>
					<tfoot>
						<tfoot>
							<tr>		
								<td class="text-right" colspan="5"></td>          
								<td class=""><?php echo $shipping_text?></td>
								<td class="text-right"><?php echo $total_shipping_commission; ?></td>
							</tr>	
							<tr>
								<td class="text-right" colspan="5"></td>          
								<td class=" pts-text-bold"><?php echo $commision_product; ?></td>
								<td class="text-right pts-text-bold"><?php echo $total_commissionn; ?></td>
							</tr>
						</tfoot>
					</table>
					<table class="table table-bordered">
						<tbody class="ptsc-commison-in-shadow">
							<tr class="ptsc-commison-in-border">
								<td colspan="2"><h3 class="h3-payment"><?php echo $text_payment;?></h3></td>
							</tr>
							<tr>	
								<td class="pts-text-left payment-td">
									
									<b class="b-payment"><?php echo $text_totla_payable_amount;?></b>: <?php echo $total_pay_amountt;?><br>
									<b class="b-payment"><?php echo $payment_status;?></b>: <?php echo $invoice_status;?><br>		    
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table table-bordered">
						<thead>
							<tr>
								<td class="pts-text-right"><b><?php echo $column_id; ?></td>
									<td class="pts-text-right"><b><?php echo $column_transacton_id; ?></b></td>
									<td class="pts-text-right"><b><?php echo $column_payment_mode; ?></b></td>
									<td class="pts-text-right"><b><?php echo $column_payment_date; ?></b></td>
									<td class="pts-text-right"><b><?php echo $column_commentt; ?></b></td>
									<td class="pts-text-right"><b><?php echo $column_statuss; ?></b></td>		  
								</tr>
							</thead>
							<tbody>
								<?php if(!empty($commissionnn_history)) { ?>
									<?php foreach ($commissionnn_history as $commission_hist) { ?>
										<tr>	
											<td class="pts-text-right"><?php echo $commission_hist['id']; ?></td>
											<td class="pts-text-right"><?php echo $commission_hist['transaction_id']; ?></td>
											<td class="pts-text-right"><?php echo $commission_hist['payment_mode']; ?></td>
											<td class="pts-text-right"><?php echo $commission_hist['created_date']; ?></td>
											<td class="pts-text-right"><?php echo $commission_hist['comment']; ?></td> 
											<td class="pts-text-right"><?php echo $commission_hist['status_id']; ?></td> 
										</tr>
									<?php } ?>
									<?php }else{ ?>
									<tr>
										<td class="text-center" colspan="9"><?php echo $text_no_results; ?></td>
									</tr>
								<?php } ?>
							</tbody>
						</table>
						<?php if ($purpletree_multivendor_footer_text) { ?>
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td><?php echo $purpletree_multivendor_footer_text; ?>		 
										</td>
									</tr>
								</tbody>
							</table>
						<?php } ?>
					</div>
				</div>
			</body>
		</html>
		