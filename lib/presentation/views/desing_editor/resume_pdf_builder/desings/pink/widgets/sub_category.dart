import 'package:pdf/widgets.dart' as pw;

class SubCategory extends pw.StatelessWidget {
  SubCategory({required this.text});

  final String text;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 20),
      child: pw.Text(
        text.toUpperCase(),
        textAlign: pw.TextAlign.left,
        textScaleFactor: 1.5,
        style: pw.TextStyle(
          fontWeight: pw.FontWeight.bold,
        ),
      ),
    );
  }
}
