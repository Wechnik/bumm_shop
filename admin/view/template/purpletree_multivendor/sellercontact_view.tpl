<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			<?php if ($helpcheck) { ?>
					<!-- <a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a> -->
				<?php }?>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="table-responsive panel">
				<table class="table">
					<tbody>
						<tr>
							<td><strong><?php echo $text_seller_name; ?></strong></td>
							<td><?php echo $seller_name; ?></td>
						</tr>
						<tr>
							<td><strong><?php echo $text_customer_name; ?></strong></td>
							<td><?php echo $text_customer_name; ?></td>
						</tr>
						<tr>
							<td><strong><?php echo $text_email; ?></strong></td>
							<td><?php echo $customer_email; ?></td>
						</tr>
						<tr>
							<td><strong><?php echo $text_description; ?></strong></td>
							<td><?php echo $customer_message; ?></td>
						</tr>
						<?php if (!empty($file_attach)) { ?>
						<tr>
						<td><strong><?php echo $text_files; ?></strong></td>
						 <td>
						 <?php foreach ($file_attach as $files) { ?>
						 <br><a href="<?php echo $files['file_root']; ?>" target="_blank" ><?php echo $files['file_name']; ?></a>
						 <?php } ?>
						 </td>
						</tr> 
						<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>