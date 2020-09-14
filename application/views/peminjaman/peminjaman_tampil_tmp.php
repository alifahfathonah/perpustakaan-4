<?php if($this->session->userdata['role'] == "admin") { ?>
<table class="table table-striped table-bordered">
    <thead>
        <tr>
            <td>Kode Buku</td>
            <td>Judul Buku</td>
            <td>Pengarang</td>
            <td></td>
        </tr>
    </thead>
    <?php foreach($tmp as $tmp):?>
    <tr>
        <td><?php echo $tmp->kode_buku;?></td>
        <td><?php echo $tmp->judul;?></td>
        <td><?php echo $tmp->pengarang;?></td>
        <td><a href="#" class="hapus" kode="<?php echo $tmp->kode_buku;?>"><i class="glyphicon glyphicon-trash"></i></a></td>
    </tr>
    <?php endforeach;?>
    <tr>
        <td colspan="2">Total Buku</td>
        <td colspan="2"><input type="text" id="jumlahTmp" readonly="readonly" value="<?php echo $jumlahTmp;?>" class="form-control"></td>
    </tr>
</table>

<?php } ?>

<?php if($this->session->userdata['role'] == "anggota") { ?>

<div class="row">
    <div class="col-md-3">
        <ul class="list-group">
            <li class="list-group-item">
                <img src="<?= base_url('assets/img/anggota/'.$getDataAnggota['image']) ?>" class="img-responsive m-auto img-thumbnail" alt="Responsive image">
            </li>
            <li class="list-group-item">Nama : <?= $getDataAnggota['nama'] ?></li>
            <li class="list-group-item">NIS : <?= $getDataAnggota['nis'] ?></li>
            <li class="list-group-item">Jenis Kelamin : <?= $getDataAnggota['jk'] ?></li>
            <li class="list-group-item">TTL : <?= $getDataAnggota['ttl'] ?></li>
            <li class="list-group-item">Kelas : <?= $getDataAnggota['kelas'] ?></li>
        </ul>
    </div>
    <div class="col-md-9">
        <h4>Pinjaman saya</h4>
        <hr>
        <div class="table-responsive">
            <table class="table table-bordered" id="listPinjaman">
                <thead>
                    <tr>
                        <th>ID transaksi</th>
                        <th>Kode Buku</th>
                        <th>Tanggal Pinjam</th>
                        <th>Tanggal Kembali</th>
                        <th>Petugas</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($listPeminjaman as $lp):?>
                        <tr>
                            <td><?= $lp['id_transaksi'] ?></td>
                            <td><?= $lp['kode_buku'] ?></td>
                            <td><?= $lp['tanggal_pinjam'] ?></td>
                            <td><?= $lp['tanggal_kembali'] ?></td>
                            <td><?= $lp['full_name'] ?></td>
                        </tr>
                    <?php endforeach;?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#listPinjaman').DataTable({
            responsive: true
        });
    });
</script>

<?php } ?>