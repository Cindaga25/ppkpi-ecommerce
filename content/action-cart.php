<?php
//untuk menghapus cart.php
if (isset($_GET['delete-cart'])) {
    // print_r($_SESSION);
    // die;
    $id_produk = $_GET['delete-cart'];
    foreach ($_SESSION['cart'] as $key => $item) {
        if ($item['id_produk'] == $id_produk) {
            unset($_SESSION['cart'][$key]);
            $_SESSION['cart'] = array_values($_SESSION['cart']);
            header("location:?pg=cart");
        }
    }
} else {

    //memriksa barang ada atau tidak di dalam variabel session
    if (!isset($_SESSION['cart'])) {
        $_SESSION['cart'] = [];
    }

    if (!isset($_SESSION['id_member'])) {
        header("location:?pg=member&message=Upss-REGISTER-DULU");
    } else {
        $id_member = $_SESSION['id_member'];
        $id_produk = $_POST['id_produk'];
        $queryCart = mysqli_query($koneksi, "SELECT * FROM barang WHERE id ='$id_produk'");
        $rowBarang = mysqli_fetch_assoc($queryCart);


        $product_exists = false;
        //periksa apakah produk sudah ada di keranjang
        foreach ($_SESSION['cart'] as $key => &$item) {
            if ($item['id_produk'] == $id_produk) {
                $item['qty'] += 1;
                $product_exists = true;
                break;
            }
        }
        //fungsi untuk menampung
        //menyambung dengan cart
        $session_produk = array(
            'id_produk'     => $id_produk,
            'nama_barang'   => $rowBarang['nama_barang'],
            'qty'           => 1,
            'harga'         => $rowBarang['harga'],
            'foto'          => $rowBarang['foto']
        );

        //jika nilai sessionnya kosong/ keranjang belanjanya produknya kosong
        if (!$product_exists) {
            $_SESSION['cart'][] = $session_produk;
        }
        header("location:index.php?tambah=cart-berhasil");
    }
}
