import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_demo/data/api/category_api.dart';
import 'package:http_demo/data/api/product_api.dart';
import 'dart:convert';
import 'package:http_demo/models/category.dart';
import 'package:http_demo/models/product.dart';
import 'package:http_demo/widgets/products_list_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();

  }
}

class MainScreenState extends State {
  List<Category> categories = List<Category>.empty(growable: true);
  List<Widget> categoryWidgets = List<Widget>.empty(growable: true);
  List<Product> products = List<Product>.empty(growable: true);

  @override
  void initState() {
    getCategoriesFromApi();
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shopping System",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
              ),
            ),
            ProductListWidget(products)
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.categories =
            list.map((categories) => Category.fromJson(categories)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget>? getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return ElevatedButton(
      child: Text(
        category.categoryName,
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.lightGreenAccent),
        ),
      ),
      onPressed: () {
        getProductsByCategoryId(category);
      },
    );
  }

  void getProductsByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products = list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }

  void getProducts() {
    ProductApi.getProducts().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products = list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }
}
