<!DOCTYPE html>
<html>
<head>
	<title>Pinjaman</title>
	<style type="text/css">
		h1{
			text-align: center;
			margin-top: 50px;
		}
		.content{width: 100%; margin: 0 auto;}
	</style>
</head>
<body onload="window.print()">
	<h1>Report Pinjaman</h1><hr>
			<p style="float: right;">Cirebon, <?=date('d F Y') ?></p>
			<div class="content">
				<?php if($hasil_search->num_rows() > 0) { ?>
				<table border="1" style="border-collapse: collapse; width: 95%; margin: 0 auto;">
				    <thead>
				        <tr>
				            <td>No.</td>
				            <td>ID Transaksi</td>
				            <td>Tanggal Pinjam</td>
				            <td>Tanggal Kembali</td>
				            <td>Status</td>
				            <td>Nis</td>
				        </tr>
				    </thead>
				    <tbody>
				    	<?php $no=0; foreach($hasil_search->result() as $row): $no++;?>
				    <tr>
				        <td><?php echo $no;?></td>
				        <td><?php echo $row->id_transaksi;?></td>
				        <td><?php echo $row->tanggal_pinjam;?></td>
				        <td><?php echo $row->tanggal_kembali;?></td>
				        <td><?php echo $row->status_pinjam; ?></td>
				        <td><?php echo $row->nis;?></td>
				    </tr>
				    <?php endforeach;?>
				    </tbody>
				</table>

				<?php }else{ ?>
				<p class="text-center"><strong> ~ Maaf Data Belum Tersedia ~ </strong></p>
				<?php } ?>
			</div>

</body>
</html>