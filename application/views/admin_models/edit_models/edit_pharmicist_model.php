<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <h4 class="modal-title"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 
    Edit Pharmacist details:</h4>
</div>
<div class="modal-body">
   <div class="row">
   <div class="box box-danger">
    <div class="box-body">
        <div class="col-md-12">
			<?php
				$Edit_attributes = array('id'=>'Edit_Pharmacist_form','method'=>'post','class'=>'form-horizontal');
			?>
			<?php echo form_open_multipart('pharmacist/edit',$Edit_attributes); ?>
	        <div class="form-group">	
				<?php echo form_label('Pharmacist Name:'); ?>
				<?php
					$data = array('class'=>'form-control','type'=>'hidden','value'=>$single_pharmacist[0]->id,'name'=>'edit_pharmacist_id');
					echo form_input($data);		
					$data = array('class'=>'form-control input-lg','type'=>'text','value'=>$single_pharmacist[0]->name,'name'=>'edit_pharmacist_name');
				echo form_input($data);
				?>
	        </div>
			<div class="form-group">
				<?php echo form_label('Pharmacist Post:'); ?>
	            <?php
					$data = array('class'=>'form-control input-lg','type'=>'text','value'=>$single_pharmacist[0]->post_title,'name'=>'edit_pharmacist_post');
					echo form_input($data);
				?>
	        </div>
			<div class="form-group">
				   	<?php echo form_label('Pharmacist description:'); ?>
	              	 <?php
						$data = array('class'=>'form-control input-lg','cols'=>'10','rows'=>'5','value'=>$single_pharmacist[0]->description,'name'=>'edit_pharmacist_des','reqiured'=>'');
						echo form_textarea($data);
				  	?>
	        </div>
		    <div class="form-group">
			   <?php echo form_label('Facebook:'); ?>
				<?php
					$data = array('class'=>'form-control input-lg','type'=>'text','value'=>$single_pharmacist[0]->facebook,'name'=>'edit_pharmacist_facebook','reqiured'=>'');
					echo form_input($data);
			   ?> 
	        </div>
		    <div class="form-group">
			    <?php echo form_label('Twitter:'); ?>
	           	<?php
					$data = array('class'=>'form-control input-lg','type'=>'text','value'=>$single_pharmacist[0]->twitter,'name'=>'edit_pharmacist_twitter','reqiured'=>'');
					echo form_input($data);
				?>
	       </div>
		   <div class="form-group">
		    <?php echo form_label('linked in:'); ?>
			<?php
					$data = array('class'=>'form-control input-lg','type'=>'text','value'=>$single_pharmacist[0]->linked,'name'=>'edit_pharmacist_linked','reqiured'=>'');
					echo form_input($data);
			?>
	      </div>
			<div class="form-group">
				   <?php echo form_label('Google Plus:'); ?>
	               <?php
						$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'edit_pharmacist_googleplus','value'=>$single_pharmacist[0]->googleplus,'reqiured'=>'');
						echo form_input($data);
					?>
	        </div>	 
		    <div class="form-group">
	           <?php
					echo img(array('width'=>'100','height'=>'100','src'=>base_url().'uploads/pharmacist/'.$single_pharmacist[0]->cus_picture,'class'=>'img-circle','name'=>'edit_pharmacist_picture'));
				?>
	        </div>
		   <div class="form-group">
	        	<label>Upload Pharmacist Picture (Optional)</label>
				<div class="input-group">
	  				<input type="file" name="edit_pharmacist_picture_name" data-validate="required" data-message-required="Value Required" >
	       		 </div>
	      </div>
		  <div class="form-group">  				
			<?php
				$data = array('class'=>'btn btn-info btn-flat btn-lg ','type' => 'submit','name'=>'btn_submit_Pharmacist','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Update Pharmacist');
				
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