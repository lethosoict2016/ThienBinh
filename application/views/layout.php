<style>
    .content {
        background-color: #eee;
    }
</style>
<section class="content">
    <div class="row">
        <div class="col-md-6">
            <div class="box box-info">
                <div class="box-header">
                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                    <?php echo form_label('Update logo :'); ?>
                </div>
                <div class="box-body margin">
                    <?php
        				$logo_attributes = array('id'=>'logo_form','method'=>'post','class'=>'form-horizontal');
        			?>
                        <?php echo form_open_multipart('Layout/logo',$logo_attributes); ?>
                            <div class="form-group">
                                <?php
                					echo img(array('width'=>'100%','height'=>'250px','src'=>'uploads/systemimgs/'.$company_record[0]->logo,'name'=>'Edit_customer_picture'));
                				?>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="file" class=" btn-lg btn-flat btn btn-default" name="company_logo" data-validate="required" data-message-required="Value Required">
                                </div>
                            </div>
                            <div class="form-group">
                                 <?php
                                    $data = array('class'=>'btn btn-info btn-flat btn-lg','type' => 'submit','name'=>'save_logo','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save logo');
                                    echo form_button($data);
                                 ?>
                            </div>
                         <?php echo form_close(); ?>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="box box-info">
                <div class="box-header">
                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                    <?php echo form_label('Default Background image :'); ?>
                </div>
                <div class="box-body margin">
                    <?php
        					$banner_attributes = array('id'=>'banner_form','method'=>'post','class'=>'form-horizontal');
        			?>
                        <?php echo form_open_multipart('Layout/banner',$banner_attributes); ?>
                            <div class="form-group">
                                <?php
            						echo img(array('width'=>'100%','height'=>'250px','src'=>'uploads/systemimgs/'.$company_record[0]->banner,'name'=>'Edit_customer_picture'));
            					?>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="file" name="company_thumbnail" class=" btn-lg btn-flat btn btn-default" data-validate="required" data-message-required="Value Required">
                                </div>
                            </div>
                            <div class="form-group">
                                <?php
                                    $data = array('class'=>'btn btn-info btn-flat btn-lg','type' => 'submit','name'=>'save_banner','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save banner');
                                    echo form_button($data);
                                 ?>
                            </div>
                        <?php echo form_close(); ?>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header text-center">
            <h3 class="box-title"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> <?php echo $title1; ?></h3>
        </div>
        <div class="box-body">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <?php

    					$Contact_attributes = array('id'=>'layout_form','method'=>'post','class'=>'form-horizontal');
    			?>
                    <?php echo form_open('Layout/details',$Contact_attributes); ?>
                        <!--.form group -->
                        <div class="form-group">
                            <?php echo form_label('Company Name:'); ?>
                                <?php
                					$data = array('class'=>'form-control','type'=>'text', 'value'=>$company_record[0]->companyname,'name'=>'company_name');
                					echo form_input($data);
                				  ?>
                        </div>
                        <div class="form-group">
                            <?php echo form_label('Company description:'); ?>
                                <?php
                					$data = array('class'=>'form-control','type'=>'text','value'=>$company_record[0]->companydescription,'name'=>'company_description');
                						echo form_input($data);
                				  ?>
                        </div>
                        <div class="form-group">
                            <?php echo form_label('Company Keywords:'); ?>
                            <?php
            					$data = array('class'=>'form-control','type'=>'text','value'=>$company_record[0]->companykeywords,'name'=>'company_keywords');
            					echo form_input($data);
            				?>
                        </div>
                        <div class="form-group">
                            <?php echo form_label('Currency :'); ?>
                                <?php
                					$data = array('class'=>'form-control','type'=>'text', 'value'=>$company_record[0]->currency ,'name'=>'company_currency');
                					echo form_input($data);
                				 ?>
                        </div>
                        <div class="form-group">
                            <?php echo form_label('Language :'); ?>
                                <?php
                					$data = array('class'=>'form-control','type'=>'text', 'value'=>$company_record[0]->language ,'name'=>'company_language');
                					echo form_input($data);
                				 ?>
                        </div> 
                        <div class="form-group">
                            <?php echo form_label('Theme primary:'); ?>
                            <a class="btn btn-default btn-sm " href="<?php echo base_url('layout/default_settings'); ?>"> Reset default 
                            </a>
                             <br>
                             <br>
                            <div class="input-group my-colorpicker2">
                              <?php
                                $data = array('class'=>'form-control my-colorpicker3 input-lg','type'=>'text', 'value'=>$company_record[0]->primarycolor,'name'=>'company_primary_color');
                                echo form_input($data);
                              ?>
                              <div class="input-group-addon">
                                <i></i>
                              </div>
                            </div>
                        </div>                        
                        <div class="form-group">
                            <?php echo form_label('Theme primary hover :'); ?>
                            <div class="input-group my-colorpicker2">
                              <?php
                                $data = array('class'=>'form-control my-colorpicker3 input-lg','type'=>'text', 'value'=>$company_record[0]->theme_pri_hover,'name'=>'company_primary_hover');
                                echo form_input($data);
                              ?>
                              <div class="input-group-addon">
                                <i></i>
                              </div>
                            </div>
                        </div>  
                        <div class="form-group">
                            <?php echo form_label('Verified invoice Expire time (in days) :'); ?>
                                <?php
                					$data = array('class'=>'form-control','type'=>'number', 'value'=>$company_record[0]->expirey ,'name'=>'company_expire_time');
                					echo form_input($data);
                				 ?>
                        </div>
                        <div class="form-group">
                            <?php
                                $data = array('class'=>'btn btn-info btn-flat btn-lg','type' => 'submit','name'=>'save_company_details','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save Company details');
                                echo form_button($data);
                             ?>
                        </div>
						<div class="form-group">
                            <?php echo form_label('Verified invoice Expire time (in days) :'); ?>
                                <?php
                					$data = array('class'=>'form-control input-lg','type'=>'number', 'value'=>$company_record[0]->expirey ,'name'=>'company_expire_time');
                					echo form_input($data);
                				 ?>
                        </div>
                        <div class="form-group">
                            <?php echo form_label('Financial month start :'); ?>
                            <select class="form-control" name="startday">
                                <option value="1"> Day </option>
                                <?php 
                                for($i = 1; $i < 32; $i++)
                                {
                                  ?>
                                    <option 
                                        <?php echo ($company_record[0]->startday == $i ? 'selected' : '');  ?> value="<?php echo $i; ?>"><?php echo $i; ?> 
                                    </option>
                                  <?php  
                                }
                                 ?>
                              
                            </select>                            
                            <select class="form-control" name="startmonth">
                                <option value="1">Month</option>
                                <option <?php echo ($company_record[0]->startmonth == 1 ? 'selected' : '');  ?>  value="1">January</option>
                                <option <?php echo ($company_record[0]->startmonth == 2 ? 'selected' : '');  ?>  value="2">February</option>
                                <option <?php echo ($company_record[0]->startmonth == 3 ? 'selected' : '');  ?>  value="3">March</option>
                                <option <?php echo ($company_record[0]->startmonth == 4 ? 'selected' : '');  ?>  value="4">April</option>
                                <option <?php echo ($company_record[0]->startmonth == 5 ? 'selected' : '');  ?>  value="5">May</option>
                                <option <?php echo ($company_record[0]->startmonth == 6 ? 'selected' : '');  ?>  value="6">June</option>
                                <option <?php echo ($company_record[0]->startmonth == 7 ? 'selected' : '');  ?>  value="7">July</option>
                                <option <?php echo ($company_record[0]->startmonth == 8 ? 'selected' : '');  ?>  value="8">August</option>
                                <option <?php echo ($company_record[0]->startmonth == 9 ? 'selected' : '');  ?>  value="9">September</option>
                                <option <?php echo ($company_record[0]->startmonth == 10 ? 'selected' : '');  ?>  value="10">October</option>
                                <option <?php echo ($company_record[0]->startmonth == 11 ? 'selected' : '');  ?>  value="11">November</option>
                                <option <?php echo ($company_record[0]->startmonth == 12 ? 'selected' : '');  ?>  value="12">December</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <?php echo form_label('Financial month end :'); ?>
                            <select class="form-control" name="endday">
                                <option value="1"> Day </option>
                                <?php 
                                for($i = 1; $i < 32; $i++)
                                {
                                  ?>
                                      <option <?php echo ($company_record[0]->endday == $i ? 'selected' : '');  ?>  value="<?php echo $i; ?>"><?php echo $i; ?></option>
                                  <?php  
                                }
                                 ?>
                              
                            </select>                            
                            <select class="form-control" name="endmonth">
                                <option value="1">Month</option>
                                <option <?php echo ($company_record[0]->endmonth == 1 ? 'selected' : '');  ?>  value="1">January</option>
                                <option <?php echo ($company_record[0]->endmonth == 2 ? 'selected' : '');  ?>  value="2">February</option>
                                <option <?php echo ($company_record[0]->endmonth == 3 ? 'selected' : '');  ?>  value="3">March</option>
                                <option <?php echo ($company_record[0]->endmonth == 4 ? 'selected' : '');  ?>  value="4">April</option>
                                <option <?php echo ($company_record[0]->endmonth == 5 ? 'selected' : '');  ?>  value="5">May</option>
                                <option <?php echo ($company_record[0]->endmonth == 6 ? 'selected' : '');  ?>  value="6">June</option>
                                <option <?php echo ($company_record[0]->endmonth == 7 ? 'selected' : '');  ?>  value="7">July</option>
                                <option <?php echo ($company_record[0]->endmonth == 8 ? 'selected' : '');  ?>  value="8">August</option>
                                <option <?php echo ($company_record[0]->endmonth == 9 ? 'selected' : '');  ?>  value="9">September</option>
                                <option <?php echo ($company_record[0]->endmonth == 10 ? 'selected' : '');  ?>  value="10">October</option>
                                <option <?php echo ($company_record[0]->endmonth == 11 ? 'selected' : '');  ?>  value="11">November</option>
                                <option <?php echo ($company_record[0]->endmonth == 12 ? 'selected' : '');  ?>  value="12">December</option>
                            </select>
                        </div>
                    <?php echo form_close(); ?>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header text-center">
            <h3 class="box-title "><i class="fa fa-pencil-square-o" aria-hidden="true"></i> <?php echo $title2; ?></h3>
        </div>
        <div class="box-body">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <?php
    				$attributes = array('id'=>'website_form','method'=>'post','class'=>'form-horizontal');
    			?>
                    <?php echo form_open('Layout/web_details',$attributes); ?>
                        <div class="form-group">
                            <?php echo form_label(' Title 1:'); ?>
                            <?php
            					$data = array('class'=>'form-control','type'=>'text', 'value'=>$company_record[0]->title1 , 'name'=>'front_title1');
            					echo form_input($data);
            				 ?>
                        </div>
                        <div class="form-group">
                            <?php echo form_label('Title 2:'); ?>
                                <?php
                					$data = array('class'=>'form-control','type'=>'text', 'value'=>$company_record[0]->title2 ,'name'=>'front_title2');
                					echo form_input($data);
                				  ?>
                        </div>
                        <div class="form-group">
                            <?php echo form_label('Title 3:'); ?>
                            <?php
            					$data = array('class'=>'form-control','type'=>'text', 'value'=>$company_record[0]->title3 , 'name'=>'front_title3');
            					echo form_input($data);
            				  ?>
                         </div>
                        <div class="form-group">
                            <?php echo form_label('Title 4:'); ?>
                            <?php
            					$data = array('class'=>'form-control','type'=>'text', 'value'=>$company_record[0]->title4 , 'name'=>'front_fitle4');
            					echo form_input($data);
            				  ?>
                        </div>
                        <div class="form-group">
                            <?php echo form_label('Title 5 :'); ?>
                            <?php
            					$data = array('class'=>'form-control','type'=>'text', 'value'=>$company_record[0]->title5 ,'name'=>'front_title5');
            					echo form_input($data);
            				  ?>
                        </div>
                        <div class="form-group">
                            <?php echo form_label('Title 6 :'); ?>
                            <?php
            					$data = array('class'=>'form-control','type'=>'text', 'value'=>$company_record[0]->title6 ,'name'=>'front_title6');
            					echo form_input($data);
            				?>
                        </div>
                        <div class="form-group">
                            <?php echo form_label('Sub Title 6 :'); ?>
                            <?php
        						$data = array('class'=>'form-control','type'=>'text', 'value'=>$company_record[0]->subtitle6 ,'name'=>'front_sub_title1');
            						echo form_input($data);
            				?>
                        </div>
                        <div class="form-group">
                            <?php echo form_label('Sub Title 6 :'); ?>
                            <?php
            					$data = array('class'=>'form-control','type'=>'text', 'value'=>$company_record[0]->subtitle6one ,'name'=>'front_sub_title2');
            						echo form_input($data);
            				?>
                        </div>
                        <div class="form-group">
                            <?php echo form_label('Title 8 :'); ?>
                            <?php
        						$data = array('class'=>'form-control','type'=>'text', 'value'=>$company_record[0]->title8 ,'name'=>'front_title8');
        							echo form_input($data);
        					?>
                        </div>
                        <div class="form-group">
                            <?php echo form_label('Title 9 :'); ?>
                            <?php
        						$data = array('class'=>'form-control','type'=>'text', 'value'=>$company_record[0]->title9 ,'name'=>'front_title9');
        							echo form_input($data);
        					?>
                        </div>
                        <div class="form-group">
                            <?php echo form_label('Title 10 :'); ?>
                            <?php
        						$data = array('class'=>'form-control','type'=>'text', 'value'=>$company_record[0]->title10 ,'name'=>'front_title10');
        							echo form_input($data);
        					?>

                        </div>
                        <div class="form-group">
                            <?php
        						$data = array('class'=>'btn btn-info btn-flat btn-lg','type' => 'submit','name'=>'btn_submit_medicine','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save Front details');

        						echo form_button($data);
        					 ?>
                        </div>
                     <?php echo form_close(); ?>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header text-center">
            <h3 class="box-title "><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Slider Options</h3>
        </div>
        <div class="box-body">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <?php
                $attributes = array('id'=>'website_form','method'=>'post','class'=>'form-horizontal');
                ?>
                <?php echo form_open_multipart('Layout/banner1',$attributes); ?>
                <div class="form-group">
                    <?php echo form_label(' Slide 1:'); ?>
                    <p>
                        <img  class="img-responsive"  src="<?php echo base_url().'uploads/systemimgs/'.$company_record[0]->slider1; ?>" alt="ad image" />
                    </p>
                    <?php
                    $data = array('class'=>'form-control','type'=>'file', 'value'=>$company_record[0]->slider1,'name'=>'ad_image1');
                    echo form_input($data);
                    ?>
                </div>
                <div class="form-group">
                    <?php
                    $data = array('class'=>'btn btn-info btn-flat pull-right ','type' => 'submit','name'=>'btn_submit_medicine','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save Slider 1');
                    echo form_button($data);
                    ?>
                    <a class="btn btn-danger btn-flat pull-right " href="<?php echo base_url().'Layout/delete/slider1'; ?>"><i class="fa fa-trash" aria-hidden="true"></i> Empty Slide 1</a>
                </div>
                <?php echo form_close(); ?>
                <?php echo form_open_multipart('Layout/banner2',$attributes); ?>
                <div class="form-group">
                    <?php echo form_label('Slide 2:'); ?>
                    <p>
                        <img  class="img-responsive"  src="<?php echo base_url().'uploads/systemimgs/'.$company_record[0]->slider2; ?>" alt="ad image" />
                    </p>
                    <?php
                    $data = array('class'=>'form-control','value'=>$company_record[0]->slider2,'type'=>'file','name'=>'ad_image2');
                    echo form_input($data);
                    ?>
                </div>
                <div class="form-group">
                    <?php
                    $data = array('class'=>'btn btn-info btn-flat pull-right ','type' => 'submit','name'=>'btn_submit_medicine','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save Slider 2');
                    echo form_button($data);
                    ?>
                    <a class="btn btn-danger btn-flat pull-right " href="<?php echo base_url().'Layout/delete/slider2'; ?>"><i class="fa fa-trash" aria-hidden="true"></i> Empty Slide 2</a>
                </div>
                <?php echo form_close(); ?>

                <?php echo form_open_multipart('layout/banner3',$attributes); ?>
                <div class="form-group">
                    <?php echo form_label('Slide 3:'); ?>
                    <p>
                        <img  class="img-responsive"  src="<?php echo base_url().'uploads/systemimgs/'.$company_record[0]->slider3; ?>" alt="ad image" />
                    </p>
                    <?php
                    $data = array('class'=>'form-control','value'=>$company_record[0]->slider2,'type'=>'file','name'=>'ad_image3');
                    echo form_input($data);
                    ?>
                </div>
                <div class="form-group">
                    <?php
                    $data = array('class'=>'btn btn-info btn-flat pull-right ','type' => 'submit','name'=>'btn_submit_medicine','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save slide 3');
                    echo form_button($data);
                    ?>
                    <a class="btn btn-danger btn-flat pull-right " href="<?php echo base_url().'Layout/delete/slider3'; ?>"><i class="fa fa-trash" aria-hidden="true"></i> Empty Slide 3</a>
                </div>
                <?php echo form_close(); ?>

                <?php echo form_open_multipart('Layout/banner4',$attributes); ?>
                <div class="form-group">
                    <?php echo form_label('Slide 4:'); ?>
                    <p>
                        <img  class="img-responsive"  src="<?php echo base_url().'uploads/systemimgs/'.$company_record[0]->slider4; ?>" alt="ad image" />
                    </p>
                    <?php
                    $data = array('class'=>'form-control','value'=>$company_record[0]->slider4,'type'=>'file','name'=>'ad_image4');
                    echo form_input($data);
                    ?>
                </div>
                <div class="form-group">
                    <?php
                    $data = array('class'=>'btn btn-info btn-flat pull-right ','type' => 'submit','name'=>'btn_submit_medicine','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save Slide 4');
                    echo form_button($data);
                    ?>
                    <a class="btn btn-danger btn-flat pull-right " href="<?php echo base_url().'Layout/delete/slider4'; ?>"><i class="fa fa-trash" aria-hidden="true"></i> Empty Slide 4</a>
                </div>
                <?php echo form_close(); ?>

                <?php echo form_open_multipart('Layout/banner5',$attributes); ?>
                <div class="form-group">
                    <?php echo form_label('Slide 5:'); ?>
                    <p>
                        <img  class="img-responsive"  src="<?php echo base_url().'uploads/systemimgs/'.$company_record[0]->slider5; ?>" alt="ad image" />
                    </p>
                    <?php
                    $data = array('class'=>'form-control','value'=>$company_record[0]->slider2,'type'=>'file','name'=>'ad_image5');
                    echo form_input($data);
                    ?>
                </div>
                <div class="form-group">
                    <?php
                    $data = array('class'=>'btn btn-info btn-flat pull-right ','type' => 'submit','name'=>'btn_submit_medicine','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save slide 5');
                    echo form_button($data);
                    ?>
                    <a class="btn btn-danger btn-flat pull-right " href="<?php echo base_url().'Layout/delete/slider5'; ?>"><i class="fa fa-trash" aria-hidden="true"></i> Empty slide 5
                    </a>
                </div>
                <?php echo form_close(); ?>
        </div>
    </section>
    <section class="content">
    <div class="box box-info">
        <div class="box-header text-center">
            <h3 class="box-title "><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Slider Options</h3>
        </div>
        <div class="box-body">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <?php
                $attributes = array('id'=>'website_form','method'=>'post','class'=>'form-horizontal');
                ?>
                <?php echo form_open_multipart('Layout/banner1',$attributes); ?>
                <div class="form-group">
                    <?php echo form_label(' Slide 1:'); ?>
                    <p>
                        <img  class="img-responsive"  src="<?php echo base_url().'uploads/systemimgs/'.$company_record[0]->slider1; ?>" alt="ad image" />
                    </p>
                    <?php
                    $data = array('class'=>'form-control','type'=>'file', 'value'=>$company_record[0]->slider1,'name'=>'ad_image1');
                    echo form_input($data);
                    ?>
                </div>
                <div class="form-group">
                    <?php
                    $data = array('class'=>'btn btn-info btn-flat pull-right ','type' => 'submit','name'=>'btn_submit_medicine','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save Slider 1');
                    echo form_button($data);
                    ?>
                    <a class="btn btn-danger btn-flat pull-right " href="<?php echo base_url().'Layout/delete/slider1'; ?>"><i class="fa fa-trash" aria-hidden="true"></i> Empty Slide 1</a>
                </div>
                <?php echo form_close(); ?>
                <?php echo form_open_multipart('Layout/banner2',$attributes); ?>
                <div class="form-group">
                    <?php echo form_label('Slide 2:'); ?>
                    <p>
                        <img  class="img-responsive"  src="<?php echo base_url().'uploads/systemimgs/'.$company_record[0]->slider2; ?>" alt="ad image" />
                    </p>
                    <?php
                    $data = array('class'=>'form-control','value'=>$company_record[0]->slider2,'type'=>'file','name'=>'ad_image2');
                    echo form_input($data);
                    ?>
                </div>
                <div class="form-group">
                    <?php
                    $data = array('class'=>'btn btn-info btn-flat pull-right ','type' => 'submit','name'=>'btn_submit_medicine','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save Slider 2');
                    echo form_button($data);
                    ?>
                    <a class="btn btn-danger btn-flat pull-right " href="<?php echo base_url().'Layout/delete/slider2'; ?>"><i class="fa fa-trash" aria-hidden="true"></i> Empty Slide 2</a>
                </div>
                <?php echo form_close(); ?>

                <?php echo form_open_multipart('layout/banner3',$attributes); ?>
                <div class="form-group">
                    <?php echo form_label('Slide 3:'); ?>
                    <p>
                        <img  class="img-responsive"  src="<?php echo base_url().'uploads/systemimgs/'.$company_record[0]->slider3; ?>" alt="ad image" />
                    </p>
                    <?php
                    $data = array('class'=>'form-control','value'=>$company_record[0]->slider2,'type'=>'file','name'=>'ad_image3');
                    echo form_input($data);
                    ?>
                </div>
                <div class="form-group">
                    <?php
                    $data = array('class'=>'btn btn-info btn-flat pull-right ','type' => 'submit','name'=>'btn_submit_medicine','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save slide 3');
                    echo form_button($data);
                    ?>
                    <a class="btn btn-danger btn-flat pull-right " href="<?php echo base_url().'Layout/delete/slider3'; ?>"><i class="fa fa-trash" aria-hidden="true"></i> Empty Slide 3</a>
                </div>
                <?php echo form_close(); ?>

                <?php echo form_open_multipart('Layout/banner4',$attributes); ?>
                <div class="form-group">
                    <?php echo form_label('Slide 4:'); ?>
                    <p>
                        <img  class="img-responsive"  src="<?php echo base_url().'uploads/systemimgs/'.$company_record[0]->slider4; ?>" alt="ad image" />
                    </p>
                    <?php
                    $data = array('class'=>'form-control','value'=>$company_record[0]->slider4,'type'=>'file','name'=>'ad_image4');
                    echo form_input($data);
                    ?>
                </div>
                <div class="form-group">
                    <?php
                    $data = array('class'=>'btn btn-info btn-flat pull-right ','type' => 'submit','name'=>'btn_submit_medicine','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save Slide 4');
                    echo form_button($data);
                    ?>
                    <a class="btn btn-danger btn-flat pull-right " href="<?php echo base_url().'Layout/delete/slider4'; ?>"><i class="fa fa-trash" aria-hidden="true"></i> Empty Slide 4</a>
                </div>
                <?php echo form_close(); ?>

                                <?php echo form_open_multipart('Layout/banner5',$attributes); ?>
                <div class="form-group">
                    <?php echo form_label('Slide 5:'); ?>
                    <p>
                        <img  class="img-responsive"  src="<?php echo base_url().'uploads/systemimgs/'.$company_record[0]->slider5; ?>" alt="ad image" />
                    </p>
                    <?php
                    $data = array('class'=>'form-control','value'=>$company_record[0]->slider2,'type'=>'file','name'=>'ad_image5');
                    echo form_input($data);
                    ?>
                </div>
                <div class="form-group">
                    <?php
                    $data = array('class'=>'btn btn-info btn-flat pull-right ','type' => 'submit','name'=>'btn_submit_medicine','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save slide 5');
                    echo form_button($data);
                    ?>
                    <a class="btn btn-danger btn-flat pull-right " href="<?php echo base_url().'Layout/delete/slider5'; ?>"><i class="fa fa-trash" aria-hidden="true"></i> Empty slide 5
                    </a>
                </div>
                <?php echo form_close(); ?>
        </div>
    </section>
