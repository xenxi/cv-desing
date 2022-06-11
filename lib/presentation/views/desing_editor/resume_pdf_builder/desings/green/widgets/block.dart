import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Block extends pw.StatelessWidget {
  Block({
    required this.title,
    this.text,
    required this.subTitle,
    required this.color,
    this.trailingText,
  });

  final String title;
  final String? text;
  final String subTitle;
  final PdfColor color;
  final String? trailingText;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: <pw.Widget>[
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: <pw.Widget>[
            pw.Container(
              width: 6,
              height: 6,
              margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
              decoration: pw.BoxDecoration(
                color: color,
                shape: pw.BoxShape.circle,
              ),
            ),
            pw.Text(
              title,
              style: pw.Theme.of(context)
                  .defaultTextStyle
                  .copyWith(fontWeight: pw.FontWeight.bold),
            ),
            if (trailingText != null) ...[
              pw.SizedBox(width: 10),
              pw.Text(
                trailingText!,
                style:
                    pw.TextStyle(fontWeight: pw.FontWeight.bold, color: color),
              ),
            ]
          ],
        ),
        pw.Container(
          decoration: pw.BoxDecoration(
            border: pw.Border(left: pw.BorderSide(color: color, width: 2)),
          ),
          padding: const pw.EdgeInsets.only(left: 10, bottom: 6),
          margin: const pw.EdgeInsets.only(left: 5),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: <pw.Widget>[
              pw.Text(
                subTitle,
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(fontStyle: pw.FontStyle.italic),
              ),
              if (text?.isNotEmpty == true) ...[
                pw.SizedBox(height: 4),
                pw.Text(text!),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
