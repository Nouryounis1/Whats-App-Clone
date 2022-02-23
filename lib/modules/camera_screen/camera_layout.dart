import 'dart:math';

import 'package:camera/camera.dart';
import 'package:chat_app/modules/camera_screen/camera_view.dart';
import 'package:chat_app/modules/camera_screen/video_view.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

List<CameraDescription>? cameras;
CameraController? controller;
bool _isReady = false;
XFile? imageFile;
XFile? videoFile;
bool isRecording = false;
bool isCameraFron = true;
bool isFlashOn = false;
double transform = 0;

class CameraLayout extends StatefulWidget {
  CameraLayout({Key? key}) : super(key: key);

  @override
  State<CameraLayout> createState() => _CameraLayoutState();
}

class _CameraLayoutState extends State<CameraLayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setupCameras();
  }

  Future<void> _setupCameras() async {
    try {
      // initialize cameras.
      cameras = await availableCameras();
      // initialize camera controllers.
      controller = CameraController(cameras![0], ResolutionPreset.high);
      await controller!.initialize();
    } on CameraException catch (_) {
      // do something on error.
    }
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !_isReady
          ? Center(child: CircularProgressIndicator())
          : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  CameraPreview(controller!),
                  Positioned(
                    bottom: 0.0,
                    child: Container(
                      padding: EdgeInsets.only(top: 5, bottom: 30),
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isFlashOn = !isFlashOn;
                                    });

                                    isFlashOn
                                        ? controller!
                                            .setFlashMode(FlashMode.torch)
                                        : controller!
                                            .setFlashMode(FlashMode.off);
                                  },
                                  icon: Icon(
                                    isFlashOn
                                        ? Icons.flash_on
                                        : Icons.flash_off,
                                    color: Colors.white,
                                    size: 28,
                                  )),
                              GestureDetector(
                                  onLongPress: () async {
                                    onVideoRecordButtonPressed();
                                  },
                                  onLongPressUp: () async {
                                    onStopButtonPressed(context);
                                  },
                                  onTap: () {
                                    if (!isRecording)
                                      onTakePictureButtonPressed(context);
                                  },
                                  child: isRecording
                                      ? Icon(
                                          Icons.radio_button_on,
                                          color: Colors.red,
                                          size: 80,
                                        )
                                      : Icon(
                                          Icons.panorama_fish_eye,
                                          color: Colors.white,
                                          size: 70,
                                        )),
                              IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      isCameraFron = !isCameraFron;
                                      transform = transform + pi;
                                    });

                                    int camPos = isCameraFron ? 0 : 1;

                                    controller = CameraController(
                                        cameras![camPos],
                                        ResolutionPreset.high);
                                    await controller!.initialize();
                                  },
                                  icon: Transform.rotate(
                                    angle: transform,
                                    child: Icon(
                                      Icons.flip_camera_ios,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Hold for Video , tap for photo',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Future<XFile?> takePicture() async {
    if (controller == null || !controller!.value.isInitialized) {
      return null;
    }

    if (controller!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await controller!.takePicture();
      return file;
    } on CameraException catch (e) {
      return null;
    }
  }

  void onTakePictureButtonPressed(context) {
    takePicture().then((XFile? file) {
      if (mounted) {
        setState(() {
          imageFile = file;
        });
        if (file != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraViewScreen(
                  path: imageFile!.path,
                ),
              ));
        }
      }
    });
  }

  Future<void> startVideoRecording() async {
    if (controller == null || !controller!.value.isInitialized) {
      return;
    }

    if (controller!.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return;
    }

    try {
      await controller!.startVideoRecording();
    } on CameraException catch (e) {
      return;
    }
  }

  Future<XFile?> stopVideoRecording() async {
    if (controller == null || !controller!.value.isRecordingVideo) {
      return null;
    }

    try {
      return controller!.stopVideoRecording();
    } on CameraException catch (e) {
      return null;
    }
  }

  void onVideoRecordButtonPressed() {
    startVideoRecording().then((_) {
      if (mounted) {
        setState(() {
          isRecording = true;
        });
      }
    });
  }

  void onStopButtonPressed(context) {
    stopVideoRecording().then((XFile? file) {
      if (mounted) {
        setState(() {
          isRecording = false;
        });
      }
      if (file != null) {
        videoFile = file;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoViewScreen(
                path: videoFile!.path,
              ),
            ));
      }
    });
  }
}
