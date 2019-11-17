<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="card" >
				<div class="header">
					<h4 class="title">Send your query</h4>
				</div>
				<div class="content" >
					<?php
						$Send_attributes = array('id'=>'send_email_user','role'=>'form','method'=>'post','class'=>'contactForm');
					?>
					<?php echo form_open('Useremail/send_email_admin',$Send_attributes); ?>
						<?php
							$data = array('class'=>'form-control br-radius-zero','type'=>'hidden','value'=>$customer_list[0]->cus_email,'name'=>'customer_email','data-rule'=>'email','data-msg'=>'Please enter a valid email','placeholder'=>'Your Email','reqiured'=>'');
							echo form_input($data);			
						?>
					<div class="form-group">
						<?php
							$data = array('class'=>'form-control br-radius-zero','type'=>'text','name'=>'subject','data-rule'=>'minlen:4','data-msg'=>'Please enter at least 8 chars of subject','placeholder'=>'subject','reqiured'=>'');
							echo form_input($data);	
						?>
					</div>
					<div class="form-group">
						<?php
							 $data = array(
								'name'        => 'email_desc',
								'id'          => 'compose-textarea',
								'rows'        => '5',
								'cols'        => '5',
								'style'       => 'height: 300px',
								'class'       => 'form-control br-radius-zero',
								'placeholder'  => 'Message',
								'data-rule'    => 'required',
								'data-msg'      => 'Please write something for us'
								);
							echo form_textarea($data);
						?>	
					</div>
					<div class="form-group">
						<?php
							$data = array('class'=>'btn btn-primary','type' => 'submit','name'=>'btn_submit_customer','value'=>'true', 'content' => 'Send Message');
							echo form_button($data);	
						?>
					</div>
					<?php echo form_close(); ?>
				</div>
			</div>
		</div>
	</div>
</div>