<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Userpanel extends CI_Controller
{
	// userPanel
	public function index()
	{
		$user_name = $this->session->userdata('userPanel_Id');

		// DEFINES TO LOAD THE CATEGORY LIST FROM DATABSE TABLE mp_Categoty
		$this->load->model('Crud_model');
		$customer_record = $this->Crud_model->fetch_record_by_id('mp_payee', $user_name['id']);
		$data['customer_record_list'] = $customer_record;
		$data['main_view'] = 'customer_profile';

		// DEFINES GO TO userPanel FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('frontend/userpanel/user_panel', $data);
	}

	// prescription
	public function prescription()
	{
		$user_name = $this->session->userdata('userPanel_Id');
		$this->load->model('Crud_model');
		$customer_record = $this->Crud_model->fetch_record_by_id('mp_payee', $user_name['id']);
		$data['customer_record_list'] = $customer_record;
		$data['main_view'] = 'upload_prescription';
		$this->load->view('/frontend/userpanel/user_panel', $data);
	}

	// availabilty
	public function availabilty()
	{
		$user_name = $this->session->userdata('userPanel_Id');
		$this->load->model('Crud_model');
		$medicine_record = $this->Crud_model->fetch_record_product(0);
	
		$data['medicine_record_list'] = $medicine_record;
		$data['main_view'] = 'availability_check';
		$this->load->view('frontend/userpanel/user_panel', $data);
	}

	// add_prescription
	public function add_prescription()
	{

		// DEFINES TO LOAD THE CATEGORY LIST FROM DATABSE TABLE mp_Categoty
		$this->load->model('Crud_model');
		$user_name = $this->session->userdata('userPanel_Id');
		$cus_id = $user_name['id'];
		$date = date('Y-m-d');
		$prescription_Picture_name = $this->Crud_model->do_upload_picture("prescription_Picture_name", "./uploads/prescription/");
		$shippinaddress = html_escape($this->input->post('shippinaddress'));

		// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
		$args = array(
			'date' => $date,
			'cus_id' => $cus_id,
			'cus_picture' => $prescription_Picture_name,
			'shippinaddress' => $shippinaddress
		);

		// DEFINES CALL THE FUNCTION OF insert_data FORM Crud_model CLASS
		$result = $this->Crud_model->insert_data('mp_orders', $args);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"/> Uploaded  Successfully',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-exclamation-triangle" aria-hidden="true"/> Uploading Failed',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('Userpanel/order_history');
	}

	// order_history
	public function order_history()
	{
		$first_date = html_escape($this->input->post('date1'));
		$second_date = html_escape($this->input->post('date2'));

		$user_name = $this->session->userdata('userPanel_Id');
		$data['title'] = 'My Prescriptions History';
		$data['title_sub'] = 'The complete history of uploaded prescriptions';

		// DEFINES THE TABLE HEAD

		$data['table_heading_names_of_coloums'] = array(
			'No',
			'Order Id',
			'Date',
			'Prescription',
			'Status'
		);
		$this->load->model('Crud_model');
		if ($first_date == NULL OR $second_date == NULL)
		{
			$first_date = date('Y-m-d');
			$second_date = date('Y-m-d');

			// FETCH SALES RECORD FROM invoices TABLE

			$result_invoices = $this->Crud_model->fetch_record_orders('mp_orders', $user_name['id'], $first_date, $second_date);
		}
		else
		{

			// FETCH SALES RECORD FROM invoices TABLE
			$result_invoices = $this->Crud_model->fetch_record_orders('mp_orders', $user_name['id'], $first_date, $second_date);
		}

		if ($result_invoices != NULL)
		{
			$data['order_records'] = $result_invoices;
			$data['main_view'] = 'order_history';

			// DEFINES GO TO userPanel FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
			$this->load->view('frontend/userpanel/user_panel', $data);
		}
		else
		{

			// DEFINES WHICH PAGE TO RENDER
			$data['main_view'] = 'error_invoices';
			$data['actionresult'] = "Userpanel/order_history";
			$data['heading1'] = ":( Sorry no prescriptions found";
			$data['heading2'] = "";
			$data['details'] = "";

			// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE

			$this->load->view('frontend/userpanel/user_panel', $data);
		}
	}

	// userPanel/sign_out
	public function sign_out()
	{
		$this->session->unset_userdata('userPanel_Id');
		redirect('Main');
	}

	//	userPanel/add_customer
	public function add_customer()
	{

		// DEFINES READ userPanel SIGNUP FORM userPanel FORM

		$user_name = html_escape($this->input->post('user_name'));
		$email_address = html_escape($this->input->post('email_address'));
		$password = html_escape($this->input->post('password'));
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
			'cus_contact_1' => $contact
		);

		// DEFINES CALL THE FUNCTION OF insert_data FORM Crud_model CLASS
		$result = $this->Crud_model->insert_data('mp_payee', $args);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"/> Added  Successfully',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-exclamation-triangle" aria-hidden="true"/> Added Failed',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('Userpanel');
	}

	//	userPanel/login_customer

	public function login_customer()
	{

		// DEFINES READ userPanel Login FORM userPanel FORM
		$user_email = html_escape($this->input->post('user_email'));
		$userpassword = html_escape($this->input->post('userpassword'));

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
		$args = array(
			'customer_name' => $user_email,
			'cus_email' => $userpassword
		);
		
	}

	// userPanel/Delete
	public function delete($args)
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS

		$this->load->model('Crud_model');
		$this->Crud_model->delete_record('mp_userPanellist', $args);
		redirect('Userpanel');
	}

	// userPanel/Edit
	public function edit()
	{

		// RETRIEVING UPDATED VALUES FROM FORM userPanel FORM
		$edit_userPanel_id = html_escape($this->input->post('edit_userPanel_id'));
		$edit_category_id = html_escape($this->input->post('edit_category_id'));
		$edit_userPanel_name = html_escape($this->input->post('edit_userPanel_name'));
		$edit_formula_name = html_escape($this->input->post('edit_formula_name'));
		$edit_quantity = html_escape($this->input->post('edit_quantity'));
		$edit_company_name = html_escape($this->input->post('edit_company_name'));
		$edit_purchase = html_escape($this->input->post('edit_purchase'));
		$edit_retail = html_escape($this->input->post('edit_retail'));
		$edit_expiry_date = html_escape($this->input->post('edit_expiry_date'));
		$edit_picture = "demo";

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_userPanellist',
			'id' => $edit_userPanel_id
		);

		// DATA ARRAY FOR UPDATE QUERY array('abc'=>abc)
		$data = array(
			'category_id' => $edit_category_id,
			'userPanelname' => $edit_userPanel_name,
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
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"/> Updated  Successfully',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-exclamation-triangle" aria-hidden="true"/> Updated Failed',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('Userpanel');
	}

	// userPanel/edit_profile
	public function edit_profile()
	{
		$user_name = $this->session->userdata('userPanel_Id');

		// RETRIEVING UPDATED VALUES FROM FORM userPanel FORM

		$edit_customer_id = $user_name['id'];
		$cus_company = html_escape($this->input->post('cus_company'));
		$user_name = html_escape($this->input->post('user_name'));
		$contact1 = html_escape($this->input->post('contact1'));
		$contact2 = html_escape($this->input->post('contact2'));
		$Home_address = html_escape($this->input->post('Home_address'));
		$region = html_escape($this->input->post('region'));
		$town = html_escape($this->input->post('town'));
		$description = html_escape($this->input->post('description'));

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_payee',
			'id' => $edit_customer_id
		);

		// DATA ARRAY FOR UPDATE QUERY array('abc'=>abc)
		$data = array(
			'cus_company' => $cus_company,
			'customer_name' => $user_name,
			'cus_contact_1' => $contact1,
			'cus_contact_2' => $contact2,
			'cus_address' => $Home_address,
			'cus_region' => $region,
			'cus_town' => $town,
			'cus_description' => $description
		);

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
		$result = $this->Crud_model->edit_record_id($args, $data);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"/> Updated  Successfully',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-exclamation-triangle" aria-hidden="true"/> Updated Failed',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('Userpanel');
	}

	// Userpanel/change_profile_picture
	public function change_profile_picture()
	{
		$user_name = $this->session->userdata('userPanel_Id');

		// RETRIEVING UPDATED VALUES FROM FORM userPanel FORM
		$customer_sess_id = $user_name['id'];

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_payee',
			'id' => $customer_sess_id
		);
		$this->load->model('Crud_model');
		$edit_picture = $this->Crud_model->do_upload_picture("customer_picture", "./uploads/customers/");
		$data = array(
			'cus_picture' => $edit_picture
		);

		// DEFINES TO DELETE IMAGE FROM FOLDER PARAMETER REQIURES ARRAY OF IMAGE PATH AND ID
		$this->Crud_model->delete_image('./uploads/customers/', $customer_sess_id, 'mp_payee');

		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
		$result = $this->Crud_model->edit_record_id($args, $data);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"/> Picture Updated ',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"/> Updated Failed ',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('Userpanel');
	}

	// UserPanal/change_password
	public function change_password()
	{
		$this->load->model('Crud_model');
		$user_name = $this->session->userdata('userPanel_Id');
		$edit_customer_id = $user_name['id'];
		$old_password = html_escape($this->input->post('old_password'));
		$new_login_customer = html_escape($this->input->post('new_password'));
		$confirm_password = html_escape($this->input->post('confirm_password'));

	
		if ($new_login_customer == $confirm_password)
		{
			$customer_record = $this->Crud_model->fetch_record_by_id('mp_payee', $edit_customer_id);
			$saved_password = $customer_record[0]->cus_password;
		
			
			if(sha1($old_password) == $saved_password){

				// TABLENAME AND ID FOR DATABASE ACTION
				$args = array(
					'table_name' => 'mp_payee',
					'id' => $edit_customer_id
				);

				// DATA ARRAY FOR UPDATE QUERY array('abc'=>abc)
				$data = array(
					'cus_password' => sha1($new_login_customer)
				);

				// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
				// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
				$result = $this->Crud_model->edit_record_id($args, $data);

				if ($result == 1)
				{
					$array_msg = array(
						'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"/> Updated  Successfully',
						'alert' => 'info'
					);
					$this->session->set_flashdata('status', $array_msg);
				}
				else
				{
					$array_msg = array(
						'msg' => '<i style="color:#fff" class="fa fa-exclamation-triangle" aria-hidden="true"/> Updated Failed',
						'alert' => 'danger'
					);
					$this->session->set_flashdata('status', $array_msg);
				}
			}
			else
			{
				$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-exclamation-triangle" aria-hidden="true"/> Invalid old Password',
					'alert' => 'danger'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
		
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-exclamation-triangle" aria-hidden="true"/> Password not matched',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('Userpanel');
	}

	// userPanel/change_status/id/status
	public function change_status($id, $status)
	{

		// TABLENAME AND ID FOR DATABASE ACTION

		$args = array(
			'table_name' => 'mp_userPanellist',
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
		redirect('Userpanel');
	}

	//Userpanel/popup
	//DEFINES A POPUP MODEL OG GIVEN PARAMETER
	function popup($page_name = '',$param = '')
	{
		if($page_name  == 'password_model')
		{
			//model name available in frontend folder
			$this->load->view('frontend/'.$page_name);
		}
		else if($page_name  == 'picture_model')
		{
			//model name available in frontend folder
			$this->load->view('frontend/'.$page_name);
		}
	}

	// METHOD IS USED FOR CONVERTING THE TABLE ROW INTO JSON FORMAT TO SHOW
	// IN BOOTSTRAP MODEL TO UPDATE..
	public function ajax_edit($id)
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS

		$this->load->model('Crud_model');

		// TABLE NAME HERE

		$table = "mp_userPanellist";

		// GET THE ROW FROM DATABASE FROM TABLE ID

		$data = $this->Crud_model->get_by_id($table, $id);

		// CONVERTED INTO JSON FORM TO SHOW INTO EDIT BOX IN POP UP MODEL

		echo json_encode($data);
	}
}
?>