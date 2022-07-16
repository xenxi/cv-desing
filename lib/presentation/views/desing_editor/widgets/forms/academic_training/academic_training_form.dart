import 'package:cv_desing_website_flutter/application/editor/academy_training_form/academy_training_form_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/academy_training.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/custom_date_range_picker.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/academic_training/fields/school_field.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/forms/academic_training/fields/title_field.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcademicTrainingForm extends StatelessWidget {
  const AcademicTrainingForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<CvEditorBloc, CvEditorState>(
        builder: (context, state) {
          return Column(
            children: [
              _buildAcademyTraining(),
              ...state.resume.academyTrainings.value.map(
                (academyTraining) => _buildAcademyTraining(
                  editedAcademicTraining: academyTraining,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAcademyTraining({AcademyTraining? editedAcademicTraining}) {
    final editedAcademicTrainingOption = optionOf(editedAcademicTraining);
    return BlocProvider(
      create: (context) => AcademyTrainingFormBloc()
        ..add(Initialized(editedAcademicTrainingOption)),
      child: BlocConsumer<AcademyTrainingFormBloc, AcademyTrainingFormState>(
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
                academyTraining: state.academyTraining,
                clearForm: editedAcademicTrainingOption.isNone(),
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
                const TitleField(),
                const SchooldField(),
                CustomDateRangePicker(
                  dateRange: state.academyTraining.dateRange,
                  onChanged: (start, end) =>
                      BlocProvider.of<AcademyTrainingFormBloc>(context).add(
                    DateRangeChanged(since: start, until: end),
                  ),
                ),
                const SizedBox(height: 20),
                _buildActions(context, editedAcademicTraining),
              ],
            ),
          );
        },
      ),
    );
  }

  void onSaved(
    BuildContext context, {
    required AcademyTraining academyTraining,
    required bool clearForm,
  }) {
    BlocProvider.of<CvEditorBloc>(context)
        .add(AcademyTrainingAdded(academyTraining));
    if (clearForm) {
      BlocProvider.of<AcademyTrainingFormBloc>(context)
          .add(Initialized(some(AcademyTraining.empty())));
    }
  }

  Widget _buildActions(
    BuildContext context,
    AcademyTraining? editedAcademyTraining,
  ) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () => BlocProvider.of<AcademyTrainingFormBloc>(
              context,
            ).add(Saved()),
            icon: const Icon(Icons.save_alt_outlined),
            label: const Text('Guardar'),
          ),
          if (editedAcademyTraining != null) ...[
            const SizedBox(width: 20),
            ElevatedButton.icon(
              onPressed: () => BlocProvider.of<CvEditorBloc>(context).add(
                AcademyTrainingDeleted(
                  editedAcademyTraining,
                ),
              ),
              icon: const Icon(Icons.delete_outline),
              label: const Text('Eliminar'),
            ),
          ]
        ],
      );
}
