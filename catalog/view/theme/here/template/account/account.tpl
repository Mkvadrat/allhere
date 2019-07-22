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
  
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>

  <h2><?php echo $text_my_account; ?></h2>
  <ul class="list-unstyled">
    <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
    <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
    <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
    <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
  </ul>
  <?php if ($credit_cards) { ?>
  <h2><?php echo $text_credit_card; ?></h2>
  <ul class="list-unstyled">
    <?php foreach ($credit_cards as $credit_card) { ?>
    <li><a href="<?php echo $credit_card['href']; ?>"><?php echo $credit_card['name']; ?></a></li>
    <?php } ?>
  </ul>
  <?php } ?>
  <h2><?php echo $text_my_orders; ?></h2>
  <ul class="list-unstyled">
    <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
    <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
    <?php if ($reward) { ?>
    <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
    <?php } ?>
    <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
    <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
    <li><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li>
  </ul>
  <h2><?php echo $text_my_newsletter; ?></h2>
  <ul class="list-unstyled">
    <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
  </ul>

<?php echo $footer; ?> 