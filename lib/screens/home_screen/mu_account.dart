import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:interior_design/constant/colors.dart';
import 'package:interior_design/controller/user_controller.dart';
import 'package:interior_design/screens/firebase/creat_account.dart';
import 'package:interior_design/widget/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAccount extends StatelessWidget {
   MyAccount({Key? key}) : super(key: key);
  final UserController _userController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
            child: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child:
                      Image.network(_userController.image)),
                  const SizedBox(height: 10,),
                  customText(_userController.userName, 30, AppColors.buttonColor, FontWeight.normal),
                  const SizedBox(height: 10,),
                  customText(_userController.email, 15, AppColors.text2Color, FontWeight.normal),
                  const SizedBox(height: 10,),
                  customText(_userController.number, 30, AppColors.text1Color, FontWeight.normal),
                  const SizedBox(height: 10,),
                  customText(_userController.address, 30, AppColors.text2Color, FontWeight.normal),
                  const SizedBox(height: 50,),
                  InkWell(
                    onTap: () async {
                      SharedPreferences preferences=await SharedPreferences.getInstance();
                      preferences.setBool("Created", false);
                      Get.snackbar(
                          "Your account deleted", "For Shopping Create an Account First");
                     Get.to(()=> CreateAccount());
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(2.0),
                              bottomLeft: Radius.circular(2.0),
                              bottomRight: Radius.circular(20.0))),
                      child: Center(
                          child: customText("Delete Out", 20,
                              AppColors.text1Color, FontWeight.normal)),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
