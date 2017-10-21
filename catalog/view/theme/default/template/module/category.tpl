<div class="container">
    <div class="row ">
        <div class="col-md-12 collection_list" style="border-bottom: 1px solid #555">
            <a href="">مجموعه ها</a>
        </div>
        <?php foreach ($mycategories as $category) { ?>
            <div class="col-md-12 collection_each ">
                <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
            </div>
        <?php }
        ?>
    </div>
</div>




<div class="price_header_top"><p class="text-center ">قیمت (هزار تومان)</p></div>
<input id="ex2" type="text" class="span2" value="" data-slider-min="0" data-slider-max="<?php echo $max / 1000; ?>"
       data-slider-step="10"
       data-slider-value="[<?php echo $current_min / 1000; ?>,<?php echo $current_max / 1000; ?>]"/>
<div><b style="float: left"><?php echo $max / 1000; ?></b> <b style="float: right">0</b></div>

<script>
    $("#ex2").slider({});
</script>


<!--
<div class="list-group">
    <?php foreach ($categories as $category) { ?>
        <?php if ($category['category_id'] == $category_id) { ?>
            <a href="<?php echo $category['href']; ?>" class="list-group-item active"><?php echo $category['name']; ?></a>
            <!-- <?php if ($category['children']) { ?>
                <?php foreach ($category['children'] as $child) { ?>
                    <?php if ($child['category_id'] == $child_id) { ?>
                         <a href="<?php echo $child['href']; ?>" class="list-group-item active">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
                    <?php } else { ?>
                         <a href="<?php echo $child['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
                    <?php } ?>
                <?php } ?>
            <?php } ?>
        <?php } else { ?>
             <a href="<?php echo $category['href']; ?>" class="list-group-item"><?php echo $category['name']; ?></a>
        <?php } ?>
    <?php } ?>
</div> -->
