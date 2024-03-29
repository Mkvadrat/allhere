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
  
  <h2><?php echo $heading_title; ?></h2>
  <?php if ($downloads) { ?>
  <div class="table-responsive">
  <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <td class="text-right"><?php echo $column_order_id; ?></td>
        <td class="text-left"><?php echo $column_name; ?></td>
        <td class="text-left"><?php echo $column_size; ?></td>
        <td class="text-left"><?php echo $column_date_added; ?></td>
        <td></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($downloads as $download) { ?>
      <tr>
        <td class="text-right"><?php echo $download['order_id']; ?></td>
        <td class="text-left"><?php echo $download['name']; ?></td>
        <td class="text-left"><?php echo $download['size']; ?></td>
        <td class="text-left"><?php echo $download['date_added']; ?></td>
        <td><a href="<?php echo $download['href']; ?>" title="<?php echo $button_download; ?>" class="btn btn-primary"><i class="fa fa-cloud-download"></i></a></td>
      </tr>
      <?php } ?>
    </tbody>
  </table>
  </div>
  <div class="row">
    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
  </div>
  <?php } else { ?>
  <p><?php echo $text_empty; ?></p>
  <?php } ?>
  <div class="buttons clearfix">
    <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
  </div>

<?php echo $footer; ?>