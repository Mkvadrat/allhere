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
  <?php if ($recurrings) { ?>
  <div class="table-responsive">
    <table class="table table-bordered table-hover">
      <thead>
        <tr>
          <td class="text-right"><?php echo $column_order_recurring_id; ?></td>
          <td class="text-left"><?php echo $column_product; ?></td>
          <td class="text-left"><?php echo $column_status; ?></td>
          <td class="text-left"><?php echo $column_date_added; ?></td>
          <td class="text-right"></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($recurrings as $recurring) { ?>
        <tr>
          <td class="text-right">#<?php echo $recurring['order_recurring_id']; ?></td>
          <td class="text-left"><?php echo $recurring['product']; ?></td>
          <td class="text-left"><?php echo $recurring['status']; ?></td>
          <td class="text-left"><?php echo $recurring['date_added']; ?></td>
          <td class="text-right"><a href="<?php echo $recurring['view']; ?>" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
  </div>
  <div class="text-right"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <p><?php echo $text_empty; ?></p>
  <?php } ?>
  <div class="buttons clearfix">
    <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
  </div>

<?php echo $footer; ?>