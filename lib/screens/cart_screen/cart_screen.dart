import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:interior_design/constant/colors.dart';
import 'package:interior_design/controller/cart_controller.dart';
import 'package:interior_design/controller/order_controller.dart';
import 'package:interior_design/controller/user_controller.dart';
import 'package:interior_design/method/get_address.dart';
import 'package:interior_design/screens/firebase/sign_account.dart';
import 'package:interior_design/widget/custom_image.dart';
import 'package:interior_design/widget/custom_text.dart';

import '../ordor_screen/order_screen.dart';
class CartScreen extends StatefulWidget {
  double height,width;
   CartScreen({Key? key,required this.height,required this.width}) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final UserController _userController=Get.find();
  CartController cartController=Get.find();
  OrderController orderController=Get.find();
  late Position position;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
                    child: Column(
                      children: [
                        customText("Cart Detail ", 30, AppColors.text3Color, FontWeight.bold),
                        Container(
                          height: widget.height * 0.1,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              customText("Total = RS ${cartController.totalAmount.toStringAsFixed(0)}", 20, AppColors.text2Color, FontWeight.bold),
                              InkWell(
                                onTap: () async{
                                  setState(() {
                                    _userController.getPreferences();
                                    _userController.getShared();
                                  });
                                  try {
                                    position = (await determineCurrentPosition())!;
                                    if(_userController.signIn==true){
                                      if (cartController.totalAmount >= 1) {
                                        orderController.addOrder(
                                            cartController.cartItem,
                                            cartController.totalAmount,
                                            cartController.itemCount,
                                            position);
                                        Get.off(OrderScreen(
                                          height: widget.height,
                                          width: widget.width,
                                        ));
                                      } else {
                                        Get.snackbar("Add Some Item in Cart First",
                                            "Than Place order");
                                      }
                                      cartController.clearCart();
                                    }
                                    else{
                                      Get.snackbar(
                                          "Sign In First", "Than continue shopping");
                                      Get.to(()=>const SignInAccount());
                                    }
                                  } catch (e) {
                                    Get.snackbar("Location Service & Permission Required",
                                        "Allow for proceeding to next");
                                  }
                                },
                                child: Container(
                                  height: 30,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: AppColors.buttonColor,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(2.0),
                                          bottomLeft: Radius.circular(2.0),
                                          bottomRight: Radius.circular(20.0))
                                  ),
                                  child: Center(
                                      child: customText("Conform Order", 20, AppColors.primaryColor, FontWeight.normal)),
                                ),
                              ),
                            ],
                          ),
                        ),
                       SizedBox(
                         height: widget.height,
                         child: ListView.builder(
                           shrinkWrap: true,
                           physics: const NeverScrollableScrollPhysics(),
                            itemCount:cartController.itemCount,
                            itemBuilder: (BuildContext context,int index){
                              return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Container(
                                     width: widget.width,
                                       height: widget.height *0.2,
                                    decoration: BoxDecoration(
                                        color: AppColors.secondaryColor,
                                        border: Border.all(color: AppColors.text3Color),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: customImage(cartController.cartItem[index].image.toString(),widget.height *0.2 , widget.width * 0.3)),
                                            Expanded(
                                              flex:1,
                                                child: Column(  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                   customText(cartController.cartItem[index].name.toString(), 20, AppColors.text3Color, FontWeight.bold),
                                                    customText("Quantity  ${cartController.cartItem[index].quantity}", 20, AppColors.buttonColor, FontWeight.bold),
                                                    customText("RS ${(cartController.cartItem[index].price! * cartController.cartItem[index].quantity).toStringAsFixed(0)}", 20, AppColors.text2Color, FontWeight.bold),

                                            ],))
                                      ],
                                    ),
                               ),
                                ),
                              ],
                              );
                            },),
                       ),

                      ],
                    ),
        ),

      ),
    );
  }
}
