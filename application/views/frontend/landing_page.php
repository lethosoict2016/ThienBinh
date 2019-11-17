<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	 	<link rel="icon" type="image/png" sizes="96x96" href="<?php echo base_url();?>assets/img/favicon.png">
    <title><?php echo $main_titles[0]->companyname; ?></title>
    <meta name="<?php echo $main_titles[0]->companydescription	; ?>" content="<?php echo $main_titles[0]->companyname; ?>">
    <meta name="<?php echo $main_titles[0]->companykeywords; ?>" content="<?php echo $main_titles[0]->companyname; ?>">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
    <!-- Font Awesome -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Bootstrap 3.3.6 -->
  	<link rel="stylesheet" href="<?php echo base_url(); ?>assets/bootstrap/css/bootstrap.min.css">
  	<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/dist/css/front/style.css">
  	<link rel="stylesheet" type="text/css"  href="<?php echo base_url(); ?>assets/dist/css/front/bootstrap-select.css">
  </head>
  <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
  	<!--banner-->
	<section>
      <div id="myCarousel" class="carousel slide " data-ride="carousel">
         <?php 
            if($main_titles[0]->slider1 != "" AND $main_titles[0]->slider2 != "")
            {
              ?>
             <!-- Indicators -->
              <ol class="carousel-indicators">
              	<?php 
              	if($main_titles[0]->slider1 != "")
              	{
	              	?>
              			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	              	<?php	
              	}

              	if($main_titles[0]->slider2 != "")
              	{
	              	?>
              			<li data-target="#myCarousel" data-slide-to="1"></li>
	              	<?php	
              	}
 
              	if($main_titles[0]->slider3 != "")
              	{
	              	?>
              			 <li data-target="#myCarousel" data-slide-to="2"></li>
	              	<?php	
              	}

              	if($main_titles[0]->slider4 != "")
              	{
	              	?>
              			<li data-target="#myCarousel" data-slide-to="3"></li>
	              	<?php	
              	}

              	if($main_titles[0]->slider5 != "")
              	{
	              	?>
              			<li data-target="#myCarousel" data-slide-to="4"></li>
	              	<?php	
              	}
              	?>
              </ol>
          <?php    
            }
           ?>
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
        <?php 
        	$active1 = 'active';
        	$active2 = 'active';
        	if($main_titles[0]->slider1 != "" OR $main_titles[0]->slider2 != "")
        	{
	          	if($main_titles[0]->slider1 != "")
	          	{
		          $active2 = '';
		?>
		        <div class="item <?php echo $active1; ?>">	
		          	<img class="img-responsive slider_imgs" src="<?php echo base_url().'uploads/systemimgs/'.$main_titles[0]->slider1;?>" />
		        </div>
        <?php    
          	   }
		        if($main_titles[0]->slider2 != "")
		        {    
		          ?>
		            <div class="item <?php echo $active2; ?>">
		             <img class="img-responsive slider_imgs"  src="<?php echo base_url().'uploads/systemimgs/'.$main_titles[0]->slider2;?>" />
		            </div>
		      <?php    
		        }      
		        if($main_titles[0]->slider3 != "")
		        {    
		          ?>
		            <div class="item <?php echo $active2; ?>">
		             <img class="img-responsive slider_imgs"  src="<?php echo base_url().'uploads/systemimgs/'.$main_titles[0]->slider3;?>" />
		            </div>
		      <?php    
		        }
		        if($main_titles[0]->slider4 != "")
		        {    
		          ?>
		            <div class="item <?php echo $active2; ?>">
		             <img class="img-responsive slider_imgs"  src="<?php echo base_url().'uploads/systemimgs/'.$main_titles[0]->slider4;?>" />
		            </div>
		      <?php    
		        }
		        if($main_titles[0]->slider5 != "")
		        {    
		          ?>
		            <div class="item <?php echo $active2; ?>">
		             <img class="img-responsive slider_imgs"  src="<?php echo base_url().'uploads/systemimgs/'.$main_titles[0]->slider5;?>" />
		            </div>
		      <?php    
		        }
			 }
        	else
        	{
        		?>
        			<img class="img-responsive slider_imgs" src="<?php echo base_url().'uploads/systemimgs/'.$main_titles[0]->banner;?>" />
	        <?php
	        }
	       ?> 

        </div>

          <?php 
            if($main_titles[0]->slider1 != "" AND $main_titles[0]->slider2 != "")
            {
              ?>
                   <!-- Left and right controls -->
                  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a  class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                  </a>
              <?php
            }
           ?>
       
      </div>
	  <div class="section_content">
			<nav class="navbar navbar-default navbar-fixed-top">
			  <div class="container">
			  	<div class="col-md-12">
				    <div class="navbar-header">
				      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				      </button>
				      <a class="navbar-brand" href="#"><img src="<?php echo base_url(); ?>uploads/systemimgs/<?php echo $main_titles[0]->logo; ?>" class="img-responsive" style="width: 140px; margin-top: -16px;"></a>
					</div>
				    <div class="collapse navbar-collapse navbar-right" id="myNavbar">
				      <ul class="nav navbar-nav">
				        <li class="active"><a href="#banner">Home</a></li>
				        <?php
				        	if($services != NULL){
				        ?>
				        	<li class=""><a href="#service">Services</a></li>
				        <?php
				        	}
				        
				        	if($pharmacist != NULL){
				        ?>
				        	<li class=""><a href="#about">About</a></li>

				        <?php
				   		 }
				        	if($testamonials != NULL){
				        ?>
				        	<li class=""><a href="#testimonial">Testimonial</a></li>
				        <?php
				        	}
				        ?>
				        <li class=""><a href="#contact">Contact</a></li>
				          <li class=""><a href="#" onclick="show_modal_page('<?php echo base_url();?>main/popup/login_model')"> Login User </a></li>
				      </ul>
				    </div>
				</div>
			  </div>
			</nav>
			<div class="container">
				<div class="row">
					<div class="banner-info">
						<div class="banner-logo text-center">
							<img src="<?php echo base_url(); ?>uploads/systemimgs/<?php echo $main_titles[0]->logo; ?>" class="img-responsive">
						</div>
						<div class="banner-text text-center">
							<h1 class="white"><?php echo $main_titles[0]->title1; ?></h1>
						</div>
						<div class="row banner-text" style="margin-top:25px;" >
							 <div class="col-md-12">
									<div class="col-md-3"></div>
									<div class="col-md-6">	 
										 <div class="form-group">
												<select  style="color:#000; z-index:9999;"  class="selectpicker form-control  col-md-12 " data-live-search="true"  >
												 
												 <option>SEARCH MEDICINES & OTHER ITEMS AVAILIBILITY</option>
												   
												  <?php
														//DEFINES TO LOAD THE CATEGORY LIST FROM DATABSE TABLE mp_medicinelist
														if($product_record_list != NULL)
														{
															foreach ($product_record_list as $obj_product_record_list)
															{		
													?>
												  			<option data-subtext=""><?php echo $obj_product_record_list->product_name.' | Generic '.$obj_product_record_list->generic_name.' | '.$obj_product_record_list->mg.' '.$obj_product_record_list->unit_type.' | Stock '.$obj_product_record_list->quantity; ?>
												  				
												  			</option>
												  <?php
													
													}
												}
												  ?>
												</select>
										</div> 
									 </div>
									 <div class="col-md-3"></div>
							</div>
						</div>
							<div class="banner-text text-center">
							<button onclick="show_modal_page('<?php echo base_url();?>main/popup/login_model')" type="button" class="btn btn-appoint">UPLOAD PRESCRIPTION</button>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/ banner-->
	<!--service-->
	<?php
	if($services != NULL)
	{
	?>
	<section id="service" class="section-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12">
					<h2 class="ser-title"><?php echo $main_titles[0]->title2; ?></h2>
					<hr class="botm-line">

				</div>
			</div>
			<div class="row">
				<?php 
					foreach($services as $obj_services)
					{			
				?>
				<div class="col-md-6 col-sm-12">
					<div class="service-info">
						<div class="icon">
							<i class="<?php echo $obj_services->icon; ?>"></i>
						</div>
						<div class="icon-info">
							<h4><?php echo $obj_services->title; ?></h4>
							<p><?php echo $obj_services->description; ?></p>
						</div>
					</div>
				</div>
				<?php 
					}			
				?>
			</div>
		</div>
	</section>
	<!--/ service-->
<?php
	}
	if($somewords != NULL)
	{
?>
	<!--about-->
	<section id="about" class="section-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
			        <div class="section-title">
			          <h2 class="head-title lg-line"><?php echo $main_titles[0]->title3; ?></h2>
			        </div>
					<hr class="">
				</div>
			</div>
			<div class="row">
				<?php 
					foreach($somewords as $obj_somewords)
					{				
				?>
				<div class="col-md-6 col-sm-12 col-xs-12">
			       <div style="visibility: visible;" class=" more-features-box">
			          <div class="more-features-box-text">
			            <div class="more-features-box-text-icon"> <i class="<?php echo $obj_somewords->icon; ?>" aria-hidden="true"></i> </div>
			            <div class="more-features-box-text-description">
				            <h4><?php echo $obj_somewords->title; ?></h4>
				            <p><?php echo $obj_somewords->description; ?></p>
				        </div>
			          </div>
			        </div>
			    </div>
				<?php 
					}				
				?>			
			</div>
		</div>
	</section>
	<?php
	}
	if($pharmacist != NULL)
	{
?>
	<!--/ about-->
	<!--doctor team-->
	<section id="doctor-team" class="section-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="ser-title"><?php echo $main_titles[0]->title4; ?></h2>
					<hr class="botm-line">
				</div>
				<?php 
					foreach($pharmacist as $obj_pharmacist)
					{				
				?>
				<div class="col-md-3 col-sm-6 col-xs-12">
			      <div class="thumbnail"> 
			      	<img src="<?php echo base_url(); ?>uploads/pharmacist/<?php echo $obj_pharmacist->cus_picture; ?>" alt="<?php echo $obj_pharmacist->name; ?>" class="team-img">
			        <div class="caption">
			          <h3><?php echo $obj_pharmacist->name; ?></h3>
			          <p><?php echo $obj_pharmacist->post_title; ?></p>
			          <p><?php echo $obj_pharmacist->description; ?></p>
			          <ul class="list-inline">
			            <li><a href="<?php echo $obj_pharmacist->facebook; ?>"><i class="fa fa-facebook"></i></a></li>
			            <li><a href="<?php echo $obj_pharmacist->twitter; ?>"><i class="fa fa-twitter"></i></a></li>
			            <li><a href="<?php echo $obj_pharmacist->googleplus	; ?>"><i class="fa fa-google-plus"></i></a></li>
			            <li><a href="<?php echo $obj_pharmacist->linked	; ?>"><i class="fa fa-linkedin"></i></a></li>
			          </ul>
			        </div>
			      </div>
			    </div>
				<?php 
					}				
				?> 
			</div>
		</div>
	</section>
		<?php
	}
	if($testamonials != NULL)
	{
?>
	<!--/ doctor team-->
	<!--testimonial-->
	<section id="testimonial" class="section-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="ser-title"><?php echo $main_titles[0]->title5; ?></h2>
					<hr class="botm-line">
				</div>
				<?php 
					foreach($testamonials as $obj_testamonials)
					{				
				?>
				<div class="testamonials col-md-4 col-sm-12">
					<div class="testi-details">
						<!-- Paragraph -->
						<p><?php echo $obj_testamonials->description;?></p>
					</div>
					<div class="testi-info">
						<!-- User Image -->
						<a href="#"><img src="<?php echo base_url(); ?>uploads/testamonials/<?php echo $obj_testamonials->cus_picture; ?>" alt="" class="img-responsive"></a>
						<!-- User Name -->
						<h3><?php echo $obj_testamonials->name;?></h3>
					</div>
				</div>
				<?php
					}	
				?>
			</div>
		</div>
	</section>
	<?php
	}
	if($Conatcdetails[0]->about_title != NULL)
	{
	?>
	<!--/ testimonial-->
	<!--cta 2-->
	<section id="cta-2" class="section-padding">
		<div class="container">
			<div class=" row">
				<div class="col-md-2"></div>
	            <div class="text-right-md col-md-4 col-sm-4">
	              <h2 class="section-title white lg-line"><?php echo $Conatcdetails[0]->about_title; ?></h2>
	            </div>
	            <div class="col-md-4 col-sm-5">
	              <?php echo $Conatcdetails[0]->about_quotation; ?>
	              <p class="text-right text-primary"><i><?php echo $Conatcdetails[0]->about_name; ?></i></p>
	            </div>
	            <div class="col-md-2"></div>
	        </div>
		</div>
	</section>
	<!--cta-->
	<?php
	}
	if($main_titles[0]->title6 != NULL)
	{
	?>
	<!--contact-->
	<section id="contact" class="section-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="ser-title"><?php echo $main_titles[0]->title6; ?></h2>
					<hr class="botm-line">
				</div>
				<div class="col-md-4 col-sm-4">
			      <h3><?php echo $main_titles[0]->subtitle6; ?></h3>
			      <div class="space"></div>
			      <p><i class="fa fa-map-marker fa-fw pull-left fa-2x"></i><?php echo $Conatcdetails[0]->address; ?></p>
			      <div class="space"></div>
			      <p><i class="fa fa-envelope-o fa-fw pull-left fa-2x"></i><?php echo $Conatcdetails[0]->email; ?></p>
			      <div class="space"></div>
			      <p><i class="fa fa-phone fa-fw pull-left fa-2x"></i><?php echo $Conatcdetails[0]->phone_number; ?></p>
			    </div>
				<div class="col-md-8 col-sm-8 marb20">
					<div class="contact-info">
							<h3 class="cnt-ttl"><?php echo $main_titles[0]->subtitle6one; ?></h3>
							<div class="space"></div>
                            <div id="sendmessage">Your message has been sent. Thank you!</div>
                            <div id="errormessage"></div>
							
						<?php
								$Send_attributes = array('id'=>'send_email_user','role'=>'form','method'=>'post','class'=>'contactForm');
						?>
						<?php echo form_open('Email/send_email/Main',$Send_attributes); ?>
                                <div class="form-group">
									<?php
										$data = array('class'=>'form-control br-radius-zero','type'=>'email','name'=>'customer_email','data-rule'=>'email','id'=>'customer_email','data-msg'=>'Please enter a valid email','placeholder'=>'Your Email','reqiured'=>'');
										echo form_input($data);
									?>
                                    <div class="validation"></div>
                                </div>
                                <div class="form-group">
                                    <?php
										$data = array('class'=>'form-control br-radius-zero','type'=>'text','name'=>'subject','data-rule'=>'minlen:4','data-msg'=>'Please enter at least 8 chars of subject','id'=>'subject','placeholder'=>'subject','reqiured'=>'');
										echo form_input($data);
									?>
									<div class="validation"></div>
                                </div>
                                <div class="form-group">
									<?php
									 $data = array(
													'name'        => 'email_desc',
													'id'          => 'textarea_Des',
													'rows'        => '5',
													'cols'        => '5',
													'style'       => 'height: 94px',
													'class'       => 'form-control br-radius-zero',
													'placeholder'  => 'Message',
													'data-rule'    => 'required',
													'data-msg'      => 'Please write something for us'
									);
									echo form_textarea($data);
								?>
								<div class="validation"></div>
                                </div>
								<div class="form-action">
								<?php
									$data = array('class'=>'btn btn-form','type' => 'submit','name'=>'btn_submit_customer','value'=>'true', 'content' => '<i class="fa fa-envelope-o" aria-hidden="true"></i> Send Message');
									
									echo form_button($data);
								?>
								</div>
								<?php echo form_close(); ?>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/ contact-->
<?php
	}
?>
	<!--footer-->
	<footer id="footer">
			<?php
				if($Conatcdetails[0]->about_title2 != NULL)
				{
			?>
		<div class="top-footer">
			<div class="container">
				<div class="row">
				<div class="col-md-4 col-sm-4 marb20">
						<div class="ftr-tle">
							<h4 class="white no-padding"><?php echo $Conatcdetails[0]->about_title2	; ?>
							</h4>
						</div>
						<p srt><?php echo $Conatcdetails[0]->about_description; ?></p>
				</div>
				<div class="col-md-4 col-sm-4 marb20">
					<div class="ftr-tle">
						<h4 class="white no-padding"><?php echo $main_titles[0]->title8; ?></h4>
					</div>
					<div class="info-sec">
						<ul class="quick-info">
							<li><a href="index.html"><i class="fa fa-circle"></i>Home</a></li>
							<li><a href="#service"><i class="fa fa-circle"></i>Service</a></li>
							<li><a href="#contact"><i class="fa fa-circle"></i>Appointment</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 marb20">
					<div class="ftr-tle">
						<h4 class="white no-padding"><?php echo $main_titles[0]->title9; ?></h4>
					</div>
					<div class="info-sec">
						<ul class="social-icon">
							<li class="bglight-blue"><a href="<?php echo $Conatcdetails[0]->facebook; ?>"><i class="color-set fa fa-facebook"></i></a></li>
							<li class="bgred"><a href="<?php echo $Conatcdetails[0]->googleplus; ?>"><i class="color-set fa fa-google-plus"></i></a></li>
							<li class="bgdark-blue"><a href="<?php echo $Conatcdetails[0]->linked; ?>"><i class="color-set fa fa-linkedin"></i></a></li>
							<li class="bglight-blue"><a href="<?php echo $Conatcdetails[0]->twitter; ?>"><i class="color-set fa fa-twitter"></i></a></li>
						</ul>
					</div>
				</div>
				</div>
			</div>
		</div>
		<?php

			}

		?>
		<div class="footer-line">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<?php echo $main_titles[0]->title10; ?>
                        <div class="credits">
                            Designed by <a href="https://gigabyteltd.net/"> GB </a>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--/ footer-->
	
<!-- Bootstrap model  -->
<?php $this->load->view('bootstrap_model.php'); ?>
<!-- Bootstrap model  ends--> 

   <!-- jQuery 2.2.3 -->
	<script src="<?php echo base_url(); ?>assets/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/dist/js/front/jquery.easing.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/dist/js/front/custom.js"></script>
    <script src="<?php echo base_url(); ?>assets/dist/js/front/bootstrap-select.js"></script>
  	<!-- Validate form js -->
  	<script src="<?php echo base_url(); ?>assets/jquery/jquery.validate.js"></script> 
    <!-- Bootstrap Gowl -->
	<script src="<?php echo base_url(); ?>assets/plugins/bootstrap-growl/jquery.bootstrap-growl.js"></script>
	<script src="<?php echo base_url(); ?>assets/dist/js/front/customValidate.js"></script>
	<script src="<?php echo base_url(); ?>assets/dist/js/customuserpanel.js"></script>
	<script type="text/javascript">
		function alertFunc(status,message)
		{
			
			
			$.bootstrapGrowl(message, {
				ele: 'body', // which element to append to
				type: status, // (NULL, 'info', 'error', 'success')
				offset: {from: 'top', amount: 20}, // 'top', or 'bottom'
				align: 'right', // ('left', 'right', or 'center')
				width: 250, // (integer, or 'auto')
				delay: 4000,
				allow_dismiss: true,
				stackup_spacing: 10 // spacing between consecutively stacked growls.
			});
			
			
		};	
	</script>
		<?php
			if($this->session->flashdata('status') == "")
			{
				
			}
			else
			{
				$message = $this->session->flashdata('status');
				echo "<script>alertFunc('".$message['alert']."','".$message['msg']."')</script>";
			}	
		?>
  </body>
</html>