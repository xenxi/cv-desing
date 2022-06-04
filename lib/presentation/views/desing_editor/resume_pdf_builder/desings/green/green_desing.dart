import 'dart:async';
import 'dart:math';

import 'package:cv_desing_website_flutter/domain/resumes/resume.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/description.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/locality.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/name.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/green/widgets/sub_category.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/green/widgets/url_text.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
const sep = 120.0;
final dateFormat = DateFormat('MM/yyy');

Future<pw.Document> buildResume(Resume resume) async {
  final bytes = await resume.personalInformation.avatarOption.fold(
    () async => (await rootBundle.load(ImagePath.logo)).buffer.asUint8List(),
    (a) => Future.value(a),
  );
  final profileImage = pw.MemoryImage(bytes);

  final doc = pw.Document(
    title: resume.personalInformation.name
        .fold((l) => Location.curriculum, (r) => r),
    author: Location.appTitle,
  );
  final pageTheme = await _myPageTheme();
  doc.addPage(
    pw.MultiPage(
      pageTheme: pageTheme,
      build: (pw.Context context) => [
        pw.Partitions(
          children: [
            pw.Partition(
              width: 400,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Container(
                    padding: const pw.EdgeInsets.only(bottom: 8),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: <pw.Widget>[
                        _buildName(context,
                            name: resume.personalInformation.name),
                        pw.SizedBox(height: 10),
                        _buildJob(context, job: resume.personalInformation.job),
                        pw.SizedBox(height: 20),
                        pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: <pw.Widget>[
                            pw.Expanded(
                              child: _buildLocality(context,
                                  locality:
                                      resume.personalInformation.locality),
                            ),
                            pw.Expanded(
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.end,
                                children: <pw.Widget>[
                                  UrlText(
                                    resume.contactInformation.phoneNumber
                                        .fold((l) => '', (r) => r),
                                    'tel:${resume.contactInformation.phoneNumber.fold((l) => '', (r) => r)}',
                                  ),
                                  UrlText(
                                    resume.contactInformation.emailAddress
                                        .fold((l) => '', (r) => r),
                                    'mailto:${resume.contactInformation.emailAddress.fold((l) => '', (r) => r)}',
                                  ),
                                ],
                              ),
                            ),
                            pw.SizedBox(width: 8),
                          ],
                        ),
                        pw.SizedBox(height: 10),
                        _buildDescription(context,
                            description:
                                resume.personalInformation.description),
                      ],
                    ),
                  ),
                  if (resume.workExperiences.value.isNotEmpty) ...[
                    _Category(title: Location.workExperience),
                    ...resume.workExperiences.value.map(
                      (workExperience) {
                        return _Block(
                          title: workExperience.job.getOrCrash(),
                          text: workExperience.description.getOrCrash(),
                          trailingText: displayDateRange(
                            workExperience.dateRange.getOrCrash(),
                          ),
                        );
                      },
                    ),
                    pw.SizedBox(height: 20),
                  ],
                  if (resume.academyTrainings.value.isNotEmpty) ...[
                    _Category(title: Location.academicTraining),
                    ...resume.academyTrainings.value.map(
                      (academyTraining) => _Block(
                        title: academyTraining.title.getOrCrash(),
                        text: academyTraining.schoold.getOrCrash(),
                        trailingText: displayDateRange(
                          academyTraining.dateRange.getOrCrash(),
                        ),
                      ),
                    ),
                  ],
                  if (resume.complementaryTrainings.value.isNotEmpty) ...[
                    _Category(title: Location.complementaryFormations),
                    ...resume.complementaryTrainings.value.map(
                      (complementaryTraining) => _Block(
                        title: complementaryTraining.title.getOrCrash(),
                        text: complementaryTraining.schoold.getOrCrash(),
                        trailingText: displayDateRange(
                          complementaryTraining.dateRange.getOrCrash(),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            pw.Partition(
              width: sep,
              child: pw.Column(
                children: [
                  pw.Container(
                    height: pageTheme.pageFormat.availableHeight,
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        pw.ClipOval(
                          child: pw.Container(
                            width: 100,
                            height: 100,
                            color: lightGreen,
                            child: pw.Image(profileImage),
                          ),
                        ),
                        if (resume.softwareSkills.value.isNotEmpty) ...[
                          pw.Column(
                            children: <pw.Widget>[
                              ...resume.softwareSkills.value.map(
                                (skill) => _Percent(
                                  size: 60,
                                  value: skill.percentage.getOrCrash() * .01,
                                  title: pw.Text(skill.getOrCrash()),
                                ),
                              ),
                            ],
                          ),
                        ],
                        if (resume.skills.value.isNotEmpty)
                          pw.Column(
                            children: [
                              SubCategory(text: 'Habilidades'),
                              pw.Wrap(
                                children: [
                                  ...resume.skills.value.map(
                                    (skill) => pw.Container(
                                      margin: const pw.EdgeInsets.all(1),
                                      padding: const pw.EdgeInsets.symmetric(
                                        vertical: 2,
                                        horizontal: 4,
                                      ),
                                      decoration: pw.BoxDecoration(
                                        color: lightGreen,
                                        borderRadius:
                                            pw.BorderRadius.circular(8),
                                      ),
                                      child: pw.Text(
                                        skill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        if (resume.languages.value.isNotEmpty)
                          pw.Column(
                            children: [
                              SubCategory(text: 'Idiomas'),
                              ...resume.languages.value.map(
                                (l) => pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.stretch,
                                  children: [
                                    pw.Text(l.getOrCrash()),
                                    pw.Text(
                                      l.level,
                                      textScaleFactor: .9,
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontStyle: pw.FontStyle.italic,
                                      ),
                                    ),
                                    pw.SizedBox(height: 4),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
  return doc;
}

Future<pw.PageTheme> _myPageTheme() async {
  final bgShape = await rootBundle.loadString(ImagePath.templateResumeDefault);

  final format = PdfPageFormat.a4.applyMargin(
    left: 2.0 * PdfPageFormat.cm,
    top: 4.0 * PdfPageFormat.cm,
    right: 2.0 * PdfPageFormat.cm,
    bottom: 2.0 * PdfPageFormat.cm,
  );
  return pw.PageTheme(
    pageFormat: format,
    theme: pw.ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: [
            pw.Positioned(
              child: pw.SvgImage(svg: bgShape),
              left: 0,
              top: 0,
            ),
            pw.Positioned(
              child: pw.Transform.rotate(
                angle: pi,
                child: pw.SvgImage(svg: bgShape),
              ),
              right: 0,
              bottom: 0,
            ),
          ],
        ),
      );
    },
  );
}

pw.Widget _buildJob(pw.Context context, {required Job job}) => pw.Text(
      job.fold((l) => '', (r) => r),
      textScaleFactor: 1.2,
      style: pw.Theme.of(context).defaultTextStyle.copyWith(
            fontWeight: pw.FontWeight.bold,
            color: green,
          ),
    );

pw.Widget _buildName(pw.Context context, {required Name name}) => pw.Text(
      name.fold((l) => '', (r) => r),
      textScaleFactor: 2,
      style: pw.Theme.of(context)
          .defaultTextStyle
          .copyWith(fontWeight: pw.FontWeight.bold),
    );

String displayDateRange(RangeOfDates dates) {
  final endDate = dates.until.fold(
    () => 'Act.',
    (r) => dateFormat.format(r),
  );
  final dateRange = '${dateFormat.format(dates.since)} - $endDate';
  return dateRange;
}

pw.Widget _buildLocality(pw.Context context, {required Locality locality}) =>
    locality.fold(
      (l) => pw.Container(),
      (r) => pw.Text(r),
    );

pw.Widget _buildDescription(pw.Context context,
        {required Description description}) =>
    description.fold(
      (l) => pw.Container(),
      (r) => pw.Text(
        r,
        style: pw.TextStyle(
          fontStyle: pw.FontStyle.italic,
        ),
      ),
    );

class _Category extends pw.StatelessWidget {
  _Category({required this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: const pw.BoxDecoration(
        color: lightGreen,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
      padding: const pw.EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: pw.Text(
        title,
        textScaleFactor: 1.5,
      ),
    );
  }
}

class _Percent extends pw.StatelessWidget {
  _Percent({
    required this.size,
    required this.value,
    required this.title,
  });

  final double size;

  final double value;

  final pw.Widget title;

  static const fontSize = 1.2;

  PdfColor get color => green;

  static const backgroundColor = PdfColors.grey300;

  static const strokeWidth = 5.0;

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

class _Block extends pw.StatelessWidget {
  _Block({
    required this.title,
    required this.text,
    this.icon,
    this.trailingText,
  });

  final String title;
  final String text;
  final pw.IconData? icon;
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
              decoration: const pw.BoxDecoration(
                color: green,
                shape: pw.BoxShape.circle,
              ),
            ),
            pw.Text(
              title,
              style: pw.Theme.of(context)
                  .defaultTextStyle
                  .copyWith(fontWeight: pw.FontWeight.bold),
            ),
            if (icon != null) pw.Icon(icon!, color: lightGreen, size: 18),
            if (trailingText != null) ...[
              pw.SizedBox(width: 10),
              pw.Text(
                trailingText!,
                style:
                    pw.TextStyle(fontWeight: pw.FontWeight.bold, color: green),
              ),
            ]
          ],
        ),
        pw.Container(
          decoration: const pw.BoxDecoration(
            border: pw.Border(left: pw.BorderSide(color: green, width: 2)),
          ),
          padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
          margin: const pw.EdgeInsets.only(left: 5),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: <pw.Widget>[
              pw.Text(text),
            ],
          ),
        ),
      ],
    );
  }
}
