<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">&times;</button>		
<h4  class="modal-title">Login Form</h4>
</div>  
<div class="modal-body"> 
    <?php
		$attributes = array('id'=>'Login_form_Model','method'=>'post');
	?>
	<?php echo form_open('Login/authentication_user',$attributes); ?>
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
		<?php echo form_label('Password :','userpassword',$labelAttributes); ?>
		<?php
			$data = array('class'=>'form-control','type'=>'password','id'=>'user_password','name'=>'user_password','value'=>'','placeholder'=>'Please Enter your password','data-validate'=>'required','data-message-required'=>'Value Required');
			echo form_input($data);
		?>
      </div>
      <div class="form-group">	
	  <?php
			$data = array('class'=>'btn btn-info  btn-lg btn-set','name'=>'btn_submit_login','value'=>'Login');
			echo form_submit($data);
		 ?> 
	 </div> 
	  <div class="form-group">	
		  <a href="#" onclick="show_modal_page('<?php echo base_url();?>main/popup/forget_model')"  class="pull-left link-set" >Forget Password</a>
		  <a href="#" onclick="show_modal_page('<?php echo base_url();?>main/popup/signup_model')" class="pull-right link-set" >Sign up</a>
     </div>
	  <br />
	  <br />
	  <hr />
	  <div class="form-group">
           <table class="table table-bordered">
					<tr>
						<td>Email</td><td>user@medix.net</td>	
					</tr>
					<tr>
						<td>Password</td><td>12345</td>	
					</tr>
			</table>
        </div>
	</form>			
</div>   
