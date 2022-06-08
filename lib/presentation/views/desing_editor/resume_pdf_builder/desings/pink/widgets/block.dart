import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';

final dateFormat = DateFormat('MM/yyy');

class Block extends pw.StatelessWidget {
  Block({
    required this.title,
    this.subTitle,
    this.text,
    required this.color,
    required this.lastItem,
    required this.dateRange,
  });

  final String title;
  final String? subTitle;
  final String? text;
  final PdfColor color;
  final bool lastItem;
  final RangeOfDates dateRange;
  @override
  pw.Widget build(pw.Context context) {
    final widget = pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: <pw.Widget>[
        pw.Stack(
          overflow: pw.Overflow.visible,
          children: [
            pw.Transform.translate(
              offset: const PdfPoint(0, 5.5),
              child: pw.SizedBox(
                width: 40,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text(
                      displayEndDate(dateRange),
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        color: color,
                      ),
                    ),
                    pw.Text(
                      displayStartDate(dateRange),
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            pw.Container(
              decoration: const pw.BoxDecoration(
                border: pw.Border(left: pw.BorderSide(color: PdfColors.grey)),
              ),
              padding: const pw.EdgeInsets.only(left: 23, top: 5, bottom: 5),
              margin: const pw.EdgeInsets.only(left: 47, top: 6),
              child: pw.Transform.translate(
                offset: const PdfPoint(0, 5.5),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: <pw.Widget>[
                    pw.SizedBox(height: 5),
                    if (subTitle?.isNotEmpty == true) ...[
                      pw.Text(
                        subTitle!,
                        style: pw.TextStyle(
                          color: color,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 5),
                    ],
                    if (text?.isNotEmpty == true)
                      pw.Text(text!, style: const pw.TextStyle(lineSpacing: 2)),
                    if (!lastItem) pw.SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            pw.Container(
              width: 6,
              height: 6,
              margin: const pw.EdgeInsets.only(left: 44, right: 5),
              decoration: pw.BoxDecoration(
                color: color,
                shape: pw.BoxShape.circle,
              ),
            ),
            pw.Transform.translate(
              offset: const PdfPoint(0, 5.5),
              child: pw.Padding(
                padding: const pw.EdgeInsets.only(
                  left: 69,
                ),
                child: pw.Text(
                  title,
                  style: pw.Theme.of(context)
                      .defaultTextStyle
                      .copyWith(fontWeight: pw.FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );

    return pw.Transform.translate(
        offset: const PdfPoint(-37.5, 0), child: widget);
  }

  String displayStartDate(RangeOfDates dates) => dateFormat.format(dates.since);

  String displayEndDate(RangeOfDates dates) => dates.until.fold(
        () => 'Act.',
        (r) => dateFormat.format(r),
      );
}
