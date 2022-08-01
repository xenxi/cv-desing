import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Percent extends pw.StatelessWidget {
  Percent({
    required this.size,
    required this.value,
    required this.title,
    required this.color,
  });

  final double size;
  final double value;
  final pw.Widget title;
  static const fontSize = 1.2;
  final PdfColor color;
  static const backgroundColor = PdfColors.grey300;
  static const strokeWidth = 4.0;

  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.Container(
        width: size,
        height: size,
        child: pw.Stack(
          alignment: pw.Alignment.center,
          fit: pw.StackFit.expand,
          children: <pw.Widget>[
            pw.Center(
              child: pw.Text(
                '${(value * 100).round().toInt()}%',
                textScaleFactor: fontSize,
              ),
            ),
            pw.CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ],
        ),
      )
    ];

    widgets.add(title);

    return pw.Column(children: widgets);
  }
}
