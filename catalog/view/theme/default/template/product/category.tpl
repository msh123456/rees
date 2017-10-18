<?php echo $header; ?>




<?php foreach ($products as $product) : ?>
    <?php include 'productModal.php'; ?>



    <!-- Modal -->
    <div id="priceModal<?php echo $product['product_id']; ?>" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                </div>
                <div class="modal-body">
                    <p>لطفا سایز مورد نظر خود را انتخاب کنید.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
<?php endforeach; ?>




<div class="container page2_container_padding" id="mycontainer">

    <div class="row">
        <div class="col-lg-2 p2_col_right">
            <?php echo $column_left; ?>

        </div>
        <div class="col-lg-10 p2_col_left">
            <div class="p2_top">
                <div class="col-sm-8">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>  <span class="bread"> > </span>
                    <?php } ?>
                </div>
                <div class="col-sm-4 top_sort  p2_top">
                    <span class="sort">   مرتب کردن بر اساس قیمت</span>
                    <a href="<?php echo $sorts['3']['href']; ?>" class="sort_option">کم به زیاد</a>

                    <a href="<?php echo $sorts['4']['href']; ?>" class="sort_option"> زیاد به کم</a>

                </div>
            </div>
            <div class="productss">
                <div class="row">
                    <?php if(count($products)<=0){ ?>
                    <div class="text center" style="padding-top: 25px; color: red">متاسفانه محصولی در این دسته بندی یافت نشد.</div>
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
            </div>
        </div>
    </div>
</div>

<?php echo $footer; ?>
<!--******************************************************-->
<!--**************************************************************-->
<!--
<?php if ($categories) { ?>
    <h3><?php echo $text_refine; ?></h3>
    <?php if (count($categories) <= 5) { ?>
        <div class="row">
            <div class="col-sm-3">
                <ul>
                    <?php foreach ($categories as $category) { ?>
                        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>
    <?php } else { ?>
        <div class="row">
            <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
                <div class="col-sm-3">
                    <ul>
                        <?php foreach ($categories as $category) { ?>
                            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                        <?php } ?>
                    </ul>
                </div>
            <?php } ?>
        </div>
    <?php } ?>
<?php } ?>

<div class="row">
    <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
        <h2><?php echo $heading_title; ?></h2>
        <?php if ($thumb || $description) { ?>
            <div class="row">
                <?php if ($thumb) { ?>
                    <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
                <?php } ?>
                <?php if ($description) { ?>
                    <div class="col-sm-10"><?php echo $description; ?></div>
                <?php } ?>
            </div>
            <hr>
        <?php } ?>
        <?php if ($categories) { ?>
            <h3><?php echo $text_refine; ?></h3>
            <?php if (count($categories) <= 5) { ?>
                <div class="row">
                    <div class="col-sm-3">
                        <ul>
                            <?php foreach ($categories as $category) { ?>
                                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                            <?php } ?>
                        </ul>
                    </div>
                </div>
            <?php } else { ?>
                <div class="row">
                    <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
                        <div class="col-sm-3">
                            <ul>
                                <?php foreach ($categories as $category) { ?>
                                    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                                <?php } ?>
                            </ul>
                        </div>
                    <?php } ?>
                </div>
            <?php } ?>
        <?php } ?>
        <?php if ($products) { ?>
            <p><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p>
            <div class="row">
                <div class="col-md-4">

                    <div class="btn-group hidden-xs">
                        <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
                        <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
                    </div>

                </div>
                <div class="col-md-2 text-right">
                    <label class="control-label" for="input-sort"><?php echo $text_sort . " قیمت "; ?></label>
                </div>
                <div class="col-md-3 text-right">

                    <select id="input-sort" class="form-control" onchange="location = this.value;">
                        <?php foreach ($sorts as $sorts) { ?>
                            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                                <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                            <?php } else { ?>
                                <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                            <?php } ?>
                        <?php } ?>
                    </select>

                </div>
                <div class="col-md-1 text-right">
                    <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
                </div>
                <div class="col-md-2 text-right">
                    <select id="input-limit" class="form-control" onchange="location = this.value;">
                        <?php foreach ($limits as $limits) { ?>
                            <?php if ($limits['value'] == $limit) { ?>
                                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                            <?php } else { ?>
                                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                            <?php } ?>
                        <?php } ?>
                    </select>
                </div>
            </div>
            <br />
            <div class="row">
                <?php foreach ($products as $product) { ?>
                    <div class="product-layout product-list col-xs-12">
                        <div class="product-thumb">
                            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                            <div>
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
                                    <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                                    <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                                    <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
            <div class="row">
                <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                <div class="col-sm-6 text-right"><?php echo $results; ?></div>
            </div>
        <?php } ?>
        <?php if (!$categories && !$products) { ?>
            <p><?php echo $text_empty; ?></p>
            <div class="buttons">
                <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
        <?php } ?>
        <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div> -->

