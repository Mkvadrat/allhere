<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>

<link rel="stylesheet" href="/catalog/view/theme/here/css/bootstrap.css">
<link rel="stylesheet" href="/catalog/view/theme/here/css/mmenu.css">
<link rel="stylesheet" href="/catalog/view/theme/here/css/mburger.css">
<link rel="stylesheet" href="/catalog/view/theme/here/css/owl.carousel.min.css">
<link rel="stylesheet" href="/catalog/view/theme/here/css/custom.css">
<link rel="stylesheet" href="/catalog/view/theme/here/css/media.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.css">
<link rel="stylesheet" href="/catalog/view/theme/here/css/sweetalert.css">
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/catalog/view/theme/here/js/bootstrap.js"></script>
<script src="/catalog/view/theme/here/js/mmenu.js"></script>
<script src="/catalog/view/theme/here/js/owl.carousel.min.js"></script>
<script src="/catalog/view/theme/here/js/owl.carousel2.thumbs.min.js"></script>
<script src="/catalog/view/theme/here/js/custom.js"></script>
<script src="/catalog/view/theme/here/js/here.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.js"></script>
<script src="/catalog/view/theme/here/js/sweetalert.min.js" type="text/javascript"></script>

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">
<!-- The page -->
<div class="page">
  <header class="header fixed-top">
    <div class="container-fluid">
      <div class="row">
        <div class="col-6 col-xl-3">
          <div class="top__phone">
              <div class="phone"><?php echo $telephone; ?></div>
              <div class="site__name d-none d-md-block"><?php echo $name; ?></div>
          </div>
        </div>
        <div class="col-6 d-none d-xl-block">
          <?php if ($categories) { ?>
          <ul class="top__menu d-flex align-content-center justify-content-between">
            <?php foreach ($categories as $category) { ?>
            <?php if ($category['children']) { ?>
            <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
              <div class="dropdown-menu">
                <div class="dropdown-inner">
                  <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                  <ul class="list-unstyled">
                    <?php foreach ($children as $child) { ?>
                    <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                    <?php } ?>
                  </ul>
                  <?php } ?>
                </div>
                <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
            </li>
            <?php } else { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
        </div>
        <div class="col-md-5 col-xl-2 d-none d-md-block">
          <div class="top__address text-right">
            <?php echo $address; ?>
          </div>

        </div>
        <div class="logo__block">
          <?php if ($logo) { ?>
          <a class="logo" href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a class="logo" href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>

          <a href="#menu" class="mburger mburger--tornado Fixed">
              <b></b>
              <b></b>
              <b></b>
          </a>
        </div>
      </div>
    </div>
  </header>
  
  <div class="main">
    <div class="container-fluid">
      <div class="row">
        <div class="col-12 col-xl-8 offset-xl-3">
          <div class="content__header">
            
            <div id="content"></div>
            
            <?php echo $search; ?>
            
            <div class="login__block">
                <div class="wish__block">
                  <div class="btn btn-circle">
                    <img src="/catalog/view/theme/here/image/star.svg" alt="wish"/>
                    <a href="<?php echo $wishlist; ?>" id="wishlist-total"><span><?php echo $text_wishlist; ?></span></a>
                  </div>
                </div>
                <div class="log__block0">
                  <div class="btn btn-circle">
                    <?php if ($logged) { ?>
                      <img src="/catalog/view/theme/here/image/user.svg" alt="user"/>
                      <a href="<?php echo $account; ?>"><span>Личный кабинет</span></a>/
                      <a href="<?php echo $logout; ?>"><span><?php echo $text_logout; ?></span></a>
                    <?php } else { ?>
                      <img src="/catalog/view/theme/here/image/user.svg" alt="user"/>
                      <a href="<?php echo $login; ?>"><span>Войти</span></a>
                    <?php } ?>
                  </div>
                </div>
            </div>
            
            <?php echo $cart; ?>
          </div>