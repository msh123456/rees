<div id="myModal<?= $product['product_id']; ?>" class="modal fade" role="dialog">
    <div class="modal-dialog modal-width">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header mymodal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>

            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-4 col-lg-3 col-sm-12 col-xs-12" style="line-height: 30px">
                        <div class="t1">
                            <p><?php echo $product['name']; ?></p>
                        </div>
                        <div class="t2">
                            <p>کد:<?php echo $product['model']; ?></p>
                        </div>
                        <div class="t3">
                            <p>
	
	
	
	
	
	
										 <?php if ($product['special'] == null): ?>
											 <?= $product['price'] ?>
										 <?php else: ?>

                            <div class="price_vije_margin" style="color: red; display: inline-block">
										 <?= $product['percent']; ?>
                            </div>
                            <div class="price_vije_margin"
                                 style="color: black; text-decoration: line-through; display: inline-block">
										 <?= str_replace("تومان", "", $product['price']); ?>
                            </div>
                            <div class="text-center p2_margin_pro_details price_vije_margin"
                                 style="color: black; text-decoration: none; display: inline-block;"><?php echo $product['special']; ?>
                            </div>
	
									<?php endif; ?>













                            </p>
                        </div>
                        <div class="t35">
                            <p><?php echo $product['mojoodi']; ?></p>
                        </div>
                        <?php $ToltalProductCount = 0; ?>
                        <?php foreach ($product['options'] as $option) ?>
                        <?php if ($option['name'] == "سایز" || $option['name'] == "size") ?>
                        <?php foreach ($option['product_option_value'] as $option_value) ?>
                        <?php if ($option_value['quantity'] > 0) $ToltalProductCount++; ?>

                        <div class="t4">
                            <?php if ($ToltalProductCount > 0) { ?>
                                <?php foreach ($product['options'] as $option) { ?>
                                    <?php if ($option['name'] == "سایز" || $option['name'] == "size") { ?>
                                        <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                            <!--<label class="control-label"><?php echo $option['name']; ?></label>-->
                                            <table style="width: 100%">
                                                <tr>
                                                    <td class="td1">
                                                        <div
                                                            id="input-option<?php echo $option['product_option_id']; ?>">
                                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                <?php if ($option_value['quantity'] > 0) { ?>
                                                                    <?php if ($option_value['name'] == "تک سایز"): ?>
                                                                        <label disabled="bigh" class=""
                                                                               style="cursor: pointer;">
                                                                            <input style="display: none" type="radio"
                                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                   value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                            <?php echo $option_value['name']; ?>

                                                                        </label>
                                                                    <?php else: ?>
                                                                        <label disabled="bigh" class="op3"
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
                                                                    <label disabled="disabled" class="op3"
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


                                <?php } ?>
                            <?php } ?>
                        </div>
                        <?php if (isset($product['attributes']) && count($product['attributes']) > 0) { ?>

                            <h4 class="h4">توضیحات</h4>
                        <?php } ?>


                        <div class="explainDiv row">
                            <div class=" col-xs-12">
                                <?php if (isset($product['attributes']) && count($product['attributes']) > 0) { ?>
                                    <div style="max-width: 100%">
                                        <table class="text-left table">
                                            <tbody>
                                            <?php foreach ($product['attributes'] as $attribute) { ?>
                                                <tr>
                                                    <td>
                                                        <b><?= $attribute['name'] ?>:</b>
                                                    </td>
                                                    <?php foreach ($attribute['attribute'] as $attr): ?>
                                                        <td>
                                                            <?= " " . $attr['name'] . " - " . $attr['text'] ?>
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
                        <!--                        explain field in admin pannel shows here in UI-->
                        <!--                        <div class="t5">-->
                        <!---->
                        <!--                            --><?php //echo $product['description']; ?>
                        <!--                        </div>-->
                    </div>


                    <div class="row hidden-lg hidden-md  text-center" style="margin-right: 5px; margin-left: 5px">
                        <div id="popupCarousel<?= $product['product_id']; ?>" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <?php $c = 0;
                                foreach ($product['images'] as $image): ?>
                                    <li data-target="#popupCarousel<?= $product['product_id']; ?>" data-slide-to="<?= $c ?>"
                                        class="<?php if ($c++ == 0) echo 'active'; ?>"></li>
                                <?php endforeach; ?>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <?php $c = 0;
                                foreach ($product['images'] as $image): ?>
                                    <div class="item <?php if ($c++ == 0) echo 'active'; ?>">
                                        <img
                                            src="<?= $image['image'] ?>"
                                            alt="تصویر محصول">
                                    </div>
                                <?php endforeach; ?>
                            </div>

                            <!-- Left and right controls -->

                            <a class="left carousel-control" href="#popupCarousel<?= $product['product_id']; ?>" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                                <span class="sr-only">Next</span>
                            </a>
                            <a class="right carousel-control" href="#popupCarousel<?= $product['product_id']; ?>" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-7 col-xs-12 hidden-sm hidden-xs" style="z-index: 100000;">

                        <img id='modal_big_pic<?php echo $product['product_id']; ?>' width="100%">

                    </div>
                    <div class="col-md-2 hidden-sm hidden-xs " id='get_height<?php echo $product['product_id']; ?>'>
                        <?php
                        $x = 0;
                        //                        $productImagesCount=count($product['images']);
                        //                        $product['images'][$productImagesCount]['image']=$product['thumb'];
                        //                        $temp=$product['images'][0];
                        //                        $product['images'][0]=$product['images'][$productImagesCount];
                        //                        $product['images'][$productImagesCount]=$temp;
                        foreach ($product['images'] as $image):
                            ?>
                            <div class="hand text-center modal_akhar_padding<?php if ($x++ == 0) echo ' first '; ?>"
                                 onclick="$('.arrow_box').removeClass('arrow_box');
                                     $(this).addClass('arrow_box');
                                     $('#modal_big_pic<?php echo $product['product_id']; ?>').attr('src', '<?php echo $image['image']; ?>');">
                                <img width="80%" src="<?php echo $image['image']; ?>">
                            </div>
                        <?php endforeach; ?>
                    </div>

                </div>

            </div>

        </div>

    </div>
</div>