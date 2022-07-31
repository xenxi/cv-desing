import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Category extends pw.StatelessWidget {
  Category({
    required this.color,
    required this.title,
  });
  final PdfColor color;

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: pw.BoxDecoration(
        color: color,
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
      padding: const pw.EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: pw.Text(
        title,
        textScaleFactor: 1.5,
      ),
    );
  }
}
