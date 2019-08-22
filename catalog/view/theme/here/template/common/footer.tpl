            </div>
        </div>
    </div>
</div>

<footer>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 col-xl-8 offset-xl-3">
                <div class="footer__top">
                    <?php if ($footer_categories) { ?>
                    <ul class="bottom__menu d-flex align-content-center">
                        <?php foreach($footer_categories as $footer){ ?>
                        <li><a href="<?php echo $footer['href']; ?>"><?php echo $footer['name']; ?></a></li>
                        <?php } ?>
                    </ul>
                    <?php } ?>
                </div>
                <div class="footer__bottom">
                    <div class="footer__contacts">
                        <?php echo $schedule; ?>
                    </div>
                    <div class="footer__power">
                        <?php echo $powered; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- The desktop menu -->
<?php if ($categories) { ?>
<div class="d-none d-xl-block col-xl-3 p-0 menu__left">
    <nav id="nav" style="display: none;">
        <!--<div class="title__block">Категории товаров:</div>-->
        <ul>
            <?php foreach ($categories as $category) { ?>
            <?php if ($category['children']) { ?>
            <li class="dropdown__parent">
                <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                <ul class="dropdown__menu">
                    <?php foreach ($children as $child) { ?>
                    <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                    <?php } ?>
                </ul>
                <?php } ?>
            </li>
            <?php } else { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
            <?php } ?>
            <li class="action__li"><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
    </nav>
</div>
<?php } ?>

<!-- The mobile menu -->
<nav id="menu">
    <ul>
        <?php if ($categories) { ?>
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li>
            <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
            <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
            <ul>
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
            </ul>
            <?php } ?>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
        <?php } ?>
        <li class="action__li"><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
    </ul>
</nav>
</body>
</html>
