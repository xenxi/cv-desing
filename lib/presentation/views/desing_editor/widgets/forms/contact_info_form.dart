import 'package:cv_desing_website_flutter/application/editor/contact_information_form/contact_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/url.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactInfoForm extends StatelessWidget {
  const ContactInfoForm({
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
              CustomFormField(
                initialized: true,
                text: 'Tu email',
                value: state.contactInformation.emailAddress,
                onChanged: (val) =>
                    BlocProvider.of<ContactInformationFormBloc>(context)
                        .add(EmailChanged(val)),
                icon: Icons.email_outlined,
              ),
              CustomFormField(
                initialized: state.isLoaded,
                text: 'Tu teléfono',
                value: state.contactInformation.phoneNumber,
                onChanged: (val) =>
                    BlocProvider.of<ContactInformationFormBloc>(context)
                        .add(PhoneNumberChanged(val)),
                icon: Icons.phone_outlined,
              ),
              CustomFormField(
                initialized: state.isLoaded,
                text: 'Tu Facebook',
                value: state.contactInformation.socialMedias.facebookOption
                    .fold(() => Url.empty(), (a) => a),
                onChanged: (val) =>
                    BlocProvider.of<ContactInformationFormBloc>(context)
                        .add(FacebookUrlChanged(val)),
                icon: Icons.facebook_outlined,
              ),
              CustomFormField(
                initialized: state.isLoaded,
                text: 'Tu Twitter',
                value: state.contactInformation.socialMedias.twitchOption
                    .fold(() => Url.empty(), (a) => a),
                onChanged: (val) =>
                    BlocProvider.of<ContactInformationFormBloc>(context)
                        .add(TwitterUrlChanged(val)),
                icon: FontAwesomeIcons.twitter,
              ),
              CustomFormField(
                initialized: state.isLoaded,
                text: 'Tu Linkedin',
                value: state.contactInformation.socialMedias.linkedinOption
                    .fold(() => Url.empty(), (a) => a),
                onChanged: (val) =>
                    BlocProvider.of<ContactInformationFormBloc>(context)
                        .add(LinkedinUrlChanged(val)),
                icon: FontAwesomeIcons.linkedin,
              ),
              CustomFormField(
                initialized: state.isLoaded,
                text: 'Tu Github',
                value: state.contactInformation.socialMedias.githubOption
                    .fold(() => Url.empty(), (a) => a),
                onChanged: (val) =>
                    BlocProvider.of<ContactInformationFormBloc>(context)
                        .add(GithubUrlChanged(val)),
                icon: FontAwesomeIcons.github,
              ),
              CustomFormField(
                initialized: state.isLoaded,
                text: 'Tu Instagram',
                value: state.contactInformation.socialMedias.instagramOption
                    .fold(() => Url.empty(), (a) => a),
                onChanged: (val) =>
                    BlocProvider.of<ContactInformationFormBloc>(context)
                        .add(InstagramUrlChanged(val)),
                icon: FontAwesomeIcons.instagram,
              ),
              CustomFormField(
                initialized: state.isLoaded,
                text: 'Tu Youtube',
                value: state.contactInformation.socialMedias.youtubeOption
                    .fold(() => Url.empty(), (a) => a),
                onChanged: (val) =>
                    BlocProvider.of<ContactInformationFormBloc>(context)
                        .add(YoutubeUrlChanged(val)),
                icon: FontAwesomeIcons.youtube,
              ),
              CustomFormField(
                initialized: state.isLoaded,
                text: 'Tu Twitch',
                value: state.contactInformation.socialMedias.twitchOption
                    .fold(() => Url.empty(), (a) => a),
                onChanged: (val) =>
                    BlocProvider.of<ContactInformationFormBloc>(context)
                        .add(TwitchUrlChanged(val)),
                icon: FontAwesomeIcons.twitch,
              ),
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
