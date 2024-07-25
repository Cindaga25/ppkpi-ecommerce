<?php
$query = mysqli_query($koneksi, "SELECT * FROM barang ORDER BY id DESC");

if (isset($_GET['delete'])) {
    $id = $_GET['delete'];

    $foto = mysqli_query($koneksi, "SELECT *FROM barang WHERE id='$id' ");
    //mysqli_fetch_asscoc untuk mengambil atau get data dari query
    $rowEdit = mysqli_fetch_assoc($foto);

    //unlik untuk menampikan gambar di folder upload
    unlink("upload/" . $rowFoto['foto']);
    $delete = mysqli_query($koneksi, "DELETE FROM barang WHERE id='$id' ");
    header("location:?pg=produk&hapus=berhasil");
}
?>
<div class="mb-3" align="right">
    <a href="?pg=tambah-produk" class="btn btn-primary">Tambah Pengguna</a>
</div>

<table class="table table-bordered">
    <thead>
        <tr>
            <th>No</th>
            <th>Nama</th>
            <th>Harga</th>
            <th>Foto</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <!-- sebuah tabel foto memakai img scr untuk memanggil gambar yang telah di uplate di website -->
        <!-- untuk memanggil sebuah data di data base(mysql) -->
        <?php $no = 1;
        while ($row = mysqli_fetch_assoc($query)) : ?>
            <tr>
                <td><?php echo $no++ ?></td>
                <td><?php echo $row['nama_barang'] ?></td>
                <td><?php echo $row['harga'] ?></td>
                <td><img class="img-thumbnail" width="100px" src="upload/<?php echo $row['foto'] ?>" alt=""></td>
                <td>
                    <a href="?pg=tambah-produk&edit=<?php echo $row['id'] ?>" class="btn btn-sm btn-success">Edit</a>-
                    <a onclick="return confirm('apakah anda yakin akan mengapus data ini?')" href="?pg=produk&delete=<?php echo $row['id'] ?>" class="btn btn-sm btn-danger">Delete</a>
                </td>
            </tr>
        <?php endwhile ?>
    </tbody>
</table>