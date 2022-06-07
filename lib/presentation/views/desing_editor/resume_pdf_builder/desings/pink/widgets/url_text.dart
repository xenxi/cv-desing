import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class UrlText extends pw.StatelessWidget {
  UrlText(this.text, this.url,
      {this.svgIcon, this.color = PdfColors.blueAccent});

  final String text;
  final String url;
  final String? svgIcon;
  final PdfColor color;
  @override
  pw.Widget build(pw.Context context) {
    final link = pw.UrlLink(
      destination: url,
      child: pw.Text(
        text,
        style: pw.TextStyle(
          decoration: pw.TextDecoration.none,
          color: color,
        ),
      ),
    );
    if (svgIcon?.isNotEmpty != true) return link;

    return pw.Row(children: [
      pw.SvgImage(svg: svgIcon!, colorFilter: color, height: 18),
      pw.SizedBox(width: 8),
      link
    ]);
  }
}
