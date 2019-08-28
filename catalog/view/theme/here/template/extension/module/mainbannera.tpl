<div class="actions__products actions__products-1">
    <div class="grid__actions row">
        <?php foreach ($mainbanneras as $banner) { ?>
        <a href="#" class="col-12">
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
