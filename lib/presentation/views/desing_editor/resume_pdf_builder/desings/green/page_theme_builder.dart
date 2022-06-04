import 'dart:math';

import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PageThemeBuilder {
  static Future<pw.PageTheme> build() async {
    final bgShape =
        await rootBundle.loadString(ImagePath.templateResumeDefault);

    final format = PdfPageFormat.a4.applyMargin(
      left: 2.0 * PdfPageFormat.cm,
      top: 4.0 * PdfPageFormat.cm,
      right: 2.0 * PdfPageFormat.cm,
      bottom: 2.0 * PdfPageFormat.cm,
    );
    return pw.PageTheme(
      pageFormat: format,
      theme: pw.ThemeData.withFont(
        base: await PdfGoogleFonts.openSansRegular(),
        bold: await PdfGoogleFonts.openSansBold(),
        icons: await PdfGoogleFonts.materialIcons(),
      ),
      buildBackground: (pw.Context context) {
        return pw.FullPage(
          ignoreMargins: true,
          child: pw.Stack(
            children: [
              pw.Positioned(
                child: pw.SvgImage(svg: bgShape),
                left: 0,
                top: 0,
              ),
              pw.Positioned(
                child: pw.Transform.rotate(
                  angle: pi,
                  child: pw.SvgImage(svg: bgShape),
                ),
                right: 0,
                bottom: 0,
              ),
            ],
          ),
        );
      },
    );
  }
}
