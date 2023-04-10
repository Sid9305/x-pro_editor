//-----------------//
//CROP VIDEO SCREEN//
//-----------------//
import 'package:Xpro_editor/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helpers/helpers/widgets/animated_interactive_viewer.dart';
import 'package:video_editor/video_editor.dart';

class CropScreen extends StatelessWidget {
  const CropScreen({Key? key, required this.controller}) : super(key: key);

  final VideoEditorController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: shawdowColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
              children: [
            Row(
                children: [
              Expanded(
                child: IconButton(
                  onPressed: () =>
                      controller.rotate90Degrees(RotateDirection.left),
                  icon: const Icon(Icons.rotate_left,color: Colors.white,),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () =>
                      controller.rotate90Degrees(RotateDirection.right),
                  icon: const Icon(Icons.rotate_right,color: Colors.white,),
                ),
              )
            ]),
            const SizedBox(height: 15),
            Expanded(
              child: AnimatedInteractiveViewer(
                maxScale: 5.4,
                child: CropGridViewer.edit(
                  controller: controller,
                  margin: const EdgeInsets.all(10),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(children: [
              Expanded(
                    child: FloatingActionButton.extended(
                      onPressed: () => Navigator.pop(context),
                      label: Text(
                        "CANCEL",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
              ),
              buildSplashTap("16:9", 16 / 9,
                  padding: const EdgeInsets.symmetric(horizontal: 10)),
              buildSplashTap("1:1", 1 / 1),
              buildSplashTap("4:5", 4 / 5,
                  padding: const EdgeInsets.symmetric(horizontal: 10)),
              buildSplashTap("NO", null,
                  padding: const EdgeInsets.only(right: 10)),
              Expanded(
                child: FloatingActionButton.extended(
                  onPressed: () {
                    controller.updateCrop(
                        controller.cacheMinCrop, controller.cacheMaxCrop);
                    Navigator.pop(context);
                  },
                  label: Text(
                    "OK",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }

  Widget buildSplashTap(
      String title,
      double? aspectRatio, {
        EdgeInsetsGeometry? padding,
      }) {
    return InkWell(
      onTap: () => controller.preferredCropAspectRatio = aspectRatio,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.aspect_ratio, color: Colors.white),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
