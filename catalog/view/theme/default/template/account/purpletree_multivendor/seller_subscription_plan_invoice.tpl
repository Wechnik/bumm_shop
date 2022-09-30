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
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>				
			   </div>
			<?php } ?>
    </div>
  </div>
			<!-----------------Invoice no----------------------------->
			<div class="">
				<div class="pts-row">
					<div class="pts-col-sm-12">
						<h2><?php echo $text_invoice_id; ?>: <?php echo $invoice_id; ?></h2>
						<div class="pts-col-sm-12  selected-plan">
							<div class="pts-col-sm-12 mid">
								<?php if($admin_info){ ?>
									<div class="pts-col-sm-6 admin-store">
										<p><strong><?php echo $text_admin_storename; ?>: </strong><?php echo $admin_info['name']; ?></p>
										<p><strong><?php echo $text_address; ?>: </strong><?php echo $admin_info['address']; ?></p>
										<p><strong><?php echo $text_telephone; ?>: </strong><?php echo $admin_info['telephone']; ?></p>
										<p><strong><?php echo $text_email; ?>: </strong><?php echo $admin_info['email']; ?></p>
										<p><strong><?php echo $text_website; ?>: </strong><?php echo $admin_info['url']; ?></p>
									</div>
								<?php } ?>
								<?php if($store_info){ ?>
									<div class="pts-col-sm-6">
										<p><strong><?php echo $text_seller_storename; ?>: </strong><?php echo $store_info['name']; ?></p>
										<p><strong><?php echo $text_seller_name; ?>: </strong><?php echo $origina_seller_name['seller_name']; ?></p>
										<p><strong><?php echo $text_address; ?>: </strong><?php echo $store_info['address']; ?></p>
										<p><strong><?php echo $text_telephone; ?>: </strong><?php echo $store_info['telephone']; ?></p>
										<p><strong><?php echo $text_email; ?>: </strong><?php echo $store_info['email']; ?></p>
									</div>
								<?php } ?>
							</div>
							<?php if(isset($newplan)){ ?>
								<div class="pts-col-sm-12 mid" >
									<div class="pts-col-sm-9">
										<p><strong><?php echo $newplan['plan_name']; ?></strong> <?php echo $newplan['plan_short_description']; ?></p>
										<p><strong><?php echo $column_start_date; ?>: </strong><?php echo $newplan['start_date']; ?></p>
										<p><strong><?php echo $column_end_date; ?>: </strong><?php echo $newplan['end_date']; ?></p>
									</div>
									<div class="pts-col-sm-3 pts-text-right">
										<span><?php echo $newplan['subscription_price']; ?></span>
									</div>
									<div class="pts-col-sm-12 pts-text-right p-0">
										<?php foreach($invoice['item'] as $value){ ?>
											
											<div class="pts-col-sm-10 p-0 pts-total_price"><span><strong><?php echo $value['title']; ?></strong></span></div><div class="pts-col-sm-2 pts-total_price pts-text-right"><?php echo $value['price']; ?></div>
										<?php } ?>
										<div class="pts-col-sm-10 p-0 pts-grand_total_price"><span class="pts-grand_total1"><?php if(isset($text_grand_total)){ echo $text_grand_total; }?> </span></div><div class="pts-col-sm-2 pts-text-right pts-grand_total_price"><strong><?php echo $grand_total; ?></strong></div>
										
									</div>
								</div>
							<?php } ?>
							
							
							<div class="pts-col-sm-12 mid">
								
								<div class="pts-col-sm-6">
									<p><strong><?php echo $text_invoice_number; ?>: </strong><?php echo $invoice_id; ?></p>
									<p><strong><?php echo $text_created_date; ?>: </strong><?php echo $invoice['created_date']; ?></p>
									<p><strong><?php echo $text_status; ?>: </strong><?php echo $invoice['status_id']; ?></p>
								</div>
								<div class="pts-col-sm-6 payment">
									<?php if($grand_total_no_currency > '0'){ ?>
										<?php if($invoice['status_id_id'] == '2'){ ?>
											<h4 class="ptsc-subpl-fontexmar"><?php echo $invoice['status_id']; ?></h4>
											<?php } else { ?>
											<h4><?php echo $heading_make_payment; ?></h4><br>
											<a href="<?php echo $payment_offline; ?>" ><?php echo $button_pay_offline; ?></a>
											<?php if(isset($purpletree_multivendor_paypal_email) && $purpletree_multivendor_paypal_email !=''){ ?>
												<form class="ptsc-subpl-florig" name="_xclick" action="https://www.paypal.com/cgi-bin/webscr" method="post">
													<input type="hidden" name="cmd" value="_xclick"/>
													<input type="hidden" name="return" value="<?php echo $return_url; ?>"/>
													<input type="hidden" name="notify_url" value="<?php echo $notify_url; ?>">
													<input type="hidden" name="currency_code" value="<?php echo $currency_currency1; ?>"/>					
													<input type="hidden" name="business" value="<?php echo $purpletree_multivendor_paypal_email; ?>"/>
													<input type="hidden" name="item_name" value="<?php echo $newplan['plan_name']; ?>"/>
													<input type="hidden" name="item_number" value="1"/>
													<input type="hidden" name="amount" value="<?php echo $grand_total_no_currency1; ?>"/>
													<input type="hidden" name="first_name" value="<?php echo $origina_seller_name['firstname']; ?>"/>
													<input type="hidden" name="last_name" value="<?php echo $origina_seller_name['lastname']; ?>"/>
													<input type="hidden" name="address1" value="<?php echo $store_info['address']; ?>"/>
													<input type="hidden" name="custom" value="<?php echo $invoice_id; ?>"/>
													<input type="hidden" name="city" value="<?php echo $store_info['city']; ?>"/>
													<input type="hidden" name="state" value="<?php echo $store_info['state']; ?>"/>
													<input type="hidden" name="zip" value="<?php echo $store_info['zip']; ?>"/>
													<input type="hidden" name="country" value="<?php echo $store_info['country']; ?>"/>
													<input type="hidden" name="night_phone_a" value="<?php echo $store_info['telephone']; ?>"/>
													<input type="hidden" name="email" value="<?php echo $store_info['email']; ?>"/>
													<input class="ptsc-subpl-width" type="image" src="image/catalog/paypalbutton.png" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!"/>
												</form>
											<?php } ?>
										<?php  } ?>
									<?php } ?>
								</div>
								</div>	<div class="pts-col-sm-12 history pts-table-responsive">
								<h3><?php echo $heading_payment_history; ?></h3>
								<table class="pts-table pts-table-bordered pts-table-hover">
									<thead>
										<tr>
											<td><?php echo $column_payment_mode; ?></td>
											<!--td>{{ text_status }}</td--->
											<td><?php echo $column_transaction_id; ?></td>
											<td><?php echo $column_payment_date; ?></td>
											<td><?php echo $column_comment; ?></td>
										</tr>
									</thead>
									<tbody>
										<?php if($payment_history){ ?>
											<?php foreach($payment_history as $value){ ?>
												<tr>
													<td><?php echo $value['payment_mode']; ?></td>
													<!---td>{{ value.status_id }}</td---->
													<td><?php echo $value['transaction_id']; ?></td>
													<td><?php echo $value['created_date']; ?></td>
													<td><?php echo $value['comment']; ?></td>
												</tr>
											<?php } ?>
											<?php } else { ?>
											<tr>
												<td class="pts-text-center" colspan="8"><?php echo $text_no_results; ?></td>
											</tr>
										<?php } ?>
										<tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<?php echo $footer; ?>	