<script>

$(document).ready(function(){

	$('a[href*="sale/order/shipping"]').before('<div id="artcmessage-button" style="margin:0 8px 0 0;" class="pull-left"></div>');
	$('.page-header').after('<div id="artcmessage" class="container-fluid"></div>');


	<?php foreach ($art_script as $script) { ?>

		$('#artcmessage-button').append(
			'<a id="artcmessage-button-<?php echo $script['messenger']; ?>" style="margin-right:2px;" target="_blank" class="btn btn-info art_button" data-toggle="tooltip" title="<?php echo $script['title'].$script['messenger']; ?>" ><i class="fa fa-<?php echo $script['icon']; ?>"><?php echo $script['icon_text']; ?></i></a>'
		);

		$('#artcmessage-button-<?php echo $script['messenger']; ?>').on('click', function() {
			if($("#<?php echo $script['messenger']; ?>").length) {
				$('#artcmessage').hide('fast');
				$('#artcmessage').html('');
			}
			else {
				<?php echo $script['messenger']; ?>Form();
			}
		});

	<?php } ?>
});

function hideForm () {
	setTimeout(function(){
	  $('#artcmessage').hide('fast');
		$('#artcmessage').html('');
	}, 1000);
}
</script>

<?php foreach ($art_script as $script) { ?>
<?php if ($script['messenger'] == 'whatsapp') { ?>
<template id="html-whatsapp">
    <div id="whatsapp">

<!-- Whatsapp Template -->
    	<div class="panel panel-default">
	     	<div class="panel-heading">
	    		<h3 class="panel-title"><i class="fa fa-<?php echo $script['icon']; ?>"></i> <?php echo $script['title'].$script['messenger']; ?></h3>
	     	</div>
	     	<div class="panel-body">
	     		<form action="<?php echo $getRedir; ?>" name="artcmessage-form-<?php echo $script['messenger']; ?>" class="form-horizontal" target="_blank" method="POST">
	     			<div class="form-group">
	     				<label class="col-sm-2 control-label" for="input-artcmessage-phone-<?php echo $script['messenger']; ?>"><?php echo $entry_phone; ?></label>
		                <div class="col-sm-10">
		                    <input type="text" name="artcmessage_phone-<?php echo $script['messenger']; ?>" id="input-artcmessage-phone-<?php echo $script['messenger']; ?>" class="form-control" value="<?php echo $phone; ?>" />
		                </div>
	     			</div>
	     			<div class="form-group">
	                	<label class="col-sm-2 control-label" for="input-artcmessage-field-<?php echo $script['messenger']; ?>"><?php echo $entry_field; ?></label>
		                <div class="col-sm-10">
		                    <select name="artcmessage-field-<?php echo $script['messenger']; ?>" autocomplete="off" id="artcmessage-field-<?php echo $script['messenger']; ?>" class="form-control">
		                    	<option id="artcmessage-clear-<?php echo $script['messenger']; ?>" value="clear" selected="selected" ><?php echo $text_field_empty; ?></option>
								<?php foreach ($fields as $field) { ?>
									<option class="artcmessage-field-id" value="<?php echo $field['field_id']; ?>"><?php echo $field['name']; ?></option>
								<?php } ?>
		                    </select>
		                </div>
	                </div>
	     			<div class="form-group">
	                	<label class="col-sm-2 control-label" for="input-artcmessage-message-<?php echo $script['messenger']; ?>"><?php echo $entry_message; ?></label>
	                	<div class="col-sm-10">
	                    	<textarea name="artcmessage_message-<?php echo $script['messenger']; ?>" rows="8" id="input-artcmessage-message-<?php echo $script['messenger']; ?>" class="form-control"></textarea>
	                  	</div>
	                </div>
	                <div class="text-center">
	                	<?php /* <a id="artcmessage-submitApp-<?php echo $script['messenger']; ?>" class="btn btn-primary" style="margin-right: 20px;" onclick="whatsAppSendForm();"><?php echo $button_msendApp; ?></a> */ ?>
	                	<input type="submit" id="artcmessage-submitWeb-<?php echo $script['messenger']; ?>" value="<?php echo $button_msend; ?>" class="btn btn-primary" onclick="hideForm();"/>
            		</div>
            		<input type="hidden" name="artcmessage-messenger" value="whatsapp" />
	     		</form>
	     	</div>
	    </div>
<!-- Whatsapp Template End -->

    </div>
</template>
<script>

	function whatsappForm () {
		$('#artcmessage').html($('#html-whatsapp').html());
		$('#artcmessage').show('fast');
	}

	$(document.body).delegate('#artcmessage-field-<?php echo $script['messenger']; ?>', 'change', function() {
		var artmessege_item = $(this).val();
	    if (artmessege_item === 'clear') { 
	    	$('#input-artcmessage-message-<?php echo $script['messenger']; ?>').val("");
	    } else {
	    	$.ajax({
			    url: '<?php echo $getField; ?>&field_id=' + artmessege_item + '&order_id=<?php echo $order_id; ?>',
			    dataType: 'json',
			    beforeSend: function() {
			    },
			    complete: function() { 
			    },
			    success: function(json) {
			      if (json) {
			        $('#input-artcmessage-message-<?php echo $script['messenger']; ?>').val(json);
			      }
			    },
			    error: function(xhr, ajaxOptions, thrownError) {
			      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			    }
			  });
	    }
	});

	function whatsAppSendForm () {
	    var text = document.getElementById ('input-artcmessage-message-<?php echo $script['messenger']; ?>').value;
	    var phone = document.getElementById ('input-artcmessage-phone-<?php echo $script['messenger']; ?>').value;
	    window.open ('whatsapp://send?phone=' + phone + '?text=' + encodeURIComponent(text), '_self')
	    hideForm();
	}

</script>
<?php } else if ($script['messenger'] == 'viber') { ?>
<template id="html-viber">
    <div id="viber">

<!-- Viber Template -->
    	<div class="panel panel-default">
	     	<div class="panel-heading">
	    		<h3 class="panel-title"><i class="fa fa-<?php echo $script['icon']; ?>"><?php echo $script['icon_text']; ?></i> <?php echo $script['title'].$script['messenger']; ?></h3>
	     	</div>
	     	<div class="panel-body">
	     		<form action="<?php echo $getRedir; ?>" name="artcmessage-form-<?php echo $script['messenger']; ?>" class="form-horizontal" target="_blank" method="POST">
	     			<div class="form-group">
	     				<label class="col-sm-2 control-label" for="input-artcmessage-phone-<?php echo $script['messenger']; ?>"><?php echo $entry_phone; ?></label>
		                <div class="col-sm-10">
		                    <input type="text" name="artcmessage_phone-<?php echo $script['messenger']; ?>" id="input-artcmessage-phone-<?php echo $script['messenger']; ?>" class="form-control" value="<?php echo $phone; ?>" />
		                </div>
	     			</div>
	     			<div class="form-group">
	                	<label class="col-sm-2 control-label" for="input-artcmessage-field-<?php echo $script['messenger']; ?>"><?php echo $entry_field; ?></label>
		                <div class="col-sm-10">
		                    <select name="artcmessage-field-<?php echo $script['messenger']; ?>" autocomplete="off" id="artcmessage-field-<?php echo $script['messenger']; ?>" class="form-control">
		                    	<option id="artcmessage-clear-<?php echo $script['messenger']; ?>" value="clear" selected="selected" ><?php echo $text_field_empty; ?></option>
								<?php foreach ($fields as $field) { ?>
									<option class="artcmessage-field-id" value="<?php echo $field['field_id']; ?>"><?php echo $field['name']; ?></option>
								<?php } ?>
		                    </select>
		                </div>
	                </div>
	     			<div class="form-group">
	                	<label class="col-sm-2 control-label" for="input-artcmessage-message-<?php echo $script['messenger']; ?>"><?php echo $entry_message; ?></label>
	                	<div class="col-sm-10">
	                    	<textarea name="artcmessage_message-<?php echo $script['messenger']; ?>" rows="8" id="input-artcmessage-message-<?php echo $script['messenger']; ?>" class="form-control"></textarea>
	                  	</div>
	                </div>
	                <div class="text-center">
	                	<a class="btn btn-default" style="margin-right: 20px;" onclick="window.open ('viber://chat?number=%2B' + document.getElementById ('input-artcmessage-phone-<?php echo $script['messenger']; ?>').value, '_self')"><?php echo $button_newchat; ?></a>
	                	<?php /* <input type="submit" id="artcmessage-submit-<?php echo $script['messenger']; ?>" value="<?php echo $button_msend; ?>" class="btn btn-primary" onclick="hideForm();"/> */ ?>
	                	<a id="artcmessage-submit-<?php echo $script['messenger']; ?>" class="btn btn-primary" style="margin-right: 20px;" onclick="viberSendForm();"><?php echo $button_msend; ?></a>
            		</div>
            		<input type="hidden" name="artcmessage-messenger" value="viber" />
	     		</form>
	     	</div>
	    </div>
<!-- Viber Template End -->

    </div>
</template>
<script>
	function viberForm () {
		$('#artcmessage').html($('#html-viber').html());
		$('#artcmessage').show('fast');
	}

	$(document.body).delegate('#artcmessage-field-<?php echo $script['messenger']; ?>', 'change', function() {
		var artmessege_item = $(this).val();
	    if (artmessege_item === 'clear') { 
	    	$('#input-artcmessage-message-<?php echo $script['messenger']; ?>').val("");
	    } else {
	    	$.ajax({
			    url: '<?php echo $getField; ?>&field_id=' + artmessege_item + '&order_id=<?php echo $order_id; ?>',
			    dataType: 'json',
			    beforeSend: function() {
			    },
			    complete: function() { 
			    },
			    success: function(json) {
			      if (json) {
			        $('#input-artcmessage-message-<?php echo $script['messenger']; ?>').val(json);
			      }
			    },
			    error: function(xhr, ajaxOptions, thrownError) {
			      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			    }
			  });
	    }
	});

	function viberSendForm () {
	    var text = document.getElementById ('input-artcmessage-message-<?php echo $script['messenger']; ?>').value;
	    window.open ('viber://forward?text=' + encodeURIComponent(text), '_self');
	    hideForm();
	}

</script>
<?php } else if ($script['messenger'] == 'telegram') { ?>
<template id="html-telegram">
    <div id="telegram">

<!-- Telegram Template -->
    	<div class="panel panel-default">
	     	<div class="panel-heading">
	    		<h3 class="panel-title"><i class="fa fa-<?php echo $script['icon']; ?>"><?php echo $script['icon_text']; ?></i> <?php echo $script['title'].$script['messenger']; ?></h3>
	     	</div>
	     	<div class="panel-body">
	     		<form action="<?php echo $getRedir; ?>" name="artcmessage-form-<?php echo $script['messenger']; ?>" class="form-horizontal" target="_blank" method="POST">
	     			<div class="form-group">
	     				<label class="col-sm-2 control-label" for="input-artcmessage-user-<?php echo $script['messenger']; ?>"><?php echo $entry_user; ?></label>
		                <div class="col-sm-10">
		                    <input type="text" name="artcmessage_user-<?php echo $script['messenger']; ?>" id="input-artcmessage-user-<?php echo $script['messenger']; ?>" class="form-control" value="" />
		                </div>
	     			</div>
	     			<div class="form-group">
	                	<label class="col-sm-2 control-label" for="input-artcmessage-field-<?php echo $script['messenger']; ?>"><?php echo $entry_field; ?></label>
		                <div class="col-sm-10">
		                    <select name="artcmessage-field-<?php echo $script['messenger']; ?>" autocomplete="off" id="artcmessage-field-<?php echo $script['messenger']; ?>" class="form-control">
		                    	<option id="artcmessage-clear-<?php echo $script['messenger']; ?>" value="clear" selected="selected" ><?php echo $text_field_empty; ?></option>
								<?php foreach ($fields as $field) { ?>
									<option class="artcmessage-field-id" value="<?php echo $field['field_id']; ?>"><?php echo $field['name']; ?></option>
								<?php } ?>
		                    </select>
		                </div>
	                </div>
	     			<div class="form-group">
	                	<label class="col-sm-2 control-label" for="input-artcmessage-message-<?php echo $script['messenger']; ?>"><?php echo $entry_message; ?></label>
	                	<div class="col-sm-10">
	                    	<textarea name="artcmessage_message-<?php echo $script['messenger']; ?>" rows="8" id="input-artcmessage-message-<?php echo $script['messenger']; ?>" class="form-control"></textarea>
	                  	</div>
	                </div>
	                <div class="text-center">
	                	<a class="btn btn-default" style="margin-right: 20px;" onclick="window.open ('tg://resolve?domain=' + document.getElementById ('input-artcmessage-user-<?php echo $script['messenger']; ?>').value, '_self')"><?php echo $button_newchat; ?></a>
	                	<a id="artcmessage-submit-<?php echo $script['messenger']; ?>" class="btn btn-primary" style="margin-right: 20px;" onclick="telegramSendForm();"><?php echo $button_msend; ?></a>
            		</div>
            		<input type="hidden" name="artcmessage-messenger" value="telegram" />
	     		</form>
	     	</div>
	    </div>
<!-- Telegram Template End -->

    </div>
</template>
<script>
	function telegramForm () {
		$('#artcmessage').html($('#html-telegram').html());
		$('#artcmessage').show('fast');
	}

	$(document.body).delegate('#artcmessage-field-<?php echo $script['messenger']; ?>', 'change', function() {
		var artmessege_item = $(this).val();
	    if (artmessege_item === 'clear') { 
	    	$('#input-artcmessage-message-<?php echo $script['messenger']; ?>').val("");
	    } else {
	    	$.ajax({
			    url: '<?php echo $getField; ?>&field_id=' + artmessege_item + '&order_id=<?php echo $order_id; ?>',
			    dataType: 'json',
			    beforeSend: function() {
			    },
			    complete: function() { 
			    },
			    success: function(json) {
			      if (json) {
			        $('#input-artcmessage-message-<?php echo $script['messenger']; ?>').val(json);
			      }
			    },
			    error: function(xhr, ajaxOptions, thrownError) {
			      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			    }
			  });
	    }
	});

	function telegramSendForm () {
	    var text = document.getElementById ('input-artcmessage-message-<?php echo $script['messenger']; ?>').value;
	    var user = '<?php echo $store_url; ?>';
	    window.open ('tg://msg_url?url=' + user + '&text=' + encodeURIComponent(text), '_self')
	    hideForm();
	}
	
</script>
<?php } else if ($script['messenger'] == 'skype') { ?>
<template id="html-skype">
    <div id="skype">

<!-- Skype Template -->
    	<div class="panel panel-default">
	     	<div class="panel-heading">
	    		<h3 class="panel-title"><i class="fa fa-<?php echo $script['icon']; ?>"><?php echo $script['icon_text']; ?></i> <?php echo $script['title'].$script['messenger']; ?></h3>
	     	</div>
	     	<div class="panel-body">
	     		<form action="<?php echo $getRedir; ?>" name="artcmessage-form-<?php echo $script['messenger']; ?>" class="form-horizontal" target="_blank" method="POST">
	     			<div class="form-group">
	     				<label class="col-sm-2 control-label" for="input-artcmessage-user-<?php echo $script['messenger']; ?>"><?php echo $entry_user; ?></label>
		                <div class="col-sm-10">
		                    <input type="text" name="artcmessage_user-<?php echo $script['messenger']; ?>" id="input-artcmessage-user-<?php echo $script['messenger']; ?>" class="form-control" value="" />
		                </div>
	     			</div>
	     			<div class="form-group">
	                	<label class="col-sm-2 control-label" for="input-artcmessage-field-<?php echo $script['messenger']; ?>"><?php echo $entry_field; ?></label>
		                <div class="col-sm-10">
		                    <select name="artcmessage-field-<?php echo $script['messenger']; ?>" autocomplete="off" id="artcmessage-field-<?php echo $script['messenger']; ?>" class="form-control">
		                    	<option id="artcmessage-clear-<?php echo $script['messenger']; ?>" value="clear" selected="selected" ><?php echo $text_field_empty; ?></option>
								<?php foreach ($fields as $field) { ?>
									<option class="artcmessage-field-id" value="<?php echo $field['field_id']; ?>"><?php echo $field['name']; ?></option>
								<?php } ?>
		                    </select>
		                </div>
	                </div>
	     			<div class="form-group">
	                	<label class="col-sm-2 control-label" for="input-artcmessage-message-<?php echo $script['messenger']; ?>"><?php echo $entry_message; ?></label>
	                	<div class="col-sm-10">
	                    	<textarea name="artcmessage_message-<?php echo $script['messenger']; ?>" rows="8" id="input-artcmessage-message-<?php echo $script['messenger']; ?>" class="form-control"></textarea>
	                  	</div>
	                </div>
	                <div class="text-center">
	                	<a class="btn btn-default" style="margin-right: 20px;" onclick="skypeChat()"><?php echo $button_newchat; ?></a>
	                	<a id="artcmessage-submit-<?php echo $script['messenger']; ?>" class="btn btn-primary" style="margin-right: 20px;" onclick="skypeSendForm();"><?php echo $button_msend; ?></a>
            		</div>
            		<input type="hidden" name="artcmessage-messenger" value="skype" />
	     		</form>
	     	</div>
	    </div>
<!-- Skype Template End -->

    </div>
</template>
<script>
	function skypeForm () {
		$('#artcmessage').html($('#html-skype').html());
		$('#artcmessage').show('fast');
	}

	$(document.body).delegate('#artcmessage-field-<?php echo $script['messenger']; ?>', 'change', function() {
		var artmessege_item = $(this).val();
	    if (artmessege_item === 'clear') { 
	    	$('#input-artcmessage-message-<?php echo $script['messenger']; ?>').val("");
	    } else {
	    	$.ajax({
			    url: '<?php echo $getField; ?>&field_id=' + artmessege_item + '&order_id=<?php echo $order_id; ?>',
			    dataType: 'json',
			    beforeSend: function() {
			    },
			    complete: function() { 
			    },
			    success: function(json) {
			      if (json) {
			        $('#input-artcmessage-message-<?php echo $script['messenger']; ?>').val(json);
			      }
			    },
			    error: function(xhr, ajaxOptions, thrownError) {
			      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			    }
			  });
	    }
	});

	function skypeChat () {
	    var text = document.getElementById ('input-artcmessage-user-<?php echo $script['messenger']; ?>').value;
	    window.open ('skype:' + encodeURIComponent(text) + '?chat', '_self')
	}

	function skypeSendForm () {
	    var text = document.getElementById ('input-artcmessage-message-<?php echo $script['messenger']; ?>').value;
	    window.open ('https://web.skype.com/share?url=' + encodeURIComponent(text), '_blank')
	    hideForm();
	}
</script>
<?php } ?>
<?php } ?>