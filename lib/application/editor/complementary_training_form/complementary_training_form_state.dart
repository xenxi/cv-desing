part of 'complementary_training_form_bloc.dart';

class ComplementaryTrainingFormState extends Equatable {
  factory ComplementaryTrainingFormState.initial() =>
      ComplementaryTrainingFormState(
        complementaryTraining: ComplementaryTraining.empty(),
        saveFailureOrSuccessOption: none(),
        showErrorMessages: false,
        isLoaded: false,
      );
  const ComplementaryTrainingFormState({
    required this.complementaryTraining,
    required this.showErrorMessages,
    required this.isLoaded,
    required this.saveFailureOrSuccessOption,
  });
  final ComplementaryTraining complementaryTraining;
  final bool showErrorMessages;
  final bool isLoaded;
  final Option<Either<Failure, Unit>> saveFailureOrSuccessOption;
  @override
  List<Object> get props => [
        complementaryTraining,
        saveFailureOrSuccessOption,
        showErrorMessages,
        isLoaded,
      ];

  ComplementaryTrainingFormState copyWith({
    ComplementaryTraining? complementaryTraining,
    bool? showErrorMessages,
    bool? isLoaded,
    Option<Either<Failure, Unit>>? saveFailureOrSuccessOption,
  }) {
    return ComplementaryTrainingFormState(
      complementaryTraining:
          complementaryTraining ?? this.complementaryTraining,
      showErrorMessages: showErrorMessages ?? this.showErrorMessages,
      isLoaded: isLoaded ?? this.isLoaded,
      saveFailureOrSuccessOption:
          saveFailureOrSuccessOption ?? this.saveFailureOrSuccessOption,
    );
  }
}
