import 'package:flutter/material.dart';
import 'package:http_demo/data/api/category_api.dart';
import 'package:http_demo/screens/main_screen.dart';

void main() {
  CategoryApi.getCategories();
  runApp(HttpApp());
}

class HttpApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }

}