import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/personal_information_form/personal_information_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoForm extends StatelessWidget {
  const PersonalInfoForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalInformationFormBloc(),
      child: BlocConsumer<PersonalInformationFormBloc,
          PersonalInformationFormState>(
        listener: (context, state) {
          state.saveFailureOrSuccessOption.fold(
            () => {},
            (a) => a.fold(
              (l) => {},
              (_) => BlocProvider.of<CvEditorBloc>(context).add(
                PersonalInformationUpdated(
                  personalInformation: state.personalInformation,
                ),
              ),
            ),
          );
        },
        builder: (context, state) {
          return Form(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.account_box_outlined, size: 60),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outlined),
                    labelText: 'Tu nombre',
                  ),
                  onChanged: (val) =>
                      BlocProvider.of<PersonalInformationFormBloc>(context)
                          .add(NameChanged(val)),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.location_on_outlined),
                    labelText: 'Tu localidad',
                  ),
                  onChanged: (val) =>
                      BlocProvider.of<PersonalInformationFormBloc>(context)
                          .add(LocalityChanged(val)),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.work_outline),
                    labelText: 'Tu profesión o actividad',
                  ),
                  onChanged: (val) =>
                      BlocProvider.of<PersonalInformationFormBloc>(context)
                          .add(ProfessionChanged(val)),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.info_outline),
                    labelText: 'Algo sobre ti',
                  ),
                  minLines: 4,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onChanged: (val) =>
                      BlocProvider.of<PersonalInformationFormBloc>(context)
                          .add(PersonalDescriptionChanged(val)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
