import 'dart:typed_data';

import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/creative_green/widgets/category.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Section extends pw.StatelessWidget {
  Section({
    required this.category,
    required this.child,
    required this.color,
    required this.padding,
    required this.image,
  });

  final String category;
  final pw.Widget child;
  final PdfColor color;
  final double padding;
  final Uint8List image;
  @override
  pw.Widget build(pw.Context context) {
    return pw.Stack(
      children: [
        pw.Container(
          margin: const pw.EdgeInsets.only(top: 10),
          padding: pw.EdgeInsets.symmetric(
            horizontal: padding,
            vertical: 26,
          ),
          decoration: pw.BoxDecoration(
            image: pw.DecorationImage(
              image: pw.MemoryImage(image),
              fit: pw.BoxFit.cover,
            ),
          ),
          child: child,
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(left: padding),
          child: Category(color: color, title: category),
        ),
      ],
    );
  }
}