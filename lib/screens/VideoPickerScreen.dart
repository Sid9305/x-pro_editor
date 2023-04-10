//-------------------//
//PICKUP VIDEO SCREEN//
//-------------------//
import 'dart:async';
import 'dart:io';
import 'package:Xpro_editor/screens/EditScreen.dart';
import 'package:Xpro_editor/components/colors.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class VideoPickerPage extends StatefulWidget {
  const VideoPickerPage({Key? key}) : super(key: key);

  @override
  State<VideoPickerPage> createState() => _VideoPickerPageState();
}

class _VideoPickerPageState extends State<VideoPickerPage> {
  final ImagePicker _picker = ImagePicker();
  String PictureButtonText = "Take a Picture";
  String VideoButtonText = "Record Video";
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Let\'s get started!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: _takePhoto,
                        icon: const Image(
                          image: AssetImage("assets/images/img_1.png"),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: _recordVideo,
                        icon: const Image(
                          image: AssetImage("assets/images/ideo.png"),
                        ),
                        iconSize: 100,
                      ),
                      const Text(
                        "Video",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
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
