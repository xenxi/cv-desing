import 'package:cv_desing_website_flutter/application/editor/complementary_training_form/complementary_training_form_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/complementary_training.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/custom_date_range_picker.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/custom_form_field.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplementaryFormationsForm extends StatelessWidget {
  const ComplementaryFormationsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CvEditorBloc, CvEditorState>(
      builder: (context, state) {
        return Column(
          children: [
            _buildComplementaryTraining(),
            ...state.resume.complementaryTrainings.value.map(
              (complementaryTraining) => _buildComplementaryTraining(
                editedComplementaryTraining: complementaryTraining,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildComplementaryTraining({
    ComplementaryTraining? editedComplementaryTraining,
  }) =>
      BlocProvider(
        create: (context) => ComplementaryTrainingFormBloc()
          ..add(Initialized(optionOf(editedComplementaryTraining))),
        child: BlocConsumer<ComplementaryTrainingFormBloc,
            ComplementaryTrainingFormState>(
          listenWhen: (previous, current) =>
              previous.saveFailureOrSuccessOption !=
              current.saveFailureOrSuccessOption,
          listener: (context, state) {
            state.saveFailureOrSuccessOption.fold(
              () => {},
              (failureOrSucces) => failureOrSucces.fold(
                (l) => {},
                (_) => BlocProvider.of<CvEditorBloc>(context).add(
                  ComplementaryTrainingAdded(state.complementaryTraining),
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
                    text: 'Curso / taller / seminario / conferencia',
                    icon: Icons.science_outlined,
                    value: state.complementaryTraining.title,
                    onChanged: (val) =>
                        BlocProvider.of<ComplementaryTrainingFormBloc>(
                      context,
                    ).add(
                      TitleChanged(val),
                    ),
                  ),
                  CustomFormField(
                    initialized: state.isLoaded,
                    text: 'Entidad formadora',
                    icon: Icons.school_outlined,
                    value: state.complementaryTraining.schoold,
                    onChanged: (val) =>
                        BlocProvider.of<ComplementaryTrainingFormBloc>(
                      context,
                    ).add(
                      SchooldChanged(val),
                    ),
                  ),
                  CustomFormField(
                    initialized: state.isLoaded,
                    text: 'Horas de estudio',
                    icon: Icons.timer_outlined,
                    inputType: TextInputType.number,
                    value: state.complementaryTraining.courseHoursOption
                        .fold(() => null, (a) => a),
                    onChanged: (val) =>
                        BlocProvider.of<ComplementaryTrainingFormBloc>(context)
                            .add(CourseHoursChanged(int.tryParse(val))),
                  ),
                  CustomDateRangePicker(
                    dateRange: state.complementaryTraining.dateRange,
                    onChanged: (start, end) =>
                        BlocProvider.of<ComplementaryTrainingFormBloc>(
                      context,
                    ).add(
                      DateRangeChanged(since: start, until: end),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildActions(context, editedComplementaryTraining),
                ],
              ),
            );
          },
        ),
      );

  Widget _buildActions(BuildContext context,
          ComplementaryTraining? editedComplementaryTraining) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () => BlocProvider.of<ComplementaryTrainingFormBloc>(
              context,
            ).add(Saved()),
            icon: const Icon(Icons.save_alt_outlined),
            label: const Text('Guardar'),
          ),
          if (editedComplementaryTraining != null) ...[
            const SizedBox(width: 20),
            ElevatedButton.icon(
              onPressed: () => BlocProvider.of<CvEditorBloc>(context).add(
                ComplementaryTrainingDeleted(
                  editedComplementaryTraining,
                ),
              ),
              icon: const Icon(Icons.delete_outline),
              label: const Text('Eliminar'),
            ),
          ]
        ],
      );
}
