import 'dart:typed_data';

import 'package:dartz/dartz.dart';

abstract class ImagePicker {
  Future<Option<Uint8List>> pickImage();
}
