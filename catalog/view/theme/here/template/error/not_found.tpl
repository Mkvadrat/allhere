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

  <p><?php echo $text_error; ?></p>

  <div class="btn-block">
      <a href="<?php echo $continue; ?>" class="btn btn-primary">Назад</a>
  </div>

<?php echo $footer; ?>
