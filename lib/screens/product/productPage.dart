import 'package:aplikasi/constants.dart';
import 'package:aplikasi/data/data.dart';
import 'package:aplikasi/screens/product/detailProduct.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final data;
  const ProductPage({super.key, this.data});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        title: Text(widget.data['namaCate']),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                  child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                children: listProduct
                    .where((category) =>
                        category['category'] == widget.data['namaCate'])
                    .map((data) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailProductPage(data: data))),
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  image: DecorationImage(
                                      image: AssetImage('${data['gambar']}'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data['namaProduct']}',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: ColorPalette.textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
