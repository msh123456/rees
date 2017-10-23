
    <div class="row">
        <?php if(count($products)<=0){ ?>
            <div class="text center" style="padding-top: 25px; color: red">متاسفانه محصولی یافت نشد.</div>
        <?php }else{ ?>
            <?php foreach ($products as $product) : ?>
                <div onmouseout="hide('.ctext<?php echo $product['product_id']; ?>');
                    hide('#s<?php echo $product['product_id']; ?>');
                    show('#sm<?php echo $product['product_id']; ?>');"

                     onmouseover="show('.ctext<?php echo $product['product_id']; ?>');
                         show('#s<?php echo $product['product_id']; ?>');
                         hide('#sm<?php echo $product['product_id']; ?>');"
                     class="col-md-4 featurePadding2" >

                    <div class="text-center" >
                        <a  href="<?php echo $product['href']; ?>">
                            <img style="margin: auto;" id="image" src="<?php echo $product['thumb']; ?>"
                                 alt="<?php echo $product['name']; ?>"
                                 title="<?php echo $product['name']; ?>"
                                 class="img-responsive" />

                        </a>
                    </div>

                    <div style="display: none;" class="text-center ctext<?php echo $product['product_id']; ?>" id="text">
                        <div id="child" >
                            <a class="marginok hand"  onclick="cart.add(<?php echo $product['product_id']; ?>)"><img width="18px" height="21px" src="<?php echo $cart_icon; ?>"></a>
                            <a class="marginok hand" href="" data-toggle="modal" data-target="#myModal<?php echo $product['product_id']; ?>"><img width="18px" height="18px" src="<?php echo $search_icon; ?>"></a>
                        </div>
                    </div>

                    <div class="text-center p2_margin_pro_details"><?php echo $product['name']; ?></div>
                    <div class="text-center p2_margin_pro_details"><?php echo $product['price']; ?></div>


                    <div class="text-center p2_margin_pro_details" id="s<?php echo $product['product_id']; ?>" style="display:none;" >


                        <?php
                        $size_counter = 0;
                        foreach ($product['options'] as $option)
                            foreach ($option['product_option_value'] as $opval){
                                if ((strtolower($option['name']) == "size" || $option['name'] == "سایز")&&$opval['quantity']>0)
                                    $size_counter++;
                            }
                        ?>


                        <?php
                        if($size_counter==0){ ?>
                            <label class="text-center" style="color:red; font-size: 14px;">  ناموجود </label>

                        <?php } else if ($size_counter == 1) { ?>
                            <label class="taksize"> تک سایز </label>
                        <?php } else { ?>
                            <?php foreach ($product['options'] as $option) { ?>
                                <?php foreach ($option['product_option_value'] as $opval) { ?>
                                    <?php if (strtolower($option['name']) == "size" || $option['name'] == "سایز") { ?>
                                        <?php if ($opval['quantity'] <= 0) { ?>
                                            <label style="background-image: url('<?php echo $no_product_background_icon; ?> '); cursor: not-allowed;" class="op"><?php echo $opval['name']; ?></label>
                                        <?php } else { ?>
                                            <label style="background-image: url('<?php echo $product_background_icon; ?>')" class="op"><?php echo $opval['name']; ?></label>
                                        <?php } ?>
                                    <?php } ?>
                                <?php } ?>
                            <?php } ?>
                        <?php } ?>
                    </div>
                    <div style="line-height: 40px;" class="text-center" id="sm<?php echo $product['product_id']; ?>" >سایزهای موجود</div>
                </div>
            <?php endforeach;} ?>
        <div class="col-sm-12 text-left"><?php echo $pagination; ?></div>
    </div>