<div id="myModal<?php echo $product['product_id']; ?>" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-width">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header mymodal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>

                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-4" style="line-height: 30px">
                                        <div class="t1">
                                            <p><?php echo $product['name']; ?></p>
                                        </div>
                                        <div class="t2">
                                            <p>کد:<?php echo $product['model']; ?></p>
                                        </div>
                                        <div class="t3">
                                            <p ><?php echo $product['price']; ?></p>
                                        </div>
                                        <div class="t35">
                                            <p ><?php echo $product['mojoodi']; ?></p>
                                        </div>

                                        <div class="t4">
                                            <?php foreach ($product['options'] as $option) { ?>
                                                <?php if ($option['type'] == 'radio' && (strcmp($option['name'], "سایز") || strcmp($option['name'], "size"))) { ?>
                                                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                                        <!--<label class="control-label"><?php echo $option['name']; ?></label>-->
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td class="td1"> 
                                                                    <div id="input-option<?php echo $option['product_option_id']; ?>">
                                                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                            <?php if ($option_value['quantity'] > 0) { ?>
                                                                                <label disabled="bigh" class="op3" style="background-image: url('<?php echo $product_background_icon; ?> '); cursor: pointer;">
                                                                                    <input  style="display: none" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                                                                    <?php echo $option_value['name']; ?>
                                                                                    <!--
                                                                                    <?php if ($option_value['price']) { ?>
                                                                                                                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                                    <?php } ?>
                                                                                    -->
                                                                                </label>
                                                                            <?php } else if ($option_value['quantity'] == 0) { ?>
                                                                                <label disabled="disabled" class="op3" style="background-image: url('<?php echo $no_product_background_icon; ?> '); cursor: not-allowed;">
                                                                                    <input disabled="disabled" style="display: none" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
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
                                        </div>

                                        <div class="t5">
                                            <h3 class="h3">توضیحات</h3><br>
                                            <?php echo $product['description']; ?>
                                        </div>
                                    </div>
















                                    <div class="col-md-6" style="z-index: 100000;">

                                        <img id='modal_big_pic<?php echo $product['product_id']; ?>' width="100%"  >

                                    </div>
                                    <div class="col-md-2" id='get_height<?php echo $product['product_id']; ?>'>
                                        <?php
                                        $x = 0;
                                        foreach ($product['images'] as $image):
                                            ?>
                                            <div class="hand text-center modal_akhar_padding<?php if ($x++ == 0) echo ' first '; ?>" onclick="$('.arrow_box').removeClass('arrow_box');
                                                    $(this).addClass('arrow_box');
                                                    $('#modal_big_pic<?php echo $product['product_id']; ?>').attr('src', '<?php echo $image['image']; ?>');">
                                                <img width="80%"src="<?php echo $image['image']; ?>">
                                            </div>
                                        <?php endforeach; ?>
                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>
                </div>