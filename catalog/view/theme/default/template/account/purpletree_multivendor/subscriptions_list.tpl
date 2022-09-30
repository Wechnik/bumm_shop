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
			<div class="">
				<div class="pts-row pts-well ptsc-shipping-marlr" >
					<div class="pts-col-sm-4">
						<div class="pts-form-group catdivdrop">
							<input type="hidden" name="filter_plan_id" value="<?php echo isset($filter_plan_id)?$filter_plan_id:''; ?>" class="pts-form-control" />
							<label class="pts-control-label" for="input-plan-name"><?php echo $entry_plan_name; ?></label>
							<input type="text" name="filter_plan_name" value="<?php echo isset($filter_plan_name)?$filter_plan_name:''; ?>" placeholder="<?php echo $entry_plan_name; ?>" id="input-plan-name" class="pts-form-control" />
						</div>
						
						<div class="pts-form-group catdivdrop">
							<input type="hidden" name="filter_status_id" value="<?php echo isset($filter_status_id)?$filter_status_id:''; ?>" class="form-control" />
							<label class="pts-control-label" for="input-status"><?php echo $entry_status; ?></label>
							<input type="text" name="filter_status" value="<?php echo $filter_status; ?>" placeholder="<?php echo $entry_status; ?>" id="input-status" class="pts-form-control" />
						</div>
						
					</div> 
					<div class="pts-col-sm-4">
						<div class="pts-form-group">
							<label class="pts-control-label" for="input-start-date-from"><?php echo $entry_start_date_from; ?></label>
							
							<div class="pts-input-group date">
								<input type="text" name="filter_start_date_from" value="<?php echo $filter_start_date_from; ?>" placeholder="<?php echo $entry_start_date_from; ?>" data-date-format="YYYY-MM-DD" id="input-start-date-from" class="pts-form-control" />
								<span class="pts-input-group-btn">
									<button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button>
								</span>
							</div>
							
						</div>
						
						<div class="pts-form-group">
							<label class="control-label" for="input-start-date-to"><?php echo $entry_start_date_to; ?></label>             
							<div class="pts-input-group date">
								<input type="text" name="filter_start_date_to" value="<?php echo $filter_start_date_to; ?>" placeholder="<?php echo $entry_start_date_to; ?>" data-date-format="YYYY-MM-DD" id="input-start-date-to" class="pts-form-control" />
								<span class="pts-input-group-btn">
									<button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button>
								</span>
							</div>
						</div>
						
					</div>
					<div class="pts-col-sm-4">
						<div class="pts-form-group">
							<label class="pts-control-label" for="input-end-date-from"><?php echo $entry_end_date_from; ?></label>             
							<div class="pts-input-group date">
								<input type="text" name="filter_end_date_from" value="<?php echo $filter_end_date_from; ?>" placeholder="<?php echo $entry_end_date_from; ?>" data-date-format="YYYY-MM-DD" id="input-end-date-from" class="pts-form-control" />
								<span class="pts-input-group-btn">
									<button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button>
								</span>
							</div>
						</div>
						
						<div class="pts-form-group">
							<label class="pts-control-label" for="input-end-date-to"><?php echo $entry_end_date_to; ?></label>            
							<div class="pts-input-group date">
								<input type="text" name="filter_end_date_to" value="<?php echo $filter_end_date_to; ?>" placeholder="<?php echo $entry_end_date_to; ?>" data-date-format="YYYY-MM-DD" id="input-end-date-to" class="pts-form-control" />
								<span class="pts-input-group-btn">
									<button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button>
								</span>
							</div>
						</div>
						<button type="button" id="button-filter" class="pts-btn pts-btn-primary pts-pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
					</div>
					
				</div>
				
				<div>
					<div class="panel panel-default ptsc-geo-margin">
						<div class="panel-heading">
							<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
						</div>
						<div class="panel-body">
							<div class="pts-table-responsive">
								<form action="" method="post" enctype="multipart/form-data" id="form-seller">
									<table class="pts-table pts-table-bordered pts-table-hover">
										<thead>
											<tr>                     
												<td class="pts-text-left"><?php echo $column_plan_name; ?></td>					  
												<td class="pts-text-left"><?php echo $column_status; ?></td>					  
												<td class="pts-text-left"><?php echo $column_active; ?></td>					  
												<td class="pts-text-left"><?php echo $column_start_date; ?></td>					
												<td class="pts-text-left"><?php echo $column_end_date; ?></td>                 
												<td class="pts-text-left"><?php echo $column_created_date; ?></td>
												<td class="pts-text-right"><?php echo $column_action; ?></td>
											</tr>
										</thead>
										<tbody>
											<?php if($subscription){ ?>
												<?php foreach($subscription as $subscriptions ){ ?>
													<tr>                   
														<td class="pts-text-left"><?php echo $subscriptions['plan_name']; ?></td>
														<td class="pts-text-left"><?php echo $subscriptions['status_name']; ?></td>
														<td class="pts-text-left"><?php echo $subscriptions['status']; ?></td>
														<td class="pts-text-left"><?php echo $subscriptions['start_date']; ?></td>
														<td class="pts-text-left"><?php echo $subscriptions['end_date']; ?></td>
														<td class="pts-text-left"><?php echo $subscriptions['created_date']; ?></td>                  
														<td class="pts-text-right">
															<div class="pts-btn-group ptsc-subscr-planmwidth">
																<a href="<?php echo $subscriptions['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="pts-btn pts-btn-info"><i class="fa fa-eye"></i></a>                     
															</div>
														</td>
													</tr>
												<?php } ?>
												<?php } else { ?>
												<tr>
													<td class="pts-text-center" colspan="8"><?php echo $text_no_results; ?></td>
												</tr>
											<?php } ?>
										</tbody>
									</table>
								</div>
							</form>
							<div class="row">
								<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
								<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	$('.table-responsive').on('shown.bs.dropdown', function (e) {
		var t = $(this),
		m = $(e.target).find('.dropdown-menu'),
		tb = t.offset().top + t.height(),
		mb = m.offset().top + m.outerHeight(true),
		d = 20;
		if (t[0].scrollWidth > t.innerWidth()) {
			if (mb + d > tb) {
				t.css('padding-bottom', ((mb + d) - tb));
			}
			} else {
			t.css('overflow', 'visible');
		}
		}).on('hidden.bs.dropdown', function () {
		$(this).css({'padding-bottom': '', 'overflow': ''});
	});
//--></script>

<script type="text/javascript"><!--
	$('#button-filter').on('click', function() {
		url = 'index.php?route=account/purpletree_multivendor/subscriptions';
		
		var filter_plan_id = $('input[name=\'filter_plan_id\']').val();
		if (filter_plan_id !== '') {
			url += '&filter_plan_id=' + encodeURIComponent(filter_plan_id);
		}
		var filter_plan_name = $('input[name=\'filter_plan_name\']').val();
		if (filter_plan_name !== '') {
			url += '&filter_plan_name=' + encodeURIComponent(filter_plan_name);
		}
		
		var filter_status_id = $('input[name=\'filter_status_id\']').val();
		if (filter_status_id) {
			url += '&filter_status_id=' + encodeURIComponent(filter_status_id);
		}
		
		var filter_status = $('input[name=\'filter_status\']').val();
		if (filter_status) {
			url += '&filter_status=' + encodeURIComponent(filter_status);
		}
		var filter_start_date_from = $('input[name=\'filter_start_date_from\']').val();
		if (filter_start_date_from) {
			url += '&filter_start_date_from=' + encodeURIComponent(filter_start_date_from);
		}
		var filter_start_date_to = $('input[name=\'filter_start_date_to\']').val();
		if (filter_start_date_to) {
			url += '&filter_start_date_to=' + encodeURIComponent(filter_start_date_to); 
		}
		var filter_end_date_from = $('input[name=\'filter_end_date_from\']').val();
		if (filter_end_date_from) {
			url += '&filter_end_date_from=' + encodeURIComponent(filter_end_date_from);
		}
		var filter_end_date_to = $('input[name=\'filter_end_date_to\']').val();
		if (filter_end_date_to) {
			url += '&filter_end_date_to=' + encodeURIComponent(filter_end_date_to);
		}
		location = url;
	});
//--></script>
<script type="text/javascript"><!--
	$('.date').datetimepicker({
		pickTime: false
	});
//--></script>
<script type="text/javascript"><!--
	$('input[name=\'filter_plan_name\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/subscriptions/autoplanname&filter_plan_name=' +  encodeURIComponent(request),
				
				dataType: 'json',	
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['plan_name'],
							value: item['plan_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_plan_name\']').val(item['label']);
			$('input[name=\'filter_plan_id\']').val(item['value']);
		}	
	});
	
	
//--></script> 

<script type="text/javascript"><!--
	$('input[name=\'filter_status\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/subscriptions/autoplanstatus&filter_status=' +  encodeURIComponent(request),
				
				dataType: 'json',	
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['status'],
							value: item['status_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_status\']').val(item['label']);
			$('input[name=\'filter_status_id\']').val(item['value']);
		}	
	});
	
	
//--></script>
<?php echo $footer; ?>