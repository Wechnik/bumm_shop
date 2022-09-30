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
				<?php foreach($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if($error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<?php if($success){ ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
			</div>
			
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-customer">
					<div class="well">
						<div class="row">
							<div class="panel-heading">
								<h4 class="panel-title"> <?php echo $text_add_commission; ?></h4>
							</div>
							
							<div class="col-sm-4">
								<div class="form-group catdivdrop">
									<input type="hidden" name="filter_id" value="" class="form-control" />
									<label class="control-label" for="input-name"><?php echo $entry_categories; ?></label>
									<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_categories; ?>" id="input-name" class="form-control" />
								</div>
							</div>  
							
							<div class="col-sm-4">
								<div class="form-group">
									<label class="control-label" for="input-commission"><?php echo $entry_commission; ?></label>
									<input type="text" name="filter_commission" value="<?php echo $filter_commission; ?>"  placeholder="<?php echo $entry_commission; ?>"  class="form-control" />
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label class="control-label" for="input-commission"><?php echo $entry_commission_fixed; ?></label>
									<input type="text" name="filter_commission_fixed" value="" placeholder="<?php echo $entry_commission_fixed; ?>"  class="form-control" />
								</div>
							</div>
							<?php if ($show_seller_group == 1) { ?>
								<div class="col-sm-4">
									<div class="form-group">
										<label class="control-label" for="input-commission"><?php echo $entry_seller_group; ?></label>
										<select name="filter_seller_group" class="form-control">
											<?php foreach ($seller_groups as $seller_group) { ?>
												<option value="<?php echo $seller_group['customer_group_id']; ?>"><?php echo  $seller_group['name'] ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							<?php } ?>						
							<div class="col-sm-4">
								<div class="form-group">
									<input type="submit" value="<?php echo $button_add1; ?>" class="btn btn-primary" class="button-add ptsc-categorycommi-paddmar" data-toggle="tooltip" title="<?php echo $button_add; ?>">				  
									
								</div>
							</div>
							
						</div>
					</div>
				</form>
			</div>
			<div class="panel-body">
				<form action="" method="post" enctype="multipart/form-data" id="form-customer">
					<div class="panel-heading ptsc-categorycommi-border">
						<h4 class="panel-title"> <?php echo $text_Available_commission; ?></h4>
					</div>
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td class="text-center ptsc-vendorlis-width"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
									<td class="text-left"><?php echo $column_categories; ?></td>
									<td class="text-left"><?php if ($sort == $column_commission) { ?>
										<a href="<?php echo $sort_commission; ?>" class="<?php echo $order|$lower; ?>"><?php echo $column_commission; ?></a>
										<?php } else  { ?>
										<a href="<?php echo $sort_commission; ?>"><?php echo $column_commission; ?></a>
									<?php } ?></td>   
									<td class="text-left"><?php echo $column_commission_fixed; ?></td>
									<?php if ($show_seller_group == 1) { ?>
										<td class="text-left"><?php echo $column_seller_group; ?></td>
									<?php } ?>					   
									<td class="text-center"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								
								<?php if ($commissions){ ?>
									<?php foreach ( $commissions as $commission) { ?>
										
										<tr>
											<td class="text-center"><?php if( in_array($commission['commission_id'],$selected)){ ?>
												<input type="checkbox" name="selected[]" value="<?php echo $commission['commission_id']; ?>" checked="checked" />
												<?php }else  { ?>
												<input type="checkbox" name="selected[]" value="<?php echo $commission['commission_id']; ?>" />
											<?php } ?></td>
											<td class="text-left"><?php echo $commission['name']; ?></td>
											<td class="text-left"><?php echo $commission['commission']; ?></td>
											<td class="text-left"><?php echo $commission['commission_fixed']; ?></td>
											<?php if ($show_seller_group == 1) { ?>
												<td class="text-left"><?php echo $commission['seller_group']; ?></td>
											<?php } ?> 
											<td class="text-center">
												<a href="<?php echo $commission['editaction']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
												
												<a onclick="checkdata(event)" href="<?php echo $commission['deleteaction']; ?>" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" ><i class="fa fa-trash-o" ></i></a>
											</td>
											
										</tr>
									<?php } ?>
									<?php }else  { ?>
									<tr>
										<td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
									</tr>
								<?php } ?>
							</tbody>
						</table>
					</div>
				</form>
				<div class="row">
					<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
					<div class="col-sm-6 text-right"><?php echo $results; ?></div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	$('#button-filter').on('click', function() {
		url = 'index.php?route=purpletree_multivendor/categoriescommission&token=<?php echo $token; ?>';
		
		var filter_name = $('input[name=\'filter_name\']').val();
		var filter_id = $('input[name=\'filter_id\']').val();
		
		if (filter_name) {
			url += '&filter_name=' + encodeURIComponent(filter_name)+'&cat_id='+filter_id;
		}
		
		location = url;
	});
//--></script> 
<script type="text/javascript"><!--
	$('input[name=\'filter_name\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=purpletree_multivendor/categoriescommission/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				
				dataType: 'json',	
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['vendor_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_name\']').val(item['label']);
			$('input[name=\'filter_id\']').val(item['value']);
		}	
	});
	
	
//--></script> 
<script>
	function checkdata(e){			
		if (confirm("<?php echo $text_confirm; ?>")) {
			
			} else {
			e.preventDefault();
		}	  
	}
</script>

<?php echo $footer; ?> 
