import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';

class ProductListRowWidget extends StatelessWidget{
  Product product;
  ProductListRowWidget(this.product);
  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: [
            Container(
              child: Image.network("https://cdn.pixabay.com/photo/2015/11/05/08/33/earth-1023859_960_720.jpg"),
              height: 130.0,
              width: MediaQuery.of(context).size.width/2,
            ),
            Text(product.productName),
            Text(product.unitPrice.toString()
            ),
          ],
        ),
      ),
    );
  }

}