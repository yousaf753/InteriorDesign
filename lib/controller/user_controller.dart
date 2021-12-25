import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserController extends GetxController {
  late String userName;
  late String email;
  late String number;
  late String address;
  late String image;
  late String name;
  late String password;
  bool otp=false;
  bool google=false;
  adduser( String nm, String em,String num,String adr,String pas) async {
    SharedPreferences preference=await SharedPreferences.getInstance();
    preference.setString("userName", nm);
    preference.setString("email", em);
    preference.setString("number", num);
    preference.setString("address", adr);
    preference.setString("password", pas);
    userName = nm;
    email = em;
    number=num;
    address=adr;
    password=pas;
    update();
  }
  addName( String nam, String img,) async {
    SharedPreferences preference=await SharedPreferences.getInstance();
    preference.setString("name", nam);
    preference.setString("image", img);
     name= nam;
    image = img;
    update();
  }
  Future getPreferences() async {
    SharedPreferences preference=await SharedPreferences.getInstance();
    userName= preference.getString("userName")!;
    email= preference.getString("email")!;
    number= preference.getString("number")!;
    address= preference.getString("address")!;
    password= preference.getString("password")!;
    name= preference.getString("name")!;
    image= preference.getString("image")!;
    update();
  }
  bool? check;
  bool? signIn;
  Future getShared() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
     check =  preferences.getBool("Created");
    signIn=preferences.getBool("SignIn");
  }
}
