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
  
  <div class="product__info">
    <div class="product__gallery">
      <?php if (!$images) { ?>
      <div class="owl-carousel" data-slider-id="1"><a class="item" data-fancybox="gallery" href="<?php echo $popup; ?>" style="background-image: url('<?php echo $popup; ?>')"></a></div>
      <div class="owl-thumbs" data-slider-id="1"><button class="owl-thumb-item" style="background-image: url('<?php echo $popup; ?>')"></button></div>
      <?php } ?>
      <?php if ($images) { ?>
      <div class="owl-carousel" data-slider-id="1">
        <?php foreach ($images as $image) { ?>
          <a class="item" data-fancybox="gallery" href="<?php echo $image['popup']; ?>" style="background-image: url('<?php echo $image['popup']; ?>')"></a>
        <?php } ?>
      </div>
      <div class="owl-thumbs" data-slider-id="1">
        <?php foreach ($images as $image) { ?>
          <button class="owl-thumb-item" style="background-image: url('<?php echo $image['popup']; ?>')"></button>
        <?php } ?>
      </div>
      <?php } ?>
    </div>
      
    <div class="product__actions">
      <div class="prod__model"><?php echo $model; ?></div>
      <div class="prod__price">
          <?php if (!$special) { ?>
          <div class="now__price"><strong><?php echo $price; ?></strong></div>
          <?php } else { ?>
          <div class="old__price"><?php echo $price; ?></div>
          <div class="now__price"><strong><?php echo $special; ?></strong></div>
          <?php } ?>
      </div>
      <div class="product__quantity">
        <div id="product">
          <?php if ($options) { ?>
          <hr>
          <h3><?php echo $text_option; ?></h3>
          <?php foreach ($options as $option) { ?>
          <?php if ($option['type'] == 'select') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($option['product_option_value'] as $option_value) { ?>
              <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
              <?php if ($option_value['price']) { ?>
              (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
              <?php } ?>
              </option>
              <?php } ?>
            </select>
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'radio') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label"><?php echo $option['name']; ?></label>
            <div id="input-option<?php echo $option['product_option_id']; ?>">
              <?php foreach ($option['product_option_value'] as $option_value) { ?>
              <div class="radio">
                <label>
                  <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                  <?php if ($option_value['image']) { ?>
                  <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                  <?php } ?>                    
                  <?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                </label>
              </div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'checkbox') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label"><?php echo $option['name']; ?></label>
            <div id="input-option<?php echo $option['product_option_id']; ?>">
              <?php foreach ($option['product_option_value'] as $option_value) { ?>
              <div class="checkbox">
                <label>
                  <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                  <?php if ($option_value['image']) { ?>
                  <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                  <?php } ?>
                  <?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                </label>
              </div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'text') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'textarea') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
          </div>
          <?php } ?>
          <?php } ?>
          <?php } ?>
          
          <?php if ($recurrings) { ?>
          <hr>
          <h3><?php echo $text_payment_recurring; ?></h3>
          <div class="form-group required">
            <select name="recurring_id" class="form-control">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($recurrings as $recurring) { ?>
              <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
              <?php } ?>
            </select>
            <div class="help-block" id="recurring-description"></div>
          </div>
          <?php } ?>
          
          <div class="select__block">
            <span class="label">Кол-во:</span>
            <div class="input-group">
              <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
            </div>
          </div>

          <?php if ($minimum > 1) { ?>
          <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
          <?php } ?>
        </div>                          
      </div>
      <div class="product__wc">
          <button type="button" class="prod__top" onclick="wishlist.add('<?php echo $product_id; ?>');"><span class="img__wish"></span></button>
          <div class="prod__cart">
              <button type="button" class="addCartBtn" id="button-cart"><img src="/catalog/view/theme/here/image/shopping-cart.svg"/>Купить</button>
          </div>
      </div>
      <div class="delivery__info">
        <div class="delivery__item">
          <?php echo $delivery; ?>
        </div>
        <div class="delivery__item">
          <?php echo $payment; ?>
        </div>
      </div>
    </div>
  </div>
  
  <div class="product__description">
    <ul class="nav nav-pills" id="pills-tab" role="tablist">
      <li class="nav-item">
          <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-descript" role="tab" aria-controls="pills-home" aria-selected="true">Описание</a>
      </li>
      <?php if($description_mini){ ?>
      <li class="nav-item">
          <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-kharakteristiks" role="tab" aria-controls="pills-profile" aria-selected="false">Характеристики</a>
      </li>
      <?php } ?>
    </ul>
    <div class="tab-content" id="pills-tabContent">
      <div class="tab-pane fade show active" id="pills-descript" role="tabpanel" aria-labelledby="pills-descript-tab">
        <?php echo $description; ?>
      </div>
      <?php if($description_mini){ ?>
      <div class="tab-pane fade" id="pills-kharakteristiks" role="tabpanel" aria-labelledby="pills-kharakteristiks-tab">
        <?php echo $description_mini; ?>
      </div>
      <?php } ?>
    </div>
  </div>
  
  <?php if ($products) { ?>
  <div class="slider__products mlr__0">
    <h2>Рекомендуемые товары</h2>
    <div class="owl-carousel">
      <?php foreach ($products as $product) { ?>
      <div class="product__item">
        <div class="product__inner">
          <button type="button" class="prod__top">
              <div class="add__wish" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">Добавить в избранное<span class="img__wish"></span></div>
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
  <?php } ?>

<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('.update-cart').html('<span class="update-cart" id="cart-total">' + json['total'] + '</span>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>

<?php echo $footer; ?>
