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
  <p><?php echo $text_total; ?> <b><?php echo $total; ?></b>.</p>
  <div class="table-responsive">
    <table class="table table-bordered table-hover">
      <thead>
        <tr>
          <td class="text-left"><?php echo $column_date_added; ?></td>
          <td class="text-left"><?php echo $column_description; ?></td>
          <td class="text-right"><?php echo $column_points; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php if ($rewards) { ?>
        <?php foreach ($rewards  as $reward) { ?>
        <tr>
          <td class="text-left"><?php echo $reward['date_added']; ?></td>
          <td class="text-left"><?php if ($reward['order_id']) { ?>
            <a href="<?php echo $reward['href']; ?>"><?php echo $reward['description']; ?></a>
            <?php } else { ?>
            <?php echo $reward['description']; ?>
            <?php } ?></td>
          <td class="text-right"><?php echo $reward['points']; ?></td>
        </tr>
        <?php } ?>
        <?php } else { ?>
        <tr>
          <td class="text-center" colspan="3"><?php echo $text_empty; ?></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
  </div>
  <div class="row pag__res">
    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
  </div>
  <div class="buttons clearfix">
    <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
  </div>

<?php echo $footer; ?>