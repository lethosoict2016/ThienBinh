<?php
	if($this->session->userdata('userPanel_Id') == "") 
	{ 	
	redirect('Main/');
	}
	else
	{
	?>
	<!doctype html>
	<html lang="en">
		<head>
			<?php $this->load->view('frontend/userpanel/head'); ?>
			<style>
				div#load_screen{
				background: #fff;
				position: fixed;
				z-index:10;
				top: 0px;
				width: 100%;
				height: 1600px;
				}
			</style>
			</head>
		<body>
			<div class="col-md-12" id="load_screen">
				<img style="margin-top:10%" class="center-block" src="<?php echo base_url(); ?>assets/img/loadingBar.gif" />
			</div>
			<div class="wrapper">
				<div class="sidebar" data-background-color="white" data-active-color="info">
					<div  class="sidebar-wrapper" >
						<div  class="logo">
							<a href="<?php echo base_url('userpanel/');?>"  class="simple-text">
								<?php echo $this->db->get_where('mp_langingpage', array('id' => 1))->result_array()[0]['companyname'] ;?>
							</a>
						</div>
						<?php $this->load->view('frontend/userpanel/side_menu'); ?>
					</div>
				</div>
				<div class="main-panel">
					<?php $this->load->view('frontend/userpanel/navigation'); ?>
					<div class="content">
						<!-- pages navigates here -->
						<?php $this->load->view('frontend/userpanel/'.$main_view); ?>
					</div>
					<!-- pages footer here -->	
					<?php $this->load->view('frontend/userpanel/footer'); ?>
				</div>
			</div>	
		</body>
		<script src="<?php echo base_url(); ?>assets/bootstrap/js/bootstrap.min.js"></script>
		<!--  Notifications Plugin    -->   
		<script src="<?php echo base_url(); ?>assets/dist/js/bootstrap-notify.js"></script>
		<!-- Paper Dashboard Core javascript and methods for Demo purpose -->	
		<script src="<?php echo base_url(); ?>assets/dist/js/paper-dashboard.js"></script>
		<!-- Select box -->
		 <script src="<?php echo base_url(); ?>assets/dist/js/front/bootstrap-select.js"></script>
		 <!-- Validate form js -->
		<script src="<?php echo base_url(); ?>assets/jquery/jquery.validate.js"></script> 
		<!-- Bootstrap Gowl -->
		<script src="<?php echo base_url(); ?>assets/plugins/bootstrap-growl/jquery.bootstrap-growl.js"></script>
		<!-- Custom jquery Validations -->	
		<script src="<?php echo base_url(); ?>assets/dist/js/customuserpanel.js"></script>
		<script type="text/javascript">
			window.addEventListener("load", function()
			{
				var load_screen = document.getElementById("load_screen");
				document.body.removeChild(load_screen);
			});
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
</html>
<?php
}
?>																					