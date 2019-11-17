<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Pharmacist extends CI_Controller
{
	// Phamacist
	public function index()
	{

		// DEFINES PAGE TITLE
		$data['title'] = 'Pharmacist List';

		// DEFINES NAME OF TABLE HEADING
		$data['table_name'] = 'Pharmacist List :';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_name'] = 'Add New Pharmacist';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_model'] = 'Add New Pharmacist';

		// DEFINES THE NAME OF THE BUTTON OF POPUP MODEL
		$data['page_title_model_button_save'] = 'Save Pharmacist';

		// DEFINES WHICH PAGE TO RENDER
		$data['main_view'] = 'pharmacist';

		// DEFINES THE TABLE HEAD
		$data['table_heading_names_of_coloums'] = array(
			'Name',
			'Post',
			'Twitter',
			'LinkedIn',
			'GooglePlus',
			'Picture',
			'Status',
			'Action'
		);

		// DEFINES TO LOAD THE CATEGORY LIST FROM DATABSE TABLE mp_Categoty
		$this->load->model('Crud_model');
		$result = $this->Crud_model->fetch_record('mp_pharmacist', NULL);
		$data['pharmacist_list'] = $result;

		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('main/index.php', $data);
	}

	//	Phamacist/Add_Phamacist
	public function add_pharmacist()
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// DEFINES READ PHARMACIST details FORM MEDICINE FORM
		$pharmacist_name = html_escape($this->input->post('pharmacist_name'));
		$pharmacist_post = html_escape($this->input->post('pharmacist_post'));
		$pharmacist_des = html_escape($this->input->post('pharmacist_des'));
		$pharmacist_facebook = html_escape($this->input->post('pharmacist_facebook'));
		$pharmacist_twitter = html_escape($this->input->post('pharmacist_twitter'));
		$pharmacist_linked = html_escape($this->input->post('pharmacist_linked'));
		$pharmacist_googleplus = html_escape($this->input->post('pharmacist_googleplus'));
		$pharmacist_picture = $this->Crud_model->do_upload_picture("pharmacist_picture", "./uploads/pharmacist/");

		// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
		$args = array(
			'name' => $pharmacist_name,
			'post_title' => $pharmacist_post,
			'description' => $pharmacist_des,
			'cus_picture' => $pharmacist_picture,
			'facebook' => $pharmacist_facebook,
			'twitter' => $pharmacist_twitter,
			'linked' => $pharmacist_linked,
			'googleplus' => $pharmacist_googleplus
		);

		// DEFINES CALL THE FUNCTION OF insert_data FORM Crud_model CLASS
		$result = $this->Crud_model->insert_data('mp_pharmacist', $args);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i> Pharmacist added Successfully',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Pharmacist cannot be added',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('pharmacist');
	}

	// Customer/Delete
	public function delete($args)
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// DEFINES TO DELETE IMAGE FROM FOLDER PARAMETER REQIURES ARRAY OF IMAGE PATH AND ID
		$this->Crud_model->delete_image('./uploads/pharmacist/', $args, 'mp_pharmacist');

		// DEFINES TO DELETE THE ROW FROM TABLE AGAINST ID
		$result = $this->Crud_model->delete_record('mp_pharmacist', $args);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-trash-o" aria-hidden="true"></i> Pharmacist record removed',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Pharmacist record cannot be changed',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('pharmacist');
	}

	// Pharmacist/Edit
	public function edit()
	{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		$this->load->model('Crud_model');

		// RETRIEVING UPDATED VALUES FROM FORM MEDICINE FORM
		$edit_pharmacist_id = html_escape($this->input->post('edit_pharmacist_id'));
		$edit_pharmacist_name = html_escape($this->input->post('edit_pharmacist_name'));
		$edit_pharmacist_post = html_escape($this->input->post('edit_pharmacist_post'));
		$edit_pharmacist_des = html_escape($this->input->post('edit_pharmacist_des'));
		$edit_pharmacist_facebook = html_escape($this->input->post('edit_pharmacist_facebook'));
		$edit_pharmacist_twitter = html_escape($this->input->post('edit_pharmacist_twitter'));
		$edit_pharmacist_linked = html_escape($this->input->post('edit_pharmacist_linked'));
		$edit_pharmacist_googleplus = html_escape($this->input->post('edit_pharmacist_googleplus'));
		echo $edit_picture = $this->Crud_model->do_upload_picture("edit_pharmacist_picture_name", "./uploads/pharmacist/");

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_pharmacist',
			'id' => $edit_pharmacist_id
		);

		// DATA ARRAY FOR UPDATE QUERY array('abc'=>abc)
		// DEFINES IF NO IMAGES IS SELECTED SO PRIVIOUS PICTURE REMAINS SAME
		if ($edit_picture == "default.jpg")
		{
			$data = array(
				'name' => $edit_pharmacist_name,
				'post_title' => $edit_pharmacist_post,
				'description' => $edit_pharmacist_des,
				'facebook' => $edit_pharmacist_facebook,
				'twitter' => $edit_pharmacist_twitter,
				'linked' => $edit_pharmacist_linked,
				'googleplus' => $edit_pharmacist_googleplus
			);
		}
		else
		{

			// DEFINES IF  IMAGES IS SELECTED SO UPDATE PRIVIOUS PICTURE
			$data = array(
				'name' => $edit_pharmacist_name,
				'post_title' => $edit_pharmacist_post,
				'description' => $edit_pharmacist_des,
				'facebook' => $edit_pharmacist_facebook,
				'twitter' => $edit_pharmacist_twitter,
				'linked' => $edit_pharmacist_linked,
				'googleplus' => $edit_pharmacist_googleplus,
				'cus_picture' => $edit_picture
			);

			// DEFINES TO DELETE IMAGE FROM FOLDER PARAMETER REQIURES ARRAY OF IMAGE PATH AND ID
			$this->Crud_model->delete_image('./uploads/pharmacist/', $edit_pharmacist_id, 'mp_pharmacist');
		}

		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
		$result = $this->Crud_model->edit_record_id($args, $data);
		if ($result == 1)
		{
			$array_msg = array(
				'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"></i> Pharmacist Editted',
				'alert' => 'info'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Pharmacist cannot be Editted',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}

		redirect('pharmacist');
	}

	//Pharmacist/popup
	//DEFINES A POPUP MODEL OG GIVEN PARAMETER
	function popup($page_name = '',$param = '')
	{
		$this->load->model('Crud_model');

		if($page_name  == 'edit_pharmicist_model')
		{
			$data['single_pharmacist'] = $this->Crud_model->fetch_record_by_id('mp_pharmacist',$param);
			//model name available in admin models folder
			$this->load->view( 'admin_models/edit_models/edit_pharmicist_model.php',$data);
		}	
		else if($page_name  == 'add_pharmicist_model')
		{
			//model name available in admin models folder
			$this->load->view( 'admin_models/add_models/add_pharmicist_model.php');
		}
		
	}

	// Customer/change_status/id/status
	public function change_status($id, $status)
	{

		// TABLENAME AND ID FOR DATABASE ACTION
		$args = array(
			'table_name' => 'mp_pharmacist',
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

		redirect('pharmacist');
	}
}