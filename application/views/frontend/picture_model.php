<style type="text/css">
	.modal-backdrop
	{
		z-index: 0 !important;
	}
</style>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>		
	<h5 class="modal-title">Change Picture</h5>
</div>  
<div class="modal-body"> 
	<?php
		$attributes = array('id'=>'Picture_Model_User','method'=>'post');
	?>
	<?php echo form_open_multipart('Userpanel/change_profile_picture',$attributes); ?>
	<?php	
		$labelAttributes = array(
				'class' => 'label',
				'style' => 'color: #000;'
		);
	?>
	<div class="form-group">
		<div class="form-group">
			<?php echo form_label('Select Picture'); ?>
			<div class="input-group">
				<input type="file" name="customer_picture" id="customer_picture" data-validate="required" data-message-required="Value Required" >
				</div>
			</div>
	</div>
	<div class="form-group">	
		<?php
			$data = array('class'=>'btn btn-info  btn-set','name'=>'btn_submit','value'=>'Change Picture');
			echo form_submit($data);
		?> 
	</div> 	  
	</form>			
</div>   