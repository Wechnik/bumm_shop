<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
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
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?></h3>
            </div>
            <div class="panel-body">
                   <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <tbody>
                   <tr>
                 <td class="text-left"><i><u><b><?php echo $text_car_modifi; ?></b></u></i></td>
                  <td class="text-right"></td>
                </tr>
                <tr>
                 <td class="text-left"><?php echo $text_car_year; ?></td>
                  <td class="text-right"><a href="<?php echo $car_year; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                 <tr>
                 <td class="text-left"><?php echo $text_car_mark; ?></td>
                  <td class="text-right"><a href="<?php echo $car_mark; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <tr>
                 <td class="text-left"><?php echo $text_car_model; ?></td>
                  <td class="text-right"><a href="<?php echo $car_model; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                 <tr>
                 <td class="text-left"><?php echo $text_car_generation; ?></td>
                  <td class="text-right"><a href="<?php echo $car_generation; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <tr>
                 <td class="text-left"><i><u><b><?php echo $text_car_diski; ?></b></u></i></td>
                  <td class="text-right"></td>
                </tr>
                <tr>
                 <td class="text-left"><?php echo $text_diski_otv; ?></td>
                  <td class="text-right"><a href="<?php echo $diski_otv; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <tr>
                 <td class="text-left"><?php echo $text_diski_diametr; ?></td>
                  <td class="text-right"><a href="<?php echo $diski_diametr; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <tr>
                 <td class="text-left"><?php echo $text_diski_width; ?></td>
                  <td class="text-right"><a href="<?php echo $diski_width; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <tr>
                 <td class="text-left"><?php echo $text_diski_vilet; ?></td>
                  <td class="text-right"><a href="<?php echo $diski_vilet; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <tr>
                 <td class="text-left"><?php echo $text_diski_dia; ?></td>
                  <td class="text-right"><a href="<?php echo $diski_dia; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>

                <tr>
                 <td class="text-left"><i><u><b><?php echo $text_car_shina; ?></b></u></i></td>
                  <td class="text-right"></td>
                </tr>
                <tr>
                 <td class="text-left"><?php echo $text_shina_diametr; ?></td>
                  <td class="text-right"><a href="<?php echo $shina_diametr; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
               <tr>
                 <td class="text-left"><?php echo $text_shina_width; ?></td>
                  <td class="text-right"><a href="<?php echo $shina_width; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                 <tr>
                 <td class="text-left"><?php echo $text_shina_profil; ?></td>
                  <td class="text-right"><a href="<?php echo $shina_profil; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
           </tbody>
            </table>
          </div>
         </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
