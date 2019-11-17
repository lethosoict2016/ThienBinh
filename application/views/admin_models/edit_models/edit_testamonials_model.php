<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">&times;</button>
		<h4 class="modal-title"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit Testamonial details:</h4>
</div>
<div class="modal-body">
 	<div class="row">
 		<div class="box box-danger">
			<div class="box-body">
				<div class="col-md-12">
					<?php
						$Edit_attributes = array('id'=>'Edit_Testamonial_form','method'=>'post','class'=>'form-horizontal');
					?>
					<?php echo form_open_multipart('testamonial/edit',$Edit_attributes); ?>
				      <div class="form-group">	
						 <?php echo form_label('Testamonial Name:'); ?>
						 <?php
							$data = array('class'=>'form-control','type'=>'hidden','name'=>'edit_testamonial_id','value'=>$single_testa[0]->id);
							echo form_input($data);

							$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'edit_testamonial_name','value'=>$single_testa[0]->name);
							echo form_input($data);
						?>
				      </div>
					   <div class="form-group">
					   <?php echo form_label('Testamonial Description:'); ?>
				       <?php
							$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'edit_testamonial_des','reqiured'=>'','value'=>$single_testa[0]->description);
								echo form_input($data);
					  	?>
				        </div>   
						<div class="form-group">
				           <?php
								echo img(array('width'=>'100','height'=>'100','class'=>'img-circle','name'=>'Edit_testamonial_picture','src'=>base_url().'uploads/testamonials/'.$single_testa[0]->cus_picture));
							?>
				      </div>
					   <div class="form-group">
				        <label>Upload Testamonial Picture</label>
							 <div class="input-group">
				  			<input type="file" name="edit_testamonial_picture_name" data-validate="required" data-message-required="Value Required" >
				        </div>
				      </div>
					  <div class="form-group">  				
						<?php
							$data = array('class'=>'btn btn-info btn-flat btn-lg margin','type' => 'submit','id'=>'','name'=>'btn_submit_Pharmacist','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Update Testamonial');
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