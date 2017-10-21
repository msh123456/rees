<h2><?php echo $text_instruction; ?></h2>
<p><b><?php echo $text_description; ?></b></p>
<div class="well well-sm">
    <p><?php echo $bank; ?></p>
    <p><?php echo $text_payment; ?></p>
</div>
<div class="buttons">
    <div class="pull-right">
        <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary"
               data-loading-text="<?php echo $text_loading; ?>"/>
    </div>
</div>
<script type="text/javascript">
    $('#button-confirm').on('click', function () {
        $.ajax({
            type: 'post',
            dataType: 'json',
            url: 'index.php?route=payment/bank_transfer/confirm',
            cache: false,
            beforeSend: function () {
                $('#button-confirm').button('loading');
            },
            complete: function () {
                $('#button-confirm').button('reset');
            },
            success: function (json) {
               if(json['status']==true) {
                   var form = $('<form action="' + json['url'] + '" method="post">' +
                       '<input type="text" name="Amount" value="' + json['Amount'] * 10 + '" />' +
                       '<input type="text" name="ResNum" value="' + json['ResNum'] + '" />' +
                       '<input type="text" name="MID" value="' + json['MID'] + '" />' +
                       '<input type="text" name="RedirectURL" value="' + json['RedirectURL'] + '" />' +
                       '</form>');
                   $('body').append(form);
                   form.submit();
                   //location = '<?php echo $continue; ?>';
               }else{
                   alert("خطایی در اتصال به درگاه پیش آمده است. لطفا دوباره تلاش کنید.");
               }

            }
        });
    });
</script>
