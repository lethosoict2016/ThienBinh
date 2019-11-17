<script type="text/javascript">    

var timmer;
//USE TO CHANGE THE AMOUNT
function amend_amount(val,item_id)
{       
       clearTimeout(timmer);
        timmer = setTimeout(function callback(){
        //get_search_result(search_item);
        // SHOW AJAX RESPONSE ON REQUEST SUCCESS
        $.ajax({
            url: '<?php echo base_url('order_list/update_price/'); ?>'+val+'/'+item_id,
            success: function(response)
            {
                jQuery('#inner_invoice_area').html(response);
                 $('#barcode_scan_area').val('');
                 $('#barcode_scan_area').focus();
                 $('.search_result').css("display", "none");

            }
        });

    }, 600);
}

//USE TO CHANGE THE QUANTITY
function amend_qty(val,item_id)
{       
    
        clearTimeout(timmer);
        timmer = setTimeout(function callback(){
        //get_search_result(search_item);
         var int_val = parseInt(val);
            // SHOW AJAX RESPONSE ON REQUEST SUCCESS
        $.ajax({
            url: '<?php echo base_url('order_list/update_qty/'); ?>'+int_val+'/'+item_id,
            success: function(response)
            {
                jQuery('#inner_invoice_area').html(response);
                 $('#barcode_scan_area').val('');
                 $('#barcode_scan_area').focus();
                 $('.search_result').css("display", "none");
            }
        });
    }, 600);
}

//USE TO CHANGE THE DSICOUNT
function amend_discount(val,item_id)
{       

       clearTimeout(timmer);
        timmer = setTimeout(function callback(){
        //get_search_result(search_item);
        var int_val = parseInt(val);
        // SHOW AJAX RESPONSE ON REQUEST SUCCESS
        $.ajax({
            url: '<?php echo base_url('order_list/discount_qty/'); ?>'+int_val+'/'+item_id,
            success: function(response)
            {
                jQuery('#inner_invoice_area').html(response);
                 $('#barcode_scan_area').val('');
                 $('#barcode_scan_area').focus();
                 $('.search_result').css("display", "none");
            }
        });
    }, 600);
}

    //USED TO ADD ITEM IN TEMP TABLE
    function add_item_invoice(data)
    {   
        clearTimeout(timmer);
        timmer = setTimeout(function callback()
        {
            if(/^[a-zA-Z0-9- ]*$/.test(data) == true) 
            {
                get_search_result(data);
            }
        }, 100);
        $('#barcode_scan_area').focus();
    }

    //USED TO CLEAR THE TEMP TABLE
    function clear_invoice()
    {
       // SHOW AJAX RESPONSE ON REQUEST SUCCESS
        $.ajax({
            url: '<?php echo base_url("order_list/clear_temp_invoice"); ?>',
            success: function(response)
            {
                jQuery('#inner_invoice_area').html(response);
                 $('#barcode_scan_area').val('');
                 $('#barcode_scan_area').focus();
            }
        }); 
    }

    //USED TO GET SEARCH RESULT
    function get_search_result(search_item)
    {
        if(search_item != '')
        {

           // alert('ree');
            // SHOW AJAX RESPONSE ON REQUEST SUCCESS
            $.ajax({
                url: '<?php echo base_url("invoice/search_result_manual/"); ?>'+search_item,
                success: function(response)
                {
                    jQuery('#search_id_result_manual').html(response);
                     //$('#barcode_scan_area').val('');
                }
            }); 
        }
        else
        {
            $('.search_result').css("display", "none");
        }
    }

    //USED TO CLOSE OR HIDE THE SEARCH DIV
    function close_search_result()
    {
        $('#barcode_scan_area').val('');
        $('#barcode_scan_area').focus();
        $('.search_result').css("display", "none");
    }

    //USED TO ADD ITEM SEARCHED IN TEMP TABLE
    function add_search_item_invoice(id)
    {
        $('#barcode_scan_area').focus();
        $('.search_result').css("display", "none");
        // SHOW AJAX RESPONSE ON REQUEST SUCCESS
        $.ajax({
            url: '<?php echo base_url('order_list/add_selected_item/'); ?>'+id,
            success: function(response)
            {
                jQuery('#inner_invoice_area').html(response);
                 $('#barcode_scan_area').val('');
            }
        });
    }
</script>    