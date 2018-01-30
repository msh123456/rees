<?php echo $header; ?>
<div class="container" id="mycontainer" style="padding-top: 45px;">
    <div style="font-size: 11px;">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>  <span
                class="bread"> > </span>
        <?php } ?>
    </div>
    <div class="row" style="margin-bottom: 45px;">
        <div class="col-sm-4 col-md-3 col-xs-12 col-lg-3 bascket_line_height">
            <div class="title" style="margin-top: 40px; font-size: 25px;"><?php echo $heading_title; ?></div>
            <div class="code" style="font-size: 19px;"><?php echo $text_model; ?><?php echo $model; ?> </div>
            <div class="price" style="font-size: 19px;">


                <?php if ($special == null): ?>
                    <?= $price ?>
                <?php else: ?>

                    <div class="price_vije_margin" style="color: red; display: inline-block">
                        <?= $percent; ?>
                    </div>
                    <div class="price_vije_margin"
                         style="color: black; text-decoration: line-through; display: inline-block">
                        <?= str_replace("تومان", "", $price); ?>
                    </div>
                    <div class="text-center p2_margin_pro_details price_vije_margin"
                         style="color: black; text-decoration: none; display: inline-block;"><?php echo $special; ?>
                    </div>

                <?php endif; ?>


            </div>
            <div class="mojoodi"> <?php echo $mojoodi; ?></div>
            <!--            --><?php //if ($tax) { ?>
            <!--                --><?php //echo $text_tax; ?><!----><?php //echo $tax; ?>
            <!--            --><?php //} ?>


            <div id="product" style="margin-top: 56px;">
                <?php if ($options) { ?>

                    <!--<h3><?php echo $text_option; ?></h3>-->
                    <?php foreach ($options as $option) { ?>
                        <?php if ($option['type'] == 'select') { ?>
                            <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label"
                                       for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                <select name="option[<?php echo $option['product_option_id']; ?>]"
                                        id="input-option<?php echo $option['product_option_id']; ?>"
                                        class="form-control">
                                    <option value=""><?php echo $text_select; ?></option>
                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                        <option
                                            value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                            <?php if ($option_value['price']) { ?>
                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                            <?php } ?>
                                        </option>
                                    <?php } ?>
                                </select>
                            </div>
                        <?php } ?>


                        <?php if ($option['type'] == 'radio' && ($option['name'] != "سایز" && $option['name'] != "size")) { ?>
                            <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label"><?php echo $option['name']; ?></label>
                                <div id="input-option<?php echo $option['product_option_id']; ?>">
                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                        <div class="radio">
                                            <label>
                                                <input type="radio"
                                                       name="option[<?php echo $option['product_option_id']; ?>]"
                                                       value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                <?php echo $option_value['name']; ?>
                                                <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                <?php } ?>
                                            </label>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                        <?php } ?>


                        <?php if ($option['type'] == 'radio' && ($option['name'] == "سایز" || $option['name'] == "size")) { ?>
                            <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                <!--<label class="control-label"><?php echo $option['name']; ?></label>-->
                                <table style="width: 100%; line-height: 34px;">
                                    <tr id="input-option<?php echo $option['product_option_id']; ?>">
                                        <td class="td1">
                                            <div>
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                    <?php if ($option_value['quantity'] > 0) { ?>
                                                        <?php if ($option_value['name'] == "تک سایز"): ?>
                                                            <label disabled="bigh" class=""
                                                                   style="cursor: pointer;">
                                                                <input style="display: none" type="radio"
                                                                       name="option[<?php echo $option['product_option_id']; ?>]"
                                                                       value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                <?php echo $option_value['name']; ?>
                                                                <!--
                                                            <?php if ($option_value['price']) { ?>
                                                                                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                            <?php } ?>
                                                            -->
                                                            </label>
                                                        <?php else: ?>
                                                            <label disabled="bigh" class="op2"
                                                                   style="background-image: url('<?php echo $product_background_icon; ?> '); cursor: pointer;">
                                                                <input style="display: none" type="radio"
                                                                       name="option[<?php echo $option['product_option_id']; ?>]"
                                                                       value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                <?php echo $option_value['name']; ?>
                                                                <!--
                                                            <?php if ($option_value['price']) { ?>
                                                                                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                            <?php } ?>
                                                            -->
                                                            </label>
                                                        <?php endif; ?>
                                                    <?php } else if ($option_value['quantity'] == 0) { ?>
                                                        <label disabled="disabled" class="op2"
                                                               style="background-image: url('<?php echo $no_product_background_icon; ?> '); cursor: not-allowed;">
                                                            <input disabled="disabled" style="display: none"
                                                                   type="radio"
                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                   value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                            <?php echo $option_value['name']; ?>
                                                            <!--
                                                            <?php if ($option_value['price']) { ?>
                                                                                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                            <?php } ?>
                                                            -->
                                                        </label>
                                                    <?php } ?>
                                                <?php } ?>
                                            </div>
                                        </td>
                                        <td class="td2">
                                            سایزهای موجود
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        <?php } ?>


                        <?php if ($option['type'] == 'checkbox') { ?>
                            <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label"><?php echo $option['name']; ?></label>
                                <div id="input-option<?php echo $option['product_option_id']; ?>">
                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"
                                                       name="option[<?php echo $option['product_option_id']; ?>][]"
                                                       value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                <?php echo $option_value['name']; ?>
                                                <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                <?php } ?>
                                            </label>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'image') { ?>
                            <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label"><?php echo $option['name']; ?></label>
                                <div id="input-option<?php echo $option['product_option_id']; ?>">
                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                        <div class="radio">
                                            <label>
                                                <input type="radio"
                                                       name="option[<?php echo $option['product_option_id']; ?>]"
                                                       value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                <img src="<?php echo $option_value['image']; ?>"
                                                     alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                                     class="img-thumbnail"/> <?php echo $option_value['name']; ?>
                                                <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                <?php } ?>
                                            </label>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'text') { ?>
                            <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label"
                                       for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                       value="<?php echo $option['value']; ?>"
                                       placeholder="<?php echo $option['name']; ?>"
                                       id="input-option<?php echo $option['product_option_id']; ?>"
                                       class="form-control"/>
                            </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'textarea') { ?>
                            <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label"
                                       for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5"
                                          placeholder="<?php echo $option['name']; ?>"
                                          id="input-option<?php echo $option['product_option_id']; ?>"
                                          class="form-control"><?php echo $option['value']; ?></textarea>
                            </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'file') { ?>
                            <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label"><?php echo $option['name']; ?></label>
                                <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>"
                                        data-loading-text="<?php echo $text_loading; ?>"
                                        class="btn btn-default btn-block"><i
                                        class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                                <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value=""
                                       id="input-option<?php echo $option['product_option_id']; ?>"/>
                            </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'date') { ?>
                            <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label"
                                       for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                <div class="input-group date">
                                    <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                           value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD"
                                           id="input-option<?php echo $option['product_option_id']; ?>"
                                           class="form-control"/>
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button"><i
                                                class="fa fa-calendar"></i></button>
                                    </span></div>
                            </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'datetime') { ?>
                            <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label"
                                       for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                <div class="input-group datetime">
                                    <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                           value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm"
                                           id="input-option<?php echo $option['product_option_id']; ?>"
                                           class="form-control"/>
                                    <span class="input-group-btn">
                                        <button type="button" class="btn btn-default"><i
                                                class="fa fa-calendar"></i></button>
                                    </span></div>
                            </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'time') { ?>
                            <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label"
                                       for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                <div class="input-group time">
                                    <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                           value="<?php echo $option['value']; ?>" data-date-format="HH:mm"
                                           id="input-option<?php echo $option['product_option_id']; ?>"
                                           class="form-control"/>
                                    <span class="input-group-btn">
                                        <button type="button" class="btn btn-default"><i
                                                class="fa fa-calendar"></i></button>
                                    </span></div>
                            </div>
                        <?php } ?>
                    <?php } ?>
                <?php } ?>
                <?php if ($recurrings) { ?>
                    <h3><?php echo $text_payment_recurring ?></h3>
                    <div class="form-group required">
                        <select name="recurring_id" class="form-control">
                            <option value=""><?php echo $text_select; ?></option>
                            <?php foreach ($recurrings as $recurring) { ?>
                                <option
                                    value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                            <?php } ?>
                        </select>
                        <div class="help-block" id="recurring-description"></div>
                    </div>
                <?php } ?>
                <div class="form-group">
                    <label class="control-label" for="input-quantity"
                           style="display: none"><?php echo $entry_qty; ?></label>
                    <input style="display: none" type="text" name="quantity" value="<?php echo $minimum; ?>" size="2"
                           id="input-quantity" class="form-control"/>
                    <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
                    <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>"
                            class=" btn-small btn-block btn_add_to_cart"><?php echo $button_cart; ?></button>
                </div>
                <?php if ($minimum > 1) { ?>
                    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
                <?php } ?>
            </div>

            <?php if (count($attribute_groups) > 0) { ?>
                <h4 style="margin-top: 35px;">توضیحات</h4>
            <?php } ?>
            <div class="explainDiv row">
                <div class=" col-xs-12">
                    <?php if (count($attribute_groups) > 0) { ?>
                        <div style="max-width: 100%">
                            <table class="text-left table">
                                <tbody>
                                <?php foreach ($attribute_groups as $attribute) { ?>
                                    <tr>
                                        <td>
                                            <b><?= $attribute['name'] ?>:</b>
                                        </td>
                                        <?php foreach ($attribute['attribute'] as $attr): ?>
                                            <td>
                                                <?= " " . $attr['name'] . "  " . $attr['text'] ?>
                                            </td>
                                        <?php endforeach; ?>
                                    </tr>
                                <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    <?php } ?>
                </div>

            </div>


        </div>

        <div class="col-sm-8 col-md-9 col-xs-12 col-lg-9">
            <div class="row hidden-xs hidden-sm ">
                <div class="col-xs-9">
                    <div><img class="mbp" id='modal_big_pic<?php echo $data['product_id']; ?>' width="100%"></div>
                </div>
                <div class="col-xs-3 text-center" id='get_height<?php echo $data['product_id']; ?>'>
                    <?php
                    $c = 0;
                    foreach ($data['product_images'] as $image) {
                        ?>
                        <div class="<?php
                        if ($c++ == 0)
                            echo ' first ';
                        ?> bascket_margin_padding hand modal_small_pic modal_right_border"
                             onclick="$('.arrow_box').removeClass('arrow_box');
                                 $(this).addClass('arrow_box');
                                 $('#modal_big_pic<?php echo $data['product_id']; ?>').attr('src', '<?php echo $image['image']; ?>');">
                            <img class="bascket_right_border " width="88px" src="<?php echo $image['image']; ?>">
                        </div>
                    <?php } ?>
                </div>
            </div>
            <script>
                $("#myCarousel").carousel()
            </script>

            <div class="row hidden-lg hidden-md ">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <?php $c = 0;
                        foreach ($images as $image): ?>
                            <li data-target="#myCarousel" data-slide-to="<?= $c ?>"
                                class="<?php if ($c++ == 0) echo 'active'; ?>"></li>
                        <?php endforeach; ?>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <?php $c = 0;
                        foreach ($images as $image): ?>
                            <div class="item <?php if ($c++ == 0) echo 'active'; ?>">
                                <img
                                    src="<?= 'image/' . $image['thumb'] ?>"
                                    alt="تصویر محصول">
                            </div>
                        <?php endforeach; ?>
                    </div>

                    <!-- Left and right controls -->

                    <a class="left carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <?php if ($products): ?>
    <div class="cdiv">
        <span class="cspan2">کالاهای مرتبط</span>
    </div>

    <div class="row mortabet">

<?php foreach($products as $product): ?>

        <?php include 'productModal.php'; ?>
    <div class="col-lg-15 col-md-15 col-sm-3 col-xs-6 featurePadding">
<?php require "singleProductView.php"; ?>
    </div>

            <?php endforeach; ?>

</div>
<?php endif; ?>

</div>
<?php echo $footer; ?>

<script type="text/javascript">
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function () {
                $('#recurring-description').html('');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
</script>

<script type="text/javascript">
    $('#button-cart').on('click', function () {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function () {
                $('#button-cart').button('loading');
            },
            complete: function () {
                $('#button-cart').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    var x = $("#mycart").text();

                    x = parseInt(x);
                    x++;
                    $("#mycart").text(x);
                    $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);
                    $("#cartModal").modal("toggle");
                    $('html, body').animate({scrollTop: 0}, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            }
        });
    });
</script>
<script type="text/javascript">
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('button[id^=\'button-upload\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function () {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        $(node).button('loading');
                    },
                    complete: function () {
                        $(node).button('reset');
                    },
                    success: function (json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').attr('value', json['code']);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
</script>
<script type="text/javascript">
    $('#review').delegate('.pagination a', 'click', function (e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function () {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-review").serialize(),
            beforeSend: function () {
                $('#button-review').button('loading');
            },
            complete: function () {
                $('#button-review').button('reset');
            },
            success: function (json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                }
            }
        });
    });

    $(document).ready(function () {
        $('.thumbnails').magnificPopup({
            type: 'image',
            delegate: 'a',
            gallery: {
                enabled: true
            }
        });
    });
</script>
