<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Service extends CI_Controller
{
	// Service
	function index()
	{
		// DEFINES PAGE TITLE
		$data['title'] = 'Service List';

		// DEFINES NAME OF TABLE HEADING
		$data['table_name'] = 'Service List :';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_name'] = 'Add New Service';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_model'] = 'Add New Service';

		// DEFINES THE NAME OF THE BUTTON OF POPUP MODEL
		$data['page_title_model_button_save'] = 'Save Service';

		// DEFINES WHICH PAGE TO RENDER
		$data['main_view'] = 'services';

		// DEFINES THE TABLE HEAD
		$data['table_heading_names_of_coloums'] = array(
			'Title',
			'Description',
			'Icon',
			'Status',
			'Action'
		);

		// DEFINES TO LOAD THE CATEGORY LIST FROM DATABSE TABLE mp_Categoty
		$this->load->model('Crud_model');
		$result = $this->Crud_model->fetch_record('mp_services', NULL);
		$data['ServicesList'] = $result;

		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('main/index.php', $data);
	}

	//	Service/add_service
	function add_service()
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// DEFINES READ PHARMACIST details FORM MEDICINE FORM
		$Service_Title = html_escape($this->input->post('Service_Title'));
		$Service_description = html_escape($this->input->post('Service_description'));
		$Service_Icon = html_escape($this->input->post('Service_Icon'));

		// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
		$args = array(
			'title' => $Service_Title,
			'description' => $Service_description,
			'icon' => $Service_Icon
		);

		// DEFINES CALL THE FUNCTION OF insert_data FORM Crud_model CLASS
		$result = $this->Crud_model->insert_data('mp_services', $args);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i> Service added Successfully',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Service cannot be added',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('service');
	}
	//Service/popup
	//DEFINES A POPUP MODEL OG GIVEN PARAMETER
	function popup($page_name = '',$param = '')
	{
		$this->load->model('Crud_model');
		if($page_name  == 'edit_service_model')
		{
			$data['single_service'] = $this->Crud_model->fetch_record_by_id('mp_services',$param);
			//model name available in admin models folder
			$this->load->view( 'admin_models/edit_models/edit_service_model.php',$data);
		}	
		else if($page_name  == 'add_service_model')
		{
			//model name available in admin models folder
			$this->load->view( 'admin_models/add_models/add_service_model.php');
		}
	}
	// Service/Delete
	function delete($args)
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// DEFINES TO DELETE THE ROW FROM TABLE AGAINST ID
		$result = $this->Crud_model->delete_record('mp_services', $args);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-trash-o" aria-hidden="true"></i> Service record removed',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Service record cannot be changed',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('service');
	}

	//Service/Edit
	function edit()
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// RETRIEVING UPDATED VALUES FROM FORM MEDICINE FORM
		$edit_service_id = html_escape($this->input->post('edit_service_id'));
		$edit_service_title = html_escape($this->input->post('edit_service_title'));
		$edit_service_des = html_escape($this->input->post('edit_service_des'));
		$edit_service_icon = html_escape($this->input->post('edit_service_icon'));

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_services',
			'id' => $edit_service_id
		);
		$data = array(
			'title' => $edit_service_title,
			'description' => $edit_service_des,
			'icon' => $edit_service_icon
		);

		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
		$result = $this->Crud_model->edit_record_id($args, $data);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"></i> Service Editted',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Service cannot be Editted',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('service');
	}

	// Service/change_status/id/status
	function change_status($id, $status)
	{

		// TABLENAME AND ID FOR DATABASE ACTION

		$args = array(
			'table_name' => 'mp_services',
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

		redirect('service');
	}

}