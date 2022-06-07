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
      margin: const pw.EdgeInsets.only(
        bottom: 8,
      ),
      // padding: const pw.EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: pw.Row(children: [
        pw.Text(
          '+',
          textScaleFactor: 1.5,
          style: pw.TextStyle(
            fontSize: 32,
            fontStyle: pw.FontStyle.italic,
          ),
        ),
        pw.SizedBox(width: 12),
        pw.Text(
          title.toUpperCase(),
          textScaleFactor: 1.5,
          style: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
