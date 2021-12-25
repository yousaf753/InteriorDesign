import 'package:flutter/material.dart';
import 'package:interior_design/constant/animation_path.dart';
import 'package:interior_design/constant/colors.dart';
import 'package:interior_design/model/products_model.dart';
import 'package:interior_design/widget/custom_image.dart';
import 'package:interior_design/widget/custom_text.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:interior_design/constant/icons_path.dart';
import 'package:interior_design/controller/cart_controller.dart';
import 'package:interior_design/screens/cart_screen/cart_screen.dart';
import 'package:interior_design/widget/custom_icon.dart';
class SofaDetailScreen extends StatefulWidget {
  final double height, width;
  int index;
  ProductsModel productsModel = ProductsModel();
  SofaDetailScreen(
      {Key? key,
        required this.height,
        required this.width,
        required this.index,
        required this.productsModel})
      : super(key: key);

  @override
  _SofaDetailScreenState createState() => _SofaDetailScreenState();
}

class _SofaDetailScreenState extends State<SofaDetailScreen> {
  CartController cartController=Get.find();
  late int quantity=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: widget.height,
          width: widget.width,
          color: AppColors.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customText(widget.productsModel.sofa![widget.index].name.toString(), 50, AppColors.text1Color, FontWeight.bold),
              customImage(widget.productsModel.sofa![widget.index].image.toString(), widget.height * 0.5, widget.width),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:Column(
                    children: [
                      customText("Description", 20, AppColors.text1Color, FontWeight.bold),
                      Text(widget.productsModel.sofa![widget.index].description.toString(),style: TextStyle(color: AppColors.text3Color,fontSize: 15,fontWeight: FontWeight.normal),textAlign: TextAlign.justify,)
                    ],
                  )
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customText("RS ${widget.productsModel.sofa![widget.index].price.toString()}", 30, AppColors.text2Color, FontWeight.bold),
                  InkWell(
                    onTap: (){
                      if(quantity >=1){
                        cartController.addItem(widget.productsModel.sofa![widget.index].name.toString(), widget.productsModel.sofa![widget.index].image.toString(), double.parse(widget.productsModel.sofa![widget.index].price.toString()), widget.productsModel.sofa![widget.index].description.toString(), quantity);
                        Get.off(CartScreen( height: widget.height,width: widget.width));
                      }
                    },
                    child:SizedBox(
                      height: 80,
                      width: 80,
                      child:Stack(
                        children: [
                          Lottie.asset(AnimationPath.cart),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: AppColors.secondaryColor,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Center(child: customText(quantity.toString(), 10, AppColors.buttonColor, FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        quantity ++;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: customIcon(IconPath.add, 50, 50),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: customText("  Quantity", 10, AppColors.text3Color, FontWeight.bold),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        if(quantity <=0){
                          quantity=0;
                        }else{
                          quantity --;
                        }
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: customIcon(IconPath.sub, 50, 50),
                    ),
                  )
                ],)
            ],
          ),
        ),
      ),
    );
  }
}
