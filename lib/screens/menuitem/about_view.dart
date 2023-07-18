import 'package:aplikasi/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorPalette.primaryColor,
          title: Text('About Us'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    'Aplikasi Kami',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    'Dalam memilih untuk membuka usaha, dalam prosesnya tidak  mungkin langsung berjalan dengan mulus. Banyak masalah yang  ditemukan saat sedang proses membangun usaha. Sering ditemukan usaha  yang gagal karena faktor manajemen maupun kurangnya monitoring.\n\nKami sebagai Tim developer membuat aplikasi yang dapat  mengelola stok pergudangan dalam membantu Pemilik Toko untuk mengatur segala aspek yang mampu memonitoring dan memanage  aktivitas pergudangan dalam usaha yang dimiliki agar menghindari  kegagalan usaha. Misalnya monitoring laporan jumlah keluar masuknya  barang, berapa jumlah barang yang telah terjual dan berapa jumlah barang  yang tersedia di Gudang Toko. \n\nAplikasi kami juga menyediakan fitur tampilan daftar barang yang  ada di Gudang Toko yang terbagi menjadi beberapa kategori berdasarkan  jenisnya masing-masing dan disediakan juga barcode item barang yang  berfungsi sebagai identitas dari barang tersebut yang menjadi bukti  pengenal dari suatu barang yang tersedia di Gudang Toko. \n\nTidak hanya  itu Kami juga membantu Pemilik Toko sebagai user untuk bisa melihat  perusahaan mana yang mendistribusikan tiap item produk, supaya  mempermudah dalam melakukan komunikasi apabila dilakukan  pengecekan jumlah stock dan jumlah barang yang telah terjual.',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(child: Text('V.1.0.1'))
              ],
            ),
          ),
        ));
  }
}
