import 'package:cv_desing_website_flutter/application/editor/contact_information_form/contact_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/contact_information/fields/email_field.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/contact_information/fields/facebook_field.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/contact_information/fields/github_field.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/contact_information/fields/instagram_field.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/contact_information/fields/linkedin_field.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/contact_information/fields/personal_website_field.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/contact_information/fields/phone_field.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/contact_information/fields/twitch_field.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/contact_information/fields/twitter_field.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/contact_information/fields/youtube_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            children: const [
              EmailField(),
              PhoneField(),
              FacebookField(),
              TwitterField(),
              LinkedinField(),
              GithubField(),
              InstagramField(),
              TwitchField(),
              YoutubeField(),
              PersonalWebSiteField(),
            ],
          ),
        );
      },
    );
  }
}
