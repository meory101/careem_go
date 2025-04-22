import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;


///
/// created by eng nour othman ***
/// at 7/4/2025
///

abstract class AppImageHelper {
  static Future<File?>? pickImageFrom(
      {required ImageSource source,
      CameraDevice? preferredCameraDevice}) async {
    File? tempImage;
    try {
      final photo = await ImagePicker().pickImage(
        source: source,
        preferredCameraDevice:preferredCameraDevice?? CameraDevice.front,
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 75,
      );
      if (photo == null) return null;
      tempImage = File(photo.path);
    } catch (error) {}
    return tempImage;
  }

  static String convertBase46Encoder({required File image}) {
    List<int> imageBytes = image.readAsBytesSync();
    return base64Encode(imageBytes);
  }

  static Image convertBase46Decoder({required String image}) {
    return Image.memory(const Base64Decoder().convert(image));
  }

  static String getFileName({required File file}) {
    return path.basename(file.path);
  }
}

