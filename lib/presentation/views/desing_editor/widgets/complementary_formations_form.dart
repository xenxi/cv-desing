import 'package:cv_desing_website_flutter/application/editor/complementary_training_form/complementary_training_form_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/domain/complementary_training.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/custom_date_range_picker.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/custom_form_field.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            ...state.complementaryTrainings.value.map(
              (complementaryTraining) => _buildComplementaryTraining(
                editedComplementaryTraining: complementaryTraining,
              ),
            ),
          ],
        );
      },
    );

    return Form(
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Añadir'),
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.science_outlined),
              labelText: 'Curso / taller / seminario / conferencia',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.school_outlined),
              labelText: 'Entidad formadora',
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.timer_outlined),
              labelText: 'Horas de estudio',
            ),
          ),
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
      ),
    );
  }

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
                    value: state.complementaryTraining.schoold,
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
                  ElevatedButton.icon(
                    onPressed: () =>
                        BlocProvider.of<ComplementaryTrainingFormBloc>(
                      context,
                    ).add(Saved()),
                    icon: const Icon(Icons.save_alt_outlined),
                    label: const Text('Guardar'),
                  ),
                  if (editedComplementaryTraining != null)
                    ElevatedButton.icon(
                      onPressed: () =>
                          BlocProvider.of<CvEditorBloc>(context).add(
                        ComplementaryTrainingDeleted(
                          editedComplementaryTraining,
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
}
