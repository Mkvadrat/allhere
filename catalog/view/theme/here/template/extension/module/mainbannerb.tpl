<!--МОДУЛЬ 1-->
<div class="actions__products">
    <?php foreach ($mainbanneras as $banner) { ?>
    <div class="grid__actions row">
        <a href="#" class="col-12 col-md-7">
            <div class="actions__item bg__img" style="background-image: url('<?php echo $banner['image']; ?>')">
                <div class="actions__title">
                    <div class="actions__name"><?php echo $banner['title']; ?></div>
                    <?php echo $banner['description']; ?>
                </div>
            </div>
        </a>
    </div>
    <?php } ?>
</div>