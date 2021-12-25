import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interior_design/constant/colors.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body:  SafeArea(
        child: Center(
          child: Text("About Us",style: TextStyle(color: AppColors.text1Color,fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.justify,),
        )
      ),
    );
  }
}
