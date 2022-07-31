import 'package:cv_desing_website_flutter/application/editor/cv_templates.dart';
import 'package:cv_desing_website_flutter/domain/resumes/resume.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/pdf_resume_builder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
const sep = 120.0;
final dateFormat = DateFormat('MM/yyy');

class ResumePreview extends StatelessWidget {
  const ResumePreview({
    Key? key,
    required this.resume,
    required this.template,
  }) : super(key: key);
  final Resume resume;
  final CvTemplates template;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black45,
            offset: Offset(-2, 4),
            blurRadius: 11,
          ),
        ],
      ),
      child: FutureBuilder<pw.Document>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PdfPreview(
              canChangeOrientation: false,
              canDebug: false,
              dynamicLayout: false,
              loadingWidget: const Center(
                child: CircularProgressIndicator(),
              ),
              previewPageMargin: EdgeInsets.zero,
              useActions: false,
              canChangePageFormat: false,
              initialPageFormat: PdfPageFormat.a4,
              build: (format) => snapshot.data!.save(),
            );
          }
          return Container();
        },
        future: PdfResumeBuilder.build(resume, template: template),
      ),
    );
  }
}
