import 'package:cv_desing_website_flutter/application/editor/cv_templates.dart';
import 'package:cv_desing_website_flutter/domain/resumes/resume.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/creative_green/creative_green_resume.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/green/green_resume.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/pink/pink_resume.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfResumeBuilder {
  static Future<pw.Document> build(
    Resume resume, {
    required CvTemplates template,
  }) async {
    switch (template) {
      case CvTemplates.green:
        return GreenResume(resume).build();
      case CvTemplates.pink:
        return PinkResume(resume).build();
      case CvTemplates.creativeGreen:
        return CreativeGreenResume(resume).build();
    }

    return Future.error('Template not found');
  }
}
