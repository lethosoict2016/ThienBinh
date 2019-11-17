<style>
.avatar:hover{
	background-color:#eee;
	cursor:pointer;
	opacity:0.5;
}	
.passwordset{
	cursor:pointer;	
}	
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-4 col-md-5">
			<div class="card card-user">
				<div class="image">
					<img src="<?php echo base_url(); ?>/assets/img/background.jpg" alt="background image"/>
				</div>
				<div class="content">
					<div class="author">
						<img onclick="show_modal_page('<?php echo base_url();?>userpanel/popup/picture_model')" class="avatar border-white" src="<?php echo base_url(); ?>uploads/customers/<?php echo $customer_record_list[0]->cus_picture; ?>" alt="<?php echo $customer_record_list[0]->customer_name; ?>"/>
						<h4 class="title">
							<?php echo $customer_record_list[0]->customer_name; ?>
						</h4>
					</div>
					<div class="row">
					<br />
					<div class="col-md-12">
						<p class="text-center">
							<i class="fa fa-building  " aria-hidden="true"/></i> Company : <?php echo $customer_record_list[0]->cus_company; ?> </p>
						<p class="text-center" >
							<i class="fa fa-user" aria-hidden="true"/></i> user_name : <?php echo $customer_record_list[0]->customer_name; ?> </p>
						<p class="text-center" >
							<i class="fa fa-envelope-o" aria-hidden="true"/></i> Email : <?php echo $customer_record_list[0]->cus_email; ?> </p>
						<p class="text-center" >
							<i class="fa fa-phone"" aria-hidden="true"/></i> Contact 1 : <?php echo $customer_record_list[0]->cus_contact_1; ?> </p>
						<p class="text-center" >
							<i class="fa fa-phone"" aria-hidden="true"/></i> Contact 2 : <?php echo $customer_record_list[0]->cus_contact_2; ?></p>
						<p class="text-center" >
							<i class="fa fa-address-card-o" aria-hidden="true"/></i> Address : <?php echo $customer_record_list[0]->cus_address; ?> </p>
						<p class="text-center" >
							<i class="fa fa-map-marker" aria-hidden="true"/></i> Region : <?php echo $customer_record_list[0]->cus_region; ?></p>
						<p class="text-center" >
							<i class="fa fa-globe" aria-hidden="true"/></i> Town : <?php echo $customer_record_list[0]->cus_town; ?> </p>
						<p class="text-center"  >
							<i class="fa fa-key"  aria-hidden="true"/></i><u onclick="show_modal_page('<?php echo base_url();?>userpanel/popup/password_model')"> Change Password </u> </p>
					</div>
				</div>
			</div>
			<hr>
		</div>
	</div>
	<div class="col-lg-8 col-md-7">
	<div class="card">
	<div class="header">
		<h4 class="title">Edit Profile</h4>
	</div>
	<div class="content">
				<?php
					$Send_attributes = array('id'=>'User_Profile_form','role'=>'form','method'=>'post','class'=>'');
				?>
				<?php echo form_open('Userpanel/edit_profile',$Send_attributes); ?>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<?php echo form_label('Company'); ?>
					<?php
	
						$data = array('class'=>'form-control border-input','type'=>'text','name'=>'cus_company','placeholder'=>'Company','value'=>$customer_record_list[0]->cus_company,'reqiured'=>'');
						echo form_input($data);					
					?>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<?php echo form_label('User Name'); ?>
					<?php
						$data = array('class'=>'form-control border-input','type'=>'text','name'=>'user_name','placeholder'=>'user_name','value'=>$customer_record_list[0]->customer_name,'reqiured'=>'');
						echo form_input($data);				
					?>

				</div>
			</div>
		</div>
	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<?php echo form_label('Contact 1'); ?>
				
				<?php

					$data = array('class'=>'form-control border-input','type'=>'number','name'=>'contact1','placeholder'=>'Contact 1','value'=>$customer_record_list[0]->cus_contact_1,'reqiured'=>'');
					echo form_input($data);
							
				?>
				
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<?php echo form_label('Contact 2'); ?>
					<?php

						$data = array('class'=>'form-control border-input','type'=>'text','name'=>'contact2','placeholder'=>'Contact 2','value'=>$customer_record_list[0]->cus_contact_2,'reqiured'=>'');
						echo form_input($data);
							
					?>
					
					</div>
				</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<?php echo form_label('Address'); ?>
					<?php

						$data = array('class'=>'form-control border-input','type'=>'text','name'=>'Home_address','placeholder'=>'Home Address','value'=>$customer_record_list[0]->cus_address,'reqiured'=>'');
						echo form_input($data);
						
					?>
					
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<?php echo form_label('Region'); ?>
					<?php
						$data = array('class'=>'form-control border-input','type'=>'text','name'=>'region','placeholder'=>'Region','value'=>$customer_record_list[0]->cus_region,'reqiured'=>'');
						echo form_input($data);
					?>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<?php echo form_label('Town'); ?>
					<?php
						$data = array('class'=>'form-control border-input','type'=>'text','name'=>'town','placeholder'=>'Town','value'=>$customer_record_list[0]->cus_town,'reqiured'=>'');
						echo form_input($data);			
					?>
				</div>
			</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<?php echo form_label('About Me'); ?>
							<?php 
									 $data = array(
										'name'        => 'description',
										'id'          => 'compose-textarea',
										'rows'        => '4',
										'cols'        => '4',
										'style'       => 'height: 300px',
										'class'       => 'form-control border-input',
										'placeholder'  => 'Here can be your description"',
										'data-rule'    => 'required',
										'data-msg'      => 'Please write something for us',
										'value'         =>$customer_record_list[0]->cus_description
									);

								echo form_textarea($data);
							?>
					</div>
				</div>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-info btn-fill btn-wd">Update Profile</button>
			</div>
			<div class="clearfix"/>
			</form>
		</div>
	</div>
</div>
</div>
</div>	
<!-- Bootstrap model  -->
<?php $this->load->view('bootstrap_model.php'); ?>
<!-- Bootstrap model  ends--> 