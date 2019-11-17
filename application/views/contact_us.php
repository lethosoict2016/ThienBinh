<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-md-6">
            <div class="col-md-12">
                <div class="box box-info">
                    <div class="box-header">
                        <h3 class="box-title"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> <?php echo $title1; ?></h3>
                    </div>
                    <div class="box-body">
                        <div class="col-md-12">
                            <?php
				               $Contact_attributes = array('id'=>'contact_form1','method'=>'post','class'=>'form-horizontal');
			                 ?>
                            <?php echo form_open('Frontend/Contact',$Contact_attributes); ?>
                                <!--.form group -->
                                <div class="form-group">
                                    <?php echo form_label('Contact Title:'); ?>
                                    <?php 
                    					$data = array('class'=>'form-control','type'=>'text', 'value'=>$contact_record[0]->contact_title,'name'=>'contact_title');
                                        echo form_input($data);
                    				?>
                                </div>
                                <div class="form-group">
                                    <?php echo form_label('Contact description:'); ?>
                                    <?php 
                						$data = array('class'=>'form-control','type'=>'text','value'=>$contact_record[0]->contact_description,'name'=>'contact_description');
                						echo form_input($data);
			                         ?>
                                </div>
                                <div class="form-group">
                                    <?php echo form_label('Phone Number:'); ?>

                                        <?php 
                        					$data = array('class'=>'form-control','type'=>'text','value'=>$contact_record[0]->phone_number,'name'=>'phone_number');
                        					echo form_input($data);
                        				 ?>
                                </div>

                                <div class="form-group">
                                    <?php echo form_label('Email :'); ?>

                                        <?php 
                        					$data = array('class'=>'form-control','type'=>'email','value'=>$contact_record[0]->email ,'name'=>'email_address');
                        					echo form_input($data);
                        				?>

                                </div>

                                <div class="form-group">
                                    <?php echo form_label('Facebook :'); ?>
                                        <?php 
                        					$data = array('class'=>'form-control','type'=>'text','value'=>$contact_record[0]->facebook ,'name'=>'facebook');
                        					echo form_input($data);
                        				?>
                                </div>
                                <div class="form-group">
                                    <?php echo form_label('Twitter :'); ?>
                                    <?php 
                    					$data = array('class'=>'form-control','type'=>'text', 'value'=>$contact_record[0]->twitter ,'name'=>'twitter');
                    					echo form_input($data);
                    				?>
                                </div>
                                <div class="form-group">
                                    <?php echo form_label('Linked In :'); ?>
                                    <?php 
                    					$data = array('class'=>'form-control','type'=>'text', 'value'=>$contact_record[0]->linked ,'name'=>'linkedin');
                    					echo form_input($data);
		                            ?>
                                </div>
                                <div class="form-group">
                                    <?php echo form_label('Google+ :'); ?>
                                    <?php 
                    					$data = array('class'=>'form-control','type'=>'text', 'value'=>$contact_record[0]->googleplus , 'name'=>'googleplus');

                    					echo form_input($data);
                    			    ?>
                                </div>
                                <div class="form-group">
                                        <?php
                    						$data = array('class'=>'btn btn-info btn-flat btn-lg  ','type' => 'submit','name'=>'btn_submit_contact','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save Contact details');

                    						echo form_button($data);
                    					?>
                                </div>
                                <?php echo form_close(); ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="col-md-12">
                <div class="box box-info">
                    <div class="box-header">
                        <h3 class="box-title"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> <?php echo $title2; ?></h3>
                    </div>
                    <div class="box-body">
                        <div class="col-md-12">
                            <?php
                    			$About_attributes = array('id'=>'about_form1','method'=>'post','class'=>'form-horizontal');
                    		?>
                            <?php echo form_open('Frontend/About',$About_attributes); ?>
                                <div class="form-group">
                                    <?php echo form_label('About Us Title:'); ?>
                                        <?php 
                        					$data = array('class'=>'form-control','type'=>'text', 'value'=>$contact_record[0]->about_title , 'name'=>'about_title');

                        					echo form_input($data);
                        				  ?>
                                </div>
                                <div class="form-group">
                                    <?php echo form_label('About Us Quotation:'); ?>
                                    <?php 
                    					$data = array('class'=>'form-control','type'=>'text', 'value'=>$contact_record[0]->about_quotation ,'name'=>'about_quotation');
                    					echo form_input($data);
                    				  ?>
                                </div>
                                <div class="form-group">
                                    <?php echo form_label('About Us Name:'); ?>
                                    <?php 
                    					$data = array('class'=>'form-control','type'=>'text', 'value'=>$contact_record[0]->about_name ,'name'=>'about_name');

                    					echo form_input($data);
                    				?>
                                </div>
                                <div class="form-group">
                                    <?php echo form_label('About Us Title2:'); ?>
                                    <?php 
                    					$data = array('class'=>'form-control','type'=>'text', 'value'=>$contact_record[0]->about_title2 , 'name'=>'about_title2');
                    					echo form_input($data);
                    				?>
                                </div>
                                <div class="form-group">
                                    <?php echo form_label('About Us description:'); ?>
                                    <?php 
                    					$data = array('class'=>'form-control','type'=>'text', 'value'=>$contact_record[0]->about_description , 'name'=>'about_description');

                    					echo form_input($data);
                    				?>
                                </div>
                        </div>
                         <div class="form-group">
                                <?php echo form_label('Address:'); ?>
                                <?php 
                                    $data = array('class'=>'form-control','type'=>'text', 'value'=>$contact_record[0]->address , 'name'=>'about_address');
                                    echo form_input($data);
                                ?>
                        </div>
                        <div class="form-group">
                            <?php
        					 $data = array('class'=>'btn btn-info btn-flat btn-lg ','type' => 'submit','name'=>'btn_submit_medicine','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save About details');

        					echo form_button($data);
        					?>
                        </div>
                        <?php echo form_close(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>