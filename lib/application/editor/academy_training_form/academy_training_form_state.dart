part of 'academy_training_form_bloc.dart';

class AcademyTrainingFormState extends Equatable {
  factory AcademyTrainingFormState.initial() => AcademyTrainingFormState(
        academyTraining: AcademyTraining.empty(),
      );
  const AcademyTrainingFormState({
    required this.academyTraining,
  });
  final AcademyTraining academyTraining;

  @override
  List<Object> get props => [academyTraining];

  AcademyTrainingFormState copyWith({
    AcademyTraining? academyTraining,
  }) {
    return AcademyTrainingFormState(
      academyTraining: academyTraining ?? this.academyTraining,
    );
  }
}
