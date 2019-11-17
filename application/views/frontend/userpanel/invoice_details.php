<?php
if($Sales_Record != "")
{
	for($i = 0; $i < count($Sales_Record); $i++)
	{
?>
    <section class="invoice" id="<?php echo $Sales_Record[$i][0]->id; ?>">
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
				   if($invoices_Record[$i]->status == 0)
				   {
				   ?>
					   <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					   <?php
					  echo "UnVerified";
				  } 
				  else if($invoices_Record[$i]->status == 1)
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
				  else{
					  echo "Error";
				  }

				?>
	  </span>
        <div class="col-sm-4 invoice-col">
		 <span >(Online Copy)</span> <br />
		 <span>invoice # <?php echo $invoices_Record[$i]->id; ?></span><br>
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
			$tax  = 0;
			$total = 0;
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
		
		$Currency =  $this->db->get_where('mp_langingpage', array('id' => 1))->result_array()[0]['currency'] ;
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
                <td style="width:50%">Subtotal (<?php echo $Currency; ?>):</td>
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
				  $new_amount = ($total-$totalam)+$invoices_Record[$i]->shippingcharges;
				   $new_amount = $new_amount+$tax;
			  ?>
              <tr>
                <td>Total (<?php echo $Currency;?>):</td>
                <td class="text-right"><?php echo $new_amount; ?></td>
              </tr>
			 
            </table>
          </div>
        </div>
      </div>
      <div class="row no-print">
	  
		  <div class="col-md-12">
			
					
					<div class="pull-right" id="myContainerElement"></div>
					
		
			</div>
      </div>
    </section>
    <div class="clearfix"></div>
 
<?php
	
	}
		
}else{
	
	echo "Sorry No invoice";
}

	//var invoice_id  = <?php echo $invoices_Record[0]->id; 
	
?>

<script src="https://www.paypalobjects.com/api/checkout.js" data-version-4></script>    
<script>	

// Render the button into the container element

    paypal.Button.render({

		  env: 'sandbox', // Or 'sandbox', //production
        // Pass the client ids to use to create your transaction on sandbox and production environments

        client: {
            sandbox:    'AYhn2w7UR-kBDGkbqRfx4__6QtyNNm8WTu_gkL_9JxigKPiM32lWpuEISXSupEge3YKhq0KW5UNGcjqJ' // from https://developer.paypal.com/developer/applications/
           // production: 'xxxxxxxxx'  // from https://developer.paypal.com/developer/applications/
        },

        

     payment: function(data, actions) {
            return actions.payment.create({
                payment: {
					
							transactions:   [
												{
													amount: { total: <?php echo $new_amount; ?> ,currency:"<?php echo $Currency;?>"}, 
													invoice_number: <?php echo $invoices_Record[0]->id; ?>
							
												}
											]	
						}	
						

            });
        },
		
        // Display a "Pay Now" button rather than a "Continue" button

        commit: true,

        // Pass a function to be called when the customer completes the payment
        onAuthorize: function(data, actions) {
			
			   return actions.payment.get().then(function(data) {

                    return actions.payment.execute().then(function() {

								alert('Payment successfull');
						
								 window.location='<?php echo base_url().'index.php/Userpanel/order_history' ?>';
								 
								 });
               
            });
	
        },
		
		 onError: function(err) {
			alert('Sorry Payment Failed');
        },
		
       

      onCancel: function(data, actions) {
           
		 alert('Sorry you cancelled the process');
		
		
		   // return actions.redirect();
        }

    }, '#myContainerElement');


</script>