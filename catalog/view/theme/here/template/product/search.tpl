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
  
  <p>Критерии поиска</p>

  <div class="search__actions">
      <div class="fields__box form-inline form-row">
          <div class="form-group col-12 col-md-6">
            <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" />
          </div>
          <div class="form-group col-12 col-md-3">
              <div class="select__block">
                <select name="category_id" class="custom-select">
                  <option value="0"><?php echo $text_category; ?></option>
                  <?php foreach ($categories as $category_1) { ?>
                  <?php if ($category_1['category_id'] == $category_id) { ?>
                  <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
                  <?php } ?>
                  <?php foreach ($category_1['children'] as $category_2) { ?>
                  <?php if ($category_2['category_id'] == $category_id) { ?>
                  <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                  <?php } ?>
                  <?php foreach ($category_2['children'] as $category_3) { ?>
                  <?php if ($category_3['category_id'] == $category_id) { ?>
                  <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
          </div>
          <div class="form-group col-12 col-md-3">
              <div class="form-check">
                <?php if ($sub_category) { ?>
                <input type="checkbox" name="sub_category" value="1" checked="checked" class="form-check-input" id="gridCheck1" />
                <?php } else { ?>
                <input type="checkbox" name="sub_category" value="1" class="form-check-input" id="gridCheck1" />
                <?php } ?>                
                
                <label class="form-check-label" for="gridCheck1">
                    Искать в подкатегориях
                </label>
              </div>
          </div>
          <div class="form-group col-12">
              <div class="form-check">
                <?php if ($description) { ?>
                <input type="checkbox" name="description" value="1" id="description" checked="checked" class="form-check-input" />
                <?php } else { ?>
                <input type="checkbox" name="description" value="1" id="description" />
                <?php } ?>
                
                <label class="form-check-label" for="description">
                    Искать в описании товара
                </label>
              </div>
          </div>
      </div>
      <div class="btn-block">
        <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
         
      </div>
  </div>

  <h2>Товары, соответствующие критериям поиска</h2>

  <hr/>
  
  <br/>
                  
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
  <?php } else { ?>
  <p><?php echo $text_empty; ?></p>
  <?php } ?>
  
  <nav>
    <?php echo $pagination; ?>
  </nav>
  
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
                    
<?php echo $footer; ?>