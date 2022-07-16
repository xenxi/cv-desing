import 'package:cv_desing_website_flutter/application/editor/contact_information_form/contact_information_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GithubField extends StatelessWidget {
  const GithubField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = _createController(context);
    return BlocListener<ContactInformationFormBloc,
        ContactInformationFormState>(
      listenWhen: (previous, current) => current.isLoaded,
      listener: (context, state) {
        controller.text = _getValue(state);
      },
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          icon: Icon(FontAwesomeIcons.github),
          labelText: 'Tu Github',
        ),
        onChanged: (val) =>
            BlocProvider.of<ContactInformationFormBloc>(context).add(
          GithubUrlChanged(val),
        ),
        validator: (_) => BlocProvider.of<ContactInformationFormBloc>(context)
            .state
            .contactInformation
            .socialMedias
            .twitterOption
            .fold(() => null, (s) => s.fold((l) => '$l', (r) => null)),
      ),
    );
  }

  TextEditingController _createController(BuildContext context) {
    final controller = TextEditingController(
      text: _getValue(
        BlocProvider.of<ContactInformationFormBloc>(context).state,
      ),
    );
    return controller;
  }

  String _getValue(ContactInformationFormState state) =>
      state.contactInformation.socialMedias.githubOption.fold(
        () => '',
        (s) => s.fold((l) => l.failedValue ?? '', (r) => r),
      );
}
