<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-payment" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
		<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
				<?php }?>
		</div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach($breadcrumbs as $breadcrumb) {  ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if($error_warning != '') {  ?>
    <div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-payment" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-status" data-toggle="tab"><?php echo $tab_order_status; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="entry-email"><?php echo $entry_email; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="pp_adaptive_email" value="<?php echo $pp_adaptive_email; ?>" placeholder="<?php echo $entry_email; ?>" id="entry-email" class="form-control"/>
                  <?php if($error_email != '') {  ?>
                  <div class="text-danger"><?php echo $error_email; ?></div>
                  <?php } ?>
                </div>
              </div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="entry_client_id"><?php echo $entry_client_id; ?></label>
				<div class="col-sm-10">
					<input type="text" name="pp_adaptive_client_id" value="<?php echo $pp_adaptive_client_id; ?>" placeholder="<?php echo $entry_client_id; ?>" id="entry_client_id" class="form-control"/>
					<?php if($error_client_id != '') {  ?>
					<div class="text-danger"><?php echo $error_client_id; ?></div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="entry_secret"><?php echo $entry_secret; ?></label>
				<div class="col-sm-10">
					<input type="text" name="pp_adaptive_admin_secret" value="<?php echo $pp_adaptive_admin_secret; ?>" placeholder="<?php echo $entry_secret; ?>" id="entry_secret" class="form-control"/>
					<?php if($error_secret_key != '') {  ?>
					<div class="text-danger"><?php echo $error_secret_key; ?></div>
					<?php } ?>
				</div>
			</div>	
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-live-demo"><span data-toggle="tooltip" title="<?php echo $help_test; ?>"><?php echo $entry_test; ?></span></label>
                <div class="col-sm-10">
                  <select name="pp_adaptive_test" id="input-live-demo" class="form-control">
                    <?php if($pp_adaptive_test == 1) {  ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-debug"><span data-toggle="tooltip" title="<?php echo $help_debug; ?>"><?php echo $entry_debug; ?></span></label>
                <div class="col-sm-10">
                  <select name="pp_adaptive_debug" id="input-debug" class="form-control">
                    <?php if($pp_adaptive_debug == 1) {  ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-transaction"><?php echo $entry_transaction; ?></label>
                <div class="col-sm-10">
                  <select name="pp_adaptive_transaction" id="input-transaction" class="form-control">
				   <?php if($pp_adaptive_transaction == 1) {  ?>
                    <option value="1" selected="selected"><?php echo $text_sale; ?></option>
                    <option value="0"><?php echo $text_authorization; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_sale; ?></option>
                    <option value="0" selected="selected"><?php echo $text_authorization; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-total"><span data-toggle="tooltip" title="<?php echo $help_total; ?>"><?php echo $entry_total; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="pp_adaptive_total" value="<?php echo $pp_adaptive_total; ?>" placeholder="<?php echo $entry_total; ?>" id="input-total" class="form-control"/>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
                <div class="col-sm-10">
                  <select name="pp_adaptive_geo_zone_id" id="input-geo-zone" class="form-control">
                    <option value="0"><?php echo $text_all_zones; ?></option>
                    <?php foreach($geo_zones as $geo_zone) {  ?>
                    <?php if($geo_zone['geo_zone_id'] == $pp_adaptive_geo_zone_id) {  ?>
                    <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="pp_adaptive_status" id="input-status" class="form-control">
                    <?php if($pp_adaptive_status == 1) {  ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="pp_adaptive_sort_order" value="<?php echo $pp_adaptive_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control"/>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-status">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-canceled-reversal-status"><?php echo $entry_canceled_reversal_status; ?></label>
                <div class="col-sm-10">
                  <select name="pp_adaptive_canceled_reversal_status_id" id="input-canceled-reversal-status" class="form-control">
                    <?php foreach($order_statuses as $order_status) {  ?>
                    <?php if($order_status['order_status_id'] == $pp_adaptive_canceled_reversal_status_id) {  ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-completed-status"><?php echo $entry_completed_status; ?></label>
                <div class="col-sm-10">
                  <select name="pp_adaptive_completed_status_id" id="input-completed-status" class="form-control">
                    <?php foreach($order_statuses as $order_status) {  ?>
                    <?php if($order_status['order_status_id'] == $pp_adaptive_completed_status_id) {  ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-denied-status"><?php echo $entry_denied_status; ?></label>
                <div class="col-sm-10">
                  <select name="pp_adaptive_denied_status_id" id="input-denied-status" class="form-control">
                    <?php foreach($order_statuses as $order_status) {  ?>
                    <?php if($order_status['order_status_id'] == $pp_adaptive_denied_status_id) {  ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-expired-status"><?php echo $entry_expired_status; ?></label>
                <div class="col-sm-10">
                  <select name="pp_adaptive_expired_status_id" id="input-expired-status" class="form-control">
                    <?php foreach($order_statuses as $order_status) {  ?>
                    <?php if($order_status['order_status_id'] == $pp_adaptive_expired_status_id) {  ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-failed-status"><?php echo $entry_failed_status; ?></label>
                <div class="col-sm-10">
                  <select name="pp_adaptive_failed_status_id" id="input-failed-status" class="form-control">
                     <?php foreach($order_statuses as $order_status) {  ?>
                    <?php if($order_status['order_status_id'] == $pp_adaptive_failed_status_id) {  ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-pending-status"><?php echo $entry_pending_status; ?></label>
                <div class="col-sm-10">
                  <select name="pp_adaptive_pending_status_id" id="input-pending-status" class="form-control">
                     <?php foreach($order_statuses as $order_status) {  ?>
                    <?php if($order_status['order_status_id'] == $pp_adaptive_pending_status_id) {  ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-processed-status"><?php echo $entry_processed_status; ?></label>
                <div class="col-sm-10">
                  <select name="pp_adaptive_processed_status_id" id="input-processed-status" class="form-control">
                     <?php foreach($order_statuses as $order_status) {  ?>
                    <?php if($order_status['order_status_id'] == $pp_adaptive_processed_status_id) {  ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-refunded-status"><?php echo $entry_refunded_status; ?></label>
                <div class="col-sm-10">
                  <select name="pp_adaptive_refunded_status_id" id="input-refunded-status" class="form-control">
                     <?php foreach($order_statuses as $order_status) {  ?>
                    <?php if($order_status['order_status_id'] == $pp_adaptive_refunded_status_id) {  ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-reversed-status"><?php echo $entry_reversed_status; ?></label>
                <div class="col-sm-10">
                  <select name="pp_adaptive_reversed_status_id" id="input-reversed-status" class="form-control">
                     <?php foreach($order_statuses as $order_status) {  ?>
                    <?php if($order_status['order_status_id'] == $pp_adaptive_reversed_status_id) {  ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-void-status"><?php echo $entry_voided_status; ?></label>
                <div class="col-sm-10">
                  <select name="pp_adaptive_voided_status_id" id="input-void-status" class="form-control">
                    <?php foreach($order_statuses as $order_status) {  ?>
                    <?php if ($order_status['order_status_id'] == $pp_adaptive_voided_status_id) {  ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>