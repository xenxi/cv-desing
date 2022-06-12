import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ProfileAvatar extends pw.StatelessWidget {
  ProfileAvatar({
    required this.imageOption,
    this.width,
    this.height,
  });

  final Option<Uint8List> imageOption;
  final double? width;
  final double? height;
  @override
  pw.Widget build(pw.Context context) {
    return imageOption.fold(
      () => pw.Container(),
      (image) => pw.ClipOval(
        child: pw.Container(
          width: width,
          height: height,
          color: PdfColors.white,
          child: pw.Image(
            pw.MemoryImage(image),
            fit: pw.BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
