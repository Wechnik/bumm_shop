<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
	<head>
		<meta charset="UTF-8" />
		<title><?php echo $title; ?></title>
		
		<link href="view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="all" />
		<script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
		<link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
		<link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="all" />
	</head>
	<body>
		<div class="container">
			<div class="ptsc-subscrip-pagebreak">
				<h1><?php echo $text_invoice; ?>#<?php echo $invoice_id; ?></h1>
				<table class="table table-bordered">
					<thead>
						<tr>
							<td colspan="2"><?php echo $text_invoice_details; ?></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="ptsc-subscrip-width">
								
								<?php if($admin_info){ ?>
									<div class="col-sm-6 admin-store">
										<p><?php echo $text_admin_store_name; ?>: <strong><?php echo $admin_info['name']; ?></strong></p>
										<p><?php echo $text_address; ?>: <strong><?php echo $admin_info['address']; ?></strong></p>
										<p><?php echo $text_telephone; ?>: <strong><?php echo $admin_info['telephone']; ?></strong></p>
										<p><?php echo $text_email; ?>: <strong><?php echo $admin_info['email']; ?></strong></p>
										<p><?php echo $text_website; ?>:  <a href="<?php echo $admin_info['url']; ?>"> <strong><?php echo $admin_info['url']; ?></strong></a></p>
									</div>
								<?php } ?>  
							</td>
							<td class="ptsc-subscrip-width">
								<?php if($store_info){ ?>
									<div class="col-sm-6">
										<p><?php echo $text_seller_store_name; ?>: <strong><?php echo $store_info['name']?></strong></p>
										<p><?php echo $text_address; ?>: <strong><?php echo $store_info['address']?></strong></p>
										<p><?php echo $text_telephone; ?>: <strong><?php echo $store_info['telephone']?></strong></p>
										<p><?php echo $text_email; ?>: <strong><?php echo $store_info['email']?></strong></p>
									</div>
								<?php } ?>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="table table-bordered">
					<thead>
						<tr>
							<td><b><?php echo $text_plan_details; ?></b></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="col-sm-12 mid">
									<?php if($newplan){ ?>
										<div class="col-sm-12 mid">
											<div class="col-sm-8">
												<p><strong><?php echo $newplan['plan_name']; ?></strong> ( <?php echo $newplan['plan_short_description']; ?> )</p>
												<p><?php echo $text_start_date; ?>: <strong><?php echo $newplan['start_date']; ?></strong></p>
												<p><?php echo $text_end_date; ?>: <strong><?php echo $newplan['end_date']; ?></strong></p>
												<p><?php echo $text_joining_fee; ?>: <strong><?php echo $joining_fee; ?></strong></p>
												<p><?php echo $text_subscription_price; ?>: <strong><?php echo $subscription_price; ?></strong></p>
											</div>
											
										</div>
									<?php } ?>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="table table-bordered">
					<tbody>
						<?php foreach($invoiceitemss as $value){ ?>
							<tr>
								<td class="text-right" colspan="4"><b><?php echo $value['title']; ?></b></td>
								<td class="text-right"><?php echo $value['price']; ?></td>
							</tr>
						<?php } ?>
						<tr>
							<td class="text-right" colspan="4"><b><?php echo $text_grand_total; ?></b></td>
							<td class="text-right"><?php echo $grand_total; ?></td>
						</tr>
					</tbody>
				</table>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="ptsc-subscrip-widpad">
								<b><?php echo $text_invoice_id; ?></b>#<?php echo $invoice_id; ?> <br />
								<b><?php echo $text_created_date; ?></b> <?php echo $created_date; ?> <br />
							</td>
							<td>
								<h3 class="text-center"><?php echo $current_status; ?></h3>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="table table-bordered">
					<thead>
						<tr>
							<td class="text-right" colspan="4"><b><?php echo $text_payment_mode; ?></b></td>
							<td class="text-right"><?php echo $text_status; ?></td>
							<td class="text-right"><?php echo $text_transaction_id; ?></td>
							<td class="text-right"><?php echo $text_payment_date; ?></td>
							<td class="text-right"><?php echo $text_comment; ?></td>
						</tr>
					</thead>
					<tbody>
						<?php if($payment_history){ ?>
							<?php foreach($payment_history as $payment_hi){ ?>
								<tr>
									<td class="text-right" colspan="4"><?php echo $payment_hi['payment_mode']; ?></td>
									<td class="text-right"><?php echo $payment_hi['status']; ?></td>
									<td class="text-right"><?php echo $payment_hi['transaction_id']; ?></td>
									<td class="text-right"><?php echo $payment_hi['created_date']; ?></td>
									<td class="text-right"><?php echo $payment_hi['comment']; ?></td>
								</tr>
							<?php } ?>
							<?php } else { ?>
							<tr>
								<td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>