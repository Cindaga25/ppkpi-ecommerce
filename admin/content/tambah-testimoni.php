<?php

if (isset($_POST['simpan'])) {
    $nama = $_POST['nama'];
    $jabatan = $_POST['jabatan'];
    $deskripsi = $_POST['deskripsi'];

    $insert = mysqli_query($koneksi, "INSERT INTO testimoni (nama,jabatan, deskripsi) VALUES ('$nama','$jabatan','$deskripsi')");
    header("location:?pg=testimoni&insert=berhasil");
}

if (isset($_GET['edit'])) {
    $id = $_GET['edit'];
    // tampilkan sebuah data dari tabel testimoni dimana id bernilai dari nilai parameter
    $edit = mysqli_query($koneksi, "SELECT * FROM testimoni WHERE id='$id'");
    $rowEdit = mysqli_fetch_assoc($edit);
}
if (isset($_POST['edit'])) {
    $nama = $_POST['nama'];
    $jabatan = $_POST['jabatan'];
    $deskripsi = $_POST['deskripsi'];
    $id = $_GET['edit'];

    $update = mysqli_query($koneksi, "UPDATE testimoni SET nama='$nama', jabatan='$jabatan', deskripsi='$deskripsi' WHERE id='$id'");
    header("location:?pg=testimoni&update=berhasil");
}
?>
<form action="" method="post">
    <div class="mb-4">
        <label for="">Nama</label>
        <input value="<?php echo isset($_GET['edit']) ? $rowEdit['nama'] : '' ?>" type="text" class="form-control" name="nama" placeholder="Masukkan Instruktur">
    </div>
    <div class="mb-4">
        <label for="">Jabatan</label>
        <input value="<?php echo isset($_GET['edit']) ? $rowEdit['jabatan'] : '' ?>" type="text" class="form-control" name="jabatan" placeholder="Masukkan Jabatan">
    </div>
    <div class="mb-4">
        <label for="">Deskripsi</label>
        <textarea name="deskripsi" id="" class="form-control" placeholder="Masukkan deskripsi"><?php echo isset($_GET['edit']) ? $rowEdit['deskripsi'] : '' ?></textarea>
    </div>
    <div class="mb-4">
        <input type="submit" name="<?php echo isset($_GET['edit']) ? 'edit' : 'simpan' ?>" value="Simpan" class="btn btn-primary">
        <a href="?pg=testimoni">Kembali</a>
    </div>
</form>