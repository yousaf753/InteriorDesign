import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:interior_design/constant/animation_path.dart';
import 'package:interior_design/constant/colors.dart';
import 'package:interior_design/controller/user_controller.dart';
import 'package:interior_design/screens/home_screen/home_screen.dart';
import 'package:interior_design/widget/custom_text.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SignInAccount extends StatefulWidget {
  const SignInAccount({Key? key}) : super(key: key);

  @override
  _SignInAccountState createState() => _SignInAccountState();
}
class _SignInAccountState extends State<SignInAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserController _userController=Get.put(UserController());
  @override
  void initState() {
    _userController.getPreferences();
    super.initState();
  }
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
                  child: Lottie.asset(AnimationPath.animation1),
                ),
                TextFormField(
                  controller: _userNameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'User Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter  UserName';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
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
                    SharedPreferences preferences=await SharedPreferences.getInstance();
                    if(_userNameController.text==_userController.userName && _passwordController.text==_userController.password){
                      Get.snackbar("Sign In", "Successfully");
                      preferences.setBool("SignIn", true);
                      textClear();
                      Get.to(()=> HomePage());
                    }
                    else{
                      Get.snackbar(
                          "Wrong UserName or ", "Password");
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 300,
                    decoration: BoxDecoration(
                        color: AppColors.text1Color,
                        borderRadius:  BorderRadius.circular(30)),
                    child: Center(
                        child: customText("SignIn", 20, AppColors.primaryColor, FontWeight.normal)),
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
    _userNameController.clear();
    _passwordController.clear();
  }
}