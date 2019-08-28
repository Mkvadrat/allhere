<div class="actions__products actions__products-2">
    <div class="grid__actions row">
        <?php foreach ($mainbannerbs as $banner) { ?>
        <a href="<?php echo $banner['link']; ?>" class="col-12">
            <div class="actions__item bg__img" style="background-image: url('<?php echo $banner['image']; ?>')">
                <div class="actions__title">
                    <div class="actions__name"><?php echo $banner['title']; ?></div>
                    <?php echo $banner['description']; ?>
                </div>
            </div>
        </a>
        <?php } ?>
    </div>
</div>
