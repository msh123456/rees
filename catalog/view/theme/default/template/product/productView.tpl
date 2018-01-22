<div class="row">
    <?php if (count($products) <= 0) { ?>
        <div class="text center" style="padding-top: 25px; color: red">متاسفانه محصولی یافت نشد.</div>
    <?php } else { ?>
        <?php foreach ($products as $product) : ?>
            <div class="col-md-4 col-xs-12 col-sm-6 col-lg-4 featurePadding2">
                <?php include 'singleProductView.php'; ?>
            </div>
        <?php endforeach;
    } ?>
    <?php if (isset($pagination)): ?>
        <div class="col-sm-12 text-left"><?php echo $pagination; ?></div>
    <?php endif; ?>
</div>
