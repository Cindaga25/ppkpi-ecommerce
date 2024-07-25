<?php
//menghapus session cart/ keluar
session_start();
unset($_SESSION['cart']);
header("location:index.php");
