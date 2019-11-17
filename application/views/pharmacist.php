<section class="content-header">
    <div class="row">
        <div class="col-md-12">
            <div class="pull pull-right">
                <button onclick="show_modal_page('<?php echo base_url().'pharmacist/popup/add_pharmicist_model/'; ?>')" type="button" class="btn btn-info btn-flat btn-lg" ><i class="fa fa-plus-square" aria-hidden="true"></i>
                    Add Pharmacist
                </button>
            </div>
        </div>
    </div>
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> <?php echo $table_name; ?></h3>
                </div>
                <div class="box-body">
                    <div class="col-md-12 table-responsive">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <?php
                    					foreach ($table_heading_names_of_coloums as $table_head)
                                        {
                    				?>
                                        <th>
                                            <?php echo $table_head; ?>
                                        </th>
                                        <?php
                        					}
                        				?>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                					if($pharmacist_list != NULL)
                                    {
                					foreach ($pharmacist_list as $obj_pharmacist_list)
                                    {
                				?>
                                    <tr>
                                        <td>
                                            <?php echo $obj_pharmacist_list->name; ?>
                                        </td>
                                        <td>
                                            <?php echo $obj_pharmacist_list->post_title; ?>
                                        </td>
                                        <td>
                                            <?php echo $obj_pharmacist_list->twitter; ?>
                                        </td>
                                        <td>
                                            <?php echo $obj_pharmacist_list->linked; ?>
                                        </td>
                                        <td>
                                            <?php echo $obj_pharmacist_list->googleplus; ?>
                                        </td>
                                        <td>
                                            <?php echo img(array('width'=>'40','height'=>'40','class'=>'img-circle','src'=>'uploads/pharmacist/'.$obj_pharmacist_list->cus_picture)); ?>
                                        </td>
                                        <td>
                                            <?php 
    											if($obj_pharmacist_list->status == 0)
                                                {

    											 echo "Active";

    											}
                                                else 
                                                {
    												echo "In active";					
    											}
    										?>
                                        </td>
                                        <td>
                                        <div class="btn-group pull pull-right">
                                            <button type="button" class="btn btn-info btn-flat">Action</button>
                                            <button type="button" class="btn btn-default btn-flat dropdown-toggle" data-toggle="dropdown">
                                                <span class="caret"></span>
                                                <span class="sr-only">Toggle Dropdown</span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li onclick="show_modal_page('<?php echo base_url().'pharmacist/popup/edit_pharmicist_model/'.$obj_pharmacist_list->id; ?>')" ><a href="#"><i class="fa fa-pencil"></i> View details </a>
                                                </li>
                                                <li><a onclick="confirmation_alert('delete this ','<?php echo base_url().'pharmacist/delete/'.$obj_pharmacist_list->id; ?>')"  href="javascript:void(0)" ><i class="fa fa-trash-o"></i> Delete</a>
                                                </li>
                                                <?php
    												if($obj_pharmacist_list->status != 0)
    												{									
    											?>
                                                <li>
                                                    <a  onclick="confirmation_alert('make this active  ','<?php echo base_url(); ?>pharmacist/change_status/<?php echo $obj_pharmacist_list->id; ?>/0')"  href="javascript:void(0)"><i class="fa fa-minus"></i> Active</a>
                                                </li>
                                                <?php
    													}
    													 if($obj_pharmacist_list->status != 1)
    													{		
    											?>
                                                <li>
                                                    <a onclick="confirmation_alert('make this in active  ','<?php echo base_url(); ?>pharmacist/change_status/<?php echo $obj_pharmacist_list->id; ?>/1')"  href="javascript:void(0)"><i class="fa fa-minus"></i> Inactive</a>
                                                </li>
                                                    <?php
    												  }

    												?>
                                                </li>
                                            </ul>
                                        </div>
                                        </td>
                                    </tr>
                                    <?php
                    					}
                    				}	
                    				?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Bootstrap model  -->
<?php $this->load->view('bootstrap_model.php'); ?>
<!-- Bootstrap model  ends--> 