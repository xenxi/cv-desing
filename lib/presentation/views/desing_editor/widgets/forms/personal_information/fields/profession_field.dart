import 'package:cv_desing_website_flutter/application/editor/personal_information_form/personal_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/value_object_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfessionField extends StatelessWidget {
  const ProfessionField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final job = _getJob(context);
    final controller = ValueObjectTextField.controllerFrom(job);
    return BlocListener<PersonalInformationFormBloc,
        PersonalInformationFormState>(
      listenWhen: (previous, current) => current.isLoaded,
      listener: (context, state) {
        controller.text =
            ValueObjectTextField.valueFrom(state.personalInformation.job);
      },
      child: ValueObjectTextField(
        controller: controller,
        icon: Icons.work_outline,
        label: 'Tu profesión o actividad',
        onLoseFocus: () =>
            BlocProvider.of<PersonalInformationFormBloc>(context).add(Saved()),
        onChanged: (val) =>
            BlocProvider.of<PersonalInformationFormBloc>(context)
                .add(ProfessionChanged(val)),
        validator: (_) => _getJob(context).fold((l) => '$l', (_) => null),
      ),
    );
  }

  Job _getJob(BuildContext context) {
    final bloc = BlocProvider.of<PersonalInformationFormBloc>(context);
    return bloc.state.personalInformation.job;
  }
}
