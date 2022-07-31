import 'package:pdf/widgets.dart' as pw;

class SubCategory extends pw.StatelessWidget {
  SubCategory({required this.text});

  final String text;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 4),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          decoration: pw.TextDecoration.underline,
          fontWeight: pw.FontWeight.bold,
        ),
      ),
    );
  }
}
