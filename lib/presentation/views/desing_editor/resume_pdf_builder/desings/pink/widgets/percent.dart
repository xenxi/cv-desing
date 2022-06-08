import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Percent extends pw.StatelessWidget {
  Percent({
    required this.value,
    required this.title,
  });

  final double value;
  final String title;
  static const fontSize = 1.2;
  static const backgroundColor = PdfColors.grey300;
  static const strokeWidth = 5.0;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: <pw.Widget>[
        pw.Text(title),
        pw.SizedBox(height: 2),
        pw.SizedBox(
          height: 2,
          child: pw.LinearProgressIndicator(
            value: value,
            valueColor: PdfColor.fromHex('#8f8f8f'),
            backgroundColor: PdfColor.fromHex('#d7d5d6'),
          ),
        ),
        pw.SizedBox(height: 8),
      ],
    );
  }
}
