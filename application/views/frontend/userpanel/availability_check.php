<div class="container-fluid">
    <div class="row">
		<div class="col-md-12">
			 <div class="form-group">
				<select  style="color:#000;"  class="selectpicker form-control  col-md-12 " data-live-search="true"  >						 
					<option>SEARCH MEDICINES & OTHER ITEMS AVAILABILITY</option>
					<?php
					if($medicine_record_list != NULL)
					{
						foreach ($medicine_record_list as $obj_medicine_record_list)
						{				
					?>
						<option data-subtext=""><?php echo $obj_medicine_record_list->product_name.' | Generic '.$obj_medicine_record_list->generic_name.' | Weight '.$obj_medicine_record_list->mg.' '.$obj_medicine_record_list->unit_type.' | Stock '.$obj_medicine_record_list->quantity; ?></option>								  
					<?php
						}
					}
					?>
												  
				</select>						  
			</div>
		</div>  
    </div>
 </div>