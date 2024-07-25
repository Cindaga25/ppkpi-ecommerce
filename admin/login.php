<?php
include "koneksi/koneksi.php";
//seesion star untuk agar masuk ke halam dasbor/index php & $_SESSION tidak bisa di panggil tanpa ssesion start
session_start();
if (isset($_POST['login'])) {
    $email = htmlspecialchars($_POST['email']);
    $password = sha1($_POST['password']);

    //PILIH database bernama user dan level dari user bergabung dengan level. data base kolom id level = level.id dmana user kolom email adalah variabel email
    $query = mysqli_query($koneksi, "SELECT * FROM user WHERE user.email='$email' ");
    //jika data base lebih bersar dari >0 maka program akan berjalan $_SESSION
    //session menampung data sementara (menampung data di dalam browser)
    if (mysqli_num_rows($query) > 0) {
        $dataUser = mysqli_fetch_assoc($query);
        if ($dataUser['password'] == $password) {
            $_SESSION['nama_lengkap'] = $dataUser['nama_lengkap'];
            $_SESSION['email'] = $dataUser['email'];
            header('location:index.php');
            exit;
        }
    }
}


?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>login e-commerce</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../asset/adm/plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="../asset/adm/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../asset/adm/dist/css/adminlte.min.css">
</head>

<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <a href="../asset/adm/index2.html"><b>Login</b> E-commerce</a>
        </div>
        <!-- /.login-logo -->
        <div class="card">
            <div class="card-body login-card-body">
                <!-- untuk memanggil parameter -->
                <?php if (isset($_GET['access'])) : ?>
                    <div class="alert alert-danger">Upss, mohon login terlebih dahulu</div>

                <?php endif ?>

                <p class="login-box-msg">Sign in to start your session</p>

                <form action="" method="post">
                    <div class="input-group mb-3">
                        <input type="email" name="email" class="form-control" placeholder="Email " required>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" name="password" class="form-control" placeholder="Password">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <div class="icheck-primary">
                                <input type="checkbox" id="remember">
                                <label for="remember">
                                    Remember Me
                                </label>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-4">
                            <button type="submit" name="login" class="btn btn-primary btn-block">Sign In</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>
                <p class="mb-1">
                    <a href="forgot-password.html">I forgot my password</a>
                </p>
            </div>
            <!-- /.login-card-body -->
        </div>
    </div>
    <!-- /.login-box -->

    <!-- jQuery -->
    <script src="../asset/adm/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="../asset/adm/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../asset/adm/dist/js/adminlte.min.js"></script>
</body>

</html>