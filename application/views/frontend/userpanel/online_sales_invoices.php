<section class="col-md-12">
<div class="row">
					<?php
							$attributes = array('id'=>'Sales_form','method'=>'post','class'=>'form-horizontal');
					?>
					<?php echo form_open('Online_invoice/manage',$attributes); ?>
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
	 
<?php
	for($i = 0; $i < count($Sales_Record); $i++)
	{
?>
    <section class="invoice" id="<?php echo $invoices_Record[$i]->prescription_id; ?>">
      <div class="row">
        <div class="col-xs-12">
          <h5 class="page-header">
            <i class="fa fa-globe"></i>  <?php echo $this->db->get_where('mp_langingpage', array('id' => 1))->result_array()[0]['companyname'] ;?>
            
            <small class="pull-right">Date: <?php echo $invoices_Record[$i]->date; ?></small>
          </h5>
        </div>
      </div>
      <div class="row invoice-info">
	  <span style="margin-right:15px; font-size:12px;" class="pull-right margin">
	  
				  <?php
				   if($invoices_Record[$i]->status == 1)
				   {
				  ?>
					   <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					   <?php
					  echo "Verified";
				  } 
				  else if($invoices_Record[$i]->status == 2)
				  {
					  echo "Paid";
				  }
				  else if($invoices_Record[$i]->status == 3)
				  {
					  echo "Delivered to Customer ";
				  }
				  else
				  {
					  echo "Error";
				  }

				  ?>
	  </span>
        <div class="col-sm-4 invoice-col">
		 <span >(Online Copy)</span> <br />
		 <span>invoice # <?php echo $invoices_Record[$i]->prescription_id; ?></span><br>
          From
           <address>
        
              <?php echo $this->db->get_where('mp_contactabout', array('id' => 1))->result_array()[0]['address'] ;?><br>
          Phone: <?php echo $this->db->get_where('mp_contactabout', array('id' => 1))->result_array()[0]['phone_number'] ;?><br>
          Email:<?php echo $this->db->get_where('mp_contactabout', array('id' => 1))->result_array()[0]['email'] ;?><br>
	
        </address>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-12 table-responsive">
          <table class="table table-striped">
            <thead>
            <tr>
              <th>No</th>
              <th>Sku</th>
              <th>Product</th>
			   <th>Mg</th>
			   <th>Price</th>
              <th>Qty</th>
              <th>Subtotal</th>
            </tr>
            </thead>
            <tbody>
			<?php
			$counter = 0;
			$total = 0;
			$tax=0; 
			while( $counter < count($Sales_Record[$i]))
			{
				$subtotal = 0;
				$subtotal = $Sales_Record[$i][$counter]->price*$Sales_Record[$i][$counter]->qty;
				$total = $total+$subtotal;
				$tax =  $tax + $Sales_Record[$i][$counter]->tax;
			?>
            <tr>
              <td><?php echo $counter+1; ?></td>
              <td><?php echo $Sales_Record[$i][$counter]->product_no; ?></td>
              <td><?php echo $Sales_Record[$i][$counter]->product_name; ?></td>
              <td><?php echo $Sales_Record[$i][$counter]->mg; ?></td>
              <td><?php echo $Sales_Record[$i][$counter]->price; ?></td>
              <td><?php echo $Sales_Record[$i][$counter]->qty; ?></td>
              <td><?php echo $subtotal;?></td>
            </tr>
            <?php		
				$counter++;	
				}
			?>
            </tbody>
          </table>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-12">
          <div class="table-responsive">
            <table class="table">
              <tr>
                <td style="width:50%">Subtotal (<?php echo $this->db->get_where('mp_langingpage', array('id' => 1))->result_array()[0]['currency'] ;?>):</td>
                <td class="text-right"> <?php echo $total; ?></td>
              </tr> 
			  <tr>
                <td style="width:50%">Discount(%):</td>
                <td class="text-right"><?php echo $invoices_Record[$i]->discount; ?></td>
              </tr>
              <tr>
                <td style="width:50%">Tax(<?php echo $this->db->get_where('mp_langingpage', array('id' => 1))->result_array()[0]['currency'];?>):</td>
                <td class="text-right"> <?php echo $tax ?></td>
               </tr>
			  <tr>
                <td style="width:50%">Shipping charges:</td>
                <td class="text-right"><?php echo $invoices_Record[$i]->shippingcharges; ?></td>
              </tr>
              <?php
			  //PERCENTAGE CALCULATION TO FIND THE TOTAL AMOUNT AFTER SUBTRATING DISCOUNT
			      $totalam = ($total/100)*$invoices_Record[$i]->discount;
				  $new_amount = ($total-$totalam)+$tax; 
				?>
              <tr>
                <td>Total (<?php echo $this->db->get_where('mp_langingpage', array('id' => 1))->result_array()[0]['currency'] ;?>):</td>
                <td class="text-right"><?php echo $new_amount+$invoices_Record[$i]->shippingcharges; ?></td>
              </tr>
            </table>
          </div>
        </div>
      </div>	
 <!-- this row will not appear when printing -->
      <div class="row no-print">
	  <div class="col-md-8"></div>
			<div class="col-md-4">
					<div class="col-md-7">
						<button onclick="printDiv(<?php echo $invoices_Record[$i]->prescription_id; ?>)"  class="btn btn-info btn-flat   pull-right "><i class="fa fa-print pull-left"></i>  Print </button>						
					</div>	
					<div class="col-md-5">
						<?php	
						   if($invoices_Record[$i]->status == 1)
						   {
						?>
							<a style="marign-left:15px;" href="<?php echo base_url(); ?>paypal_setting/invoice_description/<?php echo $Sales_Record[$i][0]->order_id; ?>"  class="btn btn-info btn-flat   pull-right "><i class="fa fa-dollar pull-left"></i>  Pay Now </a>
						   <?php 
							}
						   ?>
						
						
					</div>
			</div>
      </div>
    </section>
    <div class="clearfix"></div>
<?php
}
?>