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
  <p><?php echo $text_balance; ?> <strong><?php echo $balance; ?></strong>.</p>
  <div class="table-responsive">
    <table class="table table-striped table-bordered table-hover">
      <thead>
        <tr>
          <td class="text-left"><?php echo $column_date_added; ?></td>
          <td class="text-left"><?php echo $column_description; ?></td>
          <td class="text-right"><?php echo $column_amount; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php if ($transactions) { ?>
        <?php foreach ($transactions  as $transaction) { ?>
        <tr>
          <td class="text-left"><?php echo $transaction['date_added']; ?></td>
          <td class="text-left"><?php echo $transaction['description']; ?></td>
          <td class="text-right"><?php echo $transaction['amount']; ?></td>
        </tr>
        <?php } ?>
        <?php } else { ?>
        <tr>
          <td class="text-center" colspan="5"><?php echo $text_empty; ?></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
  </div>
  <div class="text-right"><?php echo $pagination; ?></div>
  <div class="buttons clearfix">
    <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
  </div>

<?php echo $footer; ?>