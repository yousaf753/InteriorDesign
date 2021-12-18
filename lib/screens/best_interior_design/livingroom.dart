import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:interior_design/constant/colors.dart';
import 'package:interior_design/model/products_model.dart';
import 'package:interior_design/widget/custom_image.dart';
import 'package:interior_design/widget/custom_text.dart';

class LivingRoom extends StatefulWidget {
  final double height, width;
  ProductsModel productsModel = ProductsModel();
  LivingRoom(
      {Key? key,
        required this.height,
        required this.width,
        required this.productsModel})
      : super(key: key);

  @override
  _LivingRoomState createState() => _LivingRoomState();
}

class _LivingRoomState extends State<LivingRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: widget.productsModel.livingroom![0].image != null
                ?  SizedBox(
              height: widget.height,
              width: widget.width,
                  child: ListWheelScrollView.useDelegate(
                  itemExtent: widget.height * 0.8,
                  childDelegate: ListWheelChildBuilderDelegate(
                      childCount: widget.productsModel.livingroom!.length,
                      builder: (BuildContext context, int index) {
                        return   Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customText(widget.productsModel.livingroom![index].name.toString(), 30, AppColors.text1Color, FontWeight.bold),
                            customImage(widget.productsModel.livingroom![index].image.toString(), widget.height * 0.6, widget.width),
                            customText("Rs ${widget.productsModel.livingroom![index].price.toString()}", 30, AppColors.text2Color, FontWeight.bold),
                          ],
                        );
                      })),
            )
                : SpinKitHourGlass(color: AppColors.text2Color)),
      ),
    );
  }
}
