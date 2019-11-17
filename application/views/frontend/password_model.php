<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>		
	<h5  class="modal-title">Change Password</h5>
</div>  
<div class="modal-body"> 
	<?php
		$attributes = array('id'=>'change_password_Model_User','method'=>'post');
	?>
	<?php echo form_open('Userpanel/change_password',$attributes); ?>
	<div class="form-group">
		<?php echo form_label('Old Password :'); ?>
		<?php
			$data = array('class'=>'form-control','id'=>'old_password','type'=>'password','name'=>'old_password','placeholder'=>'Please Enter your old password','reqiured'=>'');
			echo form_input($data);
		?>
	</div>
	<div class="form-group">
		<?php echo form_label('New Password :'); ?>
			<?php
			$data = array('class'=>'form-control','id'=>'new_password','type'=>'password','name'=>'new_password','placeholder'=>'Please Enter your new password','reqiured'=>'');
			echo form_input($data);
		?>
	</div>  
	<div class="form-group">
		<?php echo form_label('Confirm Password :'); ?>
		<?php
			$data = array('class'=>'form-control','id'=>'confirm_password','type'=>'password','name'=>'confirm_password','placeholder'=>'Please Confirm your new password','reqiured'=>'');
			echo form_input($data);
		?>
	</div>
	<div class="form-group">	
	<?php
		$data = array('class'=>'btn btn-info  btn-set','name'=>'btn_submit_login','value'=>'Change Password');
		echo form_submit($data);
	 ?> 
	</div> 
	<br />		  
</form>			
</div>   