import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageUtil {
  Future<XFile?> pickImage(
    ImageSource source, {
    int imageQuality = 50,
  }) async {
    final imageFile = await ImagePicker().pickImage(
      source: source,
      imageQuality: imageQuality,
    );

    switch (imageFile) {
      case null:
        return null;
      default:
        return imageFile;
    }
  }

  Future<XFile?> getLostImage() async {
    final lostImage = await ImagePicker().retrieveLostData();
    if (lostImage.isEmpty) {
      return null;
    }

    return lostImage.file;
  }

  static String? validateImageSize(XFile image, {int maxFileSizeInKb = 300}) {
    final bytes = File(image.path).readAsBytesSync().lengthInBytes;
    final kb = bytes / 1024;

    if (kb < maxFileSizeInKb) {
      return null;
    }

    return 'Image size is too large. Please select an image under $maxFileSizeInKb KB. ';
  }

  static String? encodeImageToBase64(XFile? image) {
    if (image != null) {
      return base64Encode(File(image.path).readAsBytesSync());
    }

    return null;
  }
}
