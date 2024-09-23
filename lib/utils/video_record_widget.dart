import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:video_player/video_player.dart';

class VideoRecorderWidget extends StatefulWidget {
  static const route = "videoRecordScreen";
  @override
  _VideoRecorderWidgetState createState() => _VideoRecorderWidgetState();
}

class _VideoRecorderWidgetState extends State<VideoRecorderWidget> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  String? _videoPath;
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    _initializeCameras();
  }

  Future<void> _initializeCameras() async {
    _cameras = await availableCameras();
    _controller = CameraController(
      _cameras![0],
      ResolutionPreset.high,
    );

    await _controller!.initialize();
    setState(() {});
  }

  Future<void> _startVideoRecording() async {
    if (_controller!.value.isRecordingVideo) return;

    try {
      final directory = await getApplicationDocumentsDirectory();
      _videoPath = '${directory.path}/${DateTime.now()}.mp4';
      await _controller!.startVideoRecording();
    } catch (e) {
      print('Error starting video recording: $e');
    }
  }

  Future<void> _stopVideoRecording() async {
    if (!_controller!.value.isRecordingVideo) return;

    try {
      await _controller!.stopVideoRecording();
      _videoController = VideoPlayerController.file(File(_videoPath!));
      await _videoController!.initialize();
      setState(() {});
    } catch (e) {
      print('Error stopping video recording: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        AspectRatio(
          aspectRatio: _controller!.value.aspectRatio,
          child: CameraPreview(_controller!),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(_controller!.value.isRecordingVideo
                  ? Icons.stop
                  : Icons.videocam),
              onPressed: _controller!.value.isRecordingVideo
                  ? _stopVideoRecording
                  : _startVideoRecording,
            ),
          ],
        ),
        if (_videoController != null && _videoController!.value.isInitialized)
          Column(
            children: [
              AspectRatio(
                aspectRatio: _videoController!.value.aspectRatio,
                child: VideoPlayer(_videoController!),
              ),
              ElevatedButton(
                child: Text("Play Video"),
                onPressed: () {
                  setState(() {
                    _videoController!.value.isPlaying
                        ? _videoController!.pause()
                        : _videoController!.play();
                  });
                },
              ),
            ],
          ),
      ],
    );
  }
}
