<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Main extends CI_Controller
{
	// Main
	function index()
	{
		// DEFINES TO LOAD THE CATEGORY LIST FROM DATABSE TABLE mp_Categoty
		$this->load->model('Crud_model');
		$result = $this->Crud_model->fetch_record('mp_langingpage', NULL);
		$data['main_titles'] = $result;
		$contactAndAboutdetails = $this->Crud_model->fetch_record('mp_contactabout', NULL);
		$data['Conatcdetails'] = $contactAndAboutdetails;
		$testamonials = $this->Crud_model->fetch_record('mp_testamonials', 'status');
		$data['testamonials'] = $testamonials;
		$pharmacist = $this->Crud_model->fetch_record('mp_pharmacist', 'status');
		$data['pharmacist'] = $pharmacist;
		$somewords = $this->Crud_model->fetch_record('mp_words', 'status');
		$data['somewords'] = $somewords;
		$services = $this->Crud_model->fetch_record('mp_services', 'status');
		$data['services'] = $services;
		
		$data['product_record_list']  = $this->Crud_model->fetch_record_product(0);

		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('frontend/landing_page', $data);
	}

	//	Main/add_customer
	function add_customer()
	{
		// DEFINES READ Main SIGNUP FORM Main FORM
		$user_name = html_escape($this->input->post('user_name'));
		$email_address = html_escape($this->input->post('email_address'));
		$plane_password = html_escape($this->input->post('password'));
		$password = sha1($plane_password);
		$address = html_escape($this->input->post('address'));
		$contact = html_escape($this->input->post('contact'));
		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
		$args = array(
			'customer_name' => $user_name,
			'cus_email' => $email_address,
			'cus_password' => $password,
			'cus_address' => $address,
			'cus_contact_1' => $contact,
			'cus_picture' => 'default.jpg',
			'type' => 'customer'
		);

		// CHECK WEATHER EMAIL ADLREADY EXISTS OR NOT IN THE TABLE
		$email_record_data = $this->Crud_model->check_email_address('mp_payee', 'cus_email', $email_address);
		if ($email_record_data == NULL)
		{
			// DEFINES CALL THE FUNCTION OF insert_data FORM Crud_model CLASS
			$result = $this->Crud_model->insert_data('mp_payee', $args);
			if ($result == 1)
			{
				$this->session->set_flashdata('status', 'Successfull');
			}
			else
			{
				$this->session->set_flashdata('status', 'Failed');
			}
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="TRUE"></i>Sorry Email already exists !',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		redirect('main');
	}

	// Main/Delete
	function delete($args)
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');
		$this->Crud_model->delete_record('mp_menulist', $args);
		redirect('main');
	}

	// Main/Edit
	function edit()
	{
		// RETRIEVING UPDATED VALUES FROM FORM Main FORM
		$edit_main_id = html_escape($this->input->post('edit_main_id'));
		$edit_category_id = html_escape($this->input->post('edit_category_id'));
		$edit_main_name = html_escape($this->input->post('edit_main_name'));
		$edit_formula_name = html_escape($this->input->post('edit_formula_name'));
		$edit_quantity = html_escape($this->input->post('edit_quantity'));
		$edit_company_name = html_escape($this->input->post('edit_company_name'));
		$edit_purchase = html_escape($this->input->post('edit_purchase'));
		$edit_retail = html_escape($this->input->post('edit_retail'));
		$edit_expiry_date = html_escape($this->input->post('edit_expiry_date'));
		$edit_picture = "demo";

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_menulist',
			'id' => $edit_main_id
		);

		// DATA ARRAY FOR UPDATE QUERY array('abc'=>abc)
		$data = array(
			'category_id' => $edit_category_id,
			'mainname' => $edit_main_name,
			'formula' => $edit_formula_name,
			'quantity' => $edit_quantity,
			'company' => $edit_company_name,
			'purchase' => $edit_purchase,
			'retail' => $edit_retail,
			'expire' => $edit_expiry_date
		);

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
		$result = $this->Crud_model->edit_record_id($args, $data);
		redirect('main');
	}

	//Main/popup
	//DEFINES A POPUP MODEL OG GIVEN PARAMETER
	function popup($page_name = '',$param = '')
	{
		if($page_name  == 'login_model')
		{
			//model name available in frontend folder
			$this->load->view('frontend/'.$page_name);
		}
		else if($page_name  == 'forget_model')
		{
			//model name available in frontend folder
			$this->load->view('frontend/'.$page_name);
		}
		else if($page_name  == 'signup_model')
		{
			//model name available in frontend folder
			$this->load->view('frontend/'.$page_name);
		}
	}

	// Main/change_status/id/status
	function change_status($id, $status)
	{

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_menulist',
			'id' => $id
		);

		// DATA ARRAY FOR UPDATE QUERY array('abc'=>abc)
		$data = array(
			'status' => $status
		);

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
		$result = $this->Crud_model->edit_record_id($args, $data);
		redirect('main');
	}

	// METHOD IS USED FOR CONVERTING THE TABLE ROW INTO JSON FORMAT TO SHOW
	// IN BOOTSTRAP MODEL TO UPDATE..
	function ajax_edit($id)
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// TABLE NAME HERE
		$table = "mp_menulist";

		// GET THE ROW FROM DATABASE FROM TABLE ID
		$data = $this->Crud_model->get_by_id($table, $id);

		// CONVERTED INTO JSON FORM TO SHOW INTO EDIT BOX IN POP UP MODEL
		echo json_encode($data);
	}
}