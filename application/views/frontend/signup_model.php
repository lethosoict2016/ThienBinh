<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">&times;</button>		
<h4  class="modal-title">Signup Form</h4>
</div>  
<div class="modal-body">     
	<?php
		$labelAttributes = array(
				'class' => 'label',
				'style' => 'color: #000;'
		);
	?>
	<?php
			$attributes = array('id'=>'Signup_form_Model','method'=>'post');
	?>
	<?php echo form_open('Main/add_customer',$attributes); ?>
      <div class="form-group">	
		<?php echo form_label('User name :','User name',$labelAttributes); ?>
		<?php
			$data = array('class'=>'form-control','type'=>'text','id'=>'user_name','name'=>'user_name','placeholder'=>'Please enter your name','reqiured'=>'');
			echo form_input($data);
		?>
	 </div>
      <div class="form-group">
		<?php echo form_label('Email :','email_address',$labelAttributes); ?>
		<?php
			$data = array('class'=>'form-control','type'=>'email','id'=>'email_address','name'=>'email_address','placeholder'=>'Please enter your email','reqiured'=>'');
			echo form_input($data);
		?>
	  </div>
      <div class="form-group">	
		<?php echo form_label('Password :','password',$labelAttributes); ?>
		<?php
			$data = array('class'=>'form-control','type'=>'password','id'=>'password','name'=>'password','placeholder'=>'Please enter your password','reqiured'=>'');
			echo form_input($data);
		?>
	 </div>
      <div class="form-group">	
		<?php echo form_label('Confirm Password :','cpassword',$labelAttributes); ?>
		<?php
			$data = array('class'=>'form-control','type'=>'password','id'=>'cpassword','name'=>'cpassword','placeholder'=>'Please confirm your password','reqiured'=>'');
			echo form_input($data);
		?>
	  </div>
      <div class="form-group">	
		<?php echo form_label('Address :','address',$labelAttributes); ?>
		<?php
			$data = array('class'=>'form-control','type'=>'text','id'=>'address','name'=>'address','placeholder'=>'Please enter your current address','reqiured'=>'');
			echo form_input($data);
		?>
	  </div>
      <div class="form-group">
		<?php echo form_label('Contact number :','contact',$labelAttributes); ?>			
		<?php
			$data = array('class'=>'form-control','type'=>'number','id'=>'contact','name'=>'contact','placeholder'=>'Please enter your contact number','reqiured'=>'');
			echo form_input($data);
		?>
	  </div>
      <div class="form-group">	
		 <?php
			$data = array('class'=>'btn btn-info  btn-lg btn-set','name'=>'btn_submit_signup','value'=>'Signup');
			echo form_submit($data);
		 ?> 
      </div> 	  
	</form>			
 </div>   

