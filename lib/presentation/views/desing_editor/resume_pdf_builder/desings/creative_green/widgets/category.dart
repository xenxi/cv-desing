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
    return pw.Stack(
      alignment: pw.Alignment.center,
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 8),
          child: pw.Divider(
            color: color,
            thickness: 3,
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.centerLeft,
          child: pw.Container(
            decoration: pw.BoxDecoration(
              color: color,
              borderRadius: const pw.BorderRadius.all(pw.Radius.circular(10)),
            ),
            padding: const pw.EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 1,
            ),
            child: pw.Text(
              title.toUpperCase(),
              style: const pw.TextStyle(
                color: PdfColors.white,
                fontSize: 12.9,
              ),
            ),
          ),
        )
      ],
    );
  }
}
