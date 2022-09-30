<div class="app-loader" style="display: none">
    <div class="app-loader__wrapper">
        <svg class="app-loader__spinner" width="65px" height="65px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
            <circle class="app-loader__circle" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle>
        </svg>
        <div class="app-loader__text"></div>
    </div>
</div>

<?php if (isset($error_warning) && $error_warning) { ?>
    <script>
        $(document).ready(function() {
            new Noty({
                type: 'error',
                text: '<?php echo $error_warning; ?>',
            }).show();
        });
    </script>
<?php } ?>

<?php if (isset($error_throw) && $error_throw) { ?>
    <script>
        console.log('<?php echo $error_throw; ?>');        
    </script>
<?php } ?>

<?php if (isset($success) && $success) { ?>
    <script>
        $(document).ready(function() {
            new Noty({
                type: 'success',
                text: '<?php echo $success; ?>',
            }).show();
        });
    </script>
<?php } ?>