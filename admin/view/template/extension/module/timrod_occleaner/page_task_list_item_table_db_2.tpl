<div class="table-responsive">
	<table class="table table-hover">
		<thead>
		<tr>
			<td style="width: 1px;" class="text-center">
				<input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);"/>
			</td>
			<td class="text-left col-sm-2"><?php echo $column_id; ?></td>
			<td class="text-center"><?php echo $column_expire; ?></td>
		</tr>
		</thead>
		<tbody>
			<?php if ($list) { ?>
				<?php foreach ($list as $item) { ?>
					<tr>
						<td class="text-center">
							<?php if (in_array($item['item_id'], $selected)) { ?>
								<input type="checkbox" name="selected[]" value="<?php echo $item['item_id']; ?>" checked="checked" />
							<?php } else { ?>
								<input type="checkbox" name="selected[]" value="<?php echo $item['item_id']; ?>" />
							<?php } ?>
						</td>
						<td class="text-left"><?php echo $item['item_id']; ?></td>
						<td class="text-center"><?php echo $item['expire']; ?></td>
					</tr>
				<?php } ?>
			<?php } else { ?>
				<tr>
					<td class="text-center" colspan="3"><?php echo $text_no_results; ?></td>
				</tr>
			<?php } ?>
		</tbody>
	</table>
</div>