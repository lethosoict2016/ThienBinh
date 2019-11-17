<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4 class="modal-title"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 
	Edit Somewords details:</h4>
</div>
<div class="modal-body">
	<div class="row">
			<div class="box box-danger">
				<div class="box-body">
					<div class="col-md-12">
					<?php
						$Edit_attributes = array('id'=>'Edit_Somewords_form','method'=>'post','class'=>'form-horizontal');
					?>
						<?php echo form_open_multipart('Somewords/edit',$Edit_attributes); ?>
						<div class="form-group">
							<?php echo form_label('Somewords Title:'); ?>
							<?php
								$data = array('class'=>'form-control ','type'=>'hidden','name'=>'edit_somewords_id','value'=>$single_words[0]->id);
								echo form_input($data);
								$data = array('class'=>'form-control input-lg','type'=>'text','value'=>$single_words[0]->title,'name'=>'edit_somewords_title');
								echo form_input($data);
							?>
						</div>
						<div class="form-group">
							<?php echo form_label('Somewords description:'); ?>
							<?php
									$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'edit_somewords_des','value'=>$single_words[0]->description,'reqiured'=>'');
									echo form_input($data);
							  ?>
						</div>
						<div class="form-group">
							<?php echo form_label('Somewords Icon:'); ?>
							<?php
								$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'edit_somewords_icon','value'=>$single_words[0]->icon,'placeholder'=>'e.g fa fa-group');
								echo form_input($data);
							?>
						</div>
						<div class="form-group">
							<?php
								$data = array('class'=>'btn btn-info btn-flat btn-lg  pull-right','type' => 'submit','name'=>'btn_submit_Somewords','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Update Somewords');
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