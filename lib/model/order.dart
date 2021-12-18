import 'package:geolocator/geolocator.dart';

import 'cart_item.dart';
class Order {
  final String id;
  final double amount;
  final int itemCount;
  final List<Item> products;
  final DateTime dateTime;
  final Position position;
  Order({required this.id, required this.amount, required this.products, required this.dateTime,required this.itemCount,required this.position});
}
