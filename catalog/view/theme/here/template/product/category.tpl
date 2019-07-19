<?php echo $header; ?>

  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <?php			
        $count = count($breadcrumbs);
        $i=1;
        foreach ($breadcrumbs as $breadcrumb) {
          if($i!=$count){
      ?>
            <li class="breadcrumb-item"><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php
          }else{
            echo '<li class="breadcrumb-item active" aria-current="page">'.$breadcrumb['text'] . '</li>'; 
          }		
          $i++;
        } 
      ?>
    </ol>    
  </nav>
  
  <h1><?php echo $heading_title; ?></h1>
  
  <?php if ($description) { ?>
    <?php echo $description; ?>
  <?php } ?>
  
  <?php if($categories){ ?>
  <div class="subcategorys__block">
      <div class="title__module">Подкатегории</div>
      <div class="subcategorys__grid">
        <?php foreach ($categories as $category) { ?>
          <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
        <?php } ?>
      </div>
  </div>
  <?php } ?>
  
  <?php if ($products) { ?>
  <div class="products__block">
      <div class="products__sort">
          <div class="select__block">
              <span class="label">Сортировка:</span>
              <select id="input-sort" class="custom-select" onchange="location = this.value;">
                <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
          </div>
          <div class="select__block">
              <span class="label">Показывать по:</span>
              <select id="input-limit" class="custom-select" onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
          </div>
      </div>
      <div class="slider__products">
          <div class="grid__products row">
            <?php foreach ($products as $product) { ?>
              <div class="product__item col-12 col-sm-6 col-md-4 col-lg-3">
                  <div class="product__inner">
                      <button type="button" class="prod__top">
                          <div class="add__wish" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">Добавить в избранное</div>
                          <span class="img__wish"></span>
                      </button>
                      <div class="prod__img bg__img" style="background-image: url('<?php echo $product['thumb']; ?>')"></div>
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
  </div>
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <p><?php echo $text_empty; ?></p>
  <div class="buttons">
    <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  
  <nav>
    <?php echo $pagination; ?>
  </nav>
  
  <?php if ($description_bottom) { ?>
    <?php echo $description_bottom; ?>
  <?php } ?>
                    
<?php echo $footer; ?>
