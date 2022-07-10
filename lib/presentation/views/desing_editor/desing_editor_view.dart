import 'package:cv_desing_website_flutter/application/editor/contact_information_form/contact_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/personal_information_form/personal_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/resumes/resume.dart';
import 'package:cv_desing_website_flutter/presentation/core/dependency_injections/ioc.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/adaptative_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/example_resume_data.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/pdf_resume_builder.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/desktop/resume_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/mobile/resume_form_mobile.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/resume_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing/printing.dart';

class DesingEditorView extends StatelessWidget {
  const DesingEditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = getIt<CvEditorBloc>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => bloc,
        ),
        BlocProvider(
          create: (context) => getIt<PersonalInformationFormBloc>(),
        ),
        BlocProvider(
          create: (context) => bloc.contactInformationFormBloc,
        ),
      ],
      child: isMobileScreen(context)
          ? _buildMobileView()
          : Row(
              children: [
                const Expanded(
                  child: ResumeForm(),
                ),
                _buildPreview(),
              ],
            ),
    );
  }

  Widget _buildMobileView() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.edit),
              ),
              Tab(icon: Icon(Icons.preview_outlined)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const ResumeFormMobile(),
            BlocBuilder<CvEditorBloc, CvEditorState>(
              buildWhen: (previous, current) =>
                  previous.resume != current.resume,
              builder: (context, state) {
                return ResumePreview(
                  resume: state.resume,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreview() {
    return BlocBuilder<CvEditorBloc, CvEditorState>(
      buildWhen: (previous, current) => previous.resume != current.resume,
      builder: (context, state) {
        return Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 28, right: 28, top: 18),
            color: const Color.fromRGBO(243, 245, 250, 1),
            // color: const Color.fromRGBO(249, 250, 253, 1),
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.art_track),
                      label: const Text('Cambiar diseño'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    OutlinedButton.icon(
                      onPressed: () async => download(ExampleResumeData.jonDoe),
                      icon: const Icon(Icons.download),
                      label: const Text('Descargar'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    OutlinedButton.icon(
                      onPressed: () async => print(ExampleResumeData.jonDoe),
                      icon: const Icon(Icons.print),
                      label: const Text('Imprimir'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    OutlinedButton.icon(
                      onPressed: () => _clear(context),
                      icon: const Icon(Icons.clear),
                      label: const Text('Limpiar'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    OutlinedButton.icon(
                      onPressed: () => _loadDemoData(context),
                      icon: const Icon(Icons.import_contacts),
                      label: const Text('Cargar datos de ejemplo'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ResumePreview(
                    resume: state.resume,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> print(Resume resume) async {
    final doc = PdfResumeBuilder.build(resume).then((value) => value.save());
    await Printing.layoutPdf(
      onLayout: (format) => doc,
      name: _fileName(resume),
    );
  }

  Future<void> download(Resume resume) async {
    final doc = PdfResumeBuilder.build(resume).then((value) => value.save());
    await Printing.sharePdf(bytes: await doc, filename: _fileName(resume));
  }

  String _fileName(Resume resume) =>
      'CV ${resume.personalInformation.name.getOrCrash()}.pdf';

  void _loadDemoData(BuildContext context) =>
      BlocProvider.of<CvEditorBloc>(context)
          .add(Loaded(ExampleResumeData.jonDoe));
  void _clear(BuildContext context) =>
      BlocProvider.of<CvEditorBloc>(context).add(const Cleaned());
}
