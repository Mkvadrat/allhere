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

  <table>
      <tbody>
      <tr>
          <td>Телефоны:</td>
          <td>
            <?php echo $cont_phone; ?>
          </td>
      </tr>
      <tr>
          <td>WhatsApp/ Viber</td>
          <td>
            <?php echo $messenger; ?>
          </td>
      </tr>
      <tr>
          <td>E-mail:</td>
          <td><a href="mailto:<?php echo $cont_email; ?>;"><?php echo $cont_email; ?></a></td>
      </tr>
      <tr>
          <td>Адрес:</td>
          <td><?php echo $cont_address; ?></td>
      </tr>
      <tr>
          <td>Карта:</td>
          <td>
              <div id="sevastopol" style="width:100%; height:320px"></div>
          </td>
      </tr>
      </tbody>
  </table>

  <div class="callback__block">
      <div class="callback__form contact__form">
          <div>
              <div class="title__form">Форма обратной связи</div>
              <div class="warning"></div>
              <div class="fields__box form-inline form-row">
                  <div class="form-group col-12 col-md-4">
                      <span><input type="text" id="name" class="reset_input" placeholder="Имя" value=""/></span>
                  </div>
                  <div class="form-group col-12 col-md-4">
                      <span><input type="text" id="phone" class="reset_input" placeholder="Телефон" value=""/></span>
                  </div>
                  <div class="form-group col-12 col-md-4">
                      <span><input type="text" id="email" class="reset_input" placeholder="E-mail" value=""/></span>
                  </div>
                  <div class="form-group col-12">
                      <span><textarea id="message" class="reset_input" placeholder="Сообщение"></textarea></span>
                  </div>
                  <div class="form-group col-12 col-md-8">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" onchange="document.getElementById('submit').disabled = !this.checked;" id="gridCheck">
                        <label class="form-check-label" for="gridCheck">
                            Я даю согласие на обработку моих персональных данных
                        </label>
                      </div>
                  </div>
                  
                  <div class="form-group col-12 col-md-4">
                      <span><input disabled="disabled" id="submit" onclick="sendContactForm();" type="submit" value="Отправить"/></span>
                  </div>
              </div>
          </div>
      </div>
  </div>
  
  <script src="http://api-maps.yandex.ru/2.0/?load=package.full&lang=ru-RU" type="text/javascript"></script>
  <script type="text/javascript">
      var sevastopolMap, sevastopolPlacemark, sevastopolcoords;
  
      ymaps.ready(init);
  
      function init() {
  
          sevastopolMap = new ymaps.Map('sevastopol', {
  
              center: [<?php echo $geocode; ?>],
  
              zoom: 17
  
          });
  
          var SearchControl = new ymaps.control.SearchControl({noPlacemark: true});
  
          sevastopolMap.controls
  
          //.add('zoomControl')
  
              .add('typeSelector')
  
          sevastopolcoords = [<?php echo $geocode; ?>];
  
  
          sevastopolPlacemark = new ymaps.Placemark([<?php echo $geocode; ?>], {}, {
              preset: "twirl#redIcon",
              draggable: true
          });
  
          sevastopolMap.geoObjects.add(sevastopolPlacemark);
  
      }
  </script>
  
<?php echo $footer; ?>
