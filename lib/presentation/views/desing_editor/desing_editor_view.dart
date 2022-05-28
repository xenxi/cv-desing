import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/presentation/core/dependency_injections/ioc.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/adaptative_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/form_step_builder.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/resume_form.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/resume_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DesingEditorView extends HookWidget {
  const DesingEditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CvEditorBloc>(),
      child: isMobileScreen(context)
          ? Column(
              children: [
                const Expanded(
                  child: ResumeForm(),
                ),
                const SizedBox(height: 9),
                _buildPreview(),
              ],
            )
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

  BlocBuilder<CvEditorBloc, CvEditorState> _buildPreview() {
    return BlocBuilder<CvEditorBloc, CvEditorState>(
      buildWhen: (previous, current) => previous.resume != current.resume,
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ResumePreview(
                  resume: state.resume,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
