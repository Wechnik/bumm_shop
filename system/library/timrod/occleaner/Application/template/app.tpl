<div class="app-container">
    <?php echo $header; ?>
    <?php echo $menu; ?>
    <?php echo $content; ?>
    <?php echo $footer; ?>

    <script>
        window.timrod = window.timrod || {};
        window.timrod.jsdata = new Map();
        <?php foreach ($js_data as $key => $value) { ?>
            window.timrod.jsdata.set('<?php echo $key; ?>', '<?php echo $value; ?>');
        <?php } ?> 
    </script>
</div>