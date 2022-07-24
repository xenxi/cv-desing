import 'package:cv_desing_website_flutter/application/editor/contact_information_form/contact_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_actor/cv_editor_actor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/personal_information_form/personal_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/desktop/form_builder.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/desktop/step_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResumeForm extends StatelessWidget {
  const ResumeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          StepList(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: FormBuilder(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomTheme.primaryColor,
        foregroundColor: Colors.white,
        onPressed: () {
          final personalInformation =
              BlocProvider.of<PersonalInformationFormBloc>(context);
          final contactInformation =
              BlocProvider.of<ContactInformationFormBloc>(context);
          final editor = BlocProvider.of<CvEditorBloc>(context);
          final resume = editor.state.resume.copyWith(
              personalInformation:
                  personalInformation.state.personalInformation,
              contactInformation: contactInformation.state.contactInformation);
          BlocProvider.of<CvEditorActorBloc>(context)
              .add(ResumeChanged(resume));
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
