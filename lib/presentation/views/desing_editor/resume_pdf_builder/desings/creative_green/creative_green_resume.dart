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

PdfColor green = PdfColor.fromHex('#5a9b43');
const asideWidth = 7.6 * PdfPageFormat.cm;
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
                    if (resume.skills.value.isNotEmpty)
                      pw.Column(
                        children: [
                          SubCategory(text: 'Habilidades', color: green),
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
                                    color: green,
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
                      ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  pw.Partition _buildBody(pw.Context context, pw.PageTheme pageTheme) {
    final bodyWidth = pageTheme.pageFormat.width - asideWidth;
    return pw.Partition(
      width: bodyWidth,
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Container(
            padding: const pw.EdgeInsets.only(bottom: 8, top: 18),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                _buildName(context, name: resume.personalInformation.name),
                pw.SizedBox(height: 4),
                _buildJob(context, job: resume.personalInformation.job),
                if (resume.personalInformation.description.isValid()) ...[
                  Category(color: green, title: Location.aboutMe),
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
                        spacing: 20,
                        runSpacing: 10,
                        children: [
                          ...resume.softwareSkills.value.map(
                            (skill) => Percent(
                              color: green,
                              size: 60,
                              value: skill.percentage.getOrCrash() * .01,
                              title: pw.Text(skill.getOrCrash()),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ],
                pw.SizedBox(height: 20),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: <pw.Widget>[
                    pw.Expanded(
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: <pw.Widget>[],
                      ),
                    ),
                    pw.SizedBox(width: 8),
                  ],
                ),
                pw.SizedBox(height: 10),
                _buildDescription(
                  context,
                  description: resume.personalInformation.description,
                ),
              ],
            ),
          ),
          if (resume.workExperiences.value.isNotEmpty) ...[
            Category(title: Location.workExperience, color: green),
            pw.Wrap(
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
            pw.SizedBox(height: 20),
          ],
          if (resume.academyTrainings.value.isNotEmpty) ...[
            Category(title: Location.academicTraining, color: green),
            pw.Wrap(runSpacing: 10, spacing: 10, children: [
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
            ]),
          ],
          if (resume.complementaryTrainings.value.isNotEmpty) ...[
            Category(title: Location.complementaryFormations, color: green),
            pw.Wrap(runSpacing: 10, spacing: 10, children: [
              ...resume.complementaryTrainings.value.map(
                (complementaryTraining) => pw.SizedBox(
                  width: (bodyWidth / 2) - 20,
                  child: Block(
                    color: green,
                    title: complementaryTraining.title.getOrCrash(),
                    subTitle: complementaryTraining.schoold.getOrCrash(),
                    trailingText: displayDateRange(
                      complementaryTraining.dateRange.getOrCrash(),
                    ),
                  ),
                ),
              ),
            ]),
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
              fontSize: 60,
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
          style: pw.TextStyle(
            fontSize: 12,
          ),
        ),
      );
}
