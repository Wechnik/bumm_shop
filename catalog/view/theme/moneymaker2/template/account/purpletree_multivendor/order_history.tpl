<div class="pts-table-responsive">
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
	</pts-table>
</div>
<div class="pts-row">
	<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
	<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
</div>
