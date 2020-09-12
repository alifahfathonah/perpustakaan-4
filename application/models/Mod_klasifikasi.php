<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mod_klasifikasi extends CI_Model {

    private $table   = "klasifikasi";
    private $primary = "id";
    
    function getAll()
    {
        $this->db->order_by('klasifikasi.id asc');
        return $this->db->get('klasifikasi');
    }

}

/* End of file ModelName.php */
