import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ProfileAvatar extends pw.StatelessWidget {
  ProfileAvatar({
    required this.image,
    this.width,
    this.height,
  });

  final Uint8List image;
  final double? width;
  final double? height;
  @override
  pw.Widget build(pw.Context context) {
    return pw.ClipOval(
      child: pw.Container(
        width: width,
        height: height,
        color: PdfColors.white,
        child: pw.Image(
          pw.MemoryImage(image),
          fit: pw.BoxFit.cover,
        ),
      ),
    );
  }
}
