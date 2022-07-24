import 'package:cv_desing_website_flutter/application/editor/contact_information_form/contact_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_actor/cv_editor_actor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/personal_information_form/personal_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/resumes/resume.dart';
import 'package:cv_desing_website_flutter/presentation/core/dependency_injections/ioc.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/adaptative_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/example_resume_data.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/resume_pdf_builder/pdf_resume_builder.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/cv_template_button.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CvEditorBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<PersonalInformationFormBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ContactInformationFormBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CvEditorActorBloc>(),
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
            BlocBuilder<CvEditorActorBloc, CvEditorActorState>(
              buildWhen: (previous, current) =>
                  previous.template != current.template,
              builder: (context, state) {
                return ResumePreview(
                  resume: BlocProvider.of<CvEditorBloc>(context).state.resume,
                  template: state.template,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreview() {
    return BlocBuilder<CvEditorActorBloc, CvEditorActorState>(
      builder: (context, state) {
        return Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 28, right: 28, top: 18),
            color: const Color.fromRGBO(243, 245, 250, 1),
            // color: const Color.fromRGBO(249, 250, 253, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    const CvTemplateButton(),
                    const SizedBox(
                      width: 12,
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.5, horizontal: 8),
                      ),
                      onPressed: () async => download(context),
                      icon: const Icon(Icons.download),
                      label: const Text('Descargar'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.5, horizontal: 8),
                      ),
                      onPressed: () async => print(context),
                      icon: const Icon(Icons.print),
                      label: const Text('Imprimir'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.5, horizontal: 8),
                      ),
                      onPressed: () => _clear(context),
                      icon: const Icon(Icons.clear),
                      label: const Text('Limpiar'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.5, horizontal: 8),
                      ),
                      onPressed: () => _loadDemoData(context),
                      icon: const Icon(Icons.import_contacts),
                      label: const Text('Cargar datos de ejemplo'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ResumePreview(
                    resume: BlocProvider.of<CvEditorBloc>(context).state.resume,
                    template: state.template,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> print(BuildContext context) async {
    final resume = BlocProvider.of<CvEditorBloc>(context).state.resume;
    final template = BlocProvider.of<CvEditorActorBloc>(context).state.template;

    final doc = PdfResumeBuilder.build(resume, template: template)
        .then((value) => value.save());
    await Printing.layoutPdf(
      onLayout: (format) => doc,
      name: _fileName(resume),
    );
  }

  Future<void> download(BuildContext context) async {
    final resume = BlocProvider.of<CvEditorBloc>(context).state.resume;
    final template = BlocProvider.of<CvEditorActorBloc>(context).state.template;
    final doc = PdfResumeBuilder.build(resume, template: template)
        .then((value) => value.save());
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
