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
        if (trailingText?.isNotEmpty == true) ...[
          pw.Text(
            trailingText!,
            tightBounds: true,
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.black,
            ),
          ),
          pw.SizedBox(height: 6),
        ],
        pw.Text(
          title.toUpperCase(),
          tightBounds: true,
          style: pw.Theme.of(context).defaultTextStyle.copyWith(
                fontWeight: pw.FontWeight.bold,
                color: color,
                lineSpacing: 3,
              ),
        ),
        pw.SizedBox(height: 6),
        pw.Text(
          subTitle,
          tightBounds: true,
          style: pw.Theme.of(context)
              .defaultTextStyle
              .copyWith(fontStyle: pw.FontStyle.italic),
        ),
        if (text?.isNotEmpty == true) ...[
          pw.SizedBox(height: 4),
          pw.Text(text!)
        ],
      ],
    );
  }
}
