import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:interior_design/constant/colors.dart';
import 'package:interior_design/model/products_model.dart';
import 'package:interior_design/screens/product_detail_screen/table_detail_screen.dart';
import 'package:interior_design/widget/custom_text.dart';
import 'package:interior_design/widget/custom_image.dart';
class TableScreen extends StatefulWidget {
  final double height, width;
  ProductsModel productsModel = ProductsModel();
  TableScreen(
      {Key? key,
        required this.height,
        required this.width,
        required this.productsModel})
      : super(key: key);

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: widget.productsModel.table![0].image != null
                ?   ListView.builder(
                itemCount:widget.productsModel.table!.length ,
                itemBuilder: (BuildContext context,int index){
                  return  SizedBox(
                    height: widget.height*  0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customText(widget.productsModel.table![index].name.toString(), 30, AppColors.text1Color, FontWeight.bold),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            customImage( widget.productsModel.table![index].image.toString(), widget.height * 0.5, widget.width * 0.8),
                            customText("RS ${widget.productsModel.table![index].price.toString()}", 15, AppColors.text2Color, FontWeight.bold),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  TableDetailScreen(height: widget.height,width: widget.width,index: index,productsModel: widget.productsModel,)
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 50,bottom: 50),
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
                                  child: customText("Detail", 20, AppColors.primaryColor, FontWeight.normal)),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 3,
                          color: AppColors.text2Color,
                        )
                      ],
                    ),
                  );
                })
                : SpinKitHourGlass(color: AppColors.text2Color)),
      ),
    );
  }
}
