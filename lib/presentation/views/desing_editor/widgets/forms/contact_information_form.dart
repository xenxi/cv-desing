import 'package:cv_desing_website_flutter/application/editor/contact_information_form/contact_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/url.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/custom_form_field.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/fields/email_field.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/fields/facebook_field.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/fields/github_field.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/fields/instagram_field.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/fields/linkedin_field.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/fields/phone_field.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/fields/twitter_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactInformationForm extends StatelessWidget {
  const ContactInformationForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactInformationFormBloc,
        ContactInformationFormState>(
      listenWhen: (previous, current) =>
          previous.saveFailureOrSuccessOption !=
          current.saveFailureOrSuccessOption,
      listener: (context, state) {
        state.saveFailureOrSuccessOption.fold(
          () => {},
          (s) => s.fold(
            (l) => {},
            (_) => BlocProvider.of<CvEditorBloc>(context).add(
              ContactInformationUpdated(
                contactInformation: state.contactInformation,
              ),
            ),
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            children: [
              const EmailField(),
              const PhoneField(),
              const FacebookField(),
              const TwitterField(),
              const LinkedinField(),
              const GithubField(),
              const InstagramField(),
              CustomFormField(
                initialized: state.isLoaded,
                text: 'Tu WebSite',
                value: state.contactInformation.socialMedias.personalOption
                    .fold(() => Url.empty(), (a) => a),
                onChanged: (val) =>
                    BlocProvider.of<ContactInformationFormBloc>(context)
                        .add(PersonalUrlChanged(val)),
                icon: Icons.web,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => BlocProvider.of<ContactInformationFormBloc>(
                  context,
                ).add(Saved()),
                icon: const Icon(Icons.save_alt_outlined),
                label: const Text('Guardar'),
              ),
            ],
          ),
        );
      },
    );
  }
}
