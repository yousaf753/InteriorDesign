import 'package:flutter/material.dart';
Widget customImage(String image,double height,double width,){
  return Image.asset(image,height:height ,width:width ,fit: BoxFit.fill,);
}