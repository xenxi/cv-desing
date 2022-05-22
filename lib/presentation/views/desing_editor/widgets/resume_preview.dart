import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'package:cv_desing_website_flutter/domain/resumes/resume.dart';

class ResumePreview extends StatelessWidget {
  final Resume resume;
  const ResumePreview({
    Key? key,
    required this.resume,
  }) : super(key: key);

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
            color: Color(0xFF000000),
          ),
        ],
      ),
      child: FutureBuilder<List<Uint8List>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                ...snapshot.data!.map(
                  (p) => AspectRatio(
                    aspectRatio: 1,
                    child: Image(
                      image: MemoryImage(p),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            );
          } else {
            return Container();
          }
        },
        future: _buildPdf(),
      ),
    );
  }

  Future<List<Uint8List>> _buildPdf() async {
    final doc = _buildResume(); //
    final bytes = await doc.save();
    final test = Printing.raster(bytes);
    final result = <Uint8List>[];
    await for (final page in test) {
      final aux = await page.toPng();
      result.add(aux);
    }
    return result;
  }

  pw.Document _buildResume() {
    final doc = pw.Document(title: 'My Résumé', author: 'David PHAM-VAN');

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(
              resume.personalInformation.name.fold((l) => '$l', (r) => r),
            ),
          ); // Center
        },
      ),
    ); //
    return doc;
  }
}
