<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta name="yandex-verification" content="881aceead0c4de53"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $title;  ?></title>
    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <meta property="og:title" content="<?php echo $title; ?>"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="<?php echo $og_url; ?>"/>
    <?php if ($og_image) { ?>
    <meta property="og:image" content="<?php echo $og_image; ?>"/>
    <?php } else { ?>
    <meta property="og:image" content="<?php echo $logo; ?>"/>
    <?php } ?>
    <meta property="og:site_name" content="<?php echo $name; ?>"/>
    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <?php
    // enable script on page product

    $pos = strpos($class, 'product-product');
    if($pos !== false) { ?>
    <link href="catalog/view/theme/theme/stylesheet/select2.min.css" rel="stylesheet">

    <?php } ?>
    <!-- <link href="catalog/view/theme/theme/stylesheet/stylesheet.css" rel="stylesheet"> -->
    <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
    <link href="catalog/view/theme/theme/stylesheet/style.css?ver=3.0" rel="stylesheet">


    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
          media="<?php echo $style['media']; ?>"/>
    <?php } ?>

    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>

    <?php foreach ($analytics as $analytic) { ?>
    <?php echo $analytic; ?>
    <?php } ?>
</head>
<body class="<?php echo $class; ?>">


<div id="top-bar">
    <div class="container">
        <div class="row">
            <div class="f-b col-md-6 col-sm-6  hidden-xs">
                <?php echo $language; ?>
                <ul class="list-information">
                    <li>
                        <img src="/catalog/view/theme/theme/image/main/icon-maps.png" alt="Иконка "/>
                        <p>
                            <?php echo $top_region; ?>
                        </p>
                    </li>
                    <li>
                        <a href="/shops">
                            <img src="/catalog/view/theme/theme/image/main/icon-home.png" alt="Иконка "/>
                            <p>
                                <?php echo $top_shops; ?>

                            </p>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="s-b col-md-6 col-sm-6 col-xs-12">
                <div class="work-time">
                    <?php echo $work_time_redy; ?>
                </div>
                <ul class="navigation text-right">
                    <?php if ($logged) { ?>
                    <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                    <li>
                        /
                    </li>
                    <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                    <?php } else { ?>
                    <li>
                        <a href="<?php echo $login; ?>">
                            <?php echo $top_login_text; ?>
                        </a>

                    </li>
                    <li>
                        /
                    </li>
                    <li>
                        <a href="<?php echo $register; ?>">

                            <?php echo $top_register_text; ?>
                        </a>
                    </li>
                    <?php } ?>
                </ul>
            </div>
        </div>
    </div>
</div>

<header>
    <div class="container">
        <div class="row">
            <div class="col-sm-3 col-xs-12">
                <div id="logo">
                    <?php if ($logo) { ?>
                    <?php if ($home == $og_url) { ?>
                    <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>"
                         class="img-responsive"/>
                    <?php } else { ?>
                    <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>"
                                                        alt="<?php echo $name; ?>" class="img-responsive"/></a>
                    <?php } ?>
                    <?php } else { ?>
                    <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                    <?php } ?>
                </div>
            </div>
            <div class="col-sm-9 col-xs-12">
                <div class="top">
                    <div class="phone-block">
                        <img src="/catalog/view/theme/theme/image/main/phone.png" alt="Иконка "/>
                        <ul class="lists-phones">
                            <li>
                                <a href="tel:+79175438587">
                                    +7 917 543-85-87
                                </a>
                            </li>
                        </ul>

                    </div>
                    <div class="request-call-block">
                        <div class="link-call">
                            <?php echo $sobfeedback_id34; ?>
                        </div>
                    </div>
                    <div class="cart-block">
                        <?php echo $cart; ?>
                        <a href="/wishlist/" class="wish-block">
                            <img src="/catalog/view/theme/theme/image/main/wish-icon.png" alt="Иконка "/>
                            <span class="count">
                                <?php echo $text_wishlist; ?>
                            </span>
                            <p>
                                <?php echo $top_wish_text; ?>
                            </p>
                        </a>
                    </div>
                </div>
                <div class="bottom">
                    <?php
                if(isset($categories) && !empty($categories)){  ?>
                    <div class="top-category-page-category">
                        <div class="heading">
                            <p><?php echo $top_catalog; ?></p>
                            <img src="/catalog/view/theme/theme/image/main/bar.png" alt="Иконка ">
                        </div>
                        <div class="list-group drop-down">

                            <?php foreach ($categories as $category) { ?>
                            <?php if ($category['top'] == '1') { ?>
                            <?php if ($category['category_id'] == $category_id) { ?>
                            <a href="<?php echo $category['href']; ?>"  class="list-group-item active"><?php echo $category['name']; ?></a>
                            <?php if ($category['children']) { ?>
                            <?php foreach ($category['children'] as $child) { ?>
                                <?php if ($child['top'] == '1') { ?>
                                <?php if ($child['category_id'] == $child_id) { ?>
                                <a href="<?php echo $child['href']; ?>"
                                   class="list-group-item active">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $child['href']; ?>"
                                   class="list-group-item">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
                                <?php } ?>

                                <?php } ?>
                            <?php } ?>
                            <?php } ?>
                            <?php } else { ?>
                            <a href="<?php echo $category['href']; ?>"
                               class="list-group-item"><?php echo $category['name']; ?></a>
                            <?php } ?>
                            <?php } ?>
                            <?php } ?>
                        </div>
                    </div>

                    <?php }  ?>

                    <?php echo $search; ?>
                </div>

            </div>
        </div>
    </div>

</header>

