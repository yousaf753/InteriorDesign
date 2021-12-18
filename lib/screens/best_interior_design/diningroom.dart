import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:interior_design/constant/colors.dart';
import 'package:interior_design/model/products_model.dart';
import 'package:interior_design/widget/custom_image.dart';
import 'package:interior_design/widget/custom_text.dart';

class DiningRoom extends StatefulWidget {
  final double height, width;
  ProductsModel productsModel = ProductsModel();
  DiningRoom(
      {Key? key,
        required this.height,
        required this.width,
        required this.productsModel})
      : super(key: key);

  @override
  _DiningRoomState createState() => _DiningRoomState();
}

class _DiningRoomState extends State<DiningRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: widget.productsModel.diningroom![0].image != null
                ?  SizedBox(
              height: widget.height,
              width: widget.width,
              child: ListWheelScrollView.useDelegate(
                  itemExtent: widget.height * 0.8,
                  childDelegate: ListWheelChildBuilderDelegate(
                      childCount: widget.productsModel.diningroom!.length,
                      builder: (BuildContext context, int index) {
                        return   Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customText(widget.productsModel.diningroom![index].name.toString(), 30, AppColors.text1Color, FontWeight.bold),
                            customImage(widget.productsModel.diningroom![index].image.toString(), widget.height * 0.6, widget.width),
                            customText("Rs ${widget.productsModel.diningroom![index].price.toString()}", 30, AppColors.text2Color, FontWeight.bold),
                          ],
                        );
                      })),
            )
                : SpinKitHourGlass(color: AppColors.text2Color)),
      ),
    );
  }
}
