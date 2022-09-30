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
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="pts-form-horizontal">
				<div class="pts-tab-content ptsc-temppro-tabboxshpadd">
					<h3 class="ptsc-temppro-marbotpadl"><?php echo $heading_title; ?></h3>
					<div class="row">
						<div class="col-lg-3 col-xs-12 col-12 ptsc-temppro-timgpadl">
							<img src= <?php echo $template_image; ?> class="img-fluid img-responsive ptsc-temppro-timg">
						</div>
						<div class="col-lg-9 col-xs-12 col-12">
							<h2 class="ptsc-temppro-tnam" ><small><?php echo $template_name; ?></small></h2>
							<div class=" col-lg-6 col-xs-12 col-12">
								<div class="pts-form-group">
									<label class="pts-col-sm-12 col-form-label" for="input-price"><?php echo $entry_price; ?></label>
									<div class="pts-col-sm-12">
										<input type="text" name="price" value="<?php echo $price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="pts-form-control" />
									</div>
								</div>
							</div>
							<div class=" col-lg-6 col-xs-12 col-12">
								<div class="pts-form-group">
									<label class="pts-col-sm-12 col-form-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
									<div class="pts-col-sm-12">
										<input type="text" name="quantity" value="<?php echo $quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="pts-form-control" />
									</div>
								</div>
							</div>
							<div class=" col-lg-6 col-xs-12 col-12">  
								<div class="pts-form-group ">
									<label class="pts-col-sm-12 col-form-label" for="input-subtract"><?php echo $entry_subtract; ?></label>
									<div class="pts-col-sm-12">
										<select name="subtract" id="input-subtract" class="pts-form-control">	
											<?php if($subtract){ ?>
												<option value="1" selected="selected"><?php echo $text_yes; ?></option>
												<option value="0"><?php echo $text_no; ?></option>
												<?php } else { ?>
												<option value="1"><?php echo $text_yes; ?></option>
												<option value="0" selected="selected"><?php echo $text_no; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xs-12 col-12">
								<div class="pts-form-group">
									<label class="pts-col-sm-12 col-form-label" for="input-stock-status"><span data-toggle="tooltip" title="<?php echo $help_stock_status; ?>"><?php echo $entry_stock_status; ?></span></label>
									<div class="pts-col-sm-12">
										<select name="stock_status_id" id="input-stock-status" class="pts-form-control">
											<?php foreach($stock_statuses as $stock_status){ ?>
												<?php if($stock_status['stock_status_id'] == $stock_status_id){ ?>
													<option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
													<?php } else { ?>
													<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
												<?php } ?>
											<?php } ?>
										</select>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xs-12 col-12">  
								<div class="pts-form-group">
									<label class="pts-col-sm-12 col-form-label" for="input-status"><?php echo $entry_status; ?></label>
									<div class="pts-col-sm-12">
										<select name="status" id="input-status" class="pts-form-control">	
											<?php if($status){ ?>
												<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="1"><?php echo $text_enabled; ?></option>
												<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xs-12 col-12 pts-text-right ptsc-temppro-lineheight">
								<input type="submit" value="<?php echo $button_save; ?>" class="pts-btn pts-btn-primary" />
							</div>
						</div>
						
						
						<div class="clearfix"></div>
						<div class=" col-lg-12 col-xs-12 col-12">
							<div class="compare-price ptsc-compare-price">
								<h3 class="h3"><?php echo $text_other; ?></h3>
								<div class="pts-border-grey ptsc-border-grey">
									<table class="table strip">
										<tbody>
											
											<?php if(!empty($template_prices)){ ?>
												<?php foreach($template_prices as $template_price){ ?>
													<tr class="bg-strip ptsc-bg-strip">
														<td><a><img src= <?php echo $template_price['store_logo']; ?> class="img-fluid img-responsive seller-logo-compare ptsc-seller-logo-compare"></a></td>
														<td><?php echo $template_price['store_name']; ?></td>
														<td>
															<div class="compare-pts-star">
																<?php for($i = 1; $i <= 5; $i++) { ?>
																	<?php if($template_price['rating'] < $i){ ?>
																		<i class="fa fa-star-o"></i>
																		<?php } else { ?>							 
																		<i class="fa fa-star"></i>
																	<?php } ?>
																<?php } ?>
															</div>
														</td>
														<td><h4><?php echo $template_price['price']; ?></h4></td>
													</tr>
												<?php } ?>	
												<?php } else { ?>
												<tr class="bg-strip ptsc-bg-strip">
													<td class="pts-text-center" colspan="11"><?php echo $text_no_results; ?></td>
												</tr>
											<?php } ?>	
										</tbody>
									</table>
								</div>
							</div>
							
							<!-- description -->
							<div id="accordion" class="panel-group description-accord ptsc-description-accord col-lg-12 col-xs-12 col-12">
								<div class="panel panel-default toggle-btn">
									<div class="panel-heading">
										<a class="panel-title ptsc-temppro-plantit"><?php echo $entry_description; ?></a>
									</div>
									<div id="collapseOne" class="panel-collapse">
										<div class="panel-body">
											<?php echo $templatetemplate_description_name; ?>
										</div>
									</div>
								</div>
							</div>
							<!-- description -->
						</div>
					</div>
				</div>
				
			</form>
		</div>
	</div>
</div>
<?php echo $footer; ?>