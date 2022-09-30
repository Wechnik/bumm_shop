<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
<link href="view/stylesheet/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<script src="view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="view/javascript/jquery/datetimepicker/locale/<?php echo $code; ?>.js" type="text/javascript"></script>
<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="screen" />
<?php foreach ($styles as $style) { ?>
<link type="text/css" href="<?php echo $style['href']; ?>" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="view/javascript/common.js" type="text/javascript"></script>
    <?php global $config; $this->config = $config; ?>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
</head>
<body>
<div id="container">
    <?php if(isset($content_watch_permission) AND $content_watch_permission){ ?>
        <style>
            #content_watch_text_result>b{
                background: #fde2b8;
            }
            #content_watch_text_result>span{
                background: #fde2b8;
            }
            #content_watch_words_box>p{
                margin-right: 5px;
            }
        </style>
        <div id="check_content" class="modal fade">
            <div class="modal-dialog" style="margin-left: 5%; margin-right: 5%; width: auto;">
                <div class="modal-content" >
                    <div class="modal-header">
                        <button class="close" type="button" data-dismiss="modal">×</button>
                        <div style="display: inline-flex;">
                            <p><?php echo $text_account; ?><b>
                                    <span id="content_watch_user"><img src="view/image/preloader.gif" alt=""></span></b>
                            </p>
                            <p>&nbsp;<?php echo $text_balance; ?><b>
                                    <span id="content_watch_balance"><img src="view/image/preloader.gif" alt=""></span></b>
                            </p>
                            <p>&nbsp;<?php echo $text_tariff; ?><b>
                                    <span id="content_watch_tariff"><img src="view/image/preloader.gif" alt=""></span></b>
                            </p>
                            <p>&nbsp;<?php echo $text_checks_left; ?><b>
                                    <span id="content_watch_total"><img src="view/image/preloader.gif" alt=""></span></b>
                            </p>
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="text-danger" id="content-watch-error">
                            <p></p>
                        </div>
                        <div class="hide" id="content-watch-body">
                            <div class="text-center">
                                <label for=""><?php echo $text_uniq_text; ?> <span id="content_watch_uniq" style="font-size: 18px;"></span></label>
                            </div>
                            <div id="content-watch-all-words"></div>
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <td><?php echo $text_url; ?></td>
                                    <td><?php echo $text_uniq; ?></td>
                                    <td></td>
                                </tr>
                                </thead>
                                <tbody id="content_watch_matches">
                                <tr>
                                    <td><img src="view/image/preloader.gif" alt=""></td>
                                    <td><img src="view/image/preloader.gif" alt=""></td>
                                    <td><img src="view/image/preloader.gif" alt=""></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="content_watch_text_result" class="well hide"></div>

                        <textarea name="" id="content_watch_text" cols="30" rows="10" style="margin-bottom: 5px;" class="form-control"></textarea>

                        <button type="button"  data-next="show" id="content_watch_button_double_space" class="btn btn-primary" style="margin-bottom: 5px;"><?php echo $text_double_space; ?></button>
                        <button type="button" class="btn btn-default" id="content_watch_put_text" style="margin-bottom: 5px;"><i class="fa fa-save"></i></button>
                        <input  type="text" class="form-control"  placeholder="<?php echo $text_ignore_url; ?>" style="display: inline-block; max-width:250px; padding-top: 10px; margin-right: 15px;
    margin-bottom: 5px;" id="content_watch_ignore_url">
                        <button type="button" id="check_text_content_watch" class="btn btn-primary pull-right"><?php echo $text_check_text; ?></button>
                        <div id="content_watch_words_box">
                            <p style="display: inline-block;"><?php echo $text_text_length; ?><b><span style="margin-left: 3px;" id="content_watch_words_length"></span></b></p>
                            <p style="display: inline-block;"><?php echo $text_char_length; ?><b><span style="margin-left: 3px;" id="content_watch_char_length"></span></b></p>
                            <p style="display: inline-block;"><?php echo $text_words_length; ?><b><span style="margin-left: 3px;" id="content_watch_words_count"></span></b></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <?php } ?>
<header id="header" class="navbar navbar-static-top">
  <div class="navbar-header">
    <?php if ($logged) { ?>
        <?php if(isset($content_watch_permission) AND $content_watch_permission AND isset($content_watch_show_button) AND $content_watch_show_button){ ?>
            <button class="btn btn-primary" type="button" id="show-content-watch" style="margin-top: 5px;"><?php echo $button_show_modal; ?></button>
        <?php } ?>
    <a type="button" id="button-menu" class="pull-left"><i class="fa fa-indent fa-lg"></i></a>
    <?php } ?>
    <a href="<?php echo $home; ?>" class="navbar-brand"><img src="view/image/logo.png" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" /></a></div>
  <?php if ($logged) { ?>
  <ul class="nav pull-right">
    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"><?php if($alerts > 0) { ?><span class="label label-danger pull-left"><?php echo $alerts; ?></span><?php } ?> <i class="fa fa-bell fa-lg"></i></a>
      <ul class="dropdown-menu dropdown-menu-right alerts-dropdown">
        <li class="dropdown-header"><?php echo $text_order; ?></li>
        <li><a href="<?php echo $processing_status; ?>" style="display: block; overflow: auto;"><span class="label label-warning pull-right"><?php echo $processing_status_total; ?></span><?php echo $text_processing_status; ?></a></li>
        <li><a href="<?php echo $complete_status; ?>"><span class="label label-success pull-right"><?php echo $complete_status_total; ?></span><?php echo $text_complete_status; ?></a></li>
        <li><a href="<?php echo $return; ?>"><span class="label label-danger pull-right"><?php echo $return_total; ?></span><?php echo $text_return; ?></a></li>
        <li class="divider"></li>
        <li class="dropdown-header"><?php echo $text_customer; ?></li>
        <li><a href="<?php echo $online; ?>"><span class="label label-success pull-right"><?php echo $online_total; ?></span><?php echo $text_online; ?></a></li>
        <li><a href="<?php echo $customer_approval; ?>"><span class="label label-danger pull-right"><?php echo $customer_total; ?></span><?php echo $text_approval; ?></a></li>
        <li class="divider"></li>
        <li class="dropdown-header"><?php echo $text_product; ?></li>
        <li><a href="<?php echo $product; ?>"><span class="label label-danger pull-right"><?php echo $product_total; ?></span><?php echo $text_stock; ?></a></li>
        <li><a href="<?php echo $review; ?>"><span class="label label-danger pull-right"><?php echo $review_total; ?></span><?php echo $text_review; ?></a></li>
        <li class="divider"></li>
        <li class="dropdown-header"><?php echo $text_affiliate; ?></li>
        <li><a href="<?php echo $affiliate_approval; ?>"><span class="label label-danger pull-right"><?php echo $affiliate_total; ?></span><?php echo $text_approval; ?></a></li>
      </ul>
    </li>
    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-home fa-lg"></i></a>
      <ul class="dropdown-menu dropdown-menu-right">
        <li class="dropdown-header"><?php echo $text_store; ?></li>
        <?php foreach ($stores as $store) { ?>
        <li><a href="<?php echo $store['href']; ?>" target="_blank"><?php echo $store['name']; ?></a></li>
        <?php } ?>
      </ul>
    </li>
    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-life-ring fa-lg"></i></a>
      <ul class="dropdown-menu dropdown-menu-right">
        <li class="dropdown-header"><?php echo $text_help; ?></li>
        <li><a href="http://myopencart.com" target="_blank"><?php echo $text_homepage; ?></a></li>
        <li><a href="http://docs.myopencart.com" target="_blank"><?php echo $text_documentation; ?></a></li>
        <li><a href="https://opencartforum.com" target="_blank"><?php echo $text_support; ?></a></li>
      </ul>
    </li>
    <li><a href="<?php echo $logout; ?>"><span class="hidden-xs hidden-sm hidden-md"><?php echo $text_logout; ?></span> <i class="fa fa-sign-out fa-lg"></i></a></li>
  </ul>
  <?php } ?>
  <?php if(isset($content_watch_permission) AND $content_watch_permission AND isset($content_watch_show_button) AND $content_watch_show_button ){ ?>
      <script>
      function decodeEntities(encodedString) {
          var textArea = document.createElement('textarea');
          textArea.innerHTML = encodedString;
          return textArea.value;
      }

      var type_put=false;
      $('#show-content-watch').on('click',function(){

          if($('.tab-content>.tab-pane.active').find('div[id^="language"].active').find('textarea[id^="input-description"]').text().length>0){
              text=$('.tab-content>.tab-pane.active').find('div[id^="language"].active').find('textarea[id^="input-description"]').val();
              text=decodeEntities(text).replace(/<.*?>/g, "");
              $('#content_watch_text').val(text.replace(/&nbsp;/g, ' '));
              type_put=1;
          }else if($('textarea[id^="input-description"]:first').text().length>0){
              type_put=2
              text=$('textarea[id^="input-description"]:first').val().replace(/<.*?>/g, "");
              text=decodeEntities(text).replace(/<.*?>/g, "");
              $('#content_watch_text').val(text.replace(/&nbsp;/g, ' '));
          }
          getBalance();
          getWordsInfo();

          $("#check_content").modal({backdrop: 'static'});
      });
      $('#content_watch_put_text').on('click',function(){
          if(type_put){
              if(type_put==1){
                  $('.tab-content>.tab-pane.active').find('div[id^="language"].active').find('textarea[id^="input-description"]').parent().find('.note-editable').text($('#content_watch_text').val());
                  $('.tab-content>.tab-pane.active').find('div[id^="language"].active').find('textarea[id^="input-description"]').val($('#content_watch_text').val());
              }else if(type_put==2){
                  text=$('.tab-content>.tab-pane.active').find('div[id^="language"].active').find('textarea[id^="input-description"]').val().replace(/<.*?>/g, "");
                  $('#content_watch_text').val(text.replace(/&nbsp;/g, ' '));
              }
          }
      });


      $('#check_text_content_watch').on('click',function(){
          var range0=<?php echo $content_watch_range_0 ;?>;
          var range1=<?php echo $content_watch_range_1 ;?>;

          var data='text='+encodeURIComponent($('#content_watch_text').val());
          if($('#content_watch_ignore_url').val()!=''){
              if(isUrl($('#content_watch_ignore_url').val())){
                  data='text='+encodeURIComponent($('#content_watch_text').val())+'&ignore='+$('#content_watch_ignore_url').val();
              } else{
                  $('#content-watch-error > p').text("<?php echo $error_is_not_url?>");
                  return;
              }
          }

          $.ajax({
              url: 'index.php?route=extension/feed/content_watch/checkText&token=<?php echo $token; ?>',
              type: 'post',
              dataType: 'json',
              data:data,
              beforeSend: function(){
                  $('#content_watch_uniq').html('<img src="view/image/preloader.gif" alt="">');
                  $('#content-watch-body').removeClass('hide');
                  var html='<tr>'+
                      '<td><img src="view/image/preloader.gif" alt=""></td>'+
                      '<td><img src="view/image/preloader.gif" alt=""></td>'+
                      '<td><img src="view/image/preloader.gif" alt=""></td>'+
                      '</tr>';
                  $('#content_watch_matches').html(html);
                  $('#content_watch_text_result').addClass('hide');
              },
              success: function (json) {
                  if(json['error']){
                      $('#content-watch-error > p').text(json['error']);
                      $('#content-watch-error').removeClass('hide');
                      $('#content-watch-body').addClass('hide');
                      return;
                  }

                  $('#content-watch-error').addClass('hide');

                  var html='';

                  var color='red';
                  $.each(json['matches'],function (index, item) {
                      <?php if($show_range){ ?>
                      color='red';

                      if(100-item['percent']>range0 && 100-item['percent']<range1 ){
                          color='orange';
                      }else if(100-item['percent']<=range0){
                          color='red';
                      }else if(100-item['percent']>=range1){
                          color='green';
                      }
                      <?php }else{ ?>
                      color='blue';
                      <?php } ?>

                      html+=' <tr>' +
                      '<td><a href="'+  item['url'] +'" target="_blank">'+ decodeURI(item['url']) + '</a></td>'+
                      '<td><strong style="color:'+color+';">'+item['percent']+'%</strong></td>'+
                      '<td><a href="javascript:void(0);" onclick=\'highlight_words('+JSON.stringify(item['highlight'])+')\'><?php echo $text_show_result;?></a></td>'+
                      '<tr>'
                  });
                  $('#content-watch-all-words').html('<a  href="javascript:void(0);" onclick=\'highlight_words('+JSON.stringify(json['highlight'])+');\'><?php echo $text_show_all_result; ?></a>');
                  $('#content_watch_text_result').removeClass('hide');
                  $('#content_watch_text_result').html(json['text']);
                  <?php if($show_range){ ?>
                  if(json['percent']>range0 && json['percent']<range1 ){
                      color='orange';
                  }else if(json['percent']<=range0){
                      color='red';
                  }else if(json['percent']>=range1){
                      color='green';
                  }
                  <?php } ?>
                  $('#content_watch_uniq').css('color',color);
                  $('#content_watch_uniq').html(json['percent']+'%');
                  $('#content_watch_matches').html(html);
                  highlight_words(json['highlight']);
                  getBalance();

              }
          });
      });

      $('#content_watch_text_result').on('click',function(){
          $(this).addClass('hide');
          $('#content_watch_text').removeClass('hide');
          $('#content_watch_button_double_space').attr('data-next','show').text('<?php echo $text_double_space; ?>');
      });
      $('#content_watch_button_double_space').on('click',function(){
          if($(this).attr('data-next')=='show'){
              $(this).attr('data-next','clear');
              var text= $.trim($('#content_watch_text').val()).replace(/  /g,'<span>&nbsp;&nbsp;</span>');
              $("#content_watch_text_result").html(text);
              $('#content_watch_text').addClass('hide');
              $('#content_watch_text_result').removeClass('hide');
              $('#content_watch_button_double_space').text('<?php echo $text_delete_double_space; ?>');
          }else{
              $(this).attr('data-next','show');
              $('#content_watch_button_double_space').text('<?php echo $text_double_space; ?>');
              var newText=$('#content_watch_text').val().replace(/\s+/g,' ');
              $('#content_watch_text').val(newText);
              var text= $.trim($('#content_watch_text').val()).replace(/  /g,'<span>&nbsp;&nbsp;</span>');
              $("#content_watch_text_result").html(text);
              getWordsInfo();
          }
      });

      function getBalance(){
          $.ajax({
              url: 'index.php?route=extension/feed/content_watch/getBalance&token=<?php echo $token; ?>',
              type: 'post',
              dataType: 'json',
              beforeSend: function(){

                  $('#content_watch_user').html('<img src="view/image/preloader.gif" alt="">');
                  $('#content_watch_balance').html('<img src="view/image/preloader.gif" alt="">');
                  $('#content_watch_tariff').html('<img src="view/image/preloader.gif" alt="">');
                  $('#content_watch_total').html('<img src="view/image/preloader.gif" alt="">');
              },
              success: function (json) {
                  if(json['error']){
                      $('#content-watch-error > p').text(json['error']);
                      $('#content_watch_user').html('?');
                      $('#content_watch_balance').html('?');
                      $('#content_watch_tariff').html('?');
                      $('#content_watch_total').html('?');
                      $('#content-watch-error').removeClass('hide');
                      $('#content-watch-body').addClass('hide');
                      return;
                  }
                  if(isFinite(json['balance']/json['tariff'])){
                      var total=Math.floor(json['balance']/json['tariff']);
                  }else{
                      var total=0;
                  }

                  $('#content_watch_user').html(json['user']);
                  $('#content_watch_balance').html(json['balance']);
                  $('#content_watch_tariff').html(json['tariff']);
                  $('#content_watch_total').html(total);
              }
          });
      }

      $('#content_watch_text').on('keyup',function(){
          getWordsInfo();
      });

      function isUrl(value) {
          if(!/(?:http?:\/\/)/i.test(value)){
              value='http://'+value;
          }
          return /^(?:http?:\/\/)(?:\S+(?::\S*)?@)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:[/?#]\S*)?$/i.test(value);
      }

      function getWordsInfo(){
          var elem=$('#content_watch_text');
          var words   = $(elem).val().length;
          var char_length = $.trim($(elem).val()).replace(/\s+/g,'').length;
          var space=0;
          if(char_length >0){
              space   = $.trim($(elem).val()).replace(/\s+/g,' ').split(" ").length;
          }else{
              space  = 0;
          }


          $('#content_watch_words_length').html(words);
          $('#content_watch_words_count').html(space);
          $('#content_watch_char_length').html(char_length);
      }
      function highlight_words(hl_array){

          var t_hl = $("#content_watch_text_result").text().split(" ");
          for (i = 0; i < hl_array.length; i++)
          {
              if (hl_array[i] instanceof Array) {
                  t_hl[ hl_array[i][0] ] = "<b>" + (t_hl[ hl_array[i][0] ] === undefined ? "" : t_hl[ hl_array[i][0] ]);
                  t_hl[ hl_array[i][1] ] = (t_hl[ hl_array[i][1] ] === undefined ? "" : t_hl[ hl_array[i][1] ]) + "</b>";
              } else {
                  t_hl[ hl_array[i] ] = "<b>" + t_hl[ hl_array[i] ] + "</b>";
              }
          }
          $('#content_watch_text_result').removeClass('hide');
          $('#content_watch_text').addClass('hide');
          $("#content_watch_text_result").html(t_hl.join(" "));
          return false;
      }

      </script>
  <?php } ?>
</header>

