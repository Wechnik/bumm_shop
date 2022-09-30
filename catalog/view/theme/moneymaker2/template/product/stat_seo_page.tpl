<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> smart-filter-homepage">
      <?php echo $content_top; ?>
        <ul class="breadcrumb text-center" itemscope itemtype="https://schema.org/BreadcrumbList">
            <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
                <?php if($i+1<count($breadcrumbs)) { ?>
                    <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><a itemprop="item" href="<?php echo $breadcrumb['href']; ?>"><span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a><meta itemprop="position" content="<?php echo $i+1; ?>" /></li><?php } else { ?><li class="active"><?php echo $breadcrumb['text']; ?></li><?php } ?>
            <?php } ?>
        </ul>
      <h1 class="h2 text-center content-title">Штатные навигационные системы в стиле Тесла на Андроид</h1>
        <?php if ($description) { ?>
            <div style="overflow: hidden; margin: 20px 0 10px 0">
                <?php echo $description; ?>
            </div>
        <?php } ?>
      <div class="hr"></div>
      <?php if ($additional_description) { ?>
      <div class="row catalog-descr<?php if ($moneymaker2_catalog_categories_move_description) { ?> collapse<?php } ?>">
          <div class="col-lg-12 col-md-12 col-sm-12 colxs-12">
          <div>
              <div id="ec-description" >
                <?php echo $additional_description; ?>
            </div>
              <div id="hidwrapwrap" style="height:0px;">
                  <div id="hiddenwrapper"></div>
              </div>
              <div id="show-desc">Развернуть <i class="fa fa-chevron-down"></i></div>
              <div id="hide-desc">Свернуть <i class="fa fa-chevron-up"></i></div>
          </div>
        </div>
      </div>
      <?php } ?>
      <?php if ($products) { ?>
      <div class="row limits">
        <div class="col-xs-12 text-center">
          <div class="btn-group text-left">
            <div class="btn-group btn-group-sm dropdown">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <?php echo str_replace(":","",$text_sort); ?><i class="fa fa-fw fa-angle-down"></i>
              </button>
              <ul class="dropdown-menu" id="input-sort">
                <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                <li class="active"><a href="<?php echo $sorts['href']; ?>" rel="nofollow"><?php echo $sorts['text']; ?></a></li>
                <?php } else { ?>
                <li><a href="<?php echo $sorts['href']; ?>" rel="nofollow"><?php echo $sorts['text']; ?></a></li>
                <?php } ?>
                <?php } ?>
              </ul>
            </div>
            <div class="btn-group btn-group-sm limit-btn-group dropdown">
              <ul class="dropdown-menu pull-right" id="input-limit">
                <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                <li class="active"><a href="<?php echo $limits['href']; ?>" rel="nofollow"><small><?php echo $limits['text']; ?></small></a></li>
                <?php $mmr_limit_active = $limits['text']; ?>
                <?php } else { ?>
                <li><a href="<?php echo $limits['href']; ?>" rel="nofollow"><small><?php echo $limits['text']; ?></small></a></li>
                <?php } ?>
                <?php } ?>
              </ul>
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-arrows-v hidden-md hidden-lg"></i> <span class="hidden-xs hidden-sm"><?php echo $text_limit; ?> </span><span><?php echo isset($mmr_limit_active) ? $mmr_limit_active : $limits['text']; ?></span><i class="fa fa-fw fa-angle-down"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
      <div class="row products">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid">
          <div class="product-thumb">
            <div class="image">
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 5; $i >= 1; $i--) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <i class="fa fa-star"></i>
                <?php } else { ?>
                <i class="fa fa-star active"></i>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <a href="<?php echo $product['href']; ?>" data-hpm-href="1"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
            </div>
            <div class="bottom flex fl-wrap fl-ai-center">
                <?php echo !empty($product['hpm_block']) ? $product['hpm_block'] : ''; ?>
              <div class="caption">
                <a href="<?php echo $product['href']; ?>" data-hpm-href="1"<?php if ($product['special']) { ?> class="text-special"<?php } ?>><?php echo $product['name']; ?></a>
              </div>
              <div class="price-detached"><?php if ($product['price']) { ?><span class="price"><?php if (!$product['special']) { ?><?php echo $product['price']; ?>
		              <?php } else { ?><span class="price-new"><b><?php echo $product['special']; ?>
			              </b></span> <span class="price-old"><?php echo $product['price']; ?>
		              </span><?php } ?></span><?php } ?><?php if ($product['tax']) { ?><br /><span class="price-tax text-muted"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span><?php } ?></div>
              <div class="btn-group btn-group-sm">
                <a class="detail-view btn" href="<?php echo $product['href']; ?>" data-hpm-href="1">Подробнее</a>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row paginator">
          <div id="showmore" class="col-sm-12 text-center" style="margin-top: 15px;height: 30px;"><a onclick="showmore()" class="detail-view">Показать еще</a></div>
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$products) { ?>
      <div class="row">
        <div class="col-sm-12 text-center">
          <p class="h4"><?php echo $text_empty; ?></p>
        </div>
      </div>
      <div class="buttons">
        <div class="text-center"><a href="<?php echo $continue; ?>" class="btn btn-default"><i class="fa fa-fw fa-angle-right"></i><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<script><!--
    $(document).ready(function() {
        $('.catalog-descr').appendTo($('#content'));
        $('.catalog-descr').show();


        var q1 = $("#ec-description").height();
        $("#ec-description").height('100px');
        $("#ec-description").css('overflow', 'hidden');

        $('#show-desc').click(function(){
            $("#ec-description").animate({height: (q1)+'px'},200);
            $("#hidwrapwrap").hide();
            $("#show-desc").hide();
            $("#hide-desc").show();
        });

        $('#hide-desc').click(function(){
            $("#ec-description").animate({height:'100px'},200);
            $("#hidwrapwrap").show();
            $("#hide-desc").hide();
            $("#show-desc").show();
        });


        if ($('.pagination li.active').next('li').length == 0) {
            $('#showmore').hide();
        }

    });

    function showmore() {

        var $next = $('.pagination li.active').next('li');

        if ($next.length == 0) {
            return;
        }
        $.get($next.find('a').attr('href'), function (data) {
            $data = $(data);

            var $container = $('.products');
            $container.append($data.find('.products > *'));
            $('.pagination li').removeClass('active');
            $next.addClass('active');
            if ($('.pagination li.active').next('li').length == 0) {
                $('#showmore').hide();
            }

            $data.filter('script').each(function () {
                if ((this.text || this.textContent || this.innerHTML).indexOf("document.write") >= 0) {
                    return;
                }
                $.globalEval(this.text || this.textContent || this.innerHTML || '');
            });

        }, "html");
        return false;

    }

    //--></script>
<style type="text/css"></style>
<?php echo $footer; ?>
