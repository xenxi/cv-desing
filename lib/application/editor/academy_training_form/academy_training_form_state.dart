part of 'academy_training_form_bloc.dart';

class AcademyTrainingFormState extends Equatable {
  factory AcademyTrainingFormState.initial() => AcademyTrainingFormState(
        academyTraining: AcademyTraining.empty(),
        saveFailureOrSuccessOption: none(),
      );
  const AcademyTrainingFormState({
    required this.academyTraining,
    required this.saveFailureOrSuccessOption,
  });
  final AcademyTraining academyTraining;
  final Option<Either<Failure, Unit>> saveFailureOrSuccessOption;
  @override
  List<Object> get props => [academyTraining, saveFailureOrSuccessOption];

  AcademyTrainingFormState copyWith({
    AcademyTraining? academyTraining,
    Option<Either<Failure, Unit>>? saveFailureOrSuccessOption,
  }) {
    return AcademyTrainingFormState(
      academyTraining: academyTraining ?? this.academyTraining,
      saveFailureOrSuccessOption:
          saveFailureOrSuccessOption ?? this.saveFailureOrSuccessOption,
    );
  }
}
