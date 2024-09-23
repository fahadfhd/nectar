import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddscreenProvider extends ChangeNotifier {
  final _imgPicker = ImagePicker();

  List<XFile>? _imageFiles = [];
  List<XFile>? get imageFiles => _imageFiles;
  set imageFiles(List<XFile>? value) {
    _imageFiles = value;
    notifyListeners();
  }

  Future<void> openCamera(
    BuildContext context,
  ) async {
    Navigator.pop(context);
    XFile? imgCamera = await _imgPicker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 70,
        // maxHeight: 500,
        maxWidth: 1000);
    if (imgCamera != null) {
      imageFiles?.add(imgCamera);

      notifyListeners();
    }
  }

  Future<void> openGallery({
    required BuildContext context,
  }) async {
    List<XFile>? imgGallery =
        await _imgPicker.pickMultiImage(imageQuality: 70, maxWidth: 1000);
    if (imgGallery.isNotEmpty) {
      imageFiles?.addAll(imgGallery);

      notifyListeners();
    }
  }
}
