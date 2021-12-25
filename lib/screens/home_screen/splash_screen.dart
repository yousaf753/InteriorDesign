import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:interior_design/constant/animation_path.dart';
import 'package:interior_design/constant/colors.dart';
import 'package:interior_design/screens/firebase/creat_account.dart';
import 'package:interior_design/screens/firebase/sign_account.dart';
import 'package:interior_design/widget/custom_text.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      Timer(const Duration(seconds: 3), () {
        checkScreen();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: AppColors.primaryColor,
                      height: size.height / 2,
                      width: size.width ,
                      child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Lottie.asset(AnimationPath.animation2)),
                    ),
                    customText("INTERIOR DESIGN",30, AppColors.text2Color, FontWeight.normal, ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
  checkScreen() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? check =  preferences.getBool("Created");
    bool? signIn=preferences.getBool("SignIn");
    if(signIn==true && check==true) {
      Get.to(()=> HomePage());
    }else if(check==true){
      Get.to(()=>const SignInAccount());
    }
    else{
      Get.to(()=>const CreateAccount());
    }
  }
}