import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:interior_design/constant/animation_path.dart';
import 'package:interior_design/constant/colors.dart';
import 'package:interior_design/constant/icons_path.dart';
import 'package:interior_design/controller/cart_controller.dart';
import 'package:interior_design/controller/order_controller.dart';
import 'package:interior_design/controller/user_controller.dart';
import 'package:interior_design/json_request/json_get_request.dart';
import 'package:interior_design/model/products_model.dart';
import 'package:interior_design/screens/product_screen/bed_screen.dart';
import 'package:interior_design/screens/product_screen/bookshelf_screen.dart';
import 'package:interior_design/screens/product_screen/diningset_screen.dart';
import 'package:interior_design/screens/product_screen/lights_screen.dart';
import 'package:interior_design/screens/product_screen/sofa_screen.dart';
import 'package:interior_design/screens/product_screen/table_screen.dart';
import 'package:interior_design/screens/product_screen/wardrobe_screen.dart';
import 'package:interior_design/widget/carouselslider.dart';
import 'package:interior_design/widget/custom_icon.dart';
import 'package:interior_design/widget/custom_image.dart';
import 'package:interior_design/widget/custom_text.dart';
import 'package:interior_design/widget/products_container.dart';
import 'package:lottie/lottie.dart';

import 'best_interior_design/bedroom.dart';
import 'best_interior_design/diningroom.dart';
import 'best_interior_design/livingroom.dart';
import 'cart_screen.dart';
import 'object/object_screen.dart';
import 'order_screen.dart';
import 'product_screen/chair_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController userController = Get.put(UserController());
  ProductsModel productsModel = ProductsModel();
  CartController cartController=Get.put(CartController());
  OrderController orderController=Get.put(OrderController());
  @override
  void initState() {
    // TODO: implement initState
    getProducts().then((value) {
      setState(() {
        productsModel = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 600) {
        height = width;
      } else if (constraints.maxHeight < 600) {
        height = 650;
        width = 370;
      }
      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: customIcon(IconPath.drawer, 50, 50)),
          title:
              customText("Welcome", 20, AppColors.text1Color, FontWeight.bold),
          centerTitle: true,
          backgroundColor: AppColors.secondaryColor,
          elevation: 0,
          actions: [
            InkWell(
                onTap: (){
                  Get.to(CartScreen(height: height,width: width,));
                },
                child: customIcon(IconPath.cart, 50, 50)),
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: AppColors.primaryColor,
            child: ListView(
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(300.0),
                            child: Image.network(userController.image)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customText(userController.name, 20,
                                AppColors.text2Color, FontWeight.normal),
                            customText(userController.email, 10,
                                AppColors.text1Color, FontWeight.normal),
                          ],
                        ),
                      ],
                    )),
                InkWell(
                  onTap: () {
                    if (orderController.itemCount >= 1) {
                      Get.to(OrderScreen(
                        height: height,
                        width: width,
                      ));
                    } else {
                      Get.snackbar(
                          "Confirm an Order First", "Than check order");
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(2.0),
                            bottomLeft: Radius.circular(2.0),
                            bottomRight: Radius.circular(20.0))),
                    child: Center(
                        child: customText("My Order's", 20,
                            AppColors.text1Color, FontWeight.normal)),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                carouselSlider(height),
                Container(
                  width: width,
                  decoration: BoxDecoration(color: AppColors.primaryColor),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        customText("Products", 30, AppColors.text2Color,
                            FontWeight.bold),
                        const SizedBox(
                          height: 10,
                        ),
                        GridView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChairScreen(
                                              height: height,
                                              width: width,
                                              productsModel: productsModel,
                                            )));
                              },
                              child: customProducts(height, width, "Chair",
                                  "assets/images/chairs/chair2.png"),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SofaScreen(
                                              height: height,
                                              width: width,
                                              productsModel: productsModel,
                                            )));
                              },
                              child: customProducts(height, width, "Sofa",
                                  "assets/images/sofas/sofa6.png"),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BedScreen(
                                              height: height,
                                              width: width,
                                              productsModel: productsModel,
                                            )));
                              },
                              child: customProducts(height, width, "Bed",
                                  "assets/images/bed/bed5.png"),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TableScreen(
                                              height: height,
                                              width: width,
                                              productsModel: productsModel,
                                            )));
                              },
                              child: customProducts(height, width, "Table",
                                  "assets/images/tables/table5.png"),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DiningSetScreen(
                                              height: height,
                                              width: width,
                                              productsModel: productsModel,
                                            )));
                              },
                              child: customProducts(height, width, "Dining Set",
                                  "assets/images/diningset/diningset3.png"),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BookShelfScreen(
                                              height: height,
                                              width: width,
                                              productsModel: productsModel,
                                            )));
                              },
                              child: customProducts(height, width, "Bookshelf",
                                  "assets/images/bookshelfs/bookshelf8.jpg"),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WardrobeScreen(
                                              height: height,
                                              width: width,
                                              productsModel: productsModel,
                                            )));
                              },
                              child: customProducts(height, width, "Wardrobe",
                                  "assets/images/wardrobes/wardrobe6.jpg"),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LightScreen(
                                              height: height,
                                              width: width,
                                              productsModel: productsModel,
                                            )));
                              },
                              child: customProducts(
                                  height,
                                  width,
                                  "Interior Light",
                                  "assets/images/light/light7.jpg"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(color: AppColors.primaryColor),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        customText("Best Interior Designs ", 30, AppColors.text2Color, FontWeight.bold),
                        Container(
                           height: height * 0.5,
                           decoration: BoxDecoration(
                             color: AppColors.secondaryColor,
                             border: Border(
                               top: BorderSide(width: 2, color: AppColors.buttonColor),
                             )
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: [
                                   customText("Bed Room", 30, AppColors.text3Color, FontWeight.bold),
                                   InkWell(
                                       onTap: () {
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>BedRoom( height: height,width: width, productsModel: productsModel,)));
                                       },
                                       child: SizedBox(
                                         height: 100,
                                         width: 100,
                                         child: Lottie.asset(AnimationPath.next),
                                       ))
                                 ],
                               ),
                               customImage("assets/images/bedroom/bedset3.jpg",height * 0.35,width),
                             ],
                           ),
                       ),
                        Container(
                            height: height * 0.5,
                            decoration: BoxDecoration(
                                color: AppColors.secondaryColor,
                                border: Border(
                                  top: BorderSide(width: 2, color: AppColors.buttonColor),
                                )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    customText("Dining Room", 30, AppColors.text3Color, FontWeight.bold),
                                    InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DiningRoom( height: height,width: width, productsModel: productsModel,)));
                                        },
                                        child:SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Lottie.asset(AnimationPath.next),
                                        ))
                                  ],
                                ),
                                customImage("assets/images/diningroom/diningroom1.jpg",height * 0.35,width),
                              ],
                            ),
                          ),
                        Container(
                            height: height * 0.5,
                            decoration: BoxDecoration(
                                color: AppColors.secondaryColor,
                                border: Border(
                                  top: BorderSide(width: 2, color: AppColors.buttonColor),
                                  bottom: BorderSide(width: 2, color: AppColors.buttonColor),
                                )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    customText("Living Room", 30, AppColors.text3Color, FontWeight.bold),
                                    InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LivingRoom( height: height,width: width, productsModel: productsModel,)));
                                        },
                                        child:SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Lottie.asset(AnimationPath.next),
                                        ))
                                  ],
                                ),
                                customImage("assets/images/livingroom/livingroom8.jpg",height * 0.35,width),
                              ],
                            ),
                          ),
                        Container(
                          height: height * 0.2,
                          width: width ,
                          decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.buttonColor)
                          ),
                          child:   Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              customText("3D Object's ",20,AppColors.text3Color,FontWeight.bold),
                              InkWell(
                                  onTap: (){
                                    Get.to( ObjectsScreen(height: height,width: width,));
                                  },
                                  child: Lottie.asset(AnimationPath.next))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
