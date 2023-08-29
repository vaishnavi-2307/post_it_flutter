import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PickImageService {
  final ImagePicker _imagePicker;

  const PickImageService({required ImagePicker imagePicker})
      : _imagePicker = imagePicker;

  Future<File?> pickImage() async {
    final file = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    return file != null ? File(file.path) : null;
  }

  Future<File?> pickVideo() async {
    final file = await _imagePicker.pickVideo(
      source: ImageSource.gallery,
    );
    return file != null ? File(file.path) : null;
  }
}
