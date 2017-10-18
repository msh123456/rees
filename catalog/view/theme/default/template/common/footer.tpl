<footer>
    <div class="container row">
        <div class="col-sm-2">
            <img src="<?php echo $namad_icon; ?>">
        </div>
        <div class="col-sm-2 fontIranSanse ">
            <div class="col-md-12"><a href="<?php echo $server; ?>index.php?route=information/information&information_id=4">درباره ما</a></div>
            <div class="col-md-12"><a href="<?php echo $server; ?>index.php?route=information/information&information_id=4">تماس با ما</a></div>
            <div class="col-md-12"><a href="<?php echo $server; ?>index.php?route=information/information&information_id=7">شرایط تحویل کالا</a></div>
            <div class="col-md-12"><a href="<?php echo $server; ?>index.php?route=information/information&information_id=8">شرایط برگشت کالا</a></div>
        </div>
        <div class="col-sm-4 text-right fixPaddingInFooter">
            <p><strong>FOLLOW US</strong></p>
            <div> 
                
                
                <span>
                    <a>
                        <img class="footerIcon" src="<?php echo $telegram; ?>">
                    </a>
                </span>
            <span>
                    <a>
                        <img class="footerIcon" src="<?php echo $tweeter; ?>">
                    </a>
                </span>
            <span>
                    <a>
                        <img class="footerIcon" src="<?php echo $facebook; ?>">
                    </a>
                </span>
            <span>
                    <a>
                        <img class="footerIcon" src="<?php echo $instagram; ?>">
                    </a>
                </span>
            <span>
                    <a>
                        <img class="footerIcon" src="<?php echo $googlePlus; ?>">
                    </a>
                </span>
            <span>
                    <a href="#">
                        <img class="footerIcon" src="<?php echo $pintrest; ?>">
                    </a>
                </span>
            <span>
                    <a style="display: inline" href="in.com">
                        <img class="footerIcon" src="<?php echo $in; ?>">
                    </a>
                </span>
                
                
                
                
            </div>

             








        </div>
        <div class="col-sm-4 text-right fixPaddingInFooter">
            <form method="post" action="<?php echo $footer_url; ?>">
                <p>  <strong>NEWS LETTER</strong> </p>
                <input class="input footerBtn" type="submit" value="SIGN UP">
                <input class="myinput" type="email" name="email" placeholder="Email address" style="text-align: left">

            </form>
        </div>
    </div>
</footer>

<!--
<footer>
  <div class="container">
    <div class="row">
<?php if ($informations) { ?>
                              <div class="col-sm-3">
                                <h5><?php echo $text_information; ?></h5>
                                <ul class="list-unstyled">
    <?php foreach ($informations as $information) { ?>
                                                          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
    <?php } ?>
                                </ul>
                              </div>
<?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
    <p><?php echo $powered; ?></p>
  </div>
</footer>





</body></html>
-->