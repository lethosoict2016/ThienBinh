<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">&times;</button>
<h4 class="modal-title"><i class="fa fa-plus-square" aria-hidden="true"></i> Add Somewords</h4>
</div>	  
<div class="modal-body">
	<div class="row">
      	<div class="box box-danger">
            <div class="box-body">
            	<div class="col-md-12">
				<?php
						$attributes = array('id'=>'SomewordsList_form','method'=>'post','class'=>'form-horizontal');
				?>
				<?php echo form_open_multipart('Somewords/add_somewords',$attributes); ?>
	              <div class="form-group">	
					<?php echo form_label('Somewords Title:'); ?>
					<?php
						$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'somewords_title','placeholder'=>'Enter Somewords Title');
						echo form_input($data);
					?>
	              </div>
				   <div class="form-group">
					<?php echo form_label('Somewords description:'); ?>
	               <?php
						$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'somewords_description','placeholder'=>'e.g I was a great fun');
						echo form_input($data);
					?>
	              </div>
				  <div class="form-group">
				   <?php echo form_label('Somewords Icon:'); ?>
	               <?php
						$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'somewords_icon','placeholder'=>'e.g fa fa-group');
						echo form_input($data);
					?>
	              </div>
				  <div class="form-group">  				
					<?php
						$data = array('class'=>'btn btn-info btn-flat btn-lg  pull-right','type' => 'submit','name'=>'btn_submit_Somewords','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save Somewords');
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