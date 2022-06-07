import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PageThemeBuilder {
  static Future<pw.PageTheme> build({bool withMargin = false}) async {
    final format = withMargin
        ? PdfPageFormat.a4.applyMargin(
            left: 3.0 * PdfPageFormat.cm,
            top: 0 * PdfPageFormat.cm,
            right: 2.0 * PdfPageFormat.cm,
            bottom: 2.0 * PdfPageFormat.cm,
          )
        : PdfPageFormat.a4;
    return pw.PageTheme(
      pageFormat: format,
      theme: pw.ThemeData.withFont(
        base: await PdfGoogleFonts.adventProLight(),
        bold: await PdfGoogleFonts.adventProBold(),
        italic: await PdfGoogleFonts.adventProExtraLight(),
        icons: await PdfGoogleFonts.materialIcons(),
      ).copyWith(
        defaultTextStyle: pw.TextStyle(
          color: PdfColor.fromHex('#292929'),
        ),
      ),
    );
  }
}
