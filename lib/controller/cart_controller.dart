import 'package:get/get.dart';
import 'package:interior_design/model/cart_item.dart';

class CartController extends GetxController{
final List<Item>  _cartItem=[];
   List<Item> get cartItem {
      return [..._cartItem];
   }
  int get itemCount{
     return _cartItem.length;
  }
  double get totalAmount{
    var total=0.0;
     for (var element in _cartItem) {
       total+=(element.price! * element.quantity);
     }
    update();
    return total;
  }
void addItem(String name,String image,double price,String description,int quantity) {
_cartItem.add(Item(name: name, image: image, price: price, quantity: quantity, description: description));
update();
}
void removeItem(int index){
_cartItem.removeAt(index);
update();
}
void clearCart(){
     _cartItem.clear();
     update();
}
}