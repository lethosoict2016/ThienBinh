<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4 class="modal-title"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit Service details:</h4>
</div>
<div class="modal-body">	
	<div class="row">
      <div class="box box-danger">
        <div class="box-body">
          <div class="col-md-12">
			<?php
				$Edit_attributes = array('id'=>'Edit_Service_form','method'=>'post','class'=>'form-horizontal');
			?>
			<?php echo form_open_multipart('service/edit',$Edit_attributes); ?>
          	<div class="form-group">	
			 <?php echo form_label('Service Title:'); ?> 
			 <?php
				$data = array('class'=>'form-control','type'=>'hidden','name'=>'edit_service_id','value'=>$single_service[0]->id);
				echo form_input($data);
							
				$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'edit_service_title','value'=>$single_service[0]->title);
				echo form_input($data);
			?>
          </div>
		   <div class="form-group">
			  <?php echo form_label('Service description:'); ?>
              <?php
				$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'edit_service_des','reqiured'=>'','value'=>$single_service[0]->description);
				echo form_input($data);
			  ?>
            </div>
		    <div class="form-group">
				<?php echo form_label('Service Icon:'); ?>
               	<?php
					$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'edit_service_icon','value'=>$single_service[0]->icon);
					echo form_input($data);
				?>
          </div>
		  <div class="form-group">  				
			<?php
				$data = array('class'=>'btn btn-info btn-flat btn-lg  pull-right','type' => 'submit','name'=>'btn_submit_Service','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Update Service');
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