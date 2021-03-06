import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/application/navigation/navigation_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/logo.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/desktop/step_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepList extends StatelessWidget {
  const StepList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CvEditorBloc, CvEditorState>(
      buildWhen: (previous, current) => previous.section != current.section,
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: CustomTheme.batmanGradient,
            ),
          ),
          width: 200,
          child: Column(
            children: [
              const SizedBox(
                height: 22,
              ),
              Logo(
                height: 120,
                onTap: () => BlocProvider.of<NavigationBloc>(context)
                    .add(const HomeOpened()),
              ),
              const SizedBox(
                height: 22,
              ),
              ...Section.values.map(
                (e) => StepTitle(
                  section: e,
                  selected: state.section == e,
                  onTap: () => _updateSection(context, section: e),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _updateSection(BuildContext context, {required Section section}) =>
      BlocProvider.of<CvEditorBloc>(context)
          .add(SectionChanged(section: section));
}
