import 'package:flutter/material.dart';
import 'package:interior_design/constant/object_list.dart';
import 'package:model_viewer/model_viewer.dart';
class ObjectDetail extends StatefulWidget {
  int index;
   ObjectDetail({Key? key,required this.index}) : super(key: key);

  @override
  State<ObjectDetail> createState() => _ObjectDetailState();
}

class _ObjectDetailState extends State<ObjectDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModelViewer(
          src: ObjectList.objectList[widget.index],
          alt: "A 3D model of an table soccer",
          autoPlay: true,
          autoRotate: true,
          cameraControls: true,
          ar: true,
        )
      ),
    );
  }
}
