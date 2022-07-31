import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PageThemeBuilder {
  static Future<pw.PageTheme> build() async {
    return pw.PageTheme(
      pageFormat:
          PdfPageFormat.a4.applyMargin(left: 0, top: 0, right: 0, bottom: 0),
      margin: pw.EdgeInsets.zero,
      theme: pw.ThemeData.withFont(
        base: await PdfGoogleFonts.montserratMedium(),
        bold: await PdfGoogleFonts.bebasNeueRegular(),
        icons: await PdfGoogleFonts.materialIcons(),
      ),
    );
  }
}
