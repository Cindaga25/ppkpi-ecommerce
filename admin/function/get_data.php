<?php
include '../koneksi.php';
function getData($koneksi, $table, $id)
{
    //tampilkan semua data member dmana id adalah  id
    $query = mysqli_query($koneksi, "SELECT * FROM member WHERE id='$id' ");
    $data = mysqli_fetch_assoc($query);

    return $data;
}
