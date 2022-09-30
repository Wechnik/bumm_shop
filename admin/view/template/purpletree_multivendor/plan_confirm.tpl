<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
		 <?php if ($helpcheck) { ?>
			  <div class="pull-right float-right">
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>				
			   </div>
			<?php } ?>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach($breadcrumbs as $breadcrumb){ ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-user"></i> <?php echo $column_seller_plan_confirmation; ?></h3>
			</div>
			<div class="panel-body">	
				<div class=" ">
					<div class="col-sm-12 well">
						<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="col-sm-12 form-horizontal">	
							<div class="col-sm-12  selected-plan">
								<?php if(isset($currentplan)){ ?>
									<div class="col-sm-12 mid">
										<div class="col-sm-12">
											<p><?php echo $column_seller_name; ?>: <strong><?php echo $seller_name; ?></strong></p>
											<p><?php echo $heading_current_plan; ?> :<strong><?php echo $currentplan['plan_name']; ?></strong></p>
											<p><?php echo $column_started_date; ?>: <strong><?php echo $currentplan['start_date']; ?></strong></p>
											<p><?php echo $column_end_date; ?>: <strong><?php echo $currentplan['end_date']; ?></strong></p>
											<p><?php echo $column_validity; ?>: <strong><?php echo $currentplan['validity']; ?></strong></p>
										</div>
									</div>
								<?php } ?>
								<?php if($newplan){ ?>
									<div class="col-sm-12 mid">
										<div class="col-sm-8">
											<p><?php echo $column_new_plan; ?>: <strong><?php echo $newplan['plan_name']; ?></strong></p>
											<p><strong><?php echo $entry_short_discription; ?>: </strong><?php echo $newplan['plan_short_description']; ?></p>
											<p><?php echo $column_started_date; ?>: <strong><?php echo $newplan['start_date']; ?></strong></p>
											<p><?php echo $column_end_date; ?>: <strong><?php echo $newplan['end_date']; ?></strong></p>
											<p><?php echo $column_validity; ?>: <strong><?php echo $newplan['validity']; ?></strong></p>
										</div>
										<div class="col-sm-3 text-right">
											<strong><?php echo $subscription_price; ?></strong>
										</div>
										
										<div class="col-sm-12 text-right form-group p-0">
											<?php foreach($totals['plan'] as $key=>$Plan){ ?>
												<div class="col-sm-11 p-0"><span><?php echo $Plan['title']; ?></span></div><div class="col-sm-1"><strong><?php echo $Plan['value']; ?></strong></div>
											<?php } ?>
										</div>
										
										<input type="hidden" name="plan_id" value="<?php echo $plan_id; ?>">
										<input type="hidden" name="seller_id" value="<?php echo $seller_id; ?>">
										<input type="hidden" name="start_date" value="<?php echo $start_date; ?>">
										<div class="col-sm-12 text-right form-group">
											<button type="submit"  class="btn btn-primary"><?php echo $save_and_generate_invoice; ?></button>
										</div>
									</div>
								<?php } ?>
							</div>
						</form>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>