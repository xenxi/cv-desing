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
  }) : super(key: key);
  final Resume resume;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 8,
        top: 8,
        right: 8,
        bottom: 12,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 5,
          ),
        ],
      ),
      child: FutureBuilder<pw.Document>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              width: 500,
              height: 700,
              child: PdfPreview(
                canChangeOrientation: false,
                canDebug: false,
                canChangePageFormat: false,
                build: (format) => snapshot.data!.save(),
              ),
            );
          }
          return Container();
        },
        future: PdfResumeBuilder.build(resume),
      ),
    );
  }
}
