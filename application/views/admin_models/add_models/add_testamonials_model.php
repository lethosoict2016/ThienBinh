<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">&times;</button>
<h4 class="modal-title"><i class="fa fa-plus-square" aria-hidden="true"></i> Add Testamonials</h4>
</div>
  <div class="modal-body">
	<div class="row">
      <div class="box box-danger">
        <div class="box-body">
          <div class="col-md-12">
			<?php
				$attributes = array('id'=>'Testamonial_form','method'=>'post','class'=>'form-horizontal');
			?>
			<?php echo form_open_multipart('Testamonial/add_testamonial',$attributes); ?>
	          <div class="form-group">	
				 <?php echo form_label('Testamonial Name:'); ?>
				 <?php
					$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'testamonial_name','placeholder'=>'Enter Testamonial Name');
					echo form_input($data);
				?>
	          </div>
			   <div class="form-group">
				<?php echo form_label('Testamonial Description:'); ?>
	           <?php
					$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'testamonial_description','placeholder'=>'e.g I was a great fun');
					echo form_input($data);
				?>
	          </div>
			   <div class="form-group">
	            <label>Upload Testamonial Picture </label>
					<div class="input-group">
	      				<input type="file" class="input-lg form-control" name="testamonial_picture" data-validate="required" data-message-required="Value Required" >
	            	</div>
	          </div>
			  <div class="form-group">  				
				<?php
					$data = array('class'=>'btn btn-info btn-flat margin btn-lg','type' => 'submit','id'=>'','name'=>'btn_submit_Testamonial','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Save Testamonial');
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
