<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Orders extends CI_Controller
{
	// orders
	public function index()
	{

	}

	// order_history
	public function order_history()
	{
		$data['table_name'] = 'Precriptions Uploaded by online Customers';
		$data['page_title_model_edit'] = 'Add Medicine and Other charges';
		$data['page_title_model_button_edit'] = 'Add charges to bill';

		// DEFINES THE TABLE HEAD
		$data['table_heading_names_of_coloums'] = array(
			'No',
			'Order ID',
			' Name',
			'Email',
			'Conatact 1',
			'Date',
			'Prescription',
			'Status',
			'Action'
		);
		$this->load->model('Crud_model');

		// 0 Unverified
		// 1 Verified
		// 2  delivers
		// 3 delete

		$data['unverified_records'] = $this->Crud_model->fetch_record_customer_orders(0);
		$data['verified_records'] = $this->Crud_model->fetch_record_customer_orders(1);

		// $data['deliver_records'] = $this->Crud_model->fetch_record_customer_orders(2);
		$data['delete_records'] = $this->Crud_model->fetch_record_customer_orders(5);
		$data['main_view'] = 'order_history';

		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('main/index.php', $data);
	}

	// orders/verified_invoices
	public function verified_invoices()
	{

		// DEFINES TO LOAD THE MODEL
		$this->load->model('Crud_model');
		$this->Crud_model->verified_expiry_time_checks();

		// When selecting date will come to this function
		$data['Path'] = 'orders/verified_invoices';
		$collection = array();

		// DEFINES TO LOAD THE MODEL
		$this->load->model('Accounts_model');
		$first_date = html_escape($this->input->post('date1'));
		$second_date = html_escape($this->input->post('date2'));
		if ($first_date == NULL OR $second_date == NULL)
		{
			$first_date = date('Y-m-d');
			$second_date = date('Y-m-d');

			// FETCH SALES RECORD FROM invoices TABLE status 2 means inprogress
			$result_invoices = $this->Accounts_model->fetch_record_date_temp('mp_tempinvoices', $first_date, $second_date, 1);
		}
		else
		{
			// FETCH SALES RECORD FROM invoices TABLE
			$result_invoices = $this->Accounts_model->fetch_record_date_temp('mp_tempinvoices', $first_date, $second_date, 1);
		}

		if ($result_invoices != NULL)
		{
			$count = 0;
			foreach($result_invoices as $obj_result_invoices)
			{

				// FETCH SALES RECORD FROM SALES TABLE
				$result_sales = $this->Accounts_model->fetch_record_sales('mp_temp_sales', 'order_id', $obj_result_invoices->id);
				if ($result_sales != NULL)
				{
					$collection[$count] = $result_sales;
					$count++;
				}
			}

			// ASSIGNED THE FETCHED RECORD TO DATA ARRAY TO VIEW
			$data['Sales_Record'] = $collection;
			$data['invoices_record'] = $result_invoices;

			// DEFINES WHICH PAGE TO RENDER
			$data['main_view'] = 'online_sales_invoices';

			// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
			$this->load->view('main/index.php', $data);
		}
		else
		{
			// DEFINES WHICH PAGE TO RENDER
			$data['main_view'] = 'main/error_invoices.php';
			$data['actionresult'] = "orders/verified_invoices";
			$data['heading1'] = "No In progress invoices available.. ";
			$data['heading2'] = "Oops! Sorry no invoices record available in the given details";
			$data['details'] = "We will work on fixing that right away. Meanwhile, you may return or try using the search form.";

			// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
			$this->load->view('main/index.php', $data);
		}
	}

	// orders/Paid_invoices
	public function Paid_invoices()
	{

		// When selecting date will come to this function
		$data['Path'] = 'orders/Paid_invoices';
		$collection = array();

		// DEFINES TO LOAD THE MODEL
		$this->load->model('Accounts_model');
		$first_date = html_escape($this->input->post('date1'));
		$second_date = html_escape($this->input->post('date2'));
		if ($first_date == NULL OR $second_date == NULL)
		{
			$first_date = date('Y-m-d');
			$second_date = date('Y-m-d');

			// FETCH SALES RECORD FROM invoices TABLE status 3 means delivered
			$result_invoices = $this->Accounts_model->fetch_record_date_temp('mp_tempinvoices', $first_date, $second_date, 2);
		}
		else
		{

			// FETCH SALES RECORD FROM invoices TABLE
			$result_invoices = $this->Accounts_model->fetch_record_date_temp('mp_tempinvoices', $first_date, $second_date, 2);
		}

		if ($result_invoices != NULL)
		{
			$count = 0;
			foreach($result_invoices as $obj_result_invoices)
			{

				// FETCH SALES RECORD FROM SALES TABLE
				$result_sales = $this->Accounts_model->fetch_record_sales('mp_temp_sales', 'order_id', $obj_result_invoices->id);
				if ($result_sales != NULL)
				{
					$collection[$count] = $result_sales;
					$count++;
				}
			}

			// ASSIGNED THE FETCHED RECORD TO DATA ARRAY TO VIEW
			$data['Sales_Record'] = $collection;
			$data['invoices_record'] = $result_invoices;

			// DEFINES WHICH PAGE TO RENDER
			$data['main_view'] = 'online_sales_invoices';

			// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
			$this->load->view('main/index.php', $data);
		}
		else
		{

			// DEFINES WHICH PAGE TO RENDER
			$data['main_view'] = 'main/error_invoices.php';
			$data['actionresult'] = "orders/Paid_invoices";
			$data['heading1'] = "No paid invoices invoices available .. ";
			$data['heading2'] = "Oops! Sorry no invoices record available in the given details";
			$data['details'] = "We will work on fixing that right away. Meanwhile, you may return or try using the search form.";

			// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
			$this->load->view('main/index.php', $data);
		}
	}

	// orders/delivered_invoices
	public function delivered_invoices()
	{

		// When selecting date will come to this function
		$data['Path'] = 'orders/delivered_invoices';
		$collection = array();

		// DEFINES TO LOAD THE MODEL
		$this->load->model('Accounts_model');
		$first_date = html_escape($this->input->post('date1'));
		$second_date = html_escape($this->input->post('date2'));
		if ($first_date == NULL OR $second_date == NULL)
		{
			$first_date = date('Y-m-d');
			$second_date = date('Y-m-d');

			// FETCH SALES RECORD FROM invoices TABLE status 3 means delivered
			$result_invoices = $this->Accounts_model->fetch_record_date_temp('mp_tempinvoices', $first_date, $second_date, 3);
		}
		else
		{

			// FETCH SALES RECORD FROM invoices TABLE
			$result_invoices = $this->Accounts_model->fetch_record_date_temp('mp_tempinvoices', $first_date, $second_date, 3);
		}

		if ($result_invoices != NULL)
		{
			$count = 0;
			foreach($result_invoices as $obj_result_invoices)
			{

				// FETCH SALES RECORD FROM SALES TABLE
				$result_sales = $this->Accounts_model->fetch_record_sales('mp_temp_sales', 'order_id', $obj_result_invoices->id);
				if ($result_sales != NULL)
				{
					$collection[$count] = $result_sales;
					$count++;
				}
			}

			// ASSIGNED THE FETCHED RECORD TO DATA ARRAY TO VIEW
			$data['Sales_Record'] = $collection;
			$data['invoices_record'] = $result_invoices;

			// DEFINES WHICH PAGE TO RENDER
			$data['main_view'] = 'online_sales_invoices';

			// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
			$this->load->view('main/index.php', $data);
		}
		else
		{

			// DEFINES WHICH PAGE TO RENDER
			$data['main_view'] = 'main/error_invoices.php';
			$data['actionresult'] = "orders/delivered_invoices";
			$data['heading1'] = "No delivered invoices available .. ";
			$data['heading2'] = "Oops! Sorry no invoices record available in the given details";
			$data['details'] = "We will work on fixing that right away. Meanwhile, you may return or try using the search form.";

			// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
			$this->load->view('main/index.php', $data);
		}
	}

	// orders/expired_invoices
	public function expired_invoices()
	{

		// When selecting date will come to this function
		$data['Path'] = 'orders/expired_invoices';
		$collection = array();

		// DEFINES TO LOAD THE MODEL
		$this->load->model('Accounts_model');

		// FETCH SALES RECORD FROM invoices TABLE status 3 means delivered
		$result_invoices = $this->Accounts_model->fetch_expired_record();
		if ($result_invoices != NULL)
		{
			$count = 0;
			foreach($result_invoices as $obj_result_invoices)
			{

				// FETCH SALES RECORD FROM SALES TABLE
				$result_sales = $this->Accounts_model->fetch_record_sales('mp_temp_sales', 'order_id', $obj_result_invoices->id);
				if ($result_sales != NULL)
				{
					$collection[$count] = $result_sales;
					$count++;
				}
			}

			// ASSIGNED THE FETCHED RECORD TO DATA ARRAY TO VIEW
			$data['Sales_Record'] = $collection;
			$data['invoices_record'] = $result_invoices;

			// DEFINES WHICH PAGE TO RENDER
			$data['main_view'] = 'expire_invoices';

			// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
			$this->load->view('main/index.php', $data);
		}
		else
		{

			// DEFINES WHICH PAGE TO RENDER
			$data['main_view'] = 'main/error_invoices.php';
			$data['actionresult'] = "orders/expired_invoices";
			$data['heading1'] = "No expired invoices available .. ";
			$data['heading2'] = "Oops! Sorry no invoices record available in the given details";
			$data['details'] = "We will work on fixing that right away. Meanwhile, you may return or try using the search form.";

			// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
			$this->load->view('main/index.php', $data);
		}
	}

	// orders/Delete
	public function delete($args)
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// DEFINES TO DELETE IMAGE FROM FOLDER PARAMETER REQIURES ARRAY OF IMAGE PATH AND ID
		$this->Crud_model->delete_image('./prescription/', $args, 'mp_orders');
		$result = $this->Crud_model->delete_record('mp_orders', $args);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-trash-o" aria-hidden="true"></i> Order record removed',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Order record cannot be changed',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('orders/order_history/');
	}

	// orders/change_status/id/status
	public function change_status_del($id, $status)
	{

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_orders',
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
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i> Status changed Successfully!',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Status cannot be changed',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('orders/order_history');
	}

	// orders/change_status/id/status
	public function change_status($id, $status)
	{

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_tempinvoices',
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
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i> Status changed Successfully!',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Status cannot be changed',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('orders/verified_invoices/');
	}

	// orders/change_status_sales/id/status
	public function change_status_sales($id, $status)
	{

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_tempinvoices',
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
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i> Status changed Successfully!',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Status cannot be changed',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		redirect('orders/manage');
	}

	//orders/add_deliverd_details
	public function add_deliverd_details()
	{

		// RETRIEVING UPDATED VALUES FROM FORM userPanel FORM
		$edit_invoice_Id = html_escape($this->input->post('edit_invoice_Id'));
		$delivered_to = html_escape($this->input->post('delivered_to'));
		$delivered_by = html_escape($this->input->post('delivered_by'));
		$delivered_date = html_escape($this->input->post('delivered_date'));
		$delivered_description = html_escape($this->input->post('delivered_description'));

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_tempinvoices',
			'id' => $edit_invoice_Id
		);

		// DATA ARRAY FOR UPDATE QUERY array('abc'=>abc)
		$data = array(
			'delivered_to' => $delivered_to,
			'delivered_by' => $delivered_by,
			'delivered_date' => $delivered_date,
			'delivered_description' => $delivered_description,
			'status' => 3,
			'date' => date('Y-m-d')
		);

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
		$result = $this->Crud_model->edit_record_id($args, $data);

		// FETCHING THE RECORD FROM TEMP invoice TABLE TO INSERT INTO ORGINAL invoiceS TABLE BY USING invoice ID
		$temp_invoice_record = $this->Crud_model->fetch_temp_invoice_by_id('mp_tempinvoices', $edit_invoice_Id);
		$prescription_id = $temp_invoice_record[0]->prescription_id;

		// TABLENAME AND ID FOR DATABASE ACTION
		$args_orders = array(
			'table_name' => 'mp_orders',
			'id' => $prescription_id
		);

		// DATA ARRAY FOR UPDATE QUERY array('abc'=>abc)
		$dataorders = array(
			'status' => 3
		);

		// ASSIGNING TODAYS DATE
		$temp_invoice_record[0]->date = date('Y-m-d');

		// FETCHING THE RECORD OF TEMP SALES FROM TEMP SALES TABLE TO INSERT INTO THE ORGINAL SALES TABLE
		$temp_sales_record = $this->Crud_model->fetch_temp_sales_by_id('mp_temp_sales', $edit_invoice_Id);

		// echo $edit_invoice_Id;
		$get_medicine_status = $this->manage_qty($edit_invoice_Id);

		// WILL CAUSE ERROR IF BOTH OF THE ARRAYS ARE EMPTY OR NULL
		if ($get_medicine_status == true)
		{
			if ($temp_invoice_record != NULL && $temp_sales_record != NULL)
			{
				// INSERT THE invoice DATA INTO invoice TABLE AND GET HIS ROW ID
				$last_inserted_id = $this->Crud_model->insert_data_last_id('mp_invoices', $temp_invoice_record[0]);

				// ITERATING THE OBJECT ARRAY TO INSERT THE EACH ROW INTO SALES TABLE
				foreach($temp_sales_record as $row => $sales_record)
				{
					// CHANGING THE ORDER ID OF ROW TO NEW ORDER ID INSERTED CURRENTLY SO manage THE RECORD ACCORDINGLY
					$sales_record->order_id = $last_inserted_id;

					// RECORED INSERTED
					$this->db->insert("mp_sales", $sales_record);
				}

				// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
				$this->Crud_model->edit_record_id($args_orders, $dataorders);
				$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i> invoice added Successfully',
					'alert' => 'info'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
			else
			{
				$array_msg = array(
					'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error invoice record cannot be changed',
					'alert' => 'danger'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Medicine quantity is less then reqiured',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('invoice/manage/');
	}

	//Orders/popup
	//DEFINES A POPUP MODEL OG GIVEN PARAMETER
	function popup($page_name = '',$param = '')
	{
		$this->load->model('Crud_model');

		if($page_name  == 'prescription_image_model')
		{
			$data['pres_image'] = $this->Crud_model->fetch_record_by_id('mp_orders',$param);
			//model name available in admin models folder
			$this->load->view('admin_models/prescription_image_model.php',$data);
		}
		else if($page_name  == 'customer_profile_model')
		{
			$data['single_cus'] = $this->Crud_model->fetch_record_by_id('mp_customer',$param);
			//model name available in admin models folder
			$this->load->view('admin_models/customer_profile_model.php',$data);
		}	
		else if($page_name  == 'add_delivery_model')
		{
			$data['single_cus'] = $this->Crud_model->fetch_record_by_id('mp_customer',$param);
			//model name available in admin models folder
			$this->load->view('admin_models/add_delivery_model.php',$data);
		}
		else if($page_name  == 'prescription_image_model_temp')
		{
			$data['single_cus'] = $this->Crud_model->fetch_record_by_id('mp_tempinvoices',$param);
			//model name available in admin models folder
			$this->load->view('admin_models/prescription_image_model.php',$data);
		}
		
	}

	public function ajax_edit($id)
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// TABLE NAME HERE
		$table = "mp_orders";

		// GET THE ROW FROM DATABASE FROM TABLE ID
		$data = $this->Crud_model->get_by_id($table, $id);

		// CONVERTED INTO JSON FORM TO SHOW INTO EDIT BOX IN POP UP MODEL
		echo json_encode($data);
	}

	public function ajax_edit_temp_invoice($id)
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// TABLE NAME HERE
		$table = "mp_tempinvoices";

		// GET THE ROW FROM DATABASE FROM TABLE ID
		$data = $this->Crud_model->get_by_id($table, $id);

		// CONVERTED INTO JSON FORM TO SHOW INTO EDIT BOX IN POP UP MODEL
		echo json_encode($data);
	}

	// orders/invoiceid
	public function manage_qty($invoiceid)
	{
		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Accounts_model');

		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
		return $this->Accounts_model->adjust_medicines($invoiceid);
	}
}