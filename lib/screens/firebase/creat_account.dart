import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:interior_design/authentication/email_sign_in.dart';
import 'package:interior_design/constant/animation_path.dart';
import 'package:interior_design/constant/colors.dart';
import 'package:interior_design/controller/user_controller.dart';
import 'package:interior_design/screens/home_screen/home_screen.dart';
import 'package:interior_design/widget/custom_text.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'google_sign_in_button.dart';
class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}
class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
 final UserController _userController=Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50,),
                SizedBox(
                  height: 150,
                  child: Lottie.asset(AnimationPath.animation2),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText:
                  'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter  Name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter  mail';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _numberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter  Number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _addressController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Create Password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: () async{
                    if(await sendOtp(_emailController.text)){
                      Get.snackbar(
                          "OTP Send", "check your mail");
                    }
                    else{
                      Get.snackbar(
                          "Wrong Email", "Pleas enter Correct mail");
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 300,
                    decoration: BoxDecoration(
                        color: AppColors.text1Color,
                        borderRadius:  BorderRadius.circular(30)),
                    child: Center(
                        child: customText("Verify Email", 20, AppColors.primaryColor, FontWeight.normal)),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter OTP",
                      suffixIcon: TextButton(
                          onPressed: () {
                            if(_formKey.currentState!.validate()){
                              _userController.adduser(_nameController.text, _emailController.text, _numberController.text, _addressController.text,_passwordController.text);
                            }
                            if(otpVerify(_emailController.text,_otpController.text)){
                              _userController.otp=true;
                              Get.snackbar(
                                  "Your Email verified", "Successfully");
                            }
                            else{
                              Get.snackbar(
                                  "Wrong OTP", "Enter Correct OTP");
                            }
                          },
                          child:
                          Container(
                            height: 25,
                            width: 150,
                            decoration: BoxDecoration(
                                color: AppColors.text2Color,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(2.0),
                                    bottomLeft: Radius.circular(2.0),
                                    bottomRight:
                                    Radius.circular(20.0))),
                            child: Center(
                                child: customText(
                                    "Verify OTP",
                                    20,
                                    AppColors.primaryColor,
                                    FontWeight.normal)),
                          )
                      ),
                    ),
                  ),
                ),
                const GoogleSignInButton(),
              InkWell(
                    onTap: () async {
                      SharedPreferences preferences=await SharedPreferences.getInstance();
                      if(_userController.otp && _userController.google){
                        preferences.setBool("Created", true);
                        textClear();
                        Get.to(()=> HomePage());
                      }
                      else{
                        Get.snackbar(
                            "Your Account not Created", "Try Again");
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 300,
                      decoration: BoxDecoration(
                          color: AppColors.text2Color,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(2.0),
                              bottomLeft: Radius.circular(2.0),
                              bottomRight:
                              Radius.circular(20.0))),
                      child: Center(
                          child: customText(
                              "Create Account",
                              20,
                              AppColors.primaryColor,
                              FontWeight.normal)),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void textClear(){
    _nameController.clear();
    _numberController.clear();
    _emailController.clear();
    _passwordController.clear();
    _addressController.clear();
    _otpController.clear();
  }
}