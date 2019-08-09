<?php
class ControllerCommonCyrlat extends Controller {
public function index(){

print "<br><br>!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Product !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!<br><br><br>";

	$numnum = 0;		
	$query = $this->db->query("select image, product_id from " . DB_PREFIX . "product");
		
	$results_a = $query->rows;
			
	foreach ($results_a as $result_at) {
				
		if ($result_at['image'] && file_exists(DIR_IMAGE . $result_at['image'])) {
		

			$unic_flag = true;
			$old_image = $result_at['image'];
				
			if (preg_match('#[^A-Za-z0-9_\-/\.]#', $old_image)) 
			{
			$numnum = $numnum +1;
			print "<br>- ".$numnum." -<br>";
			
						$image_new = $this->translitIt($old_image);
						$image_new = preg_replace('#[^A-Za-z0-9_\-/\.]#', '', $image_new);
						
						$info = pathinfo($image_new);
						$extension = $info['extension'];
						$name_body = substr($image_new, 0, strrpos($image_new, '.'));
						$new_image = $name_body . '.' . $extension;
						$directories = explode('/', dirname(str_replace('../', '', $new_image)));
						array_shift($directories);
						
						$path = 'data';
						foreach ($directories as $directory) {
							$path = $path . '/' . $directory;
							
							if (!file_exists(DIR_IMAGE . $path)) {
								@mkdir(DIR_IMAGE . $path, 0777);
							}		
						}
						
						
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x91'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x92'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x93'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x94'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x95'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x96'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x97'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x98'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x99'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {print "<br>__________!!!!!! mnogo copiy takogo faila ".$old_image." --- ". $new_image . " __pid=(".$result['product_id'].")<br>";}
						
						if ($unic_flag && rename(DIR_IMAGE . $old_image, DIR_IMAGE . $new_image)) {
							print $old_image." = p = ".$new_image . " __pid=(".$result_at['product_id'].")<br>";
							$unic_flag = false;
						}
						else {print "<br>__________!!! ERRORcopyFile ".$old_image." === ". $new_image. " __pid=(".$result['product_id'].")<br>";}
			
			
			
			
// ищем в Продуктах

				$query = $this->db->query("select product_id, image from " . DB_PREFIX . "product where image='".$old_image."'");
		
				$results = $query->rows;

				foreach ($results as $result) {
				
					if ($result['image'] && ($result['image'] = $old_image)) {
						print "p(". $result['product_id'] .")<br>";
						$this->db->query("UPDATE " . DB_PREFIX . "product SET image='".$this->db->escape($new_image)."' where product_id ='".(int)$result['product_id']."'");
					}
				}
	
// теперь это же ищем в Продукт_Картинках
		
				$query = $this->db->query("select product_image_id, image from " . DB_PREFIX . "product_image where image='".$old_image."'");
		
				$results = $query->rows;
			
				foreach ($results as $result) {
				
					if ($result['image'] && ($result['image'] = $old_image)) {
						print "i(". $result['product_image_id'] .")<br>";
						$this->db->query("UPDATE " . DB_PREFIX . "product_image SET image='".$this->db->escape($new_image)."' where product_image_id ='".(int)$result['product_image_id']."'");
					}
				}
			
			}
		
		}
		else
			if (!file_exists(DIR_IMAGE . $result_at['image'])) {
			print "<br>__________file NOT found______". $result_at['image'] . " __pid=(".$result_at['product_id'].")<br>";
			}
	}
			
print "<br><br><br>!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Product_Image !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!<br><br><br>";

	// перебор Прод_картинок
			
	$query = $this->db->query("select image, product_image_id from " . DB_PREFIX . "product_image");
		
	$results_a = $query->rows;
			
	foreach ($results_a as $result_at) {
				
		if ($result_at['image'] && file_exists(DIR_IMAGE . $result_at['image'])) {

			$unic_flag = true;
			$old_image = $result_at['image'];
				
			if (preg_match('#[^A-Za-z0-9_\-/\.]#', $old_image)) 
			{
			$numnum = $numnum +1;
			print "<br>- ".$numnum." -<br>";
						$image_new = $this->translitIt($old_image);
						$image_new = preg_replace('#[^A-Za-z0-9_\-/\.]#', '', $image_new);
						
						$info = pathinfo($image_new);
						$extension = $info['extension'];
						$name_body = substr($image_new, 0, strrpos($image_new, '.'));
						$new_image = $name_body . '.' . $extension;
						$directories = explode('/', dirname(str_replace('../', '', $new_image)));
						array_shift($directories);
						
						$path = 'data';
						foreach ($directories as $directory) {
							$path = $path . '/' . $directory;
							
							if (!file_exists(DIR_IMAGE . $path)) {
								@mkdir(DIR_IMAGE . $path, 0777);
							}		
						}
						
						
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x91'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x92'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x93'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x94'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x95'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x96'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x97'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x98'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {$new_image = $name_body . '_x99'. '.' . $extension; print "* ";}
						if ($unic_flag && file_exists(DIR_IMAGE . $new_image)) {print "<br>__________!!!!!! mnogo copiy takogo faila ".$old_image." --- ". $new_image . " __piid=(".$result['product_image_id'].")<br>";}
						
						if ($unic_flag && rename(DIR_IMAGE . $old_image, DIR_IMAGE . $new_image)) {
							print $old_image." = i = ".$new_image . " __piid=(".$result_at['product_image_id'].")<br>";
							$unic_flag = false;
						}
						else {print "<br>__________!!! ERRORcopyFile ".$old_image." === ". $new_image. " __piid=(".$result['product_image_id'].")<br>";}
			
			
			
			
// ищем в Продукт_image

				$query = $this->db->query("select product_image_id, image from " . DB_PREFIX . "product_image where image='".$old_image."'");
		
				$results = $query->rows;

				foreach ($results as $result) {
				
					if ($result['image'] && ($result['image'] = $old_image)) {
						print "i(". $result['product_image_id'] .")<br>";
						$this->db->query("UPDATE " . DB_PREFIX . "product_image SET image='".$this->db->escape($new_image)."' where product_image_id ='".(int)$result['product_image_id']."'");
					}
				}
	
// теперь это же ищем в Продуктах
		
				$query = $this->db->query("select product_id, image from " . DB_PREFIX . "product where image='".$old_image."'");
		
				$results = $query->rows;
			
				foreach ($results as $result) {
				
					if ($result['image'] && ($result['image'] = $old_image)) {
						print "p(". $result['product_id'] .")<br>";
						$this->db->query("UPDATE " . DB_PREFIX . "product SET image='".$this->db->escape($new_image)."' where product_id ='".(int)$result['product_id']."'");
					}
				}
			
			}
		
		}
		else
			if (!file_exists(DIR_IMAGE . $result_at['image'])) {
			print "<br>__________file NOT found______". $result_at['image'] . " __piid=(".$result_at['product_image_id'].")<br>";
			}
	}

	
}

	private function translitIt($str) 
	{
		$tr = array(
			"А"=>"A","Б"=>"B","В"=>"V","Г"=>"G",
			"Д"=>"D","Е"=>"E","Ж"=>"J","З"=>"Z","И"=>"I",
			"Й"=>"Y","К"=>"K","Л"=>"L","М"=>"M","Н"=>"N",
			"О"=>"O","П"=>"P","Р"=>"R","С"=>"S","Т"=>"T",
			"У"=>"U","Ф"=>"F","Х"=>"H","Ц"=>"TS","Ч"=>"CH",
			"Ш"=>"SH","Щ"=>"SCH","Ъ"=>"","Ы"=>"YI","Ь"=>"",
			"Э"=>"E","Ю"=>"YU","Я"=>"YA","а"=>"a","б"=>"b",
			"в"=>"v","г"=>"g","д"=>"d","е"=>"e","ж"=>"j",
			"з"=>"z","и"=>"i","й"=>"y","к"=>"k","л"=>"l",
			"м"=>"m","н"=>"n","о"=>"o","п"=>"p","р"=>"r",
			"с"=>"s","т"=>"t","у"=>"u","ф"=>"f","х"=>"h",
			"ц"=>"ts","ч"=>"ch","ш"=>"sh","щ"=>"sch","ъ"=>"",
			"ы"=>"yi","ь"=>"","э"=>"e","ю"=>"yu","я"=>"ya", 
			" "=> "_","+"=>"_plus_","!"=>"_i_","%20"=>"_","Ё"=>"IO","ё"=>"io"
		);
		return strtr($str,$tr);
	}
}	
?>