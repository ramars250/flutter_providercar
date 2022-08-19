import 'package:flutter/material.dart';
import 'package:flutter_providercar/page/product_list_page.dart';
import 'package:flutter_providercar/store/mystore.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
    ChangeNotifierProvider(
      //註冊提供者
      create: (context) {
        return MyStore();
      },
      child: MaterialApp(
        home: ProductList(),
      ),
    ),
  );
}
