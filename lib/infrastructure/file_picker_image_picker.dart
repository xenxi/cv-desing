import 'dart:typed_data';

import 'package:cv_desing_website_flutter/application/components/image_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ImagePicker)
class FilePickerImagePicker extends ImagePicker {
  @override
  Future<Option<Uint8List>> pickImage() async {
    final result = await FilePicker.platform.pickFiles();
    final bytes = result?.files.single.bytes;
    return optionOf(bytes);
  }
}
