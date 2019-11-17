<div class="container-fluid">
    <div class="row">
		<div style="padding:16px;" class="card">
            <div class="header">
                <h4 class="title "> Upload Prescription </h4>
            </div>
            <div class="content">
			<?php
				$attributes = array('id'=>'prescription_form','method'=>'post','enctype'=>'multipart/form-data','class'=>'form-horizontal');
			?>
			<?php echo form_open('Userpanel/add_prescription',$attributes); ?>
				<div class="row">
	                <div class="col-md-12">
						<div class="form-group ">
							 <?php
								$data = array('class'=>'form-control','type'=>'file','id'=>'','name'=>'prescription_Picture_name','reqiured'=>'');
								echo form_input($data);
							?>							
						</div>			
					</div>
				</div>
				<div class="row">
	                <div class="col-md-12">
						<div class="form-group ">
							<?php echo form_label('Shipping Address (Change the address below if you want to shipped on another address ):');?>
							<?php
							$data = array('class'=>'form-control','type'=>'text','id'=>'shippinaddress','name'=>'shippinaddress','value'=>$customer_record_list[0]->cus_address.' '.$customer_record_list[0]->cus_region.' '.$customer_record_list[0]->cus_town,'reqiured'=>'');
							echo form_input($data);
							?>						
						</div>
					</div>
				</div> 	
				<div class="row">
	                <div class="col-md-12">
						<?php
							$data = array('class'=>'btn btn-info btn-fill btn-wd','name'=>'btn_prescription','value'=>'Upload prescription');
							echo form_submit($data);
						 ?> 
					</div>	
				</div>	
            </form>										
          	</div>	
     	</div>
  	</div>
</div>