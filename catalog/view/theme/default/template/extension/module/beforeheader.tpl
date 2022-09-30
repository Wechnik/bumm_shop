<?php if($hyper_status) { ?>
<?php if(!empty($sellerareas)) { ?>
<div class="text-center pts-hyperlocal-heading"> <?php echo $hp_heading;?> &nbsp <a class="launch-modal"><?php echo $seller_area_namea;?></a></div>
<div id ="overlay"class="wait">
<div id="wait" style="display:none;width:69px;height:89px;position:absolute;top:50%;left:50%;padding:2px; z-index: 99;"><img style="color:white;"src='<?php echo $hyperlocal_loder;?>' alt="&nbsp Loading.." width="64" height="64" /><br></div>
</div>
<style>
	.wait {
	  position: fixed;
	  display: none;
	  width: 100%;
	  height: 100%;
	  top: 0;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  background-color: rgba(0,0,0,0.5);
	  z-index: 80;
	  cursor: pointer;
	}
	.pts-hyperlocal-heading a {
		color:#FFFFFF;
		cursor:pointer;
		text-decoration: underline;
		}
	.pts-hyperlocal-heading {
	  font-size:15px;
	  padding:10px;
	  background-color:#2198C6;
	  color:#FFFFFF;
	  text-align:center;
	} 
</style>
<div id="sellerarea_modal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
<p class="text-primary" style="font-size:15px;"><?php echo $hp_heading;?></p>
				<?php  if ($seller_area != '') { ?>
                <button type="button" class="close pts-hyperlocal-close" data-dismiss="modal" style="margin-top:-40px; margin-right: -4px;">&times;</button>
				<?php } else { ?>
					<?php  if (!isset($area_status_check)){ ?>
					     <button type="button" class="close pts-hyperlocal-close" data-dismiss="modal" style="margin-top:-40px; margin-right: -4px;">&times;</button>
					<?php } ?>
				<?php } ?>
            </div>
            <div class="modal-body"> 
                <form>
                    <div class="pts-form-group">
                      <select style="width:100%;" name="pts_customer_area" class="form-control pts_customer_area <?php echo $check_seller_area;?>" id="select_sellerarea">
					<?php  if ($check_seller_area == '') { ?>					
					  <option value="" class="pts-form-control" selected="selected">
					<span class="location"><?php echo $text_hyper_selects;?> </span>
                       </option>
					<?php } ?>
					   <?php foreach ($sellerareas as $sellerarea) { ?>
					   <?php  if ($sellerarea['area_id'] ==  $check_seller_area) { ?>
					   <?php  if ($check_seller_area != '') { ?>
					   <option value="<?php echo $sellerarea['area_id'];?>" class="pts-form-control" selected="selected">
                           <span class="location"><?php echo $sellerarea['area_name'];?></span>
                       </option>
					   <?php } else { ?>
					   <option value="<?php echo $sellerarea['area_id'];?>" class="pts-form-control">
                           <span class="location"><?php echo $sellerarea['area_name'];?></span>
                       </option>
					  <?php } ?>
					    <?php } else { ?>
                       <option value="<?php echo $sellerarea['area_id'];?>" class="pts-form-control">
                           <span class="location"><?php echo $sellerarea['area_name'];?></span>
                       </option>
					<?php } ?> 
				<?php } ?>  
              </select>     
                    </div>    
                </form>
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function(){
	$('.launch-modal').click(function(){
		$('#sellerarea_modal').modal({
			backdrop: 'static'
		});
	}); 
});
$( ".pts_customer_area" ).change(function() {
     var str = "";
    $( "#select_sellerarea option:selected" ).each(function() {
	  str =  $( this ).val();
    });
	if(str== ''){
	     str = $('#pts_customer_area').val();
		}
	var hyper_type = 1;
	hyperlocalAjax(str,hyper_type);
});
$(window).load(function() {
 var check_seller_area = '<?php echo $check_seller_area;?>';
	if(check_seller_area == ''){
      $('.launch-modal').click();
	}
});
<?php  if ($check_seller_area == '') { ?>
$(document).ready(function(){	 
	$('.pts-hyperlocal-close').click(function(){
	  var hyper_type = 2;	
	  var str = 0;
	  hyperlocalAjax(str,hyper_type);
	});
});
<?php } ?>
function hyperlocalAjax(str,hyper_type){
	$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/sellerregister/sethyperlocalvalue&seller_area=' + str,
				dataType: 'json',				
				beforeSend:function(){
				if( hyper_type == 1){
				    $("#sellerarea_modal").modal('hide');
				    $("#wait").css("display", "block");
				    $("#overlay").css("display", "block");
				   }
					},				
				success: function(json) {				    
					if(json.status == 'success') {
					  if( hyper_type == 1){
						location.reload();
					  }
					}
				},
				error: function(json) {	
					 window.location.replace("<?php echo $base_url;?>");
				}
				/* complete:function(){
					$("#wait").css("display", "none");
					} */
			})
}
</script>
<?php } ?>
<?php } ?>