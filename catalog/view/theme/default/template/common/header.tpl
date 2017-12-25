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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php if ($title != "heading_title") { ?>
        <title><?php echo $title; ?></title>

    <?php } ?>

    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
        <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <?php if ($icon) { ?>
        <link href="<?php echo $icon; ?>" rel="icon"/>
    <?php } ?>
    <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>
    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <?php if ($direction == 'rtl') { ?>
        <link href="catalog/view/javascript/bootstrap/css/bootstrap.min-rtl.css" rel="stylesheet" media="screen"/>
    <?php } else { ?>
        <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
    <?php } ?>
    <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <?php if ($direction == 'rtl') { ?>
        <link href="catalog/view/javascript/font-awesome/css/font-awesome.min-rtl.css" rel="stylesheet"
              type="text/css"/>

    <?php } else { ?>
        <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <?php } ?>
    <?php if ($direction == 'rtl') { ?>
        <link href="catalog/view/theme/default/stylesheet/stylesheet-rtl.css" rel="stylesheet">
        <link href="catalog/view/theme/default/stylesheet/c1.css" rel="stylesheet">
    <?php } else { ?>
        <link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css"/>
        <link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
    <?php } ?>
    <?php foreach ($styles as $style) { ?>
        <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
              media="<?php echo $style['media']; ?>"/>
    <?php } ?>
    <?php if ($direction == 'rtl') { ?>
        <script src="catalog/view/javascript/j1.js" type="text/javascript"></script>
        <script src="catalog/view/javascript/common-rtl.js" type="text/javascript"></script>

    <?php } else { ?>
        <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
        <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?>">

<header>
    <div id="top">
        <div class="container">
            <?php //echo $currency; ?>
            <div id="top-links" class="nav text-center">
                ارسال رایگان به سراسر ایران
            </div>
        </div>
    </div>


    <!-- this will show when scrol is down -->

    <div style="background-color: white;" id="fixed">
        <div class="container row">
            <div class="col-xs-6">
                <div class="hand pull-left">
                    <?php echo $cart; ?>

                    <?php if (!$islogin): ?>
                        <div class="dropdown displayInline">
                            <img class="marginok" data-toggle="dropdown" width="20px" height="20px"
                                 src="<?php echo $user_icon; ?>"/>
                            <div class="dropdown-menu topLogin text-justify">
                                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label class="control-label"
                                               for="input-email"><?php echo $entry_email; ?></label>
                                        <input type="text" name="email" value="<?php echo $email; ?>"
                                               placeholder="<?php echo $entry_email; ?>" id="input-email"
                                               class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label"
                                               for="input-password"><?php echo $entry_password; ?></label>
                                        <input type="password" name="password" value="<?php echo $password; ?>"
                                               placeholder="<?php echo $entry_password; ?>" id="input-password"
                                               class="form-control"/>
                                        <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
                                    <input type="submit" value="<?php echo $button_login; ?>" class="mybtn"/>
                                    <?php if ($redirect) { ?>
                                        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>"/>
                                    <?php } ?>
                                    با ایجاد یک حساب کاربری میتوانید سریع تر خرید نمایید. تاریخچه سفارشات خود را دیده و
                                    همچنین از وضعیت سفارش خود آگهی پیدا نمایید.
                                    <input value="<?php echo $text_register; ?>" type="button" class="mybtn"
                                           onclick="location.href = '<?php echo $register; ?>'">
                                </form>
                            </div>
                        </div>
                    <?php else: ?>
                        <a href="<?php echo $account_url; ?>"><img width="20px" height="20px"
                                                                   src="<?php echo $user_icon; ?>"/>
                            درود <?php echo $firstname; ?>  </a> |
                        <a href="<?php echo $logout_url; ?>"> خروج</a>

                    <?php endif; ?>
                </div>
            </div>
            <div class="col-xs-6">
                <div class="pull-right">
                    <?php echo $language; ?>
                </div>
            </div>
        </div>

        <div id="logo" class="row">
            <div class="col-xs-12 col-sm-3 col-md-5"></div>
            <div class="col-xs-12 col-sm-6 col-md-2">
                <?php if ($logo) { ?>
                    <a href="<?php echo $home; ?>">
                        <img width="200px" id="logo_img" src="<?php echo $logofix; ?>" title="<?php echo $name; ?>"
                             alt="<?php echo $name; ?>"
                             class="img-responsive"/>
                    </a>
                <?php } else { ?>
                    <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                <?php } ?>
            </div>
            <div class="col-xs-12 col-sm-3 col-md-5"></div>
        </div>


        <nav class="navbar navbar-default mynavbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav header-navbar-nav">
                        <li><a href="#">خانه</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">کلکسیون<span
                                    class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <?php foreach ($categories as $categoryy) { ?>
                                            <div class="menu-collection-row"
                                                 onmouseover="$('#header_img').attr('src', '<?php echo $categoryy['image']; ?>')">
                                                <a href="<?php echo $categoryy['href']; ?>"><?php echo $categoryy['name']; ?></a>
                                            </div>
                                        <?php } ?>
                                    </div>
                                    <div class="col-sm-6 hidden-xs"><img id="header_img"
                                                                         src="<?= $categories[0]['image'] ?>">
                                    </div>
                                </div>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">راهنمای خرید<span
                                    class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <div class="row">
                                    <div class="col-sm-6">

                                        <div class="menu-collection-row"
                                             onmouseover="$('#rahnamayekharidImg').attr('src', 'image/catalog/test.jpg')">
                                            <a href="index.php?route=information/information&information_id=5">نحوه
                                                سفارش</a>
                                        </div>
                                        <div class="menu-collection-row"
                                             onmouseover="$('#rahnamayekharidImg').attr('src', 'image/catalog/test2.jpg')">
                                            <a href="index.php?route=information/information&information_id=9">شرایط
                                                ارسال</a>
                                        </div>

                                    </div>
                                    <div class="col-sm-6 hidden-xs"><img id="header_img"
                                                                         src="http://localhost/aa/image/catalog/test.jpg">
                                    </div>
                                </div>
                            </ul>
                        </li>
                        <li><a href="index.php?route=information/information&information_id=4">درباره ما</a>
                        <li class="hidden-xs">
                            <div class="input-group stylish-input-group">
                            <span class="input-group-addon">
                                <button type="submit"><span class="glyphicon glyphicon-search"></span></button>
                            </span>


                                <input type="text" id="search_header" onkeyup="searchAjax()" onfocus="searchAjax(1)"
                                       onblur="$('#searchResult').fadeOut(300)"
                                       class="form-control dropdown-toggle"
                                       placeholder="جستجو">
                                <ul id="searchResult" class="results dropdown-menu header-dropdown-menu">


                                </ul>


                            </div>

                        </li>
                    </ul>

                </div>
            </div>
        </nav>


<!--        <script>-->
<!--            -->
<!--            $('ul.nav li.dropdown').hover(function () {-->
<!--                $(this).find('.dropdown-menu').stop(true, true).delay(100).fadeIn(100);-->
<!--            }, function () {-->
<!--                $(this).find('.dropdown-menu').stop(true, true).delay(100).fadeOut(100);-->
<!--            });-->
<!--        </script>-->


    </div>


    <script>
        //        var setedHeight = 270;
        //        var setHeight = '#menuDiv';
        //        $(".dummy").on("show.bs.dropdown", function (event) {
        //            $(setHeight).height(270);
        //        });
        //
        //
        //        $(".dummy").on("hide.bs.dropdown", function (event) {
        //            $('#menuDiv').height(40);
        //        });
        var globalTimeout = null;
        function searchAjax(isfocus=0) {


            clearTimeout(globalTimeout);

            var searchText = $("#search_header").val();
            if(isfocus==1 && searchText!=""){
                $('#searchResult').fadeIn(0);


                return;
            }
            if (searchText != "") {


                $('#searchResult').html("<div class='text-center'> <img src='image/sal.gif'></div>");
                $('#searchResult').fadeIn(0);
            } else if(searchText==""){


                $('#searchResult').fadeOut(0);
                return;
            }
            globalTimeout = setTimeout(function () {


                globalTimeout = null;

                $.post("<?php echo $server; ?>index.php?route=common/header/searchAjax", {searchText: searchText}, function (html) {

                    $("#searchResult").html(html);
                });

            }, 700);

        }
    </script>

    <!-- Second Menue when width<600 show it -->

    <!--
                    <div id="setHeight" class="navbar navbar-default mynav" role="navigation">
                        <div class="collapse navbar-collapse  navbar-ex1-collapse">
                            <ul class="nav navbar-nav">
                                <li><a class="" href="#" onclick="doheightNavDiv()">خانه</a></li>
                                <li id="colection" class="dropdown" onclick="doheight('#colection', '#getHeight', '#setHeight')">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">کلکسیون</a>
                                    <ul id="getHeight" class="dropdown-menu myDropDownMenu">
                                        <div class="col-md-6">
                                            <div onmouseover="change_menu_picture()">1مانتو پالتو</div>
                                            <div>2مانتو پالتو</div>
                                            <div>مانتو پالتو3</div>
                                            <div>مانتو پالتو4</div>
                                        </div>
                                        <div class="col-md-6">
                                            <img src="">
                                        </div>
                                    </ul>
                                </li>
                                <li id="colection2" class="dropdown" onclick="doheight('#colection2', '#getHeight2', '#setHeight')">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">راهنمای خرید</a>
                                    <ul id="getHeight2" class="dropdown-menu myDropDownMenu">
                                        <li><a href="#">مانتو</a></li>
                                        <li><a href="#">پالتو</a></li>

                                    </ul>
                                </li>
                                <li><a class="" href="#" onclick="doheightNavDiv()">درباره ما</a></li>

                            </ul>
                        </div>
                    </div>








    <!--
    <?php if ($categories) { ?>
                                                                                        <nav id="menu" class="navbar">
                                                                                            <div class="container">
                                                                                                <div class="navbar-header">
                                                                                                    <span id="category" class="visible-xs"><?php echo $text_category; ?></span>
                                                                                                    <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
                                                                                                </div>
                                                                                                <div class="collapse navbar-collapse navbar-ex1-collapse">
                                                                                                    <ul class="nav navbar-nav">
        <?php $counter = 0; ?>
        <?php foreach ($categories as $category) { ?>
            <?php
        if ($category['children']) {
            $counter++;
            ?>
                                                                                                                                                                                                                        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
                                                                                                                                                                                                                        <div class="dropdown-menu">
                                                                                                                                                                                                                        <div class="dropdown-inner">

                <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                                                                                                                                                                                                                <ul class="list-unstyled">
                                                                                                                                                                                                                                <div class="row">
                                                                                                                                                                                                                                <div class="col-md-5">
                    <?php foreach ($children as $child) { ?>
                                                                                                                                                                                                                                        <li>
                                                                                                                                                                                                                                        <a onmouseover="changeMenuImage('<?php echo 'myimage' . $counter; ?>', '<?php echo $child['image']; ?>')" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?>  </a>
                                                                                                                                                                                                                                        </li>
                    <?php } ?>
                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                <div class="col-md-7">
                                                                                                                                                                                                                                <img id="myimage<?php echo $counter; ?>" style="width: 200px; height: 200px;" src="" />
                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                </ul>
                <?php } ?>

                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                        <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a>
                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                        </li>
            <?php } else { ?>
                                                                                                                                                                                                                        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
        <?php } ?>
                                                                                                    </ul>
                                                                                                </div>
                                                                                            </div>
                                                                                        </nav>



                                                                                        <div class="col-sm-5"><?php echo $search; ?>
                                                                                        </div>



    <?php } ?>



    -->


</header>
<!--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Small Modal</button>-->

<!-- Modal -->
<div class="modal fade" id="cartModal" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">نتیجه</h4>
            </div>
            <div class="modal-body">
                <p>کالا با موفقیت به سبد خرید شما افزوده شد</p>
            </div>
            <div class="modal-footer text-center" style="text-align: center">
                <a type="button" href="index.php?route=checkout/cart" class="btn btn-default" data-dismiss="modal">مشاهده سبد خرید</a>
                <button type="button" class="btn btn-default" data-dismiss="modal">بستن</button>
            </div>
        </div>
    </div>
</div>
