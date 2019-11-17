<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
class Testamonial extends CI_Controller
{
	// Testamonial
	public function index()
	{

		// DEFINES PAGE TITLE
		$data['title'] = 'Testamonial List';

		// DEFINES NAME OF TABLE HEADING
		$data['table_name'] = 'Testamonial List :';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_name'] = 'Add New Testamonial';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_model'] = 'Add New Testamonial';

		// DEFINES THE NAME OF THE BUTTON OF POPUP MODEL
		$data['page_title_model_button_save'] = 'Save Testamonial';

		// DEFINES WHICH PAGE TO RENDER
		$data['main_view'] = 'testamonials';

		// DEFINES THE TABLE HEAD
		$data['table_heading_names_of_coloums'] = array(
			'Name',
			'Description',
			'Picture',
			'Status',
			'Action'
		);

		// DEFINES TO LOAD THE CATEGORY LIST FROM DATABSE TABLE mp_Categoty
		$this->load->model('Crud_model');
		$result = $this->Crud_model->fetch_record('mp_testamonials', NULL);
		$data['testamonialsList'] = $result;

		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('main/index.php', $data);
	}

	//Testamonial/add_Testamonial
	function add_testamonial()
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// DEFINES READ PHARMACIST details FORM MEDICINE FORM
		$testamonial_name = html_escape($this->input->post('testamonial_name'));
		$testamonial_description = html_escape($this->input->post('testamonial_description'));
		$testamonial_picture = $this->Crud_model->do_upload_picture("testamonial_picture", "./uploads/testamonials/");

		// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
		$args = array(
			'name' => $testamonial_name,
			'description' => $testamonial_description,
			'cus_picture' => $testamonial_picture
		);

		// DEFINES CALL THE FUNCTION OF insert_data FORM Crud_model CLASS
		$result = $this->Crud_model->insert_data('mp_testamonials', $args);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i> Testamonial added Successfully',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Testamonial cannot be added',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('testamonial');
	}

	// Testamonial/Delete
	function delete($args)
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// DEFINES TO DELETE IMAGE FROM FOLDER PARAMETER REQIURES ARRAY OF IMAGE PATH AND ID
		$this->Crud_model->delete_image('./uploads/testamonials/', $args, 'mp_testamonials');

		// DEFINES TO DELETE THE ROW FROM TABLE AGAINST ID
		$result = $this->Crud_model->delete_record('mp_testamonials', $args);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-trash-o" aria-hidden="true"></i> Category record removed',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Category record cannot be changed',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('testamonial');
	}

	// Customers/Edit
	function edit()
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// RETRIEVING UPDATED VALUES FROM FORM MEDICINE FORM
		$edit_testamonial_id = html_escape($this->input->post('edit_testamonial_id'));
		$edit_testamonial_name = html_escape($this->input->post('edit_testamonial_name'));
		$edit_testamonial_des = html_escape($this->input->post('edit_testamonial_des'));
		$edit_testamonial_picture_name = $this->Crud_model->do_upload_picture("edit_testamonial_picture_name", "./uploads/testamonials/");

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_testamonials',
			'id' => $edit_testamonial_id
		);

		// DEFINES IF  IMAGES IS SELECTED SO UPDATE PRIVIOUS PICTURE
		if ($edit_testamonial_picture_name == "default.jpg")
		{
			$data = array(
				'name' => $edit_testamonial_name,
				'description' => $edit_testamonial_des
			);
		}
		else
		{
			$data = array(
				'name' => $edit_testamonial_name,
				'description' => $edit_testamonial_des,
				'cus_picture' => $edit_testamonial_picture_name
			);
			
			// DEFINES TO DELETE IMAGE FROM FOLDER PARAMETER REQIURES ARRAY OF IMAGE PATH AND ID
			$this->Crud_model->delete_image('./uploads/testamonials/', $edit_testamonial_id, 'mp_testamonials');

		}
			
		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
		$result = $this->Crud_model->edit_record_id($args, $data);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"></i> Testamonial Editted',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Testamonial cannot be Editted',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('testamonial');
	}

	//Testamonial/popup
	//DEFINES A POPUP MODEL OG GIVEN PARAMETER
	function popup($page_name = '',$param = '')
	{
		$this->load->model('Crud_model');

		if($page_name  == 'edit_testamonials_model')
		{
			$data['single_testa'] = $this->Crud_model->fetch_record_by_id('mp_testamonials',$param);
			//model name available in admin models folder
			$this->load->view( 'admin_models/edit_models/edit_testamonials_model.php',$data);
		}	
		else if($page_name  == 'add_testamonials_model')
		{
			//model name available in admin models folder
			$this->load->view( 'admin_models/add_models/add_testamonials_model.php');
		}
		
	}

	// Testamonial/change_status/id/status
	function change_status($id, $status)
	{

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_testamonials',
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

		redirect('testamonial');
	}

}