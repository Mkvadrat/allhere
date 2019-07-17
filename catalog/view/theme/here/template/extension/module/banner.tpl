<div class="main__slider mlr__0">
    <div id="banner<?php echo $module; ?>" class="owl-carousel">
      <?php foreach ($banners as $banner) { ?>

        <div class="main__item">
          <?php if ($banner['link']) { ?>
            <a href="<?php echo $banner['link']; ?>">
              <div class="slider__text">
                  <div class="slider__text-inner">
                      <div class="title__1"><?php echo $banner['title']; ?></div>
                      <?php echo $banner['description']; ?>
                  </div>
              </div>
            </a>
            <div class="slider__img bg__img" style="background-image: url('<?php echo $banner['image']; ?>')"></div>
          <?php }else{ ?>
            <div class="slider__text">
                <div class="slider__text-inner">
                    <div class="title__1"><?php echo $banner['title']; ?></div>
                    <?php echo $banner['description']; ?>
                </div>
            </div>
            <div class="slider__img bg__img" style="background-image: url('<?php echo $banner['image']; ?>')"></div>
          <?php } ?>
        </div>
      <?php } ?>
    </div>
</div>

<script>
$(document).ready(function () {
  $('#banner<?php echo $module; ?>').owlCarousel({
      items: 1,
      nav: false,
      // autoplay: true,
      loop: true,
      autoplayTimeout: 4000
  });
});
</script>