import 'dart:async';
import 'dart:io';
import 'package:Xpro_editor/components/colors.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';

import 'EditScreen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with SingleTickerProviderStateMixin {
  String PictureButtonText = "Take a Picture";
  String VideoButtonText = "Record Video";
  late AnimationController _controller;
  final ImagePicker _picker = ImagePicker();

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Record Video or Take Photo"),
            backgroundColor: bgColor),
        backgroundColor: bgColor,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: _takePhoto,
                    icon: Icon(
                      Icons.photo_outlined,
                      color: Colors.white,
                    ),
                    iconSize: 100,
                  ),
                  const Text(
                    "Photo",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: _recordVideo,
                    icon: Icon(
                      Icons.video_camera_back_outlined,
                      color: Colors.white,
                    ),
                    iconSize: 105,
                  ),
                  const Text(
                    "Video",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
            ],
          ),
        )
    );
  }

  void _takePhoto() async {
    ImagePicker()
        .getImage(source: ImageSource.camera)
        .then((PickedFile recordedImage) {
          if (recordedImage != null && recordedImage.path != null) {
            setState(() {
              PictureButtonText = "Saving in progress...";
            });
            GallerySaver.saveImage(recordedImage.path, albumName: "TestImage");
          }
        } as FutureOr Function(PickedFile? value));
  }

  void _pickVideo() async {
    final XFile? file = await _picker.pickVideo(source: ImageSource.gallery);
    if (mounted && file != null) {
      Navigator.push(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  EditScreen(file: File(file.path))));
    }
  }

  void _recordVideo() async {
    ImagePicker()
        .getVideo(source: ImageSource.camera)
        .then((PickedFile recordedVideo) {
          if (recordedVideo != null && recordedVideo.path != null) {
            setState(() {
              VideoButtonText = "Saving Video...";
            });
            GallerySaver.saveVideo(recordedVideo.path, albumName: "TestVideo");
            CoolAlert.show(
                context: context,
                type: CoolAlertType.success,
                text: "Video Saved Successfully");
            _pickVideo();
          }
        } as FutureOr Function(PickedFile? value));
  }
}
