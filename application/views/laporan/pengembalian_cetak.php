<!DOCTYPE html>
<html>
<head>
	<title>Pengembalian</title>
	<style type="text/css">
		h1{
			text-align: center;
			margin-top: 50px;
		}
		.content{width: 100%; margin: 0 auto;}
	</style>
</head>
<body onload="window.print()">
<!-- <body> -->
	<h1>Report Pengembalian</h1><hr>
			<p style="float: right;">Cirebon, <?=date('d F Y') ?></p>
			<div class="content">
				<?php if($hasil_search->num_rows() > 0) { ?>
				<table border="1" style="width: 95%; margin: 0 auto; border-collapse: collapse;">
				    <thead>
				        <tr>
				            <td>No.</td>
				            <td>ID Transaksi</td>
				            <td>Tanggal Pengembalian</td>
				            <td>Denda</td>
				            <td>Nominal</td>
				            <td>ID Petugas</td>
				        </tr>
				    </thead>
				    <?php $no=0; $nominal = 0; foreach($hasil_search->result() as $data): $no++;?>
				    <tr>
						<?php 
						$nominal += $data->nominal;
						?>
				        <td><?php echo $no;?></td>
				        <td><?php echo $data->id_transaksi;?></td>
				        <td><?php echo $data->tgl_pengembalian;?></td>
				        <td><?php echo $data->denda;?></td>
				        <td><?php echo $data->nominal; ?></td>
				        <td><?php echo $data->full_name;?></td>
				    </tr>
					<?php endforeach;?>
					<tr>
						<th colspan="5">Total Denda</th>
						<th>Rp. <?= $nominal; ?></th>
					</tr>
				</table>

				<?php }else{ ?>
				<p class="text-center"><strong> ~ Maaf Data Belum Tersedia ~ </strong></p>
				<?php } ?>
			</div>

</body>
</html>