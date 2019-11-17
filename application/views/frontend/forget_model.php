<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>		
	<h4  class="modal-title">Enter Your Email Address</h4>
</div>  
<div class="modal-body"> 
    <?php
			$attributes = array('id'=>'Forget_form_Model_User','method'=>'post');
	?>
	<?php echo form_open('Forget_password/forget_password_send_email_user',$attributes); ?>
	<?php	
			$labelAttributes = array(
					'class' => 'label',
					'style' => 'color: #000;'
			);
	?>
	<div class="form-group">
		<?php echo form_label('Email :','user_email',$labelAttributes); ?>
		<?php
			
			$data = array('class'=>'form-control','type'=>'email','id'=>'user_email','name'=>'user_email','value'=>'','placeholder'=>'Please Enter your email address','data-validate'=>'required','data-message-required'=>'Value Required');
			echo form_input($data);
		?>
	 </div>
	 <div class="form-group">	
	  <?php
			$data = array('class'=>'btn btn-info btn-lg  btn-set','name'=>'btn_submit_login','value'=>'Send Me Email');
			echo form_submit($data);
		 ?> 
	 </div>  
	  <br />		  
	<?php echo form_close(); ?>			
 </div> 