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
    <li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
  </ul>
  <h2><?php echo $text_my_tracking; ?></h2>
  <ul class="list-unstyled">
    <li><a href="<?php echo $tracking; ?>"><?php echo $text_tracking; ?></a></li>
  </ul>
  <h2><?php echo $text_my_transactions; ?></h2>
  <ul class="list-unstyled">
    <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
  </ul>

<?php echo $footer; ?>