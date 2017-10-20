<div class="panel panel-default filter-border">
    <!--<div class="panel-heading"><?php echo $heading_title; ?></div>-->
    <div class="list-group">
        <?php foreach ($filter_groups as $filter_group) { ?>
        <a class="list-group-item filter_header"><?php echo $filter_group['name']; ?></a>
        <div class="list-group-item">
            <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
                <?php foreach ($filter_group['filter'] as $filter) { ?>
                <div class="checkbox">
                    <label>
                        <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
                        <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>"
                               checked="checked" onchange="$('#button-filter').click();"/>
                        <?php echo $filter['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>"
                               onchange="$('#button-filter').click();"/>
                        <?php echo $filter['name']; ?>
                        <?php } ?>
                    </label>
                </div>
                <?php } ?>
            </div>
        </div>
        <?php } ?>
    </div>
    <div class="panel-footer text-right" style="display:none">
        <button type="button" id="button-filter" class="btn btn-primary"><?php echo $button_filter; ?></button>
    </div>
</div>
<script type="text/javascript">
    $('#button-filter').on('click', function () {

        filter = [];
        $('input[name^=\'filter\']:checked').each(function (element) {
            filter.push(this.value);
        });
        var filterValue = filter.join(',');



        $("#productss").html("<img class=\"gif\" src=\"<?php echo $loadingGifSrc; ?>\" />");
        var newVal = $('.span2').data('slider').getValue();
        $.get("<?php echo $action; ?>&ajax=1&filter=" + filterValue + "&minPrice=" + newVal[0] + "&maxPrice=" + newVal[1], function (html) {

            $("#productss").html(html);

        });

        //	location = '<?php echo $action; ?>&filter=' + filter.join(',');
    });
</script>
