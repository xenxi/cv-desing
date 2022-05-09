part of 'academy_training_form_bloc.dart';

class AcademyTrainingFormState extends Equatable {
  factory AcademyTrainingFormState.initial() => AcademyTrainingFormState(
        academyTraining: AcademyTraining.empty(),
        saveFailureOrSuccessOption: none(),
        showErrorMessages: false,
      );
  const AcademyTrainingFormState({
    required this.academyTraining,
    required this.showErrorMessages,
    required this.saveFailureOrSuccessOption,
  });
  final AcademyTraining academyTraining;
  final bool showErrorMessages;
  final Option<Either<Failure, Unit>> saveFailureOrSuccessOption;
  @override
  List<Object> get props =>
      [academyTraining, saveFailureOrSuccessOption, showErrorMessages];

  AcademyTrainingFormState copyWith({
    AcademyTraining? academyTraining,
    bool? showErrorMessages,
    Option<Either<Failure, Unit>>? saveFailureOrSuccessOption,
  }) {
    return AcademyTrainingFormState(
      academyTraining: academyTraining ?? this.academyTraining,
      showErrorMessages: showErrorMessages ?? this.showErrorMessages,
      saveFailureOrSuccessOption:
          saveFailureOrSuccessOption ?? this.saveFailureOrSuccessOption,
    );
  }
}
