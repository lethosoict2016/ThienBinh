<style>
    #prescribtion_id:hover {
        background-color: #000;
        opacity: 0.2;
        cursor: pointer;
    }
    #prescribtion_id>img {
        width: 80px;
        height: 80px;
        margin-left: 14px;
    }
</style>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#UnVerified" data-toggle="tab"><i class="fa fa-question-circle" aria-hidden="true"></i> UnVerified List </a>
                    </li>
                    <li>
                        <a href="#Delete" data-toggle="tab"> <i class="fa fa-trash-o" aria-hidden="true"></i> Expired List </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="active tab-pane" id="UnVerified">
                        <?php if($unverified_records != NULL){ ?>
                        <div class="box">
                            <div class="box-header">
                                <h3 class="box-title"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> <?php echo $table_name; ?></h3>
                            </div>
                            <div class="box-body">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <?php foreach ($table_heading_names_of_coloums as $table_head)
                                        { 
                                        ?>
                                        <th>
                                            <?php echo $table_head; ?>
                                        </th>
                                        <?php 
                                        } 
                                        ?>
                                    </thead>
                                    <tbody>
                                        <?php $counter=1 ; foreach ($unverified_records as $obj_order_records){ ?>
                                        <tr>
                                            <td>
                                                <?php echo $counter; ?>
                                            </td>
                                            <td>
                                                <?php echo $obj_order_records->id; ?>
                                            </td>
                                            <td>
                                                <?php echo $obj_order_records->customer_name; ?>
                                            </td>
                                            <td>
                                                <?php echo $obj_order_records->cus_email; ?>
                                            </td>
                                            <td>
                                                <?php echo $obj_order_records->cus_contact_1; ?>
                                            </td>
                                            <td>
                                                <?php echo $obj_order_records->date; ?>
                                            </td>
                                            <td id="prescribtion_id">
                                                <img onclick="show_modal_page('<?php echo base_url().'orders/popup/prescription_image_model/'.$obj_order_records->id ?>')" src="<?php echo base_url(); ?>uploads/prescription/<?php echo $obj_order_records->cus_picture; ?>" class="form-control" alt="prescription images" />
                                            </td>
                                            <td>
                                                <?php if($obj_order_records->status == 0){ echo "Unverified"; }else if($obj_order_records->status == 1){ echo "Verified"; }else if($obj_order_records->status == 2){ echo "Paid"; }else if($obj_order_records->status == 3){ echo "Delivered"; } ?>
                                            </td>
                                            <td>
                                                <div class="btn-group pull pull-right">
                                                    <button type="button" class="btn btn-info btn-flat">Action</button>
                                                    <button type="button" class="btn btn-default btn-flat dropdown-toggle" data-toggle="dropdown">
                                                        <span class="caret"></span>
                                                        <span class="sr-only">Toggle Dropdown</span>
                                                    </button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li>
                                                            <a href="<?php echo base_url(); ?>index.php/Orders/change_status_del/<?php echo $obj_order_records->id; ?>/5"><i class="fa fa-plus"></i> Expire</a>
                                                        </li>

                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <?php $counter++; } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <?php 
                        } 
                        else 
                        {
                        ?>
                        <p class="text-center">
                            Opps No Record Found in Pending!!!
                        </p>
                        <?php 
                        } 
                        ?>
                    </div>
                
                    <div class=" tab-pane" id="Delete">
                        <div class="box">
                            <div class="box-header">
                                <h3 class="box-title"><?php echo $table_name; ?></h3>
                            </div>
                            <div class="box-body">
                                <?php if($delete_records !=NULL)
                                { 
                                ?>
                                <table id="example3" class="table table-bordered table-striped">
                                    <thead>
                                        <?php foreach ($table_heading_names_of_coloums as $table_head){ ?>
                                        <th>
                                            <?php echo $table_head; ?>
                                        </th>
                                        <?php } ?>
                                    </thead>
                                    <tbody>
                                        <?php $counter=1 ; foreach ($delete_records as $obj_delete_records){ ?>
                                        <tr>
                                            <td>
                                                <?php echo $counter; ?>
                                            </td>
                                            <td>
                                                <?php echo $obj_delete_records->id; ?>
                                            </td>
                                            <td>
                                                <?php echo $obj_delete_records->customer_name; ?>
                                            </td>
                                            <td>
                                                <?php echo $obj_delete_records->cus_email; ?>
                                            </td>
                                            <td>
                                                <?php echo $obj_delete_records->cus_contact_1; ?>
                                            </td>

                                            <td>
                                                <?php echo $obj_delete_records->date; ?>
                                            </td>
                                            <td id="prescribtion_id"><img onclick="show_modal_page('<?php echo base_url().'orders/popup/prescription_image_model/'.$obj_delete_records->id ?>')" src="<?php echo base_url(); ?>uploads/prescription/<?php echo $obj_delete_records->cus_picture; ?>" class="form-control" alt="prescription images" />
                                            </td>

                                            <td>
                                                <?php if($obj_delete_records->status == 5) { echo "Expired"; } else { echo "Error"; } ?>
                                            </td>
                                            <td>
                                                <div class="btn-group pull pull-right">
                                                    <button type="button" class="btn btn-info btn-flat">Action</button>
                                                    <button type="button" class="btn btn-default btn-flat dropdown-toggle" data-toggle="dropdown">
                                                        <span class="caret"></span>
                                                        <span class="sr-only">Toggle Dropdown</span>
                                                    </button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li>
                                                            <a href="<?php echo base_url(); ?>orders/change_status_del/<?php echo $obj_delete_records->id; ?>/0"> <i class="fa fa-plus"></i> Unverified</a>
                                                        </li>
                                                        <li>
                                                            <a href="<?php echo base_url(); ?>orders/delete/<?php echo $obj_delete_records->id; ?>"><i class="fa fa-trash"></i> Delete</a>
                                                        </li>

                                                    </ul>
                                                </div>
                                            </td>

                                        </tr>

                                        <?php $counter++; } ?>
                                    </tbody>

                                </table>
                            </div>
                        </div>

                        <?php } else { ?>

                        <p class="text-center">
                            Opps No Record Found in Delete!!!
                        </p>

                        <?php } ?>
                    </div>

                </div>
            </div>

        </div>

    </div>

</section>
<!-- Bootstrap model  -->
<?php $this->load->view('bootstrap_model.php'); ?>
<!-- Bootstrap model  ends-->


<script type="text/javascript">
    

    function edit_category(id) {

        $.ajax({
            url: "<?php echo base_url(); ?>index.php/Orders/ajax_edit/" + id,
            type: "GET",
            dataType: "JSON",
            success: function(data) {

                //Assign JSON data to textbox to edit
                $('[name="Edit_order_Id"]').val(data.id);

                // show bootstrap modal when complete loaded            
                $('#Edit_Model').modal('show');

            },
            error: function(jqXHR, textStatus, errorThrown) {

                alert('Error get data from ajax');
            }
        });
    }
</script>