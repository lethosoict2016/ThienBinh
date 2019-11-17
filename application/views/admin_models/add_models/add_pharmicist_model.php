<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4 class="modal-title"><i class="fa fa-plus-square" aria-hidden="true"></i> Add Pharmacist</h4>
</div>
<div class="modal-body">
	<div class="row">
        <div class="box box-danger">
            <div class="box-body">
               <div class="col-md-12">
				<?php
						$attributes = array('id'=>'Pharmacist_form','method'=>'post','class'=>'form-horizontal');
				?>
				<?php echo form_open_multipart('Pharmacist/add_pharmacist',$attributes); ?>
	              <div class="form-group">	
					 <?php echo form_label('Pharmacist Name:'); ?>
					  <?php
						$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'pharmacist_name','placeholder'=>'Enter Pharmacist Name');
						echo form_input($data);
				?>
	              </div>
				   <div class="form-group">
					<?php echo form_label('Pharmacist Post:'); ?>
	                   <?php
							$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'pharmacist_post','placeholder'=>'e.g Head of Laboratory');
							echo form_input($data);
					?>
	              </div>
				   <div class="form-group">
				  	 <?php echo form_label('Pharmacist description:'); ?>
		              <?php
								$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'pharmacist_des','placeholder'=>'e.g Lorum Ipsum Dollar sit amit');
								echo form_input($data);
					  ?>
	                </div>
				   <div class="form-group">
				   <?php echo form_label('Facebook :'); ?>
				   <?php
							$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'pharmacist_facebook','placeholder'=>'e.g /medix');
							echo form_input($data);
				   ?>
	              </div>
				   <div class="form-group">
				     <?php echo form_label('Twitter :'); ?>
	                   <?php
							$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'pharmacist_twitter','placeholder'=>'e.g /medix');
							echo form_input($data);
						?>
	              </div>
				   <div class="form-group">
				     <?php echo form_label('LinkedIn:'); ?>
					  <?php
							$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'pharmacist_linked','placeholder'=>'e.g /medix');
							echo form_input($data);
					  ?>
	              </div>
				    <div class="form-group">
				     <?php echo form_label('GooglePlus:'); ?>
					  <?php
							$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'pharmacist_googleplus','placeholder'=>'e.g /medix');
							echo form_input($data);
					
						?>
	              </div>
				   <div class="form-group">
	                	<label>Upload Phamacist Picture </label>
						<div class="input-group">
		          		<input type="file" class="input-lg" name="pharmacist_picture" data-validate="required" data-message-required="Value Required" >
		                </div>
	              </div>
				  <div class="form-group">  				
					<?php
						$data = array('class'=>'btn btn-info btn-flat btn-lg ','type' => 'submit','name'=>'btn_submit_Pharmacist','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save Pharmacist');
						echo form_button($data);
					 ?>   
	              </div>
				<?php echo form_close(); ?>
        	</div>
      	</div>
	</div>
  </div>
</div>
 <!-- Form Validation -->
<script src="<?php echo base_url(); ?>assets/dist/js/custom.js"></script>