import 'dart:async';
import 'dart:typed_data';

import 'package:cv_desing_website_flutter/domain/resumes/resume.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/description.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/locality.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/name.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/language_level_extensions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/creative_green/page_theme_builder.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/creative_green/widgets/block.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/creative_green/widgets/percent.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/creative_green/widgets/section.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/creative_green/widgets/sub_category.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/creative_green/widgets/url_text.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/widgets/profile_avatar.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

PdfColor green = PdfColor.fromHex('#5a9b43');
const asideWidth = 7.6 * PdfPageFormat.cm;
final dateFormat = DateFormat('MM/yyy');

class CreativeGreenResume {
  CreativeGreenResume(this.resume);

  final Resume resume;
  late Uint8List _bg;
  Future<pw.Document> build() async {
    final doc = pw.Document(
      title: resume.personalInformation.name
          .fold((l) => Location.curriculum, (r) => r),
      author: Location.appTitle,
    );
    final pageTheme = await PageThemeBuilder.build();

    final bytes = await rootBundle.load(ImagePath.resumeBg2);
    _bg = bytes.buffer.asUint8List();

    doc.addPage(
      pw.MultiPage(
        pageTheme: pageTheme,
        build: (pw.Context context) => [
          pw.Partitions(
            children: [
              _buildAside(context, pageTheme),
              _buildBody(context, pageTheme),
            ],
          ),
        ],
      ),
    );
    return doc;
  }

  pw.Partition _buildAside(pw.Context context, pw.PageTheme pageTheme) {
    final formart = pageTheme.pageFormat;

    return pw.Partition(
      width: asideWidth,
      child: pw.Column(
        children: [
          pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: <pw.Widget>[
              ProfileAvatar(
                width: asideWidth,
                height: formart.availableHeight / 2,
                imageOption: resume.personalInformation.avatarOption,
                rounded: false,
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.symmetric(horizontal: 12),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                  children: [
                    if (resume.personalInformation.locality.isValid())
                      pw.Column(
                        children: [
                          SubCategory(text: Location.address, color: green),
                          _buildLocality(
                            context,
                            locality: resume.personalInformation.locality,
                          )
                        ],
                      ),
                    if (resume.contactInformation.phoneNumber.isValid())
                      pw.Column(
                        children: [
                          SubCategory(text: Location.phone, color: green),
                          UrlText(
                            resume.contactInformation.phoneNumber.getOrCrash(),
                            'tel:${resume.contactInformation.phoneNumber.getOrCrash()}',
                          ),
                        ],
                      ),
                    if (resume.contactInformation.emailAddress.isValid())
                      pw.Column(
                        children: [
                          SubCategory(text: Location.email, color: green),
                          UrlText(
                            resume.contactInformation.emailAddress.getOrCrash(),
                            'tel:${resume.contactInformation.emailAddress.getOrCrash()}',
                          ),
                        ],
                      ),
                    _buildSkills(),
                    _buildLanguages(),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  pw.Widget _buildLanguages() {
    if (resume.languages.value.isEmpty) {
      return pw.SizedBox();
    }
    return pw.Column(
      children: [
        SubCategory(text: 'Idiomas', color: green),
        ...resume.languages.value.map(
          (l) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              pw.Text(l.getOrCrash()),
              pw.Text(
                l.level.displayName,
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
    );
  }

  pw.Widget _buildSkills() {
    if (resume.skills.value.isEmpty) {
      return pw.SizedBox();
    }
    return pw.Column(
      children: [
        SubCategory(text: Location.skillsandAptitudes, color: green),
        pw.Wrap(
          spacing: 8,
          runSpacing: 4,
          children: [
            ...resume.skills.value.map(
              (skill) => pw.Container(
                margin: const pw.EdgeInsets.all(1),
                padding: const pw.EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 8,
                ),
                decoration: pw.BoxDecoration(
                  // color: green,
                  border: pw.Border.fromBorderSide(
                    pw.BorderSide(color: green, width: 1.4),
                  ),
                  borderRadius: pw.BorderRadius.circular(8),
                ),
                child: pw.Row(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Icon(const pw.IconData(0xe5ca), color: green, size: 18),
                  pw.SizedBox(width: 2),
                  pw.Text(
                    skill.toUpperCase(),
                  )
                ]),
              ),
            ),
          ],
        ),
      ],
    );
  }

  pw.Partition _buildBody(pw.Context context, pw.PageTheme pageTheme) {
    final bodyWidth = pageTheme.pageFormat.width - asideWidth;
    const padding = 10.0;
    return pw.Partition(
      width: bodyWidth,
      child: pw.Container(
        padding: const pw.EdgeInsets.only(bottom: 8, top: 18),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: <pw.Widget>[
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: padding),
              child: _buildName(context, name: resume.personalInformation.name),
            ),
            pw.SizedBox(height: 4),
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: padding),
              child: _buildJob(context, job: resume.personalInformation.job),
            ),
            pw.SizedBox(height: 18),
            _buildAboutMe(context, padding: padding),
            _buildWorkExperience(context,
                padding: padding, bodyWidth: bodyWidth),
            _buildAcademyTraining(context,
                padding: padding, bodyWidth: bodyWidth),
            _buildComplementaryFormations(context,
                padding: padding, bodyWidth: bodyWidth),
          ],
        ),
      ),
    );
  }

  pw.Widget _buildAcademyTraining(pw.Context context,
      {required double padding, required double bodyWidth}) {
    if (resume.academyTrainings.value.isEmpty) {
      return pw.SizedBox();
    }
    return Section(
      category: Location.academicTraining,
      color: green,
      padding: padding,
      image: _bg,
      child: pw.Wrap(
        runSpacing: 10,
        spacing: 10,
        children: [
          ...resume.academyTrainings.value.map(
            (academyTraining) => pw.SizedBox(
              width: (bodyWidth / 2) - 20,
              child: Block(
                color: green,
                title: academyTraining.title.getOrCrash(),
                subTitle: academyTraining.schoold.getOrCrash(),
                trailingText: displayDateRange(
                  academyTraining.dateRange.getOrCrash(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget _buildComplementaryFormations(pw.Context context,
      {required double padding, required double bodyWidth}) {
    if (resume.complementaryTrainings.value.isEmpty) {
      return pw.SizedBox();
    }
    return Section(
      category: Location.complementaryFormations,
      color: green,
      padding: padding,
      child: pw.Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          ...resume.complementaryTrainings.value.map(
            (complementaryTraining) {
              return pw.SizedBox(
                width: (bodyWidth / 2) - 20,
                child: Block(
                  color: green,
                  title: complementaryTraining.title.getOrCrash(),
                  subTitle: complementaryTraining.schoold.getOrCrash(),
                  trailingText: displayDateRange(
                    complementaryTraining.dateRange.getOrCrash(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  pw.Widget _buildWorkExperience(pw.Context context,
      {required double padding, required double bodyWidth}) {
    if (resume.workExperiences.value.isEmpty) {
      return pw.SizedBox();
    }

    return Section(
      category: Location.workExperience,
      color: green,
      padding: padding,
      child: pw.Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          ...resume.workExperiences.value.map(
            (workExperience) {
              return pw.SizedBox(
                width: (bodyWidth / 2) - 20,
                child: Block(
                  color: green,
                  title: workExperience.job.getOrCrash(),
                  subTitle: workExperience.employer.getOrCrash(),
                  text: workExperience.description.getOrCrash(),
                  trailingText: displayDateRange(
                    workExperience.dateRange.getOrCrash(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  pw.Widget _buildAboutMe(pw.Context context, {required double padding}) {
    if (!resume.personalInformation.description.isValid() &&
        resume.softwareSkills.value.isEmpty) {
      return pw.SizedBox();
    }
    return Section(
      category: Location.aboutMe,
      color: green,
      image: _bg,
      padding: padding,
      child: pw.Column(
        children: [
          _buildDescription(
            context,
            description: resume.personalInformation.description,
          ),
          if (resume.softwareSkills.value.isNotEmpty) ...[
            pw.SizedBox(height: 14),
            pw.SizedBox(
              width: double.infinity,
              child: pw.Wrap(
                alignment: pw.WrapAlignment.spaceAround,
                crossAxisAlignment: pw.WrapCrossAlignment.center,
                spacing: 22,
                runSpacing: 10,
                children: [
                  ...resume.softwareSkills.value.map(
                    (skill) => Percent(
                      color: PdfColors.black,
                      size: 55,
                      value: skill.percentage.getOrCrash() * .01,
                      title: pw.Text(skill.getOrCrash()),
                    ),
                  )
                ],
              ),
            )
          ],
        ],
      ),
    );
  }

  pw.Widget _buildJob(pw.Context context, {required Job job}) => pw.Text(
        job.fold((l) => '', (r) => r.toUpperCase()),
        style: pw.Theme.of(context).defaultTextStyle.copyWith(
              fontWeight: pw.FontWeight.bold,
              fontSize: 17,
            ),
      );

  pw.Widget _buildName(pw.Context context, {required Name name}) => pw.Text(
        name.fold((l) => '', (r) => r.toUpperCase()),
        tightBounds: true,
        style: pw.Theme.of(context).defaultTextStyle.copyWith(
              fontSize: 55,
              fontStyle: pw.FontStyle.italic,
              lineSpacing: -115,
              color: PdfColors.black,
            ),
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
        (r) => pw.Text(r, textAlign: pw.TextAlign.center),
      );

  pw.Widget _buildDescription(
    pw.Context context, {
    required Description description,
  }) =>
      description.fold(
        (l) => pw.Container(),
        (r) => pw.Text(
          r,
          style: const pw.TextStyle(
            fontSize: 12,
          ),
        ),
      );
}
