<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Provider_produk extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('status') !== 'login' ) {
			redirect('/');
		}
		$this->load->model('provider_produk_model');
	}

	public function index()
	{
		$this->load->view('provider_produk');
	}

	public function read()
	{
		header('Content-type: application/json');
		if ($this->provider_produk_model->read()->num_rows() > 0) {
			foreach ($this->provider_produk_model->read()->result() as $provider_produk) {
				$data[] = array(
					'provider' => $provider_produk->provider,
					'action' => '<button class="btn btn-sm btn-success" onclick="edit('.$provider_produk->id.')">Edit</button> <button class="btn btn-sm btn-danger" onclick="remove('.$provider_produk->id.')">Delete</button>'
				);
			}
		} else {
			$data = array();
		}
		$provider_produk = array(
			'data' => $data
		);
		echo json_encode($provider_produk);
	}

	public function add()
	{
		$data = array(
			'provider' => $this->input->post('provider')
		);
		if ($this->provider_produk_model->create($data)) {
			echo json_encode('sukses');
		}
	}

	public function delete()
	{
		$id = $this->input->post('id');
		if ($this->provider_produk_model->delete($id)) {
			echo json_encode('sukses');
		}
	}

	public function edit()
	{
		$id = $this->input->post('id');
		$data = array(
			'provider' => $this->input->post('provider')
		);
		if ($this->provider_produk_model->update($id,$data)) {
			echo json_encode('sukses');
		}
	}

	public function get_kategori()
	{
		$id = $this->input->post('id');
		$provider = $this->provider_produk_model->getKategori($id);
		if ($provider->row()) {
			echo json_encode($provider->row());
		}
	}

	public function search()
	{
		header('Content-type: application/json');
		$provider = $this->input->post('provider');
		$search = $this->provider_produk_model->search($provider);
		foreach ($search as $provider) {
			$data[] = array(
				'id' => $provider->id,
				'text' => $provider->provider
			);
		}
		echo json_encode($data);
	}

}

