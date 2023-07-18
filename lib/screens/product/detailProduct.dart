import 'package:aplikasi/constants.dart';
import 'package:flutter/material.dart';

class DetailProductPage extends StatelessWidget {
  final data;
  const DetailProductPage({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorPalette.primaryColor,
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(data['gambar']))),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Color(0xCCDDE6ED),
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        data['namaProduct'],
                        style: TextStyle(
                            fontSize: 25, color: ColorPalette.primaryDarkColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Deskripsi',
                        style: TextStyle(
                            fontSize: 19, color: ColorPalette.textColor),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${data['deskripsi']}',
                        style: TextStyle(
                            fontSize: 15, color: ColorPalette.textColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          child: Text(
                        'Exp : ${data['exp']}',
                        style: TextStyle(
                            color: ColorPalette.primaryDarkColor, fontSize: 17),
                      )),
                      Container(
                          child: Text(
                        'Tanggal Masuk Product : ${data['tglMasuk']}',
                        style: TextStyle(
                            color: ColorPalette.primaryDarkColor, fontSize: 17),
                      )),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              Icon(
                                Icons.fire_truck,
                                color: ColorPalette.textColor,
                                size: 30,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                '${data['stok']} Items',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: ColorPalette.textColor),
                              )
                            ],
                          )),
                          Expanded(
                              child: Row(
                            children: [
                              Icon(
                                Icons.inventory,
                                color: ColorPalette.textColor,
                                size: 30,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                '${data['sold']} Items',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: ColorPalette.textColor),
                              )
                            ],
                          )),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
