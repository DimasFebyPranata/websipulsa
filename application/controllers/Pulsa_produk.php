<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pulsa_produk extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('status') !== 'login' ) {
			redirect('/');
		}
		$this->load->model('pulsa_produk_model');
	}

	public function index()
	{
		$this->load->view('pulsa_produk');
	}

	public function read()
	{
		header('Content-type: application/json');
		if ($this->pulsa_produk_model->read()->num_rows() > 0) {
			foreach ($this->pulsa_produk_model->read()->result() as $pulsa_produk) {
				$data[] = array(
					'pulsa' => $pulsa_produk->pulsa,
					'action' => '<button class="btn btn-sm btn-success" onclick="edit('.$pulsa_produk->id.')">Edit</button> <button class="btn btn-sm btn-danger" onclick="remove('.$pulsa_produk->id.')">Delete</button>'
				);
			}
		} else {
			$data = array();
		}
		$pulsa_produk = array(
			'data' => $data
		);
		echo json_encode($pulsa_produk);
	}

	public function add()
	{
		$data = array(
			'pulsa' => $this->input->post('pulsa')
		);
		if ($this->pulsa_produk_model->create($data)) {
			echo json_encode('sukses');
		}
	}

	public function delete()
	{
		$id = $this->input->post('id');
		if ($this->pulsa_produk_model->delete($id)) {
			echo json_encode('sukses');
		}
	}

	public function edit()
	{
		$id = $this->input->post('id');
		$data = array(
			'pulsa' => $this->input->post('pulsa')
		);
		if ($this->pulsa_produk_model->update($id,$data)) {
			echo json_encode('sukses');
		}
	}

	public function get_satuan()
	{
		$id = $this->input->post('id');
		$pulsa = $this->pulsa_produk_model->getKategori($id);
		if ($pulsa->row()) {
			echo json_encode($pulsa->row());
		}
	}

	public function search()
	{
		header('Content-type: application/json');
		$pulsa = $this->input->post('pulsa');
		$search = $this->pulsa_produk_model->search($pulsa);
		foreach ($search as $pulsa) {
			$data[] = array(
				'id' => $pulsa->id,
				'text' => $pulsa->pulsa
			);
		}
		echo json_encode($data);
	}

}

