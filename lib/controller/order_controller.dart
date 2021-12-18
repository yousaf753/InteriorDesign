import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:interior_design/method/get_address.dart';
import 'package:interior_design/model/cart_item.dart';
import 'package:interior_design/model/order.dart';
class OrderController extends GetxController{
  final List<Order> _orders = [];
  List<Order> get orders {
    return [..._orders];
  }
  int get itemCount{
    return _orders.length;
  }
  void addOrder(List <Item> item, double amount,int count,Position position){
    _orders.add(
        Order(
            products: item,
            id:DateTime.now().toString(),
            dateTime: DateTime.now(),
            amount: amount,
            itemCount: count,
            position: position
        )
    );
    update();
  }
}