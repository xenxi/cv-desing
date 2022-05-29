import 'package:cv_desing_website_flutter/application/editor/contact_information_form/contact_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/personal_information_form/personal_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/dependency_injections/ioc.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/adaptative_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/example_resume_data.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/resume_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/resume_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          create: (context) => ContactInformationFormBloc(),
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
            const ResumeForm(),
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

  BlocBuilder<CvEditorBloc, CvEditorState> _buildPreview() {
    return BlocBuilder<CvEditorBloc, CvEditorState>(
      buildWhen: (previous, current) => previous.resume != current.resume,
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ResumePreview(
                  // resume: state.resume,
                  resume: ExampleResumeData.jonDoe,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
