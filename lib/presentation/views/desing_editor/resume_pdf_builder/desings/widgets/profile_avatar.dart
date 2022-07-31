import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ProfileAvatar extends pw.StatelessWidget {
  ProfileAvatar({
    required this.imageOption,
    this.width,
    this.height,
    this.rounded = true,
  });

  final Option<Uint8List> imageOption;
  final double? width;
  final double? height;
  final bool rounded;
  @override
  pw.Widget build(pw.Context context) {
    return imageOption.fold(
      () => pw.Container(),
      (image) {
        final avatar = pw.Container(
          width: width,
          height: height,
          color: PdfColors.white,
          child: pw.Image(
            pw.MemoryImage(image),
            fit: pw.BoxFit.cover,
          ),
        );
        if (rounded) {
          return pw.ClipOval(
            child: avatar,
          );
        }
        return avatar;
      },
    );
  }
}
