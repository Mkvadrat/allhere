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
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
    <fieldset>
      <div class="form-group">
        <label class="col-sm-2 control-label"><?php echo $entry_newsletter; ?></label>
        <div class="col-sm-10">
          <?php if ($newsletter) { ?>
          <label class="radio-inline">
            <input type="radio" name="newsletter" value="1" checked="checked" />
            <?php echo $text_yes; ?> <span class="checkmark"></span></label>
          <label class="radio-inline">
            <input type="radio" name="newsletter" value="0" />
            <?php echo $text_no; ?><span class="checkmark"></span></label>
          <?php } else { ?>
          <label class="radio-inline">
            <input type="radio" name="newsletter" value="1" />
            <?php echo $text_yes; ?> <span class="checkmark"></span></label>
          <label class="radio-inline">
            <input type="radio" name="newsletter" value="0" checked="checked" />
            <?php echo $text_no; ?><span class="checkmark"></span></label>
          <?php } ?>
        </div>
      </div>
    </fieldset>
    <div class="buttons clearfix">
      <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
      <div class="pull-right">
        <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
      </div>
    </div>
  </form>

<?php echo $footer; ?>