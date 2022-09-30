<div class="table-responsive">
	<table class="table table-hover">
		<thead>
		<tr>
			<td style="width: 1px;" class="text-center">
				<input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" />
			</td>
			<td class="text-center col-sm-1">
				<?php if ($sort === 'item_id') { ?>
					<a href="<?php echo $sort_item_id; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_id; ?></a>
				<?php } else { ?>
					<a href="<?php echo $sort_item_id; ?>"><?php echo $column_id; ?></a>
				<?php } ?>
			</td>
			<td class="text-left">
				<?php if ($sort === 'name') { ?>
					<a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
				<?php } else { ?>
					<a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
				<?php } ?>
			</td>
		</tr>
		</thead>
		<tbody>
			<?php if ($list) { ?>
				<?php foreach ($list as $item) { ?>
					<tr>
						<td class="text-center">
							<?php if (in_array($item['id'], $selected)) { ?>
								<input type="checkbox" name="selected[]" value="<?php echo $item['id']; ?>" checked="checked" />
							<?php } else { ?>
								<input type="checkbox" name="selected[]" value="<?php echo $item['id']; ?>" />
							<?php } ?>
						</td>
						<td class="text-center"><?php echo $item['item_id']; ?></td>
						<td class="text-left"><?php echo $item['name']; ?></td>
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