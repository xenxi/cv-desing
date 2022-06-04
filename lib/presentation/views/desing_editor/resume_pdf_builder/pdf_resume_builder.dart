import 'package:cv_desing_website_flutter/domain/resumes/resume.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/green/green_desing.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfResumeBuilder {
  static Future<pw.Document> build(Resume resume) {
    return buildResume(resume);
  }
}
