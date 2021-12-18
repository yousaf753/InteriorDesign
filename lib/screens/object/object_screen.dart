import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:interior_design/constant/animation_path.dart';
import 'package:interior_design/constant/colors.dart';
import 'package:interior_design/constant/object_list.dart';
import 'package:lottie/lottie.dart';
import 'package:model_viewer/model_viewer.dart';

import 'object_detail.dart';

class ObjectsScreen extends StatefulWidget {
  double height, width;

  ObjectsScreen({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  _ObjectsScreenState createState() => _ObjectsScreenState();
}

class _ObjectsScreenState extends State<ObjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: ObjectList.objectList.length,
                itemBuilder: (context, index) {
                  return
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          border: Border.all(color: AppColors.buttonColor),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: widget.height * 0.3,
                      width: widget.width,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: ModelViewer(
                              src: ObjectList.objectList[index],
                              alt: "A 3D model of an table soccer",
                              autoPlay: true,
                              autoRotate: true,
                              cameraControls: true,
                            ),),
                          Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Get.to(ObjectDetail(index: index));
                                },
                                child: Lottie.asset(AnimationPath.next),
                              ))
                        ],
                      ),
                    );
                })));
  }
}
