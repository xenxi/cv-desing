part of 'academy_training_form_bloc.dart';

class AcademyTrainingFormState extends Equatable {
  factory AcademyTrainingFormState.initial() => AcademyTrainingFormState(
        title: Title.empty(),
      );
  const AcademyTrainingFormState({
    required this.title,
  });
  final Either<Failure<String>, Title> title;

  @override
  List<Object> get props => [title];

  AcademyTrainingFormState copyWith({
    Either<Failure<String>, Title>? title,
  }) {
    return AcademyTrainingFormState(
      title: title ?? this.title,
    );
  }
}
