<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Pengembalian extends MY_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Mod_pengembalian');
        $this->load->model('Mod_anggota');
    }


    public function index()
    {
        $data['title'] = "Pengembalian Buku";
        $data['getDataAnggota'] = $this->Mod_anggota->cekAnggota($this->session->userdata['username'])->row_array();
        if($this->session->userdata['role'] == "anggota") {
            $data['listPengembalian'] = $this->listPengembalian()->result_array();
        }
        $this->template->load('layoutbackend', 'pengembalian/pengembalian_data', $data);
    }

    public function cari_nis()
    {
        $nis = $this->input->post('nis');
        // $nis = 121210;
        $data['pencarian'] = $this->Mod_pengembalian->SearchNis($nis);
        // print_r($data['pencarian']);
        $this->load->view('pengembalian/pengembalian_pencarian', $data);
        
         
    }

    public function cari_transaksi()
    {
        $no_transaksi = $this->input->get_post('no_transaksi');
        // $no_transaksi = 20180411002;
        $hasil = $this->Mod_pengembalian->SearchTransaksi($no_transaksi);
        if($hasil->num_rows() > 0) {
            $dtrans = $hasil->row_array();
            echo $dtrans['nis']."|".$dtrans['tanggal_pinjam']."|".$dtrans['tanggal_kembali']."|".$dtrans['nama']."|".$dtrans['kode_buku'];
        }
    }

    public function tampil_buku()
    {
        
        $no_transaksi = $this->input->get('no_transaksi');
        $data['buku'] = $this->Mod_pengembalian->showBook($no_transaksi)->result();
        $this->load->view('pengembalian/pengembalian_tampil_buku', $data);
        
    }

    public function simpan_transaksi()
    {
        $id_petugas = $this->session->userdata['id_petugas'];

        $simpan = array(
            'id_transaksi'     => $this->input->post('no_transaksi'),
            'tgl_pengembalian' => date('Y-m-d'),
            'denda'            => $this->input->post('denda'),
            'nominal'          => $this->input->post('nominal'),
            'kode'          => $this->input->post('kode'),
            'id_petugas'       => $id_petugas
        );
        $this->Mod_pengembalian->insertPengembalian($simpan);

        //update status peminjaman dari N menjadi Y
        $no_transaksi = $this->input->post('no_transaksi');
        $data = array(
            'status' => "Y"
        );

        $this->Mod_pengembalian->UpdateStatus($no_transaksi, $data);
    }

    public function listPengembalian()
    {
        $nis = $this->session->userdata['username'];
        $results = $this->Mod_pengembalian->listPengembalian($nis);
        return $results;
    }

}

/* End of file Pengembalian.php */








