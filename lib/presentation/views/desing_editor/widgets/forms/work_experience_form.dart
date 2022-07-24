import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/work_experience_form/work_experience_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/work_experience.dart';
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
      buildWhen: (previous, current) =>
          previous.resume.workExperiences != current.resume.workExperiences,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              _buildWorkExperience(),
              ...state.resume.workExperiences.value.map(
                (workExperience) => _buildWorkExperience(
                  editedWorkExperience: workExperience,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWorkExperience({
    WorkExperience? editedWorkExperience,
  }) {
    final editedWorkExperienceOption = optionOf(editedWorkExperience);
    return BlocProvider(
      create: (context) => WorkExperienceFormBloc()
        ..add(Initialized(editedWorkExperienceOption)),
      child: BlocConsumer<WorkExperienceFormBloc, WorkExperienceFormState>(
        listenWhen: (previous, current) =>
            previous.saveFailureOrSuccessOption !=
            current.saveFailureOrSuccessOption,
        listener: (context, state) {
          state.saveFailureOrSuccessOption.fold(
            () => {},
            (failureOrSucces) => failureOrSucces.fold(
              (l) => {},
              (_) => onSaved(
                context,
                workExperience: state.workExperience,
                clearForm: editedWorkExperienceOption.isNone(),
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
                _buildActions(context, editedWorkExperience)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildActions(
          BuildContext context, WorkExperience? editedWorkExperience) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () => BlocProvider.of<WorkExperienceFormBloc>(
              context,
            ).add(Saved()),
            icon: const Icon(Icons.save_alt_outlined),
            label: const Text('Guardar'),
          ),
          if (editedWorkExperience != null) ...[
            const SizedBox(width: 20),
            ElevatedButton.icon(
              onPressed: () => BlocProvider.of<CvEditorBloc>(context).add(
                WorkExperienceDeleted(
                  editedWorkExperience,
                ),
              ),
              icon: const Icon(Icons.delete_outline),
              label: const Text('Eliminar'),
            ),
          ]
        ],
      );

  void onSaved(BuildContext context,
      {required WorkExperience workExperience, required bool clearForm}) {
    BlocProvider.of<CvEditorBloc>(context).add(
      WorkExperienceAdded(workExperience),
    );

    if (clearForm) {
      BlocProvider.of<WorkExperienceFormBloc>(context)
          .add(Initialized(some(WorkExperience.empty())));
    }
  }
}
