 
 <style>

#prescribtion_id:hover{
	background-color:#000;
	opacity:0.2;
	cursor:pointer;
}

#prescribtion_id>img{
	width:100px;
	height:90px;
	margin-left:14px;
}

</style>
 <div id="image_Model" class="modal  fade" data-backdrop="false"  role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
		
        <h4 class="modal-title"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> Prescription Image</h4>
		
      </div>
	  
	  
	  
      <div class="modal-body">
        
			 <div class="form-group">
					
					<?php
					
						echo img(array('width'=>'500','height'=>'auto','name'=>'prescribtion_picture'));
				
					?>
              </div>
			</div>
		</div>
		
		
	</div>
</div> 
<div class="container-fluid">
	
				<section class="col-md-12">
					<div class="row">
					<!-- /.form group -->
			
					<?php
							$attributes = array('id'=>'Sales_form','method'=>'post','class'=>'form-horizontal');
					?>

					<?php echo form_open('userPanel/order_history',$attributes); ?>
			  
						<div class="col-xs-12">
								<div class="form-group">
								
										<?php echo form_label('Date From:'); ?>
								 
										<?php $data = array('class'=>'form-control','type'=>'date','name'=>'date1');
										
										echo form_input($data); ?>
								
										
								</div>
								<div class="form-group">
									
									
										<?php echo form_label('Date To:'); ?>
								 
										<?php $data1 = array('class'=>'form-control','type'=>'date','name'=>'date2');
										
										echo form_input($data1); ?>
								
								</div>	
								<div class="form-group">
										<?php
					
					
											$data = array('class'=>'btn btn-info  btn-flat pull-right','type' => 'submit','name'=>'btnSubmit','value'=>'true', 'content' => '<i class="fa fa-search" aria-hidden="true"></i> Search');
											
											echo form_button($data);
										 ?> 
										
								</div>
								
						</div>
						
						</form>
				</div>

		</section>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title"><?php echo $title; ?></h4>
                                <p class="category"><?php echo $title_sub; ?></p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped  table-hover">
                                    <thead>
									<?php
									
									foreach ($table_heading_names_of_coloums as $table_head){
					
								?>
								   <th><?php echo $table_head; ?></th>	
								<?php
											
										
									}
										
								?>
                                       
                                    </thead>
                                    <tbody>
									<?php
									
									$counter = 1;
										foreach ($order_records as $obj_order_records){
						
									?>
                                        <tr>
                                        	<td><?php echo $counter; ?></td>
                                        	<td><?php echo $obj_order_records->id; ?></td>
                                        	<td><?php echo $obj_order_records->date; ?></td>
											<td id="prescribtion_id"><img onclick="prescribtion_model(<?php echo $obj_order_records->id; ?>)"  src="<?php echo base_url(); ?>uploads/prescription/<?php echo $obj_order_records->cus_picture; ?>" class="form-control" alt="prescription images" /></td>
                                        	
                                        	<td>
												<?php 
														if($obj_order_records->status == 0){
														?>
															<i style="color:red" class="fa fa-question-circle" aria-hidden="true"></i>
															 UnVerified 
														<?php
														}
														
														else if($obj_order_records->status == 1){
															?>
															
															<i  style="color:orange" class="fa fa-check-circle" aria-hidden="true"></i> 
															Verified 
														<?php
														}
														
														else if($obj_order_records->status == 2){
															?>
															
															<i style="color:green" class="fa fa-money" aria-hidden="true"></i>
															Piad 
															
														<?php
															
															
														}
														
														else if($obj_order_records->status == 3){
														?>
													
															<i class="fa fa-truck" aria-hidden="true"></i>
															Delivered
															
															<?php
															
														}else if($obj_order_records->status == 5){
														?>
													
															<i class="fa fa-question-circle" aria-hidden="true"></i>
																Expired
															
															<?php
															
														}
													
												?>
											</td>
                                        	
                                        </tr>
										
                                    <?php
											$counter++;
										
										}
										
									?>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

<script type="text/javascript">
   
	function prescribtion_model(id){
		
		
		$.ajax({
			url : "<?php echo base_url(); ?>index.php/Orders/ajax_edit/"+id,
			type: "GET",
			dataType: "JSON",
			success: function(data)
			{
			
				//Assign JSON data to textbox to edit
				//$('[name="Edit_order_Id"]').val(data.id);
				
				//set the value of image of name below from json data
				$('[name="prescribtion_picture"]').attr("src",'../uploads/prescription/'+data.cus_picture);
	
				// show bootstrap modal when complete loaded			
				$('#image_Model').modal('show'); 
				
		
			
			},
			error: function (jqXHR, textStatus, errorThrown)
			{
				
				alert('Error get data from ajax');
			}
		});
		
	}
</script>