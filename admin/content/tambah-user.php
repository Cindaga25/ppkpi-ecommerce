<?php
//untuk simpan
if (isset($_POST['simpan'])) {
    $nama_lengkap = $_POST['nama_lengkap'];
    $email = $_POST['email'];
    $id_level = $_POST['id_level'];
    $password = sha1($_POST['password']);

    //memasukan ke dalam tabel user (field yang akan di masukan)
    //values (inputan masing-masing kolom)

    $insert = mysqli_query($koneksi, "INSERT INTO user (nama_lengkap, email, password, id_level) VALUES 
    ('$nama_lengkap','$email','$password','$id_level ')");

    if (!$insert) {
        // header("location:?pg=tambah-user&pesan=tambah-gagal");

    } else {
        header("location:?pg=user&pesan=tambah-berhasil");
    }
}



if (isset($_GET['edit'])) {
    $id = $_GET['edit'];

    $edit = mysqli_query($koneksi, "SELECT * FROM user WHERE id = '$id' ");
    $rowEdit = mysqli_fetch_assoc($edit);
}
//untuk edit 
if (isset($_POST["edit"])) {
    //htmlspecialchars untuk mencegah parameter kita ke
    $nama_lengkap = htmlspecialchars($_POST['nama_lengkap']);
    $email = $_POST['email'];
    $id_level = $_POST['id_level'];
    $password = sha1($_POST['password']);

    //variabel id untuk edit
    $id = $_GET['edit'];

    $update = mysqli_query($koneksi, "UPDATE user SET nama_lengkap='$nama_lengkap', email='$email', password='$password', id_level='$id_level' WHERE id='$id' ");
    header("location:?pg=user&update=berhasil");
}
?>

<form action="" method="post">
    <div class="mb-3">
        <label for="">nama lengkap</label>
        <input value="<?php echo isset($_GET['edit']) ? $rowEdit['nama_lengkap'] : '' ?>" type="text" class="form-control" placeholder="Masukan Nama Lengkap Anda" name="nama_lengkap">
    </div>

    <div class="mb-3">
        <label for="">Email</label>
        <input value="<?php echo isset($_GET['edit']) ? $rowEdit['email'] : '' ?>" type="email" class="form-control" placeholder="Masukan Email Anda" name="email">
    </div>
    <div class="mb-3">
        <label for="">Password</label>
        <input value="" type="password" class="form-control" placeholder="Masukan Password Anda" name="password">
    </div>


    <!-- untuk mengambil data email dan pasword di data base saat login -->
    <div class="mb-3">
        <?php
        $dataUser = mysqli_query($koneksi, "SELECT * FROM level");
        ?>


        <select class="form-control" name="id_level" id="id_level">
            <option value="">--pilih level--</option>
            <?php
            //while harus pake titik : tidak boleh pake titik ;
            while ($row = mysqli_fetch_assoc($dataUser)) :
            ?>
                <option value="<?php echo $row['id'] ?>"><?php echo $row['nama_level'] ?></option>
            <?php endwhile; ?>
        </select>
    </div>

    <!-- untuk button -->
    <div class=" mb-3">
        <input type="submit" class="btn btn-primary" value="Simpan" name="<?php echo isset($_GET['edit']) ? 'edit' : 'simpan' ?>"> <!--echo isset(GET), BUTTON MEMILIKI 2 KONDISI YAKNI EDIT DAN SIMPAN -->
    </div>
</form>