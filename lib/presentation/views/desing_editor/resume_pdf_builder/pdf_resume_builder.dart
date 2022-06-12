import 'package:cv_desing_website_flutter/domain/resumes/resume.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/example_resume_data.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/green/green_resume.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/desings/pink/pink_resume.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfResumeBuilder {
  static Future<pw.Document> build(Resume resume) {
    return PinkResume(resume).build();
    return PinkResume(ExampleResumeData.jonDoe).build();
    return GreenResume(ExampleResumeData.jonDoe).build();
  }
}
