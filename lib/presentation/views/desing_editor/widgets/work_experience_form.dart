import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/work_experience_form/work_experience_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/work_experience.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/custom_date_range_picker.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/custom_form_field.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkExperienceForm extends StatelessWidget {
  const WorkExperienceForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CvEditorBloc, CvEditorState>(
      builder: (context, state) {
        return Column(
          children: [
            _buildWorkExperience(),
            ...state.workExperiences.value.map(
              (workExperience) => _buildWorkExperience(
                editedWorkExperience: workExperience,
              ),
            ),
          ],
        );
      },
    );

    return Form(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _datePicker(context, text: 'Desde'),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: _datePicker(context, text: 'Hasta'),
            ),
          ],
        )
      ],
    ));
  }

  Widget _buildWorkExperience({
    WorkExperience? editedWorkExperience,
  }) =>
      BlocProvider(
        create: (context) => WorkExperienceFormBloc()
          ..add(Initialized(optionOf(editedWorkExperience))),
        child: BlocConsumer<WorkExperienceFormBloc, WorkExperienceFormState>(
          listenWhen: (previous, current) =>
              previous.saveFailureOrSuccessOption !=
              current.saveFailureOrSuccessOption,
          listener: (context, state) {
            state.saveFailureOrSuccessOption.fold(
              () => {},
              (failureOrSucces) => failureOrSucces.fold(
                (l) => {},
                (_) => BlocProvider.of<CvEditorBloc>(context).add(
                  WorkExperienceAdded(state.workExperience),
                ),
              ),
            );
          },
          builder: (context, state) {
            return Form(
              autovalidateMode: state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: Column(
                children: [
                  CustomFormField(
                    initialized: state.isLoaded,
                    text: 'Puesto',
                    icon: Icons.work_history_outlined,
                    value: state.workExperience.job,
                    onChanged: (val) => BlocProvider.of<WorkExperienceFormBloc>(
                      context,
                    ).add(
                      JobChanged(val),
                    ),
                  ),
                  CustomFormField(
                    initialized: state.isLoaded,
                    text: 'Empleador',
                    icon: Icons.business_sharp,
                    value: state.workExperience.employer,
                    onChanged: (val) => BlocProvider.of<WorkExperienceFormBloc>(
                      context,
                    ).add(
                      EmployerChanged(val),
                    ),
                  ),
                  CustomFormField(
                    initialized: state.isLoaded,
                    text: 'Descripción del puesto y tareas realizadas',
                    icon: Icons.info_outline,
                    inputType: TextInputType.multiline,
                    value: state.workExperience.description,
                    onChanged: (val) => BlocProvider.of<WorkExperienceFormBloc>(
                      context,
                    ).add(
                      DescriptionChanged(val),
                    ),
                  ),
                  CustomDateRangePicker(
                    dateRange: state.workExperience.dateRange,
                    onChanged: (start, end) =>
                        BlocProvider.of<WorkExperienceFormBloc>(
                      context,
                    ).add(
                      DateRangeChanged(since: start, until: end),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => BlocProvider.of<WorkExperienceFormBloc>(
                      context,
                    ).add(Saved()),
                    icon: const Icon(Icons.save_alt_outlined),
                    label: const Text('Guardar'),
                  ),
                  if (editedWorkExperience != null)
                    ElevatedButton.icon(
                      onPressed: () =>
                          BlocProvider.of<CvEditorBloc>(context).add(
                        WorkExperienceDeleted(
                          editedWorkExperience,
                        ),
                      ),
                      icon: const Icon(Icons.delete_outline),
                      label: const Text('Eliminar'),
                    ),
                ],
              ),
            );
          },
        ),
      );
  Widget _datePicker(BuildContext context, {required String text}) =>
      TextFormField(
        enableInteractiveSelection: false,
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.date_range_rounded),
          labelText: text,
        ),
        onTap: () => _selectDate(context),
      );

  Future<DateTime?> _selectDate(BuildContext context) => showDatePicker(
        // locale: const Locale('es', 'ES'),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1850),
        lastDate: DateTime.now(),
      );
}
