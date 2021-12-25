import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:interior_design/constant/colors.dart';
import 'package:interior_design/constant/icons_path.dart';
import 'package:interior_design/controller/order_controller.dart';
import 'package:interior_design/widget/custom_icon.dart';
import 'package:interior_design/widget/custom_text.dart';
import 'order_detail.dart';
class OrderScreen extends StatefulWidget {
  double height,width;
   OrderScreen({Key? key,required this.height,required this.width}) : super(key: key);
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  OrderController orderController=Get.find();
  late String orderAddress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor:  AppColors.primaryColor,
        title: customText("Your Order's", 20, AppColors.text1Color, FontWeight.bold),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount:orderController.itemCount ,
          itemBuilder: (BuildContext context, int index) {
            try{
              address(orderController.orders[index].position);
              return Container(
                height: widget.height * 0.3,
                width: widget.width,
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    border: Border.all(
                      color: AppColors.buttonColor,),
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customText("Order # ${index+1}", 20, AppColors.text1Color, FontWeight.bold),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        customText("Total Amount", 20, AppColors.text2Color, FontWeight.bold),
                        customText("RS ${orderController.orders[index].amount.toStringAsFixed(0)}", 20, AppColors.buttonColor, FontWeight.bold),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        customText("Cart Item's", 20, AppColors.text2Color, FontWeight.bold),
                        customText("${orderController.itemCount}", 20, AppColors.buttonColor, FontWeight.bold),
                      ],
                    ),
                    customText("Order Location", 20, AppColors.text1Color, FontWeight.bold),
                    customText(orderAddress, 20, AppColors.text3Color, FontWeight.bold),
                    InkWell(
                      onTap: (){
                        Get.to(OrderDetailScreen(height: widget.height,width: widget.width,index: index,));
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(2.0),
                                bottomLeft: Radius.circular(2.0),
                                bottomRight: Radius.circular(20.0))
                        ),
                        child: Center(
                            child: customText("Detail", 20, AppColors.text1Color, FontWeight.normal)),
                      ),
                    )
                  ],
                ),
              );
            }
            catch (e){
              return SpinKitFadingGrid(color: AppColors.buttonColor,);
            }
          },
        ),
      ),
    );
  }
  address(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude
      );
      Placemark place = placemarks[0];
      setState(() {
        orderAddress="${place.subLocality}, ${place.locality}";
      });
    } catch (e) {
      return  null;
    }
  }
}
