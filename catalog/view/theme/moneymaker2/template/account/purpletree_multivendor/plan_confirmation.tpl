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
     <h1><?php echo $heading_create_plan_confirmation; ?></h1>
      <ul class="breadcrumb">
	  <?php  foreach($breadcrumbs as $breadcrumb): ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php  endforeach; ?>
              </ul>
    </div>
  </div>
			<!-----------------plan confirmation----------------------------->
			<form id = "pts-form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="pts-col-sm-12 pts-form-horizontal selected-plan">	
				<div class="pts-col-sm-12 p-0">
					<div class="pts-col-sm-12 mid">
						<?php 
							
							if(isset($multiplePlan)){ 
								if($multiplePlan){ 
									if(isset($currentplan)){ 
										
									?>
									<div class="pts-col-sm-6 p-0">
										<div class="pts-col-sm-12">
											<p><strong><?php echo $heading_current_plan; ?>: </strong> <?php echo $currentplan['plan_name'];?> <a class="pts-popuplink" data-toggle="modal" data-target="#myModala"><?php echo $button_view_description;?></a></p>
											<p><strong><?php echo $column_start_date;?>: </strong><?php echo $currentplan['start_date'];?></p>
											<p><strong><?php echo $column_end_date; ?>: </strong><?php echo $currentplan['end_date'];?></p>
											<p><strong><?php echo $column_validity;?>: </strong><?php echo $currentplan['validity'];?></p>
											<p><strong><?php echo $column_subscription_price;?>: </strong><?php echo $currentplan['subscription_price'];?></p>
										</div>
									</div>
								<?php } } } ?>
								<?php  if ($newplan){?>
									<div class="pts-col-sm-6 p-0">
										<div class="pts-col-sm-12">
											<p><strong><?php echo $column_new_plan;?>: </strong><?php echo $newplan['plan_name'];?><a class="pts-popuplink" data-toggle="modal" data-target="#myModalb"><?php echo $button_view_description;?></a></p>
											<!----p><strong>{{ newplan.plan_name }}</strong> {{ newplan.plan_short_description }}</p---->
											<p><strong><?php echo $column_start_date;?>: </strong><?php echo $newplan['start_date'];?></p>
											<p><strong><?php echo $column_end_date;?>: </strong><?php echo $newplan['end_date'];?></p>
											<p><strong><?php echo $column_validity;?>: </strong><?php echo $newplan['validity'];?></p>
											<p><strong><?php echo $column_subscription_price;?>: </strong><?php echo $subscription_price;?></p>
										</div>
									</div>
								</div>
								<div class="pts-row">
									<?php if(isset($subscriptions)){ ?>
										<div class="col-sm-4 ptsc-planconf-marpad">
											<select name="s_date" class="dropdwonnn form-control">
												<!-- <option value="0" >{{ text_start_now }}</option> -->
												<option value="1" ><?php echo $text_start_at_end;?></option>
											</select>
										</div>
										
										<?php } else {?>
										<div class="col-sm-4 ptsc-planconf-marpad">
											<select name="s_date" class="dropdwonnn pts-form-control">
												<option value="0" ><?php echo $text_start_now; ?></option>
												<?php if(isset($currentplan)){ ?>
													<option value="1" ><?php echo $text_start_at_end; ?></option>
												<?php } ?>
											</select>
										</div>
										
									<?php } ?>
								</div>
								<input type="hidden" name="plan_id" value="<?php echo $subscription['plan_id'];?>"/>
								
								<div class="pts-col-sm-12 text-right mid pts-form-group">
									<?php foreach($totals['plan'] as $key=>$plan ){ ?>
										<div class="pts-col-sm-10 p-0"><span><strong><?php echo $plan['title'];?></strong></span></div><div class="pts-col-sm-2"><?php echo $plan['value'];?></div>
									<?php }?>
								</div>
								
								<input type="hidden" name="plan_id" value="<?php echo $plan_id;?>">
								
								<div class="pts-col-sm-12 text-right pts-form-group">
									<button id = "conform-button" type="button"  class="pts-btn pts-btn-primary"><?php echo $button_save_generate_invoice;?></button>
								</div>
					<?php } ?>
				</div>
				<?php if(isset($currentplan)){?>
					<!-- Modal plan a -->
					<div class="modal fade" id="myModala" role="dialog">
						<div class="modal-dialog popup-model">
							<!-- Modal content-->
							<div class="modal-content hieght-fixed">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title"><?php echo $column_description;?></h4>
								</div>
								<div class="modal-body">
									<p> <?php echo $currentplan['plan_description'];?></p>
								</div>
							</div>
							
						</div>
					</div>
				<?php } ?>
				<div class="modal fade" id="myModalb" role="dialog">
					<div class="modal-dialog popup-model">
						<!-- Modal content-->
						<div class="modal-content hieght-fixed">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title"><?php echo $column_description;?></h4>
							</div>
							<div class="modal-body">
								<p><?php echo $newplan['plan_description'];?> </p>
							</div>
						</div>
						
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	$( document ).ready(function() {
		$(".dropdwonnn").change(function () {
			var end = this.value;
			window.location.href = window.location.href + "&s_date="+end;
		});
		$("#conform-button").on("click", function() {
			$(this).attr("disabled", "disabled");
			$("#pts-form").submit();
		});
	});
</script>
<?php echo $footer; ?>