import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:interior_design/model/products_model.dart';

Future<ProductsModel> getProducts() async {
  final String response =
      await rootBundle.loadString("assets/json/product.json");
  var data = await json.decode(response);
  ProductsModel productsModel = ProductsModel.fromJson(data);
  return productsModel;
}
