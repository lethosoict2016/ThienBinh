<section class="content-header">
    <div class="row">
        <div class="col-md-12">
            <div class="pull pull-right">
                <button type="button" class="btn btn-info btn-flat btn-lg"  onclick="show_modal_page('<?php echo base_url();?>somewords/popup/add_somewords_model')"  ><i class="fa fa-plus-square" aria-hidden="true"></i>
                    Add Somewords
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
                <div class="box-body ">
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
                					if($SomewordsList != NULL)
                                    {
                    					foreach ($SomewordsList as $obj_SomewordsList)
                                        {
                    			?>
                                <tr>
                                    <td>
                                        <?php echo substr($obj_SomewordsList->title,0,25); ?>...
                                    </td>
                                    <td>
                                        <?php echo substr($obj_SomewordsList->description,0,25); ?>..
                                    </td>
                                    <td>
                                        <?php echo $obj_SomewordsList->icon; ?>
                                    </td>
                                    <td>
                                        <?php 
											if($obj_SomewordsList->status == 0)
                                            {

											 echo "Active";

											}
                                            else 
                                            {
												echo "Inactive";					
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
                                                <li ><a onclick="show_modal_page('<?php echo base_url().'somewords/popup/edit_somewords_model/'.$obj_SomewordsList->id;?>')" href="#"><i class="fa fa-pencil"></i> Edit</a>
                                                </li>
                                                <li><a onclick="confirmation_alert('delete this ','<?php echo base_url().'somewords/delete/'.$obj_SomewordsList->id; ?>')"  href="javascript:void(0)" ><i class="fa fa-trash-o"></i> Delete</a>
                                                </li>
                                                <?php
													if($obj_SomewordsList->status != 0)
													{									
												?>
                                                    <li>
                                                        <a onclick="confirmation_alert('make this active ','<?php echo base_url(); ?>somewords/change_status/<?php echo $obj_SomewordsList->id; ?>/0')"  href="javascript:void(0)" ><i class="fa fa-minus"></i> Active</a>
                                                    </li>
                                                    <?php
														}
														if($obj_SomewordsList->status != 1)
														{		
													?>
                                                        <li>
                                                            <a onclick="confirmation_alert('make this in active ','<?php echo base_url(); ?>somewords/change_status/<?php echo $obj_SomewordsList->id; ?>/1')"  href="javascript:void(0)" ><i class="fa fa-minus"></i> In active</a>
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