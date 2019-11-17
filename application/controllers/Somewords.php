<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Somewords extends CI_Controller
{
	// Somewords
	function index()
	{

		// DEFINES PAGE TITLE
		$data['title'] = 'Somewords List';

		// DEFINES NAME OF TABLE HEADING
		$data['table_name'] = 'Somewords List :';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_name'] = 'Add New Someword';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_model'] = 'Add New Someword';

		// DEFINES THE NAME OF THE BUTTON OF POPUP MODEL
		$data['page_title_model_button_save'] = 'Save Someword';

		// DEFINES WHICH PAGE TO RENDER
		$data['main_view'] = 'somewords';

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
		$result = $this->Crud_model->fetch_record('mp_words', NULL);
		$data['SomewordsList'] = $result;

		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('main/index.php', $data);
	}

	//	Somewords/add_somewords
	function add_somewords()
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// DEFINES READ PHARMACIST details FORM MEDICINE FORM
		$somewords_title = html_escape($this->input->post('somewords_title'));
		$somewords_description = html_escape($this->input->post('somewords_description'));
		$somewords_icon = html_escape($this->input->post('somewords_icon'));

		// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
		$args = array(
			'title' => $somewords_title,
			'description' => $somewords_description,
			'icon' => $somewords_icon
		);

		// DEFINES CALL THE FUNCTION OF insert_data FORM Crud_model CLASS
		$result = $this->Crud_model->insert_data('mp_words', $args);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i>  Added Successfully',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error cannot be added',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('somewords');
	}

	// Somewords/Delete
	function delete($args)
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');


		// DEFINES TO DELETE THE ROW FROM TABLE AGAINST ID
		$result = $this->Crud_model->delete_record('mp_words', $args);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-trash-o" aria-hidden="true"></i>  Record removed',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error  record cannot be changed',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('somewords');
	}

	//Somewords/popup
	//DEFINES A POPUP MODEL OG GIVEN PARAMETER
	function popup($page_name = '',$param = '')
	{
		$this->load->model('Crud_model');

		if($page_name  == 'edit_somewords_model')
		{
			$data['single_words'] = $this->Crud_model->fetch_record_by_id('mp_words',$param);
			//model name available in admin models folder
			$this->load->view( 'admin_models/edit_models/edit_somewords_model.php',$data);
		}	
		else if($page_name  == 'add_somewords_model')
		{
			//model name available in admin models folder
			$this->load->view( 'admin_models/add_models/add_somewords_model.php');
		}
		
	}


	// Customers/Edit
	function edit()
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// RETRIEVING UPDATED VALUES FROM FORM MEDICINE FORM
		$edit_somewords_id = html_escape($this->input->post('edit_somewords_id'));
		$edit_somewords_title = html_escape($this->input->post('edit_somewords_title'));
		$edit_somewords_des = html_escape($this->input->post('edit_somewords_des'));
		$edit_somewords_icon = html_escape($this->input->post('edit_somewords_icon'));

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_words',
			'id' => $edit_somewords_id
		);
		$data = array(
			'title' => $edit_somewords_title,
			'description' => $edit_somewords_des,
			'icon' => $edit_somewords_icon
		);

		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA

		$result = $this->Crud_model->edit_record_id($args, $data);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"></i> Record Editted',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Record cannot be Editted',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('somewords');
	}

	// Somewords/change_status/id/status
	function change_status($id, $status)
	{

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_words',
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
		redirect('somewords');
	}
}