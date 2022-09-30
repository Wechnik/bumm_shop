<div class="app-menu app-menu_open">
    <?php foreach ($menu as $item) { ?>

        <?php if ($item['type'] === 'link') { ?>
            <div class="app-menu__link <?php echo $item['active'] ? 'app-menu__link_active' : '' ?>">
                <a <?php echo $item['link'] ? 'href="' . $item['link'] . '"'  : '' ?>>

                    <?php if ($item['icon']) { ?>
                        <span class="material-icons"><?php echo $item['icon']; ?></span>
                    <?php } ?>

                    <span><?php echo $item['title']; ?></span>
                </a>
            </div>
        <?php } ?>

        <?php if ($item['type'] === 'divider') { ?>
            <div class="app-menu__divider"></div>
        <?php } ?>

    <?php } ?>
</div>