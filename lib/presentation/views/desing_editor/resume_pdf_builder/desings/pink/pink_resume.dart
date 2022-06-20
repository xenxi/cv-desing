import 'dart:async';

import 'package:cv_desing_website_flutter/domain/resumes/resume.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/description.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/locality.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/name.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/language_level_extensions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/icons_path.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/pink/page_theme_builder.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/pink/widgets/block.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/pink/widgets/category.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/pink/widgets/percent.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/pink/widgets/sub_category.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/pink/widgets/url_text.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/widgets/profile_avatar.dart';
import 'package:flutter/services.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

final PdfColor accentColor = PdfColor.fromHex('#437d90');
final PdfColor pink = PdfColor.fromHex('#edd1c6');
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
const sep = 120.0;

class PinkResume {
  PinkResume(this.resume);

  final Resume resume;

  Future<pw.Document> build() async {
    final twitterIcon = await rootBundle.loadString(IconsPath.twitterSvg);
    final linkedinIcon = await rootBundle.loadString(IconsPath.linkedinSvg);
    final githubIcon = await rootBundle.loadString(IconsPath.githubSvg);
    final doc = pw.Document(
      title: resume.personalInformation.name
          .fold((l) => Location.curriculum, (r) => r),
      author: Location.appTitle,
    );
    final pageTheme = await PageThemeBuilder.build(withMargin: true);
    final pageThemeFirstPage = pageTheme.copyWith(margin: pw.EdgeInsets.zero);
    doc.addPage(
      pw.Page(
        pageTheme: pageThemeFirstPage,
        build: (pw.Context context) => pw.Stack(
          children: [
            pw.Align(
              alignment: pw.Alignment.topCenter,
              child: pw.Container(
                padding:
                    const pw.EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                height: pageThemeFirstPage.pageFormat.availableHeight * .5,
                color: PdfColors.white,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        _buildName(
                          context,
                          name: resume.personalInformation.name,
                        ),
                        pw.SizedBox(height: 6),
                        _buildJob(context, job: resume.personalInformation.job),
                        pw.Container(
                          width: 60,
                          margin: const pw.EdgeInsets.only(top: 10),
                          decoration: pw.BoxDecoration(
                            color: accentColor,
                            borderRadius: pw.BorderRadius.circular(3),
                          ),
                          height: 4,
                        ),
                      ],
                    ),
                    pw.SizedBox(width: 50),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        ...resume.contactInformation.socialMedias.twitterOption
                            .fold(
                          () => [pw.Container()],
                          (r) => [
                            UrlText(
                              r.getOrCrash(),
                              r.getOrCrash(),
                              svgIcon: twitterIcon,
                              color: accentColor,
                            ),
                            pw.SizedBox(height: 8),
                          ],
                        ),
                        ...resume.contactInformation.socialMedias.linkedinOption
                            .fold(
                          () => [pw.Container()],
                          (r) => [
                            UrlText(
                              r.getOrCrash(),
                              r.getOrCrash(),
                              svgIcon: linkedinIcon,
                              color: accentColor,
                            ),
                            pw.SizedBox(height: 8),
                          ],
                        ),
                        ...resume.contactInformation.socialMedias.githubOption
                            .fold(
                          () => [pw.Container()],
                          (r) => [
                            UrlText(
                              r.getOrCrash(),
                              r.getOrCrash(),
                              svgIcon: githubIcon,
                              color: accentColor,
                            ),
                            pw.SizedBox(height: 8),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            pw.Align(
              alignment: pw.Alignment.bottomCenter,
              child: pw.Container(
                height: pageTheme.pageFormat.availableHeight * .5,
                color: pink,
                padding: const pw.EdgeInsets.only(left: 60, right: 60, top: 40),
                child: pw.Column(
                  children: [
                    pw.SizedBox(height: 36),
                    _buildDescription(
                      context,
                      description: resume.personalInformation.description,
                    ),
                    pw.Expanded(child: pw.SizedBox()),
                    _buildFooter(context),
                    pw.SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            pw.Align(
              child: pw.Transform.translate(
                offset: const PdfPoint(0, -50),
                child: ProfileAvatar(
                    width: 150,
                    height: 150,
                    imageOption: resume.personalInformation.avatarOption),
              ),
            ),
          ],
        ),
      ),
    );
    doc.addPage(
      pw.MultiPage(
        pageTheme: pageTheme,
        build: (pw.Context context) => [
          pw.Partitions(
            children: [
              pw.Partition(
                width: 350,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: <pw.Widget>[
                    if (resume.workExperiences.value.isNotEmpty) ...[
                      Category(
                        title: Location.workExperience,
                        color: lightGreen,
                      ),
                      ...resume.workExperiences.value.map(
                        (workExperience) {
                          return Block(
                            subTitle: workExperience.employer.getOrCrash(),
                            color: accentColor,
                            title: workExperience.job.getOrCrash(),
                            text: workExperience.description.getOrCrash(),
                            dateRange: workExperience.dateRange.getOrCrash(),
                            lastItem: resume.workExperiences.value.last ==
                                workExperience,
                          );
                        },
                      ),
                      pw.SizedBox(height: 20),
                    ],
                    if (resume.academyTrainings.value.isNotEmpty) ...[
                      Category(
                        title: Location.academicTraining,
                        color: lightGreen,
                      ),
                      ...resume.academyTrainings.value.map(
                        (academyTraining) => Block(
                          color: accentColor,
                          title: academyTraining.title.getOrCrash(),
                          subTitle: academyTraining.schoold.getOrCrash(),
                          dateRange: academyTraining.dateRange.getOrCrash(),
                          lastItem: resume.academyTrainings.value.last ==
                              academyTraining,
                        ),
                      ),
                    ],
                    if (resume.complementaryTrainings.value.isNotEmpty) ...[
                      Category(
                        title: Location.complementaryFormations,
                        color: lightGreen,
                      ),
                      ...resume.complementaryTrainings.value.map(
                        (complementaryTraining) => Block(
                          color: accentColor,
                          title: complementaryTraining.title.getOrCrash(),
                          subTitle: complementaryTraining.schoold.getOrCrash(),
                          dateRange:
                              complementaryTraining.dateRange.getOrCrash(),
                          lastItem: resume.complementaryTrainings.value.last ==
                              complementaryTraining,
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
                        children: <pw.Widget>[
                          if (resume.softwareSkills.value.isNotEmpty) ...[
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                              children: <pw.Widget>[
                                SubCategory(text: 'Tecnologías'),
                                ...resume.softwareSkills.value.map(
                                  (skill) => Percent(
                                    value: skill.percentage.getOrCrash() * .01,
                                    title: skill.getOrCrash(),
                                  ),
                                ),
                                pw.SizedBox(height: 30),
                              ],
                            ),
                          ],
                          if (resume.skills.value.isNotEmpty)
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                              children: [
                                SubCategory(text: 'Aptitudes'),
                                ...resume.skills.value.map(
                                  (skill) => pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(
                                        skill,
                                      ),
                                      pw.SizedBox(
                                        height: 2,
                                        width: 10,
                                        child: pw.LinearProgressIndicator(
                                          value: 0,
                                          backgroundColor:
                                              PdfColor.fromHex('#d7d5d6'),
                                        ),
                                      ),
                                      pw.SizedBox(height: 8),
                                    ],
                                  ),
                                ),
                                pw.SizedBox(height: 28),
                              ],
                            ),
                          if (resume.languages.value.isNotEmpty)
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                              children: [
                                SubCategory(text: 'Idiomas'),
                                ...resume.languages.value.map(
                                  (language) => Percent(
                                    value: language.level.percentage,
                                    title: language.getOrCrash(),
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

  pw.Widget _buildJob(pw.Context context, {required Job job}) => pw.Text(
        job.fold((l) => '', (r) => r),
        textScaleFactor: 1.2,
        style: pw.Theme.of(context).defaultTextStyle.copyWith(
              fontWeight: pw.FontWeight.bold,
              color: accentColor,
            ),
      );

  pw.Widget _buildName(pw.Context context, {required Name name}) => pw.Text(
        name.fold((l) => '', (r) => r),
        textScaleFactor: 2,
        style: pw.Theme.of(context).defaultTextStyle.copyWith(
              fontWeight: pw.FontWeight.bold,
            ),
      );

  pw.Widget _buildLocality(pw.Context context, {required Locality locality}) =>
      locality.fold(
        (l) => pw.Container(),
        (r) => pw.Text(r, textAlign: pw.TextAlign.right),
      );

  pw.Widget _buildDescription(
    pw.Context context, {
    required Description description,
  }) =>
      description.fold(
        (l) => pw.Container(),
        (r) => pw.RichText(
          softWrap: true,
          textAlign: pw.TextAlign.center,
          tightBounds: true,
          text: pw.TextSpan(
            text: '"',
            style: pw.TextStyle(
              fontSize: 24,
              fontWeight: pw.FontWeight.bold,
            ),
            children: [
              pw.TextSpan(
                text: r,
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.normal,
                  fontStyle: pw.FontStyle.italic,
                ),
              ),
              pw.TextSpan(
                text: '"',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );

  pw.Widget _buildFooter(pw.Context context) => pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              UrlText(
                resume.contactInformation.phoneNumber.fold((l) => '', (r) => r),
                'tel:${resume.contactInformation.phoneNumber.fold((l) => '', (r) => r)}',
                color: PdfColors.black,
              ),
              UrlText(
                resume.contactInformation.emailAddress
                    .fold((l) => '', (r) => r),
                'mailto:${resume.contactInformation.emailAddress.fold((l) => '', (r) => r)}',
                color: PdfColors.black,
              ),
              UrlText(
                'www.jondoe.com',
                'www.jondoe.com',
                color: PdfColors.black,
              ),
            ],
          ),
          pw.SizedBox(
            width: 100,
            child: _buildLocality(
              context,
              locality: resume.personalInformation.locality,
            ),
          ),
        ],
      );
}
