import 'package:cv_desing_website_flutter/application/editor/contact_information_form/contact_information_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterField extends StatelessWidget {
  const TwitterField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocListener<ContactInformationFormBloc,
        ContactInformationFormState>(
      listenWhen: (previous, current) => current.isLoaded,
      listener: (context, state) {
        controller.text =
            state.contactInformation.socialMedias.twitterOption.fold(
          () => '',
          (s) => s.fold((l) => l.failedValue ?? '', (r) => r),
        );
      },
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          icon: Icon(FontAwesomeIcons.twitter),
          labelText: 'Tu Twitter',
        ),
        onChanged: (val) =>
            BlocProvider.of<ContactInformationFormBloc>(context).add(
          FacebookUrlChanged(val),
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
}
