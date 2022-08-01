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
    this.image,
  });

  final String category;
  final pw.Widget child;
  final PdfColor color;
  final double padding;
  final Uint8List? image;
  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: image?.isNotEmpty == true
          ? pw.BoxDecoration(
              image: pw.DecorationImage(
                image: pw.MemoryImage(image!),
                fit: pw.BoxFit.cover,
              ),
            )
          : null,
      child: pw.Stack(
        overflow: pw.Overflow.visible,
        children: [
          pw.Container(
            width: double.infinity,
            padding: pw.EdgeInsets.symmetric(
              horizontal: padding,
              vertical: 26,
            ),
            child: child,
          ),
          pw.Transform.translate(
            offset: PdfPoint(padding, 10),
            child: Category(color: color, title: category),
          ),
        ],
      ),
    );
  }
}
