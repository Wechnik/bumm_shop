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
    <?php if($error_warning) { ?>
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
			 <div class="form-group">
                <label class="col-sm-2 control-label" for="input-payment-method-status"><?php echo $text_payment_status; ?></label>
                <div class="col-sm-10">
                  <select name="pts_stripe_status" id="input-payment-method-status" class="form-control">
                    <?php if($pts_stripe_status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                     <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                     <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="entry-payment-method-title"><?php echo $text_payment_title; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="pts_stripe_title" value="<?php echo $pts_stripe_title; ?>" placeholder="<?php echo $text_payment_title; ?>" id="entry-payment-method-title" class="form-control"/>
                  <?php if($error_payment_method_title) { ?>
                  <div class="text-danger"><?php echo $error_payment_method_title; ?></div>
                   <?php } ?>
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-payment-mode"><?php echo $text_payment_payment_mode; ?></label>
                <div class="col-sm-10">
                  <select name="pts_stripe_payment_mode" id="input-payment-mode" class="form-control">
                    <?php if($pts_stripe_payment_mode) { ?>
                    <option value="1" selected="selected"><?php echo $text_payment_mode_live; ?></option>
                    <option value="0"><?php echo $text_payment_mode_test; ?></option>
                     <?php } else { ?>
                    <option value="1"><?php echo $text_payment_mode_live; ?></option>
                    <option value="0" selected="selected"><?php echo $text_payment_mode_test; ?></option>
                     <?php } ?>
                  </select>
                </div>
              </div>
			<div class="form-group required entry_secret_key_test" <?php if($pts_stripe_payment_mode) { ?> style="display:none"  <?php } ?>>
				<label class="col-sm-2 control-label" for="entry_secret_key_test"><?php echo $text_payment_secret_key_test; ?></label>
				<div class="col-sm-10">
					<input type="text" name="pts_stripe_secret_key_test" value="<?php echo $pts_stripe_secret_key_test; ?>" placeholder="<?php echo $text_payment_secret_key_test; ?>" id="entry_secret_key_test" class="form-control"/>
					<?php if($error_payment_secret_key_test) { ?>
					<div class="text-danger"><?php echo $error_payment_secret_key_test; ?></div>
					 <?php } ?>
				</div>
			</div>
			<div class="form-group required entry_payment_publish_key_test" <?php if($pts_stripe_payment_mode) { ?> style="display:none"  <?php } ?>>
				<label class="col-sm-2 control-label" for="entry_payment_publish_key_test"><?php echo $text_payment_publish_key_test; ?></label>
				<div class="col-sm-10">
					<input type="text" name="pts_stripe_publish_key_test" value="<?php echo $pts_stripe_publish_key_test; ?>" placeholder="<?php echo $text_payment_publish_key_test; ?>" id="entry_payment_publish_key_test" class="form-control"/>
					<?php if($error_payment_publish_key_test) { ?>
					<div class="text-danger"><?php echo $error_payment_publish_key_test; ?></div>
					 <?php } ?>
				</div>
			</div>	
			<div class="form-group required entry_secret_key_live" <?php if($pts_stripe_payment_mode) { ?> <?php } else { ?> style="display:none"  <?php } ?>>
				<label class="col-sm-2 control-label" for="entry_secret_key_live"><?php echo $text_payment_secret_key_live; ?></label>
				<div class="col-sm-10">
					<input type="text" name="pts_stripe_secret_key_live" value="<?php echo $pts_stripe_secret_key_live; ?>" placeholder="<?php echo $text_payment_secret_key_live; ?>" id="entry_secret_key_live" class="form-control"/>
					<?php  if($error_payment_secret_key_live) { ?>
					<div class="text-danger"><?php echo $error_payment_secret_key_live; ?></div>
					 <?php } ?>
				</div>
			</div>

			<div class="form-group required entry_payment_publish_key_live"  <?php if($pts_stripe_payment_mode) { ?> <?php } else { ?> style="display:none"  <?php } ?>>
				<label class="col-sm-2 control-label" for="entry_payment_publish_key_live"><?php echo $text_payment_publish_key_live; ?></label>
				<div class="col-sm-10">
					<input type="text" name="pts_stripe_publish_key_live" value="<?php echo $pts_stripe_publish_key_live; ?>" placeholder="<?php echo $text_payment_publish_key_live; ?>" id="entry_payment_publish_key_live" class="form-control"/>
					<?php  if ($error_payment_publish_key_live) { ?>
					<div class="text-danger"><?php echo $error_payment_publish_key_live; ?></div>
					 <?php } ?>
				</div>
			</div>	
			<div class="form-group required entry_payment_client_id_test" <?php if($pts_stripe_payment_mode) { ?> style="display:none"   <?php } ?>>
				<label class="col-sm-2 control-label" for="entry_payment_client_id_test"><?php echo $text_payment_client_id_test; ?></label>
				<div class="col-sm-10">
					<input type="text" name="pts_stripe_client_id_test" value="<?php echo $pts_stripe_client_id_test; ?>" placeholder="<?php echo $text_payment_client_id_test; ?>" id="entry_payment_client_id_test" class="form-control"/>
					<?php if ($error_payment_client_id_test) { ?>
					<div class="text-danger"><?php echo $error_payment_client_id_test; ?></div>
					 <?php } ?>
				</div>
			</div>	
			<div class="form-group required entry_payment_client_id_live" <?php if ($pts_stripe_payment_mode) { ?> <?php } else { ?> style="display:none"  <?php } ?>>
				<label class="col-sm-2 control-label" for="entry_payment_client_id_live"><?php echo $text_payment_client_id_live; ?></label>
				<div class="col-sm-10">
					<input type="text" name="pts_stripe_client_id_live" value="<?php echo $pts_stripe_client_id_live; ?>" placeholder="<?php echo $text_payment_client_id_live; ?>" id="entry_payment_client_id_live" class="form-control"/>
					 <?php if ($error_payment_client_id_live) { ?>
					<div class="text-danger"><?php echo $error_payment_client_id_live; ?></div>
					 <?php } ?>
				</div>
			</div>	
			 <div class="form-group">
                <label class="col-sm-2 control-label" for="input-total-min"><span data-toggle="tooltip" title="<?php echo $help_total_min; ?>"><?php echo $entry_total_min; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="pts_stripe_total_min" value="<?php echo $pts_stripe_total_min; ?>" placeholder="<?php echo $entry_total_min; ?>" id="input-total-min" class="form-control"/>
				   <?php if($error_payment_total_min) { ?>
					<div class="text-danger"><?php echo $error_payment_total_min; ?></div>
				 <?php } ?>
                </div>
              </div>
			   <div class="form-group">
                <label class="col-sm-2 control-label" for="input-total-max"><span data-toggle="tooltip" title="<?php echo $help_total_max; ?>"><?php echo $entry_total_max; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="pts_stripe_total_max" value="<?php echo $pts_stripe_total_max; ?>" placeholder="<?php echo $entry_total_max; ?>" id="input-total-max" class="form-control"/>
				   <?php  if ($error_payment_total_max) { ?>
					<div class="text-danger"><?php echo $error_payment_total_max; ?></div>
					 <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-debug"><span data-toggle="tooltip" title="<?php echo $help_debug; ?>"><?php echo $entry_debug; ?></span></label>
                <div class="col-sm-10">
                  <select name="pts_stripe_debug" id="input-debug" class="form-control">
                     <?php if ($pts_stripe_debug) { ?>
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
                <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
                <div class="col-sm-10">
                  <select name="pts_stripe_geo_zone_id" id="input-geo-zone" class="form-control">
                    <option value="0"><?php echo $text_all_zones; ?></option>
                     <?php foreach($geo_zones as $geo_zone) { ?>
                     <?php if ($geo_zone['geo_zone_id'] == $pts_stripe_geo_zone_id) { ?>
                    <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                     <?php } else { ?>
                    <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                        <?php } } ?>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="pts_stripe_sort_order" value="<?php echo $pts_stripe_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control"/>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-status">
			   <div class="form-group">
                <label class="col-sm-2 control-label" for="input-completed-status"><?php echo $entry_completed_status; ?></label>
                <div class="col-sm-10">
                  <select name="pts_stripe_completed_status_id" id="input-completed-status" class="form-control">
                    <?php foreach($order_statuses as $order_status) { ?>
                    <?php  if ($order_status['order_status_id'] == $pts_stripe_completed_status_id) { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php }  else {?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                   <?php } } ?>
                  </select>
                </div>
              </div>
              <!--div class="form-group">
                <label class="col-sm-2 control-label" for="input-canceled-reversal-status"><?php //echo $entry_canceled_reversal_status; ?></label>
                <div class="col-sm-10">
                  <select name="pts_stripe_canceled_reversal_status_id" id="input-canceled-reversal-status" class="form-control">
                    {% for order_status in order_statuses %}
                    {% if order_status.order_status_id == pts_stripe_canceled_reversal_status_id %}
                    <option value="<?php //echo $order_status.order_status_id; ?>" selected="selected"><?php //echo $order_status.name; ?></option>
                    {% else %}
                    <option value="<?php //echo $order_status.order_status_id; ?>"><?php echo $order_status.name; ?></option>
                    {% endif %}
                    {% endfor %}
                  </select>
                </div>
              </div-->
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script>
$(document).ready(function() {
 $("#input-payment-mode").change(function () {
        var mode = this.value;
		if(mode == 1) {
			$('.entry_secret_key_test').hide();
			$('.entry_payment_publish_key_test').hide();
			$('.entry_secret_key_live').show();
			$('.entry_payment_publish_key_live').show();
			$('.entry_payment_client_id_test').hide();
			$('.entry_payment_client_id_live').show();
		} else {
			$('.entry_secret_key_test').show();
			$('.entry_payment_publish_key_test').show();
			$('.entry_secret_key_live').hide();
			$('.entry_payment_publish_key_live').hide();
			$('.entry_payment_client_id_test').show();
			$('.entry_payment_client_id_live').hide();
		}
  });
});
</script>
<?php echo $footer; ?>