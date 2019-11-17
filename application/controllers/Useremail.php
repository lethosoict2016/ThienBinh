<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Useremail extends CI_Controller
{
	// Useremail
	 function index()
	{
		$user_name = $this->session->userdata('userPanel_Id');

		// DEFINES PAGE TITLE
		$data['title'] = 'Send Email to Customers';
		$data['send_email_title'] = 'Send Email';
		// DEFINES WHICH PAGE TO RENDER
		$data['main_view'] = 'customer_email';
		// DEFINES TO LOAD THE CATEGORY LIST FROM DATABSE TABLE mp_Categoty
		$this->load->model('Crud_model');
		$result = $this->Crud_model->fetch_record_by_id('mp_payee', $user_name['id']);
		$data['customer_list'] = $result;
		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('frontend/userpanel/user_panel', $data);
	}

	function email_configuration($from_email, $to_email, $subject, $email_desc)
	{
		$this->email->from($from_email, $this->db->get_where('mp_langingpage', array(
			'id' => 1
		))->result_array() [0]['companyname']);
		$this->email->to($to_email);
		$this->email->subject($subject);
		$this->email->message($email_desc);
		return $this->email->send();
	}

	//	Email/send_email
	function send_email($redirect)
	{

		// DEFINES READ MEDICINE details FORM MEDICINE FORM
		$customer_email = html_escape($this->input->post('customer_email'));
		$from_email = 'info@gigabyteltd.net';
		$subject = html_escape($this->input->post('subject'));
		$email_desc = $this->input->post('email_desc');
		$email_status = $this->email_configuration($from_email, $customer_email, $subject, $email_desc);

		// Send mail
		if ($email_status)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"/> Email sent successfully',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"/> Error in sending Email.',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		redirect($redirect);
	}
	//	Email/send_email
	function send_email_admin()
	{

		// DEFINES READ MEDICINE details FORM MEDICINE FORM
		// $admin_email = 'info@gigabyteltd.net';
		$admin_email = 'aliibrahimroshan@gmail.com';
		$customer_email = html_escape($this->input->post('customer_email'));
		$from_email = 'info@gigabyteltd.net';
		$subjectCus = "Query"; //,$admin_email,$email_desc
		$subject = html_escape($this->input->post('subject'));
		$email_desc = $this->input->post('email_desc');
		$customer_dsec = "Thank you for contact us. We will soon respond to your query.";
		$email_status = $this->email_configuration($from_email, $customer_email, $subjectCus, $customer_dsec);
		$email_status1 = $this->email_configuration($from_email, $admin_email, $subject, $email_desc);

		// Send mail
		if ($email_status)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"/> Query sent successfully ',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"/> Error in sending Query.',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		redirect('useremail');
	}
}