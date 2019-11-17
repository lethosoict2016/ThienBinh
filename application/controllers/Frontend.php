<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Frontend extends CI_Controller
{
	// Frontend
	public function index()
	{

		// DEFINES PAGE TITLE
		$data['title1'] = 'Contact Us details';

		// DEFINES PAGE TITLE
		$data['title2'] = 'About Us details :';

		// DEFINES WHICH PAGE TO RENDER
		$data['main_view'] = 'contact_us';

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// DEFINES FETCH THE RECORD FROM mp_contactabout TABLE
		$contact_record = $this->Crud_model->fetch_record('mp_contactabout', '');
		$data['contact_record'] = $contact_record;

		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('main/index.php', $data);
	}

	// Frontend/Contact
	public function contact()
	{
		// DEFINES READ CONTACT details FORM CONTACT US FORM
		$contact_title = html_escape($this->input->post('contact_title'));
		$contact_description = html_escape($this->input->post('contact_description'));
		$phone_number = html_escape($this->input->post('phone_number'));
		$email_address = html_escape($this->input->post('email_address'));
		$facebook = html_escape($this->input->post('facebook'));
		$twitter = html_escape($this->input->post('twitter'));
		$linkedin = html_escape($this->input->post('linkedin'));
		$googleplus = html_escape($this->input->post('googleplus'));

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
		$data = array(
			'contact_title' => $contact_title,
			'contact_description' => $contact_description,
			'phone_number' => $phone_number,
			'email' => $email_address,
			'facebook' => $facebook,
			'twitter' => $twitter,
			'linked' => $linkedin,
			'googleplus' => $googleplus
		);

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_contactabout',
			'id' => 1
		);

		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
		$result = $this->Crud_model->edit_record_id($args, $data);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"/> Contact Us Record Editted',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"/> Error Contact Us Record cannot be Editted',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('frontend');
	}

	//	Frontend/About
	public function about()
	{

		// DEFINES READ ABOUT details FORM ABOUT US FORM
		$about_title = html_escape($this->input->post('about_title'));
		$about_quotation = html_escape($this->input->post('about_quotation'));
		$about_name = html_escape($this->input->post('about_name'));
		$about_title2 = html_escape($this->input->post('about_title2'));
		$about_description = html_escape($this->input->post('about_description'));
		$about_address = html_escape($this->input->post('about_address'));

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_contactabout',
			'id' => 1
		);

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
		$data = array(
			'about_title' => $about_title,
			'about_quotation' => $about_quotation,
			'about_name' => $about_name,
			'about_title2' => $about_title2,
			'about_description' => $about_description,
			'address' => $about_address
		);

		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
		$result = $this->Crud_model->edit_record_id($args, $data);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"/> About Us Record Editted',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"/> About Us Error Record cannot be Editted',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		redirect('frontend');
	}
}