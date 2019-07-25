  <div class="slider__products mlr__0">
    <div class="title__module">Товары со скидкой</div>
    <div class="owl-carousel">
      <?php foreach ($products as $product) { ?>
        <div class="product__item">
            <div class="product__inner">
                <button type="button" class="prod__top">
                    <div class="add__wish" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">Добавить в избранное</div>
                    <span class="img__wish"></span>
                </button>
                <a href="<?php echo $product['href']; ?>" class="prod__img bg__img"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
                <a href="<?php echo $product['href']; ?>" class="prod__name"><?php echo $product['name']; ?></a>
                <div class="prod__action">
                    <div class="prod__price">
                      <?php if (!$product['special']) { ?>
                      <div class="now__price"><strong><?php echo $product['price']; ?></strong></div>
                      <?php } else { ?>
                      <div class="old__price"><?php echo $product['price']; ?></div>
                      <div class="now__price"><strong><?php echo $product['special']; ?></strong></div>
                      <?php } ?>
                    </div>
                    <div class="prod__cart">
                      <button type="button" class="addCartBtn" onclick="cart.add('<?php echo $product['product_id']; ?>');"><img src="/catalog/view/theme/here/image/shopping-cart.svg"/></button>
                    </div>
                </div>
            </div>
        </div>
      <?php } ?>
    </div>
</div>