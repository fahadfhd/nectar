// import 'dart:io';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:video_player/video_player.dart';
// import 'package:path/path.dart' as path; // for managing file paths

// class VideoRecordCamera extends StatefulWidget {
//   static const String route = "videoRecordWidget";
//   const VideoRecordCamera({super.key});

//   @override
//   State<VideoRecordCamera> createState() => _VideoRecordCameraState();
// }

// class _VideoRecordCameraState extends State<VideoRecordCamera> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;
//   String? _videoPath;
//   VideoPlayerController? _videoPlayerController;

//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }

//   Future<void> _initializeCamera() async {
//     final cameras = await availableCameras();
//     _controller = CameraController(
//       cameras.first,
//       ResolutionPreset.high,
//     );
//     _initializeControllerFuture = _controller.initialize();
//     setState(() {});
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _videoPlayerController?.dispose();
//     super.dispose();
//   }

//   Future<void> _startVideoRecording() async {
//     try {
//       await _initializeControllerFuture;
//       // Start recording video
//       await _controller.startVideoRecording();
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> _stopVideoRecording() async {
//     try {
//       // Stop recording video
//       final XFile videoFile = await _controller.stopVideoRecording();

//       // Save the video file to a new path
//       final Directory appDocDir = await getExternalStorageDirectory() ??
//           await getApplicationDocumentsDirectory();
//       String newPath = path.join(appDocDir.path, '${DateTime.now()}.mp4');
//       File savedVideo = File(videoFile.path).copySync(newPath);

//       _videoPath = savedVideo.path;

//       _videoPlayerController = VideoPlayerController.file(File(_videoPath!))
//         ..initialize().then((_) {
//           setState(() {});
//           _videoPlayerController!.play();
//         });
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<String> _getFilePath() async {
//     try {
//       if (Platform.isAndroid) {
//         final folderPath = '/storage/emulated/0/nectar';

//         final folder = Directory(folderPath);
//         if (!await folder.exists()) {
//           await folder.create(recursive: true);
//         }
//         return '$folderPath/example.pdf';
//       } else {
//         final directory = await getApplicationDocumentsDirectory();
//         print('Documents Directory: ${directory.path}');
//         return directory.path;
//       }
//     } catch (e) {
//       print('Error getting file path: $e');
//       rethrow;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Video Recorder')),
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Column(
//               children: [
//                 AspectRatio(
//                   aspectRatio: 16 / 9,
//                   child: CameraPreview(_controller),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                       onPressed: _startVideoRecording,
//                       child: const Text('Record'),
//                     ),
//                     const SizedBox(width: 20),
//                     ElevatedButton(
//                       onPressed: _stopVideoRecording,
//                       child: const Text('Stop'),
//                     ),
//                   ],
//                 ),
//                 if (_videoPlayerController != null &&
//                     _videoPlayerController!.value.isInitialized)
//                   Container(
//                     height: 200,
//                     color: Colors.red,
//                     child: VideoPlayer(_videoPlayerController!),
//                   ),
//               ],
//             );
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
