<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Forget_password extends CI_Controller

{

	// Forget_password

	public function index()
	{
	}

	// SEND EMAIL TO CUSTOMERS WHO FORGET THERE PASSWORD INCLUDING HASHED CODE
	// Forget_password/Forget_password

	public function forget_password_send_email_user()
	{
		$user_email = html_escape($this->input->post('user_email'));
		if (!empty($user_email))
		{

			// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS

			$this->load->model('Crud_model');
			$fetch_record = $this->Crud_model->recover_password('mp_payee', $user_email, 'cus_email');
			if (!empty($fetch_record))
			{
				$email_desc = 'Click here to confirm password '.base_url('login/get_password_recover_user').' Your email code  is : '.$fetch_record[0]->cus_password;

				$cname = $this->db->get_where('mp_langingpage', array(
					'id' => 1
				))->result_array() [0]['companyname'];

				$cemail = $this->db->get_where('mp_langingpage', array(
					'id' => 1
				))->result_array() [0]['email'];

				$this->email->from($cemail, $cname);
				$this->email->to($user_email);
				$this->email->subject("Forget Password ");
				$this->email->message($email_desc);
				$result = $this->email->send();
				if ($result == 1)
				{
					$array_msg = array(
						'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i> Email sent Successfully',
						'alert' => 'info'
					);
					$this->session->set_flashdata('status', $array_msg);
				}
				else
				{
					$array_msg = array(
						'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Email  cannot be sent',
						'alert' => 'danger'
					);
					$this->session->set_flashdata('status', $array_msg);
				}
			}
			else
			{
				$array_msg = array(
					'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Sorry Invalid Email address',
					'alert' => 'danger'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Enter your email address',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('main');
	}

	// REDIRECTED TO THIS FUNCTION WHEN ADMIN FORGET ITS PASSWORD
	// /Forget_password/forget_password_administrator

	public function forget_password_administrator()
	{
		$user_email = html_escape($this->input->post('user_email'));
		if (!empty($user_email))
		{

			// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
			$this->load->model('Crud_model');
			$fetch_record = $this->Crud_model->recover_password('mp_users', $user_email,'user_email');
			if (!empty($fetch_record))
			{
				
				$email_desc = 'Click here to confirm password '.base_url('login/get_password_recover').' Your email code  is : '.$fetch_record[0]->user_password;

				$cname = $this->db->get_where('mp_langingpage', array(
					'id' => 1))->result_array() [0]['companyname'];

				$cemail = $this->db->get_where('mp_langingpage', array(
					'id' => 1
				))->result_array() [0]['email'];

				$this->email->from($cemail, $cname);
				$this->email->to($user_email);
				$this->email->subject("Forget Password ");
				$this->email->message($email_desc);
				$result = $this->email->send();
				if ($result == 1)
				{
					$array_msg = array(
						'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i> Email sent Successfully',
						'alert' => 'info'
					);
					$this->session->set_flashdata('status', $array_msg);
				}
				else
				{
					$array_msg = array(
						'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Email  cannot be sent',
						'alert' => 'danger'
					);
					$this->session->set_flashdata('status', $array_msg);
				}
			}
			else
			{
				$array_msg = array(
					'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Sorry Invalid Email address',
					'alert' => 'danger'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Enter your email address',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('login');
	}
}