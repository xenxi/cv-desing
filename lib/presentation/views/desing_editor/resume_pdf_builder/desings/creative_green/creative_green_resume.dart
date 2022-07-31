import 'dart:async';

import 'package:cv_desing_website_flutter/domain/resumes/resume.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/description.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/locality.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/name.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/language_level_extensions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/creative_green/page_theme_builder.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/creative_green/widgets/block.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/creative_green/widgets/category.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/creative_green/widgets/percent.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/creative_green/widgets/sub_category.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/creative_green/widgets/url_text.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/widgets/profile_avatar.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
const sep = 120.0;
final dateFormat = DateFormat('MM/yyy');

class CreativeGreenResume {
  CreativeGreenResume(this.resume);

  final Resume resume;

  Future<pw.Document> build() async {
    final doc = pw.Document(
      title: resume.personalInformation.name
          .fold((l) => Location.curriculum, (r) => r),
      author: Location.appTitle,
    );
    final pageTheme = await PageThemeBuilder.build();
    doc.addPage(
      pw.MultiPage(
        pageTheme: pageTheme,
        build: (pw.Context context) => [
          pw.Partitions(
            children: [
              _buildAside(pageTheme),
              _buildBody(context),
            ],
          ),
        ],
      ),
    );
    return doc;
  }

  pw.Partition _buildAside(pw.PageTheme pageTheme) {
    final formart = pageTheme.pageFormat;
    const width = 7.6 * PdfPageFormat.cm;
    return pw.Partition(
      width: width,
      child: pw.Column(
        children: [
          pw.Container(
            height: formart.availableHeight,
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: <pw.Widget>[
                ProfileAvatar(
                  width: width,
                  height: formart.availableHeight / 2,
                  imageOption: resume.personalInformation.avatarOption,
                ),
                if (resume.softwareSkills.value.isNotEmpty) ...[
                  pw.Column(
                    children: <pw.Widget>[
                      ...resume.softwareSkills.value.map(
                        (skill) => Percent(
                          color: green,
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
                                borderRadius: pw.BorderRadius.circular(8),
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
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  pw.Partition _buildBody(pw.Context context) {
    return pw.Partition(
      width: 400,
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Container(
            padding: const pw.EdgeInsets.only(bottom: 8),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                _buildName(context, name: resume.personalInformation.name),
                pw.SizedBox(height: 10),
                _buildJob(context, job: resume.personalInformation.job),
                pw.SizedBox(height: 20),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: <pw.Widget>[
                    pw.Expanded(
                      child: _buildLocality(context,
                          locality: resume.personalInformation.locality),
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
                    description: resume.personalInformation.description),
              ],
            ),
          ),
          if (resume.workExperiences.value.isNotEmpty) ...[
            Category(title: Location.workExperience, color: lightGreen),
            ...resume.workExperiences.value.map(
              (workExperience) {
                return Block(
                  color: green,
                  title: workExperience.job.getOrCrash(),
                  subTitle: workExperience.employer.getOrCrash(),
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
            Category(title: Location.academicTraining, color: lightGreen),
            ...resume.academyTrainings.value.map(
              (academyTraining) => Block(
                color: green,
                title: academyTraining.title.getOrCrash(),
                subTitle: academyTraining.schoold.getOrCrash(),
                trailingText: displayDateRange(
                  academyTraining.dateRange.getOrCrash(),
                ),
              ),
            ),
          ],
          if (resume.complementaryTrainings.value.isNotEmpty) ...[
            Category(
                title: Location.complementaryFormations, color: lightGreen),
            ...resume.complementaryTrainings.value.map(
              (complementaryTraining) => Block(
                color: green,
                title: complementaryTraining.title.getOrCrash(),
                subTitle: complementaryTraining.schoold.getOrCrash(),
                trailingText: displayDateRange(
                  complementaryTraining.dateRange.getOrCrash(),
                ),
              ),
            ),
          ],
        ],
      ),
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
}
