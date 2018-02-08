<div class="row">
    <?php if (count($products) <= 0) { ?>
        <div class="text center" style="padding-top: 25px; color: red">متاسفانه محصولی یافت نشد.</div>
    <?php } else { ?>
        <?php foreach ($products as $product) : ?>
           <?php $percent = $product['percent']; ?>
            <div class="col-md-4 col-xs-12 col-sm-6 col-lg-4 featurePadding2 col">
                <?php include 'singleProductView.php'; ?>
                <?php include 'productModal.php'; ?>
            </div>
        <?php endforeach;
    } ?>
   
</div>
<?php if (isset($pagination)): ?>
    <div class="row">
        <div class="col-xs-8" ><?php echo $pagination; ?></div>
        <div class="col-xs-4" style="margin-top: 5px ; "><?php echo $results; ?></div>
    </div>
<?php endif; ?>
