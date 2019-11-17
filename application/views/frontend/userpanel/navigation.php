<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="<?php echo base_url('Userpanel/');?>"><i class="fa fa-user" aria-hidden="true"></i> User Panel</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                     
						<li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="ti-bell"></i>
                                    <?php
			
											$user_name = $this->session->userdata('userPanel_Id');

									?>
									<p>Howdy <?php echo $user_name['name']; ?></p>
									<b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="<?php echo base_url('Userpanel/sign_out');?>">logout</a></li>
                                
                              </ul>
                        </li>
						
                    </ul>

                </div>
            </div>
        </nav>