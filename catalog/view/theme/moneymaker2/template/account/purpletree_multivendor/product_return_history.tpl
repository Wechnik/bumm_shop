<?php if(isset($error)) { ?>
	<div class="alert pts-alert-danger alert-dismissible"><?php echo $error; ?></div>
<?php } ?>
<?php if(isset($success)) { ?>
	<div class="alert pts-alert-success alert-dismissible"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
<?php } ?>
<table class="pts-table pts-table-bordered">
	<thead>
		<tr>
			<td class="pts-text-left"><?php echo $column_date_added; ?></td>
			<td class="pts-text-left"><?php echo $column_comment; ?></td>
			<td class="pts-text-left"><?php echo $column_status; ?></td>
			<td class="pts-text-left"><?php echo $column_notify; ?></td>
		</tr>
	</thead>
	<tbody>
		<?php if ($histories) { ?>
			<?php foreach ($histories as $history) { ?>
				<tr>
					<td class="pts-text-left"><?php echo $history['date_added']; ?></td>
					<td class="pts-text-left"><?php echo $history['comment']; ?></td>
					<td class="pts-text-left"><?php echo $history['status']; ?></td>
					<td class="pts-text-left"><?php echo $history['notify']; ?></td>
				</tr>
			<?php } ?>
			<?php } else { ?>
			<tr>
				<td class="pts-text-center" colspan="4"><?php echo $text_no_results; ?></td>
			</tr>
		<?php } ?>
	</tbody>
</table>
<div class="pts-row">
	<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
	<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
</div>
