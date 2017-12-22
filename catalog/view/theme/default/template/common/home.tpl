<?php echo $header; ?>


    <img id="mycontainer" class="img-responsive widthfull" src="<?= $server . 'image/' . $banner1['image']; ?>">
<?php if (count($banner2) > 0): ?>
    <hr>
<?php endif; ?>

    <div class="row">
        <?php foreach ($banner2 as $banner): ?>
            <div class=" <?= $class; ?>">
                <a href="<?= $banner['link'] ?>"><img class="bannerHome"
                                                      src="<?= $server . 'image' . $banner['image'] ?>"></a>
            </div>
        <?php endforeach; ?>
    </div>

    <div class="container">
        <div class="row">

            <?php echo $column_left; ?>
            <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-9'; ?>
            <?php } else { ?>
                <?php $class = 'col-sm-12'; ?>
            <?php } ?>
            <div id="content"
                 class="<?php echo $class; ?>"><?php echo $content_top; ?><?php echo $content_bottom; ?></div>
            <?php echo $column_right; ?>
        </div>
    </div>
<?php echo $footer; ?>

<?php /*
 //The first modal when user first enters
if (!isset($_SESSION['taze_vared'])):
    $_SESSION['taze_vared'] = 1;
    ?>
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content" style="background-color: #fefefe">
                <div class="modal-body" style="padding: 0;">

                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <form action="#" style="position: fixed; margin-top: 246px; margin-right: 77px" method="POST">

                        <input type="submit" name="submit" value="اشتراک"
                               style="padding: 5px 15px 5px 15px; border: none; background-color: #eee;">
                        <input type="email" name="firstEmail" placeholder="Email:" dir="ltr"
                               style="border: 0; border-bottom: 1px solid #eee; padding-top: 5px; padding-bottom: 5px">
                    </form>
                    <img src="<?php echo $firstModalImgSrc; ?>" width="100%">


                </div>

            </div>

        </div>
    </div>
    <button id="taze_vared_modal" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"
            style="display: none;">Open Modal
    </button>
    <script>
        $("#taze_vared_modal").click();
    </script>
<?php endif;*/ ?>