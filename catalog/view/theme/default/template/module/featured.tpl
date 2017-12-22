

<div class="cdiv">
    <span class="cspan"><?php echo $heading_title; ?></span>
</div>

<?php if ($products): ?>

    <div class="row">

        <?php foreach ($products as $product) : ?>


            <?php include "productModal.php"; ?>

                <div onmouseout="hide('.ctext<?php echo $product['product_id']; ?>');
                                hide('#s<?php echo $product['product_id']; ?>');
                                show('#sm<?php echo $product['product_id']; ?>');"

                             onmouseover="show('.ctext<?php echo $product['product_id']; ?>');
                                     show('#s<?php echo $product['product_id']; ?>');
                                     hide('#sm<?php echo $product['product_id']; ?>');"
                             class="col-lg-15 col-md-15 col-sm-6 col-xs-12 featurePadding" >

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


                            <div class="text-center p2_margin_pro_details" style="display:none" id="s<?php echo $product['product_id']; ?>" >


                                <?php
                                $size_counter = 0;
                                foreach ($product['options'] as $option)
                                    foreach ($option['product_option_value'] as $opval)
                                        if (strtolower($option['name']) == "size" || $option['name'] == "سایز")
                                            $size_counter++;
                                ?>


                                <?php if ($size_counter == 1) { ?>
                                    <label class="taksize">  تک سایز </label>
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
        <?php endforeach; ?>
    </div>


<?php endif; ?>

<!--
<h3><?php echo $heading_title; ?></h3>
<div class="row">
<?php foreach ($products as $product) { ?>
                              <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="product-thumb transition">
                                  <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                                  <div class="caption">
                                    <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                                    <p><?php echo $product['description']; ?></p>
    <?php if ($product['rating']) { ?>
                                                                <div class="rating">
        <?php for ($i = 1; $i <= 5; $i++) { ?>
            <?php if ($product['rating'] < $i) { ?>
                                                                                                                          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
            <?php } else { ?>
                                                                                                                          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
            <?php } ?>
        <?php } ?>
                                                                </div>
    <?php } ?>
    <?php if ($product['price']) { ?>
                                                                <p class="price">
        <?php if (!$product['special']) { ?>
            <?php echo $product['price']; ?>
        <?php } else { ?>
                                                                                              <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
        <?php } ?>
        <?php if ($product['tax']) { ?>
                                                                                              <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
        <?php } ?>
                                                                </p>
    <?php } ?>
                                  </div>
                                  <div class="button-group">
                                    <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                                    <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                                    <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                                  </div>
                                </div>
                              </div>
<?php } ?>
</div>-->
