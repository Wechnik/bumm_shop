<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
        <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
  <?php if (isset($success)) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body"><!-- начало -->	  
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-product" data-toggle="tab"><?php echo $tab_product; ?></a></li>
            <li><a href="#tab-category" data-toggle="tab"><?php echo $tab_category; ?></a></li>
            <li><a href="#tab-info" data-toggle="tab"><?php echo $tab_information; ?></a></li>
            <li><a href="#tab-home" data-toggle="tab"><?php echo $tab_home; ?></a></li>
        </ul>
<!--p><?php echo $text_category ?></p-->    
<div class="tab-content">
	<div class="tab-pane active" id="tab-product">	<!--  продукты -->
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="formproduct">
        <table>
			<tr><td>
			<div class="form-group">
				<label class="control-label"><?php echo $entry_date_start; ?></label>
				<div class="input-group date">
				  <input type="text" name="datemod" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
				  <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button></span></div>				
			</div>			
			<div class="form-group">
				<label class="control-label"><?php echo $entry_time_start; ?></label>						  
				<input name="timemin" placeholder="<?php echo $entry_time_start; ?>" type="text" class="form-control" value="" />
			</div>		
			<div class="form-group">
				<label class="control-label"><?php echo $entry_time_finish; ?></label>						  
				<input name="timemax" placeholder="<?php echo $entry_time_finish; ?>" type="text" class="form-control" value="" />				
			</div>		
    			</td>
					<td class="col-sm-10">
					<div class="well well-sm" style="height: 250px; overflow: auto;" >
						<?php foreach ($categories as $category) { ?>
						<div class="checkbox">
							<label><input type="checkbox" name="product_category[]" value="<?php echo $category['category_id']; ?>" />
							<?php echo $category['name']; ?></label>               
						</div>
						<?php } ?>
					</div>
						<a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / 
						<a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
					</td>                            
            </tr>       
        </table>
            <button class="btn btn-primary" id="button-continue" type="submit" name="formproduct" value="formproduct"><?php echo $text_save; ?></button>
		</form>
    </div>
	<div class="tab-pane" id="tab-category">		<!-- категории  -->
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"  id="formcategory">
        <table id="module" class="list">
			<tr><td>
			<div class="form-group">
				<label class="control-label"><?php echo $entry_date_start; ?></label>
				<div class="input-group date">
				  <input type="text" name="datemodcategory" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
				  <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button></span></div>				
			</div>			
			<div class="form-group">
				<label class="control-label"><?php echo $entry_time_start; ?></label>						  
				<input name="timemincategory" placeholder="<?php echo $entry_time_start; ?>" type="text" class="form-control" value="" />
			</div>		
			<div class="form-group">
				<label class="control-label"><?php echo $entry_time_finish; ?></label>						  
				<input name="timemaxcategory" placeholder="<?php echo $entry_time_finish; ?>" type="text" class="form-control" value="" />				
			</div>
			
    			</td>
					<td class="col-sm-10">
					<div class="well well-sm" style="height: 250px; overflow: auto;" >
						<?php foreach ($categories as $category) { ?>
						<div class="checkbox">
							<label><input type="checkbox" name="category[]" value="<?php echo $category['category_id']; ?>" />
							<?php echo $category['name']; ?>  </label>               
						</div>
						<?php } ?>
					</div>
						<a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / 
						<a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
    			</td>                            
            </tr> 
        </table>
			<button class="btn btn-primary" id="button-continue" type="submit" name="formcategory" value="formcategory"><?php echo $text_save; ?></button>
        </form>	
	</div>		
    <div class="tab-pane" id="tab-info">			<!-- статьи -->
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="forminfo">
        <table>
            <tr><td>
					<div class="form-group">
						<label class="control-label"><?php echo $entry_date_start; ?></label>
						<div class="input-group date">
						  <input type="text" name="datemodinfo" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
						  <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button></span></div>				
					</div>			
					<div class="form-group">
						<label class="control-label"><?php echo $entry_time_start; ?></label>						  
						<input name="timemininfo" placeholder="<?php echo $entry_time_start; ?>" type="text" class="form-control" value="" />
					</div>		
					<div class="form-group">
						<label class="control-label"><?php echo $entry_time_finish; ?></label>						  
						<input name="timemaxinfo" placeholder="<?php echo $entry_time_finish; ?>" type="text" class="form-control" value="" />				
					</div>						
			    </td>
				<td class="col-sm-10">
					<div class="well well-sm" style="height: 250px; overflow: auto;" >
                        <?php foreach ($informations as $information) { ?>
                            <div class="checkbox">                                                        
                                    <label><input type="checkbox" name="information[]" value="<?php echo $information['information_id']; ?>" />
                                    <?php echo $information['title']; ?></label>
                            </div>
                        <?php } ?>
                    </div>
						<a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / 
						<a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                </td>
            </tr>
        </table>
            <button class="btn btn-primary" id="button-continue" type="submit" name="forminfo" value="forminfo"><?php echo $text_save; ?></button>
        </form>
    </div>
	<div class="tab-pane" id="tab-home">			<!-- главная -->
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"  id="formhome">
        <table>
            <tr>
                <td>
					<div class="form-group">
						<label class="control-label"><?php echo $entry_date_start; ?></label>
						<div class="input-group date">
						  <input type="text" name="datemodhome" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
						  <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button></span></div>				
					</div>			
						<div class="form-group">
							<label class="control-label"><?php echo $entry_time_start; ?></label>						  
							<input name="timeminhome" placeholder="<?php echo $entry_time_start; ?>" type="text" class="form-control" value="" />
						</div>		
							<div class="form-group">
								<label class="control-label"><?php echo $entry_time_finish; ?></label>						  
								<input name="timemaxhome" placeholder="<?php echo $entry_time_finish; ?>" type="text" class="form-control" value="" />				
							</div>           
			    </td>
				<td ></td>
            </tr>
        </table>
			<button class="btn btn-primary" id="button-continue" type="submit" name="formhome" value="formhome"><?php echo $text_save; ?></button>
        </form>	
	</div>
</div>
</div>
</div>
</div>
</div>
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
//--></script> 
<?php echo $footer; ?>