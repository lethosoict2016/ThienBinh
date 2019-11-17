<?php
/*
*  @author    : Muhammad Ibrahim
*  @Mail      : aliibrahimroshan@gmail.com
*  @Created   : 14th August, 2017
*  @Developed : Team Gigabyte
*  @URL       : www.gigabyteltd.net
*  @Envato    : https://codecanyon.net/user/gb_developers
*/
defined('BASEPATH') OR exit('No direct script access allowed');
class Layout extends CI_Controller
{
	// Layout
	public function index()
	{
		// DEFINES PAGE TITLE
		$data['title1'] = 'Theme Layout Settings';

		// DEFINES PAGE TITLE
		$data['title2'] = 'Website FrontEnd Headings :';

		// DEFINES WHICH PAGE TO RENDER
		$data['main_view'] = 'layout';

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// FETCHING THE RECORD FROM TABLE GIVEN
		$company_record = $this->Crud_model->fetch_record('mp_langingpage', '');
		$data['company_record'] = $company_record;

		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('main/index.php', $data);
	}

	// Layout/logo
	public function logo()

	{
		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');
		$company_logo = $this->Crud_model->do_upload_picture("company_logo", "./uploads/systemimgs/");
		if ($company_logo != "default.jpg")
		{
			// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
			$data = array(
				'logo' => $company_logo,
			);
			// TABLENAME AND ID FOR DATABASE ACTION
			$args = array(
				'table_name' => 'mp_langingpage',
				'id' => 1,
			);
			// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
			$result = $this->Crud_model->edit_record_id($args, $data);
			if ($result == 1)
			{
				$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"></i> logo Updated',
					'alert' => 'info',
				);
				$this->session->set_flashdata('status', $array_msg);
			}
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Empty logo cannot be Updated',
				'alert' => 'danger',
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		redirect('layout');
	}

	// Layout/banner
	public function banner()
	{
		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');
		$company_thumbnail = $this->Crud_model->do_upload_picture("company_thumbnail", "./uploads/systemimgs/");
		if ($company_thumbnail != "default.jpg")
		{

			// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
			$data = array(
				'banner' => $company_thumbnail
			);

			// TABLENAME AND ID FOR DATABASE ACTION
			$args = array(
				'table_name' => 'mp_langingpage',
				'id' => 1
			);

			// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
			$result = $this->Crud_model->edit_record_id($args, $data);
			if ($result == 1)
			{
				$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"></i> banner Updated',
					'alert' => 'info'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Empty banner cannot be Updated',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		redirect('layout');
	}

	//Layout/banner1
	public function banner1()
	{
		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');
		$ad_image1 = $this->Crud_model->do_upload_picture("ad_image1", "./uploads/systemimgs/");
		if ($ad_image1 != "default.jpg")
		{

			// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
			$data = array(
				'slider1' => $ad_image1
			);

			// TABLENAME AND ID FOR DATABASE ACTION
			$args = array(
				'table_name' => 'mp_langingpage',
				'id' => 1
			);

			// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
			$result = $this->Crud_model->edit_record_id($args, $data);

		}
		else
		{
			$result = 0;
		}


		if($result == 1)
		{
			$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"></i> Slider updated',
					'alert' => 'info'
				);
				$this->session->set_flashdata('status', $array_msg);
		}
		else
		{

			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Empty slider cannot be updated',
				'alert' => 'danger'
				);
				$this->session->set_flashdata('status', $array_msg);
		}

		redirect('layout');
	}
	
	// Layout/banner2
	public function banner2()
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');
		//$link2 = $this->input->post('link2');
		$ad_image2 = $this->Crud_model->do_upload_picture("ad_image2", "./uploads/systemimgs/");
		if ($ad_image2 != "default.jpg")
		{

			// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
			$data = array(
				'slider2' => $ad_image2
			);

			// TABLENAME AND ID FOR DATABASE ACTION
			$args = array(
				'table_name' => 'mp_langingpage',
				'id' => 1
			);

			// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
			$result = $this->Crud_model->edit_record_id($args, $data);
		}
		else
		{
			$result = 0;
		}


		if($result ==1)
		{
			$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"></i> Slider updated',
					'alert' => 'info'
				);

				$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Empty slider cannot be updated',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('layout');
	}

	// Layout/banner3
	public function banner3()
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');
		//$link2 = $this->input->post('link2');
		 $ad_image3 = $this->Crud_model->do_upload_picture("ad_image3", "./uploads/systemimgs/");
		if ($ad_image3 != "default.jpg")
		{

			// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
			$data = array(
				'slider3' => $ad_image3
			);

			// TABLENAME AND ID FOR DATABASE ACTION
			$args = array(
				'table_name' => 'mp_langingpage',
				'id' => 1
			);

			// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
			$result = $this->Crud_model->edit_record_id($args, $data);

		}
		else
		{
			$result = 0;
		}


		if($result ==1)
		{
			$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"></i> Slider updated',
					'alert' => 'info'
				);

				$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Empty slider cannot be updated',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('layout');
	}
	// Layout/banner4
	public function banner4()
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');
		//$link2 = $this->input->post('link2');
		$ad_image4 = $this->Crud_model->do_upload_picture("ad_image4", "./uploads/systemimgs/");
		if ($ad_image4 != "default.jpg")
		{

			// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY

			$data = array(
				'slider4' => $ad_image4
			);

			// TABLENAME AND ID FOR DATABASE ACTION

			$args = array(
				'table_name' => 'mp_langingpage',
				'id' => 1
			);

			// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA

			$result = $this->Crud_model->edit_record_id($args, $data);

		}
		else
		{
			$result = 0;
		}


		if($result ==1)
		{
			$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"></i> Slider updated',
					'alert' => 'info'
				);

				$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Empty slider cannot be updated',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('layout');
	}

	// Layout/banner5
	public function banner5()
	{
		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');
		//$link2 = $this->input->post('link2');
		$ad_image5 = $this->Crud_model->do_upload_picture("ad_image5", "./uploads/systemimgs/");
		if ($ad_image5 != "default.jpg")
		{

			// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
			$data = array(
				'slider5' => $ad_image5
			);

			// TABLENAME AND ID FOR DATABASE ACTION
			$args = array(
				'table_name' => 'mp_langingpage',
				'id' => 1
			);

			// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
			$result = $this->Crud_model->edit_record_id($args, $data);

		}
		else
		{
			$result = 0;
		}


		if($result ==1)
		{
			$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"></i> Slider updated',
					'alert' => 'info'
				);

				$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Empty slider cannot be updated',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('layout');
	}

	
	// Layout/details
	public function details()
	{
		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// DEFINES READ CONTACT details FORM CONTACT US FORM
		$company_name = html_escape($this->input->post('company_name'));
		$company_description = html_escape($this->input->post('company_description'));
		$company_keywords = html_escape($this->input->post('company_keywords'));
		$company_currency = html_escape($this->input->post('company_currency'));
		$company_language = html_escape($this->input->post('company_language'));
		$company_primary_color = html_escape($this->input->post('company_primary_color'));
		$company_primary_hover = html_escape($this->input->post('company_primary_hover'));
		$company_expire_time = html_escape($this->input->post('company_expire_time'));

		// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
		$data = array(
			'companyname' => $company_name,
			'companydescription' => $company_description,
			'companykeywords' => $company_keywords,
			'currency' => $company_currency,
			'language' => $company_language,
			'primarycolor' => $company_primary_color,
			'theme_pri_hover' => $company_primary_hover,
			'expirey' => $company_expire_time
		);

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_langingpage',
			'id' => 1
		);

		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
		$result = $this->Crud_model->edit_record_id($args, $data);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"></i> Company Record Editted',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Company Record cannot be Editted',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('layout');
	}

		//DEFAULT SETTINGS OF COLOR 
	function default_settings()
	{
		$primary_color = '#4a6984';
		$primary_color_hover = '#1f5788';

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_langingpage',
			'id' => 1
		);

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
		$data = array(
			'primarycolor' => $primary_color,
			'theme_pri_hover' => $primary_color_hover
		);

		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
		$result = $this->Crud_model->edit_record_id($args, $data);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"></i> Reset successfully',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Reset cannot be editted',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		redirect('layout');

	}

	function delete($title)
	{
		$this->load->model('Crud_model');
			$data = array(
				$title=> '',
			);

			// TABLENAME AND ID FOR DATABASE ACTION

			$args = array(
				'table_name' => 'mp_langingpage',
				'id' => 1
			);

			// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
			$this->Crud_model->delete_image_custom('./uploads/systemimgs/',1,$title,'mp_langingpage');

			$result = $this->Crud_model->edit_record_id($args, $data);
			if ($result == 1)
			{
				$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"></i> Deleted sucessfully',
					'alert' => 'info'
				);
				$this->session->set_flashdata('status', $array_msg);
			}

			redirect('Layout');
	}

	// Layout/web_details
	public function web_details()
	{
		// DEFINES READ web_details details FORM web_details US FORM
		$front_title1 = html_escape($this->input->post('front_title1'));
		$front_title2 = html_escape($this->input->post('front_title2'));
		$front_title3 = html_escape($this->input->post('front_title3'));
		$front_fitle4 = html_escape($this->input->post('front_fitle4'));
		$front_title5 = html_escape($this->input->post('front_title5'));
		$front_title6 = html_escape($this->input->post('front_title6'));
		$front_sub_title1 = html_escape($this->input->post('front_sub_title1'));
		$front_sub_title2 = html_escape($this->input->post('front_sub_title2'));
		$front_title8 =  html_escape($this->input->post('front_title8'));
		$front_title9 =  html_escape($this->input->post('front_title9'));
		$front_title10 = html_escape($this->input->post('front_title10'));

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_langingpage',
			'id' => 1
		);

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
		$data = array(
			'title1' => $front_title1,
			'title2' => $front_title2,
			'title3' => $front_title3,
			'title4' => $front_fitle4,
			'title5' => $front_title5,
			'title6' => $front_title6,
			'subtitle6' => $front_sub_title1,
			'subtitle6one' => $front_sub_title2,
			'title8' => $front_title8,
			'title9' => $front_title9,
			'title10' => $front_title10
		);

		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
		$result = $this->Crud_model->edit_record_id($args, $data);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"></i> Front Site Record Editted',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Front Site Error Record cannot be Editted',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		redirect('layout');
	}
}