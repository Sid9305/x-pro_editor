import 'package:Xpro_editor/screens/CameraScreen.dart';
import 'package:Xpro_editor/screens/CropScreen.dart';
import 'package:Xpro_editor/screens/VideoPickerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/heroes.dart';
import 'package:gallery_saver/gallery_saver.dart';
import '../components/colors.dart';
import 'dart:math' as math;
import 'dart:io';
import 'package:helpers/helpers.dart'
    show OpacityTransition, SwipeTransition, AnimatedInteractiveViewer;
import 'package:image_picker/image_picker.dart';
import 'package:video_editor/video_editor.dart';
import 'package:video_player/video_player.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key, required this.file}) : super(key: key);
  final File file;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _exportingProgress = ValueNotifier<double>(0.0);
  final _isExporting = ValueNotifier<bool>(false);
  final double height = 60;

  bool _exported = false;
  String _exportText = "";
  late VideoEditorController _controller;

  bool _isVisible = true;
  bool _isVisible2 = false;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _controller = VideoEditorController.file(widget.file,
        maxDuration: const Duration(seconds: 30))
      ..initialize().then((_) => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _exportingProgress.dispose();
    _isExporting.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _openCropScreen() => Navigator.push(
      context,
      MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              CropScreen(controller: _controller)));

  void _exportVideo() async {
    _exportingProgress.value = 0;
    _isExporting.value = true;
    // NOTE: To use `-crf 1` and [VideoExportPreset] you need `ffmpeg_kit_flutter_min_gpl` package (with `ffmpeg_kit` only it won't work)
    await _controller.exportVideo(
      preset: VideoExportPreset.medium,
      customInstruction: "-crf 17",
      onProgress: (stats, value) => _exportingProgress.value = value,
      onCompleted: (file) {
        _isExporting.value = false;
        if (!mounted) return;
        if (file != null) {
          final VideoPlayerController videoController =
              VideoPlayerController.file(file);
          videoController.initialize().then((value) async {
            setState(() {});
            videoController.play();
            videoController.setLooping(true);
            await showDialog(
              context: context,
              builder: (_) => Padding(
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: AspectRatio(
                    aspectRatio: videoController.value.aspectRatio,
                    child: VideoPlayer(videoController),
                  ),
                ),
              ),
            );
            await videoController.pause();
            videoController.dispose();
          });
          _exportText = "Video success export!";
        } else {
          _exportText = "Error on export video :(";
        }

        setState(() => _exported = true);
        Future.delayed(const Duration(seconds: 2),
            () => setState(() => _exported = false));
      },
    );
  }

  void _exportCover() async {
    setState(() => _exported = false);
    await _controller.extractCover(
      onCompleted: (cover) {
        if (!mounted) return;

        if (cover != null) {
          _exportText = "Cover exported! ${cover.path}";
          showDialog(
            context: context,
            builder: (_) => Padding(
              padding: const EdgeInsets.all(30),
              child: Center(child: Image.memory(cover.readAsBytesSync())),
            ),
          );
        } else {
          _exportText = "Error on cover exportation :(";
        }

        setState(() => _exported = true);
        Future.delayed(const Duration(seconds: 2),
            () => setState(() => _exported = false));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: _controller.initialized
          ? SafeArea(
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: 70,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5.0),
                            child: Container(
                              color: shawdowColor,
                              width: 50,
                              height: 50,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Image(
                                      image:
                                          AssetImage("assets/icons/back.png"))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5.0),
                            child: Container(
                              color: shawdowColor,
                              width: 50,
                              height: 50,
                              child: TextButton(
                                onPressed: () => _controller
                                    .rotate90Degrees(RotateDirection.right),
                                child: const Icon(
                                  Icons.rotate_right,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5.0),
                            child: Container(
                              color: shawdowColor,
                              width: 50,
                              height: 50,
                              child: TextButton(
                                onPressed: () => _controller
                                    .rotate90Degrees(RotateDirection.left),
                                child: const Icon(Icons.rotate_left,
                                    color: Colors.white, size: 35),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5.0),
                            child: Container(
                              color: shawdowColor,
                              width: 50,
                              height: 50,
                              child: TextButton(
                                onPressed: _openCropScreen,
                                child: const Image(
                                    image:
                                        AssetImage("assets/icons/img_1.png")),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5.0),
                            child: Container(
                              color: shawdowColor,
                              width: 50,
                              height: 50,
                              child: TextButton(
                                  onPressed: _exportCover,
                                  child: const Image(
                                      image:
                                          AssetImage("assets/icons/exit.png"))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5.0),
                            child: Container(
                              color: shawdowColor,
                              width: 50,
                              height: 50,
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _isVisible = !_isVisible;
                                      _isVisible2 = !_isVisible2;
                                    });
                                  },
                                  child: const Image(
                                      image: AssetImage(
                                          "assets/icons/timeline.png"))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CropGridViewer.preview(
                                          controller: _controller,
                                          // showGrid: false,
                                        ),
                                        AnimatedBuilder(
                                          animation: _controller.video,
                                          builder: (_, __) => OpacityTransition(
                                            visible: !_controller.isPlaying,
                                            child: GestureDetector(
                                              onTap: _controller.video.play,
                                              child: Container(
                                                width: 60,
                                                height: 60,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Icon(
                                                    Icons.play_arrow,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        barrierDismissible:
                                                            true,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                                "Export Project",textAlign: TextAlign.center),
                                                            content: Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Container(
                                                                height: 100,
                                                                child: const Image(
                                                                    image: AssetImage(
                                                                        "assets/icons/img_3.png")),
                                                              ),
                                                            ),
                                                            actions: [
                                                              FloatingActionButton
                                                                  .extended(
                                                                onPressed:() {
                                                                  Navigator.pop(context);
                                                                  _exportVideo();
                                                                    },
                                                                label: const Text(
                                                                    "Export Video"),
                                                                backgroundColor: shawdowColor,
                                                              ),
                                                              FloatingActionButton
                                                                  .extended(
                                                                onPressed: () {
                                                                  Navigator.pop(context);
                                                                  _exportCover();
                                                                    },
                                                                label: const Text(
                                                                    "Export ThumbNails"),
                                                                backgroundColor: shawdowColor,
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  child: CircleAvatar(
                                                      radius: 20,
                                                      backgroundColor:
                                                          shawdowColor,
                                                      child: const Icon(
                                                        Icons.ios_share,
                                                        size: 25,
                                                      )),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                            child: _controls(context),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: InkWell(
                                                      onTap: () {},
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            shawdowColor,
                                                        child: const Icon(
                                                          Icons.storefront,
                                                          size: 25,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: InkWell(
                                                      onTap: _controller.video.play,
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            shawdowColor,
                                                        child: const Icon(
                                                          Icons
                                                              .play_arrow_rounded,
                                                          size: 25,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: _isVisible2,
                            child: _coverSelection(),
                          ),
                          Visibility(
                            visible: _isVisible,
                            child: Expanded(
                              flex: 2,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: _trimSlider()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _coverSelection() {
    return Container(
        height: 125,
        margin: EdgeInsets.symmetric(horizontal: height / 2),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CoverSelection(
              controller: _controller,
              size: height,
              quantity: 30,
            ),
          ),
        ));
  }

  String formatter(Duration duration) => [
        duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
        duration.inSeconds.remainder(60).toString().padLeft(2, '0')
      ].join(":");

  List<Widget> _trimSlider() {
    return [
      AnimatedBuilder(
        animation: _controller.video,
        builder: (_, __) {
          final duration = _controller.video.value.duration.inSeconds;
          final pos = _controller.trimPosition * duration;
          final start = _controller.minTrim * duration;
          final end = _controller.maxTrim * duration;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: height / 4),
            child: Row(children: [
              Text(
                formatter(Duration(seconds: pos.toInt())),
                style: const TextStyle(color: Colors.white),
              ),
              const Expanded(child: SizedBox()),
              OpacityTransition(
                visible: _controller.isTrimming,
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    formatter(Duration(seconds: start.toInt())),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    formatter(Duration(seconds: end.toInt())),
                    style: const TextStyle(color: Colors.white),
                  ),
                ]),
              )
            ]),
          );
        },
      ),
      Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: height / 4),
          child: TrimSlider(
              controller: _controller,
              height: height,
              horizontalMargin: height / 4,
              child: TrimTimeline(
                  controller: _controller,
                  padding: const EdgeInsets.only(top: 1))),
        ),
      )
    ];
  }
}

Widget _controls(BuildContext context) {
  return // Figma Flutter Generator Group1Widget - GROUP
      Container(
          width: 130,
          height: 130,
          child: Stack(children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(57, 60, 74, 1),
                      border: Border.all(
                        color: const Color.fromRGBO(0, 0, 15, 1),
                        width: 2,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(130, 130)),
                    ))),
            Positioned(
                top: 39,
                left: 39,
                child: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 90, 92, 1),
                      border: Border.all(
                        color: const Color.fromRGBO(0, 0, 15, 1),
                        width: 1,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(52, 52)),
                    ))),
            Positioned(
                top: 35.75,
                left: 14.299995422363281,
                child: Transform.rotate(
                  angle: -31.184977503467543 * (math.pi / 180),
                  child: const Divider(
                      color: Color.fromRGBO(0, 0, 0, 1), thickness: 1),
                )),
            Positioned(
                top: 29.25,
                left: 111.90068054199219,
                child: Transform.rotate(
                  angle: -136.3781256223937 * (math.pi / 180),
                  child: const Divider(
                      color: Color.fromRGBO(0, 0, 0, 1), thickness: 1),
                )),
            Positioned(
                top: 80.5999984741211,
                left: 39.18327331542969,
                child: Transform.rotate(
                  angle: -126.27700671847491 * (math.pi / 180),
                  child: const Divider(
                      color: Color.fromRGBO(0, 0, 0, 1), thickness: 1),
                )),
            Positioned(
                top: 99.07630157470703,
                left: 113.1860122680664,
                child: Transform.rotate(
                  angle: 140.21281342440147 * (math.pi / 180),
                  child: const Divider(
                      color: Color.fromRGBO(0, 0, 0, 1), thickness: 1),
                )),
            Positioned(
                top: 52,
                left: 50.70000457763672,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CameraScreen()));
                  },
                  child: Container(
                      width: 28.87083625793457,
                      height: 26.64999771118164,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/Lens1.png'),
                            fit: BoxFit.fitWidth),
                      )),
                )),
            Positioned(
                top: 11.030303955078125,
                left: 54.36363983154297,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VideoPickerPage()));
                  },
                  child: Container(
                      width: 21.27272605895996,
                      height: 14.969695091247559,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/Media1.png'),
                            fit: BoxFit.fitWidth),
                      )),
                )),
            Positioned(
                top: 55,
                left: 101.00001525878906,
                child: Container(
                    width: 14.99999713897705,
                    height: 16.000001907348633,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Music1.png'),
                          fit: BoxFit.fitWidth),
                    ))),
            Positioned(
                top: 52.79998779296875,
                left: 11.26666259765625,
                child: Transform.rotate(
                  angle: -7.016711121317657e-15 * (math.pi / 180),
                  child: Container(
                      width: 18.999998092651367,
                      height: 18.999998092651367,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/Layers1.png'),
                            fit: BoxFit.fitWidth),
                      )),
                )),
            Positioned(
                top: 93.757568359375,
                left: 52,
                child: Container(
                    width: 25.212121963500977,
                    height: 22.848485946655273,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Recording1.png'),
                          fit: BoxFit.fitWidth),
                    ))),
            const Positioned(
                top: 116.60606384277344,
                left: 60.666664123535156,
                child: Text(
                  'REC',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 6,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            const Positioned(
                top: 75.63636779785156,
                left: 14.181816101074219,
                child: Text(
                  'Layer',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 6,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            const Positioned(
                top: 75.00000762939453,
                left: 103,
                child: Text(
                  'Audio',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 6,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            const Positioned(
                top: 28.999984741210938,
                left: 57.0000114440918,
                child: Text(
                  'Media',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 6,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
          ]));
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//-------------------//
//VIDEO EDITOR SCREEN//
//-------------------//
class VideoEditor extends StatefulWidget {
  const VideoEditor({Key? key, required this.file}) : super(key: key);

  final File file;

  @override
  State<VideoEditor> createState() => _VideoEditorState();
}

class _VideoEditorState extends State<VideoEditor> {
  final _exportingProgress = ValueNotifier<double>(0.0);
  final _isExporting = ValueNotifier<bool>(false);
  final double height = 60;

  bool _exported = false;
  String _exportText = "";
  late VideoEditorController _controller;

  @override
  void initState() {
    _controller = VideoEditorController.file(widget.file,
        maxDuration: const Duration(seconds: 30))
      ..initialize().then((_) => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _exportingProgress.dispose();
    _isExporting.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _openCropScreen() => Navigator.push(
      context,
      MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              CropScreen(controller: _controller)));

  void _exportVideo() async {
    _exportingProgress.value = 0;
    _isExporting.value = true;
    // NOTE: To use `-crf 1` and [VideoExportPreset] you need `ffmpeg_kit_flutter_min_gpl` package (with `ffmpeg_kit` only it won't work)
    await _controller.exportVideo(
      preset: VideoExportPreset.medium,
      customInstruction: "-crf 17",
      onProgress: (stats, value) => _exportingProgress.value = value,
      onCompleted: (file) {
        _isExporting.value = false;
        if (!mounted) return;
        if (file != null) {
          final VideoPlayerController videoController =
              VideoPlayerController.file(file);
          videoController.initialize().then((value) async {
            setState(() {});
            videoController.play();
            videoController.setLooping(true);
            await showDialog(
              context: context,
              builder: (_) => Padding(
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: AspectRatio(
                    aspectRatio: videoController.value.aspectRatio,
                    child: VideoPlayer(videoController),
                  ),
                ),
              ),
            );
            await videoController.pause();
            videoController.dispose();
          });
          _exportText = "Video success export!";
        } else {
          _exportText = "Error on export video :(";
        }

        setState(() => _exported = true);
        Future.delayed(const Duration(seconds: 2),
            () => setState(() => _exported = false));
      },
    );
  }

  void _exportCover() async {
    setState(() => _exported = false);
    await _controller.extractCover(
      onCompleted: (cover) {
        if (!mounted) return;

        if (cover != null) {
          _exportText = "Cover exported! ${cover.path}";
          showDialog(
            context: context,
            builder: (_) => Padding(
              padding: const EdgeInsets.all(30),
              child: Center(child: Image.memory(cover.readAsBytesSync())),
            ),
          );
        } else {
          _exportText = "Error on cover exportation :(";
        }

        setState(() => _exported = true);
        Future.delayed(const Duration(seconds: 2),
            () => setState(() => _exported = false));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller.initialized
          ? SafeArea(
              child: Stack(children: [
              Column(children: [
                _topNavBar(),
                Expanded(
                    child: DefaultTabController(
                        length: 2,
                        child: Column(children: [
                          Expanded(
                              child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Stack(alignment: Alignment.center, children: [
                                CropGridViewer.edit(
                                  controller: _controller,
                                  // showGrid: false,
                                ),
                                AnimatedBuilder(
                                  animation: _controller.video,
                                  builder: (_, __) => OpacityTransition(
                                    visible: !_controller.isPlaying,
                                    child: GestureDetector(
                                      onTap: _controller.video.play,
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.play_arrow,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              CoverViewer(controller: _controller)
                            ],
                          )),
                          Container(
                              height: 200,
                              margin: const EdgeInsets.only(top: 10),
                              child: Column(children: [
                                TabBar(
                                  indicatorColor: Colors.white,
                                  tabs: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Icon(Icons.content_cut)),
                                          Text('Trim')
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Icon(Icons.video_label)),
                                          Text('Cover')
                                        ]),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: _trimSlider()),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [_coverSelection()]),
                                    ],
                                  ),
                                )
                              ])),
                          _customSnackBar(),
                          ValueListenableBuilder(
                            valueListenable: _isExporting,
                            builder: (_, bool export, __) => OpacityTransition(
                              visible: export,
                              child: AlertDialog(
                                backgroundColor: Colors.white,
                                title: ValueListenableBuilder(
                                  valueListenable: _exportingProgress,
                                  builder: (_, double value, __) => Text(
                                    "Exporting video ${(value * 100).ceil()}%",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ])))
              ])
            ]))
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _topNavBar() {
    return SafeArea(
      child: SizedBox(
        height: height,
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                onPressed: () =>
                    _controller.rotate90Degrees(RotateDirection.left),
                icon: const Icon(Icons.rotate_left),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () =>
                    _controller.rotate90Degrees(RotateDirection.right),
                icon: const Icon(Icons.rotate_right),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: _openCropScreen,
                icon: const Icon(Icons.crop),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: _exportCover,
                icon: const Icon(Icons.save_alt, color: Colors.white),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: _exportVideo,
                icon: const Icon(Icons.save),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatter(Duration duration) => [
        duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
        duration.inSeconds.remainder(60).toString().padLeft(2, '0')
      ].join(":");

  List<Widget> _trimSlider() {
    return [
      AnimatedBuilder(
        animation: _controller.video,
        builder: (_, __) {
          final duration = _controller.video.value.duration.inSeconds;
          final pos = _controller.trimPosition * duration;
          final start = _controller.minTrim * duration;
          final end = _controller.maxTrim * duration;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: height / 4),
            child: Row(children: [
              Text(formatter(Duration(seconds: pos.toInt()))),
              const Expanded(child: SizedBox()),
              OpacityTransition(
                visible: _controller.isTrimming,
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(formatter(Duration(seconds: start.toInt()))),
                  const SizedBox(width: 10),
                  Text(formatter(Duration(seconds: end.toInt()))),
                ]),
              )
            ]),
          );
        },
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: height / 4),
        child: TrimSlider(
            controller: _controller,
            height: height,
            horizontalMargin: height / 4,
            child: TrimTimeline(
                controller: _controller,
                padding: const EdgeInsets.only(top: 10))),
      )
    ];
  }

  Widget _coverSelection() {
    return Container(
        height: 200,
        margin: EdgeInsets.symmetric(horizontal: height / 2),
        child: SingleChildScrollView(
          child: CoverSelection(
            controller: _controller,
            size: height,
            quantity: 30,
          ),
        ));
  }

  Widget _customSnackBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SwipeTransition(
        visible: _exported,
        axisAlignment: 1.0,
        child: Container(
          height: height,
          width: double.infinity,
          color: Colors.black.withOpacity(0.8),
          child: Center(
            child: Text(_exportText,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  void _downloadVideo(VideoPlayerController videoController) async {
        GallerySaver.saveVideo(videoController.dataSource, albumName: "TestVideo");
      }
}
