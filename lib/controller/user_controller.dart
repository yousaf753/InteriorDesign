import 'package:get/get.dart';

class UserController extends GetxController {
  late String image;
  late String name;
  late String email;

  adduser(String img, String nm, String em) {
    image = img;
    name = nm;
    email = em;
  }
}
