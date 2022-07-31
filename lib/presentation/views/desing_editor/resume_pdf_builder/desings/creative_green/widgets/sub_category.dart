import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class SubCategory extends pw.StatelessWidget {
  SubCategory({
    required this.text,
    required this.color,
  });

  final String text;
  final PdfColor color;
  @override
  pw.Widget build(pw.Context context) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Text(
        text.toUpperCase(),
        style: pw.TextStyle(
          fontWeight: pw.FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
